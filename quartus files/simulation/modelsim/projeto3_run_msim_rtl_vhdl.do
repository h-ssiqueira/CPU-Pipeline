transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {C:/Users/Helayne.DESKTOP-UMFI8VM/Documents/GitHub/CPU-Pipeline/quartus files/PC.vhd}
vcom -93 -work work {C:/Users/Helayne.DESKTOP-UMFI8VM/Documents/GitHub/CPU-Pipeline/quartus files/ALU.vhd}
vcom -93 -work work {C:/Users/Helayne.DESKTOP-UMFI8VM/Documents/GitHub/CPU-Pipeline/quartus files/ALUPC.vhd}
vcom -93 -work work {C:/Users/Helayne.DESKTOP-UMFI8VM/Documents/GitHub/CPU-Pipeline/quartus files/Control.vhd}
vcom -93 -work work {C:/Users/Helayne.DESKTOP-UMFI8VM/Documents/GitHub/CPU-Pipeline/quartus files/EXWB.vhd}
vcom -93 -work work {C:/Users/Helayne.DESKTOP-UMFI8VM/Documents/GitHub/CPU-Pipeline/quartus files/Fowarding.vhd}
vcom -93 -work work {C:/Users/Helayne.DESKTOP-UMFI8VM/Documents/GitHub/CPU-Pipeline/quartus files/IDEX.vhd}
vcom -93 -work work {C:/Users/Helayne.DESKTOP-UMFI8VM/Documents/GitHub/CPU-Pipeline/quartus files/IFID.vhd}
vcom -93 -work work {C:/Users/Helayne.DESKTOP-UMFI8VM/Documents/GitHub/CPU-Pipeline/quartus files/Memory64x4.vhd}
vcom -93 -work work {C:/Users/Helayne.DESKTOP-UMFI8VM/Documents/GitHub/CPU-Pipeline/quartus files/Registers.vhd}
vcom -93 -work work {C:/Users/Helayne.DESKTOP-UMFI8VM/Documents/GitHub/CPU-Pipeline/quartus files/SignExtend.vhd}
vcom -93 -work work {C:/Users/Helayne.DESKTOP-UMFI8VM/Documents/GitHub/CPU-Pipeline/quartus files/CPU.vhd}
vcom -93 -work work {C:/Users/Helayne.DESKTOP-UMFI8VM/Documents/GitHub/CPU-Pipeline/quartus files/MUXR.vhd}
vcom -93 -work work {C:/Users/Helayne.DESKTOP-UMFI8VM/Documents/GitHub/CPU-Pipeline/quartus files/MUXD.vhd}

