view wave 
wave clipboard store
wave create -driver freeze -pattern constant -value 0 -starttime 0ns -endtime 200ns sim:/muxr/sinal 
wave modify -driver freeze -pattern constant -value 1 -starttime 100ns -endtime 200ns Edit:/muxr/sinal 
wave create -driver freeze -pattern constant -value 101 -range 2 0 -starttime 0ns -endtime 200ns sim:/muxr/A 
WaveExpandAll -1
wave create -driver freeze -pattern constant -value 010 -range 2 0 -starttime 0ns -endtime 200ns sim:/muxr/B 
WaveExpandAll -1
WaveCollapseAll -1
wave clipboard restore
