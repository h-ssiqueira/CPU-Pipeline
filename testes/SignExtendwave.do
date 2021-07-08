view wave 
wave clipboard store
wave create -driver freeze -pattern constant -value 010101 -range 5 0 -starttime 0ns -endtime 200ns sim:/signextend/Immediate 
WaveExpandAll -1
wave modify -driver freeze -pattern constant -value 101010 -range 5 0 -starttime 100ns -endtime 200ns Edit:/signextend/Immediate 
WaveCollapseAll -1
wave clipboard restore
