view wave 
wave clipboard store
wave create -driver freeze -pattern clock -initialvalue 1 -period 100ns -dutycycle 50 -starttime 0ns -endtime 300ns sim:/memory64x4/clock1 
wave create -driver freeze -pattern constant -value 00000000 -range 7 0 -starttime 0ns -endtime 300ns sim:/memory64x4/address 
WaveExpandAll -1
wave modify -driver freeze -pattern constant -value 00000100 -range 7 0 -starttime 100ns -endtime 200ns Edit:/memory64x4/address 
wave modify -driver freeze -pattern constant -value 00001000 -range 7 0 -starttime 200ns -endtime 300ns Edit:/memory64x4/address 
WaveCollapseAll -1
wave clipboard restore
