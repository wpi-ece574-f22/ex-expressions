#!/bin/sh

if [ "$#" -ne 1 ]; then
  echo "Usage: $0 <rtlexample>" >&2
  exit 1
fi

echo "read_liberty -lib /mnt/volume_nyc1_01/skywater-pdk/libraries/sky130_fd_sc_hd/latest/timing/sky130_fd_sc_hd__tt_025C_1v80.lib" > $1_syn.ys

echo "read_verilog ../rtl/$1.v" >> $1_syn.ys
echo "write_json $1_rtl.json" >> $1_syn.ys

echo "synth -top $1" >> $1_syn.ys
echo "write_json $1_generic.json" >> $1_syn.ys

echo "dfflibmap -liberty /mnt/volume_nyc1_01/skywater-pdk/libraries/sky130_fd_sc_hd/latest/timing/sky130_fd_sc_hd__tt_025C_1v80.lib" >> $1_syn.ys
echo "abc -liberty /mnt/volume_nyc1_01/skywater-pdk/libraries/sky130_fd_sc_hd/latest/timing/sky130_fd_sc_hd__tt_025C_1v80.lib" >> $1_syn.ys
echo "opt_clean" >> $1_syn.ys

echo "stat -liberty /mnt/volume_nyc1_01/skywater-pdk/libraries/sky130_fd_sc_hd/latest/timing/sky130_fd_sc_hd__tt_025C_1v80.lib" >> $1_syn.ys
echo "write_verilog $1_gl.v" >> $1_syn.ys
echo "write_json $1_gl.json" >> $1_syn.ys

yosys -s $1_syn.ys
netlistsvg $1_rtl.json -o $1_rtl.svg
netlistsvg $1_generic.json -o $1_gate.svg
netlistsvg $1_gl.json -o $1_sky130.svg

# read_liberty -lib /mnt/volume_nyc1_01/skywater-pdk/libraries/sky130_fd_sc_hd/latest/timing/sky130_fd_sc_hd__tt_025C_1v80.lib

# read_verilog ../rtl/expressions.v
# write_json expressions_rtl.json

# synth -top expressions
# write_json expressions_generic.json

# dfflibmap -liberty /mnt/volume_nyc1_01/skywater-pdk/libraries/sky130_fd_sc_hd/latest/timing/sky130_fd_sc_hd__tt_025C_1v80.lib
# abc -liberty /mnt/volume_nyc1_01/skywater-pdk/libraries/sky130_fd_sc_hd/latest/timing/sky130_fd_sc_hd__tt_025C_1v80.lib
# opt_clean

# stat -liberty /mnt/volume_nyc1_01/skywater-pdk/libraries/sky130_fd_sc_hd/latest/timing/sky130_fd_sc_hd__tt_025C_1v80.lib
# write_verilog expressions_gl.v
