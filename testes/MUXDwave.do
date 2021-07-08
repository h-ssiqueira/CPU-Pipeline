view wave 
wave clipboard store
wave create -driver freeze -pattern constant -value 0 -starttime 0ns -endtime 200ns sim:/muxd/sinal 
wave modify -driver freeze -pattern constant -value 1 -starttime 100ns -endtime 200ns Edit:/muxd/sinal 
wave create -driver freeze -pattern constant -value 00001111 -range 7 0 -starttime 0ns -endtime 200ns sim:/muxd/A 
WaveExpandAll -1
wave create -driver freeze -pattern constant -value 11110000 -range 7 0 -starttime 0ns -endtime 200ns sim:/muxd/B 
WaveExpandAll -1
WaveCollapseAll -1
wave clipboard restore
