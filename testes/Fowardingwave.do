view wave 
wave clipboard store
wave create -driver freeze -pattern clock -initialvalue 1 -period 100ns -dutycycle 50 -starttime 0ns -endtime 1000ns sim:/fowarding/clock1 
wave create -driver freeze -pattern constant -value 1 -starttime 0ns -endtime 1000ns sim:/fowarding/RegWriteWB 
wave create -driver freeze -pattern constant -value 000 -range 2 0 -starttime 0ns -endtime 1000ns sim:/fowarding/EXRS 
WaveExpandAll -1
wave create -driver freeze -pattern constant -value 000 -range 2 0 -starttime 0ns -endtime 1000ns sim:/fowarding/EXRT 
WaveExpandAll -1
wave create -driver freeze -pattern constant -value 000 -range 2 0 -starttime 0ns -endtime 1000ns sim:/fowarding/WBRD 
WaveExpandAll -1
wave modify -driver freeze -pattern constant -value 001 -range 2 0 -starttime 0ns -endtime 100ns Edit:/fowarding/EXRS 
wave modify -driver freeze -pattern constant -value 001 -range 2 0 -starttime 0ns -endtime 100ns Edit:/fowarding/EXRT 
wave modify -driver freeze -pattern constant -value 001 -range 2 0 -starttime 0ns -endtime 100ns Edit:/fowarding/WBRD 
wave modify -driver freeze -pattern constant -value 011 -range 2 0 -starttime 100ns -endtime 200ns Edit:/fowarding/EXRS 
wave modify -driver freeze -pattern constant -value 110 -range 2 0 -starttime 200ns -endtime 300ns Edit:/fowarding/EXRT 
wave modify -driver freeze -pattern constant -value 010 -range 2 0 -starttime 200ns -endtime 300ns Edit:/fowarding/WBRD 
wave modify -driver freeze -pattern constant -value 100 -range 2 0 -starttime 300ns -endtime 400ns Edit:/fowarding/WBRD 
wave modify -driver freeze -pattern constant -value 100 -range 2 0 -starttime 300ns -endtime 400ns Edit:/fowarding/EXRS 
wave modify -driver freeze -pattern constant -value 111 -range 2 0 -starttime 400ns -endtime 500ns Edit:/fowarding/WBRD 
wave modify -driver freeze -pattern constant -value 111 -range 2 0 -starttime 400ns -endtime 500ns Edit:/fowarding/EXRT 
WaveCollapseAll -1
wave clipboard restore
