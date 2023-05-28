onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /mainctrl_tb/clk
add wave -noupdate /mainctrl_tb/RESET
add wave -noupdate /mainctrl_tb/load0
add wave -noupdate /mainctrl_tb/load1
add wave -noupdate /mainctrl_tb/load2
add wave -noupdate /mainctrl_tb/load3
add wave -noupdate /mainctrl_tb/out0
add wave -noupdate /mainctrl_tb/out1
add wave -noupdate /mainctrl_tb/out2
add wave -noupdate /mainctrl_tb/out3
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {257839 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {310800 ps}
