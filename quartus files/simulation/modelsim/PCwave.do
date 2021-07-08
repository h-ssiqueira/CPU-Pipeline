view wave 
wave clipboard store
wave create -driver freeze -pattern clock -initialvalue 1 -period 100ns -dutycycle 50 -starttime 0ns -endtime 1000ns sim:/pc/PCWrite1 
wave create -driver freeze -pattern constant -value 1 -starttime 0ns -endtime 1000ns sim:/pc/RESET1 
wave edit change_value -start 0ns -end 100ns -value 0 Edit:/pc/RESET1 
wave create -driver freeze -pattern constant -value 1 -starttime 0ns -endtime 1000ns sim:/pc/PCWrite1 
wave create -driver freeze -pattern clock -initialvalue 1 -period 100ns -dutycycle 50 -starttime 0ns -endtime 1000ns sim:/pc/CLOCK1 
wave create -driver freeze -pattern constant -value 00000100 -range 7 0 -starttime 0ns -endtime 1000ns sim:/pc/ADDRESS 
WaveExpandAll -1
wave edit change_value -start 150ns -end 250ns -value 00001000 Edit:/pc/ADDRESS 
wave edit change_value -start 250ns -end 350ns -value 00001100 Edit:/pc/ADDRESS 
wave edit change_value -start 350ns -end 450ns -value 00010000 Edit:/pc/ADDRESS 
wave edit change_value -start 450ns -end 550ns -value 00010100 Edit:/pc/ADDRESS 
WaveCollapseAll -1
wave clipboard restore
