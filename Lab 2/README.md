LAB 2 Documentation

Bill Of Materials:

Wiring Schematic:

Mechanical Drawing:

Code:
Please see associated Arduino file 

Design of System:

The inspiration for this design comes from both my piano playing background as well as from Lab 1. Because I did not have time to complete lab 1, I was hoping to incorporate some of the concepts from Lab 1 into Lab 2. Thus, I came up with this design to utilize both forward/inverse kinematic and piano playing concepts to build a animatronic piano-playing system.

This system is a very basic kinematic linkage with only two joint and an end effector. Because the orientation of the end effector is not important, the necessary degrees of freedom are cut down to 3, making computation much simpler. The kinematic linkage can be observed in the section titled 'Mechanical Drawing'. As can be seen, the first servo-controlled joint serves to rotate the cardboard slab to move the second joint to a certain position on the keyboard, whereby the servo controlling the second joint can effectively press down on a piano key and 'play' a note.

The code for Forward Kinematics can be seen in the attached .m Matlab file. Because of this kinematic linkage's contrained range of motion, I thought that writing code for inverse kinematics is unecessary. The system is already set up (by default, the second servo positioned between the notes E and F, which 1) places the default position right in the middle of the give 6 note range and 2) provides a simple and accurate method to place the system each time for performance) such that its range of motion covers 6 notes: C,D,E,F,G,A, of the C major scale, therefore, all that is left to discern is the correct angle to position the second servo in the range of the correct note. Each note is measured to be approximately 2.4cm in diameter, which is the y axis in the world reference frame. Therefore, we only need to calculate joint angles to place us in the correct y-axis coordinates. This is done by taking the total transformation obtained from forward kinematics and extracting the equation for the y coordinates of the end effector: (27*sin(T1))/2 + 2*sin(T1)*sin(T2). 

Since we have two variables, we could do optimization to calculate parameters the minimize range of motion; however, I realized since the second servo's usage is more for playing the notes, we can just assume ignore the second variable T2 = 0 and get a unique solution solving y = (27*sin(T1))/2. 
TI = arcsin(2*y/27)

The following list contains the data for each of the piano notes:

C: 4.8cm:7.2cm -> 0.363508:0.562536 rad
D: 2.4cm:4.8cm -> 0.178728:0.363508 rad
E: 0+:2.4cm -> 0+:0.178728 rad
F: 0-:-2.4cm -> 0-:-0.178728 rad
G: -2.4cm:-4.8cm -> -0.178728:-0.363508 rad
A: -4.8cm:-7.2cm -> -0.363508:-0.562536 rad

Obviously, arduino and the servo cannot exact this kind of precision. Let us first convert to degrees (which is how arduino is programmed to actuate the servo) and then round off.

C: 20.8:32.2 degreees
D: 10.2:20.8 degrees
E: 0+:10.2 degrees
F: 0-:-10.2 degrees
G: -10.2:-20.8 degrees
A: -20.8:-32.2 degrees

Then, we will pick a point within the degree boundaries that is easy for a human to understand:

C: 25 degrees
D: 15 degrees
E: 5 degrees
F: -5 degrees
G: -15 degrees
A: -25 degrees

The angular speed of the servo is listed as 0.09 sec/60°
This will be utilized in relation to a delay introduced to create the illusion of tempo in the code. In other words, the microcontroller will calculate the time it will take for servo 1 to reach the correct position based on this information, and then introduce a delay before activating servo 2 to play a note. The longest time it would take for this system is to travel from C to A, a total of 50 degrees, which is 0.075 sec. To play a note, we will need to rotate the second servo from a position of -90 degrees to zero degrees, which would take 0.135 sec. The total time would thus be 0.21 sec. If this time period were to be used as tempo, it would translate into 285 bpm which is unecessarily fast. Therefore, we will set the tempo to 120bpm, and implement delays based on this:

Tempo = 120 bpm
Period = 0.5 sec

Explain how each element of your
system works. Detail your design process, and explain any design decisions you made along the way. Point out
potential alternatives and areas for further development to allow others to build off of your work.
Pictures, videos, and text descriptions should
be used to clearly describe the construction and operation of the instrument. 
