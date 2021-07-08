view wave 
wave clipboard store
wave create -driver freeze -pattern clock -initialvalue 1 -period 100ns -dutycycle 50 -starttime 0ns -endtime 300ns sim:/pc/CLOCK1 
wave create -driver freeze -pattern constant -value 1 -starttime 0ns -endtime 300ns sim:/pc/RESET1 
wave modify -driver freeze -pattern constant -value 0 -starttime 0ns -endtime 100ns Edit:/pc/RESET1 
wave create -driver freeze -pattern constant -value 1 -starttime 0ns -endtime 300ns sim:/pc/PCWrite1 
wave create -driver freeze -pattern constant -value 00000000 -range 7 0 -starttime 0ns -endtime 300ns sim:/pc/ADDRESS 
WaveExpandAll -1
wave modify -driver freeze -pattern constant -value 00000100 -range 7 0 -starttime 100ns -endtime 200ns Edit:/pc/ADDRESS 
wave modify -driver freeze -pattern constant -value 00001000 -range 7 0 -starttime 200ns -endtime 300ns Edit:/pc/ADDRESS 
wave modify -driver freeze -pattern constant -value UUUUUUUU -range 7 0 -starttime 0ns -endtime 100ns Edit:/pc/ADDRESS 
WaveCollapseAll -1
wave clipboard restore
