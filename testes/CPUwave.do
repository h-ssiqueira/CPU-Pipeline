view wave 
wave clipboard store
wave create -driver freeze -pattern clock -initialvalue 1 -period 100000ps -dutycycle 50 -starttime 0ps -endtime 2000000ps sim:/cpu/CLOCK 
wave create -driver freeze -pattern constant -value 0 -starttime 0ps -endtime 100000ps sim:/cpu/RESET 
wave modify -driver freeze -pattern constant -value 1 -starttime 100ns -endtime 2000ns Edit:/cpu/RESET 
WaveCollapseAll -1
wave clipboard restore
