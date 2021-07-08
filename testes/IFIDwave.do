view wave 
wave clipboard store
wave create -driver freeze -pattern clock -initialvalue 1 -period 100ns -dutycycle 50 -starttime 0ns -endtime 300ns sim:/ifid/clock1 
wave create -driver freeze -pattern constant -value 1000111110110000 -range 15 0 -starttime 0ns -endtime 300ns sim:/ifid/Memdata 
WaveExpandAll -1
wave modify -driver freeze -pattern constant -value 0101001100000010 -range 15 0 -starttime 100ns -endtime 200ns Edit:/ifid/Memdata 
wave modify -driver freeze -pattern constant -value 0000100000111000 -range 15 0 -starttime 200ns -endtime 300ns Edit:/ifid/Memdata 
WaveCollapseAll -1
wave clipboard restore
