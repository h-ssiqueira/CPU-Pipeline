view wave 
wave clipboard store
wave create -driver freeze -pattern clock -initialvalue 1 -period 100ns -dutycycle 50 -starttime 0ns -endtime 1000ns sim:/control/clock1 
wave create -driver freeze -pattern constant -value 1 -starttime 0ns -endtime 1000ns sim:/control/reset1 
wave modify -driver freeze -pattern constant -value 0 -starttime 0ns -endtime 100ns Edit:/control/reset1 
wave create -driver freeze -pattern constant -value 0000 -range 3 0 -starttime 0ns -endtime 1000ns sim:/control/opcode 
WaveExpandAll -1
wave modify -driver freeze -pattern constant -value 0001 -range 3 0 -starttime 100ns -endtime 200ns Edit:/control/opcode 
wave modify -driver freeze -pattern constant -value 0010 -range 3 0 -starttime 200ns -endtime 300ns Edit:/control/opcode 
wave modify -driver freeze -pattern constant -value 0011 -range 3 0 -starttime 300ns -endtime 400ns Edit:/control/opcode 
wave modify -driver freeze -pattern constant -value 0100 -range 3 0 -starttime 400ns -endtime 500ns Edit:/control/opcode 
wave modify -driver freeze -pattern constant -value 0101 -range 3 0 -starttime 500ns -endtime 600ns Edit:/control/opcode 
wave modify -driver freeze -pattern constant -value 0110 -range 3 0 -starttime 600ns -endtime 700ns Edit:/control/opcode 
wave modify -driver freeze -pattern constant -value 0111 -range 3 0 -starttime 700ns -endtime 800ns Edit:/control/opcode 
wave modify -driver freeze -pattern constant -value 1000 -range 3 0 -starttime 800ns -endtime 900ns Edit:/control/opcode 
wave modify -driver freeze -pattern constant -value 1001 -range 3 0 -starttime 900ns -endtime 1000ns Edit:/control/opcode 
wave modify -driver freeze -pattern constant -value 0000 -range 3 0 -starttime 1000ns -endtime 1100ns Edit:/control/opcode 
wave modify -driver freeze -pattern constant -value 1 -starttime 100ns -endtime 1100ns Edit:/control/reset1 
wave modify -driver freeze -pattern clock -initialvalue 1 -period 100ns -dutycycle 50 -starttime 0ns -endtime 1100ns Edit:/control/clock1 
WaveCollapseAll -1
wave clipboard restore
