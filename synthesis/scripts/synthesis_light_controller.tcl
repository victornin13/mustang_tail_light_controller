set search_path [list . $search_path} "/apps/design_kits/ibm_kits/IBM_IP/ibm_cmos8hp/std_cell/sc/v.20110613/synopsys/ss_125" "../src" "../db"]
set target_library IBM_CMOS8HP_SS125.db
set link_library { * IBM_CMOS8HP_SS125.db }
set acs_work_dir "."

#############################
# Update design name to match top-level module name
set DESIGN "light_controller"

##########################
# Analyze design
# for designs with multiple verilog files, add addition "analyze" lines for each verilog file
analyze -format verilog { ../../source/light_controller.v }

# elaborate design
elaborate  ${DESIGN} -architecture verilog -library DEFAULT
uniquify

# constraints
source ../constraints/constraints_${DESIGN}.tcl

# check design for issues
check_design

# compile design
compile -exact_map

#compile -map_effort high -incremental

# reports
## worst case timing paths
redirect ../reports/${DESIGN}_timing_worst.rpt {report_timing -path full -delay max -nworst 5 -max_paths 5 -significant_digits 3 -sort_by group }

redirect ../reports/${DESIGN}_area.rpt {report_area -hierarchy }

# write netlist
write -hierarchy -format verilog -output ../netlists/${DESIGN}_syn.v

# write pace/route constraints
write_sdc ../netlists/${DESIGN}_syn.sdc
write_sdf -version 1.0 ../netlists/${DESIGN}_syn.sdf
