view wave 
wave clipboard store
wave create -driver freeze -pattern clock -initialvalue 1 -period 100ns -dutycycle 50 -starttime 0ns -endtime 300ns sim:/exwb/clock1 
wave create -driver freeze -pattern constant -value 1 -starttime 0ns -endtime 300ns sim:/exwb/RegWriteEX 
wave create -driver freeze -pattern constant -value 010 -range 2 0 -starttime 0ns -endtime 300ns sim:/exwb/RDEX 
WaveExpandAll -1
wave modify -driver freeze -pattern constant -value 101 -range 2 0 -starttime 100ns -endtime 200ns Edit:/exwb/RDEX 
wave modify -driver freeze -pattern constant -value 110 -range 2 0 -starttime 200ns -endtime 300ns Edit:/exwb/RDEX 
wave create -driver freeze -pattern constant -value 11110000 -range 7 0 -starttime 0ns -endtime 300ns sim:/exwb/ResultEX 
WaveExpandAll -1
wave modify -driver freeze -pattern constant -value 00001111 -range 7 0 -starttime 100ns -endtime 200ns Edit:/exwb/ResultEX 
wave modify -driver freeze -pattern constant -value 10101010 -range 7 0 -starttime 200ns -endtime 300ns Edit:/exwb/ResultEX 
WaveCollapseAll -1
wave clipboard restore
