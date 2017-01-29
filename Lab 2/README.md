LAB 2 Documentation

Bill Of Materials:

Wiring Schematic:

Mechanical Drawing:

Code:
Please see associated Arduino file 

Design of System:

The inspiration for this design comes from both my piano playing background as well as from Lab 1. Because I did not have time to complete lab 1, I was hoping to incorporate some of the concepts from Lab 1 into Lab 2. Thus, I came up with this design to utilize both forward/inverse kinematic and piano playing concepts to build a animatronic piano-playing system.

This system is a very basic kinematic linkage with only two joint and an end effector. Because the orientation of the end effector is not important, the necessary degrees of freedom are cut down to 3, making inverse kinematic computation much more easy. The kinematic linkage can be observed in the section titled 'Mechanical Drawing'. As can be seen, the first servo-controlled joint serves to rotate the cardboard slab to move the second joint to a certain position on the keyboard, whereby the servo controlling the second joint can effectively press down on a piano key and 'play' a note.

Explain how each element of your
system works. Detail your design process, and explain any design decisions you made along the way. Point out
potential alternatives and areas for further development to allow others to build off of your work.
