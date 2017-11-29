# DE0FlippyBit
Flippy Bit on a DE0 for Intro to Digital final project

## Proposal: 
Recreate the online hexadecimal-to-binary-conversion game, Flippy Bit, using a DE0’s hardware.

## Description:
We hope to create a modified version of Flippy Bit using seven-segment displays. The player will have a given amount of time in seconds to correctly convert the hexadecimal values chosen and displayed by the system into binary. Our primary inputs will be 8 switches that function as the user’s binary inputs. The outputs will be the score display, the binary values represented by the LEDs, the hexadecimal values from the switch inputs, and the timer display.

## Approach (Main Goal):
In order to create a functioning version of Flippy Bit, there must be an 8 switch system the user can manipulate. Our project will primarily be coded using Verilog to represent and utilize our system’s logic. Our system’s outputs will be displayed on multiple seven-segment displays on a DE0 and a DE0 extension.

## Ideal Goal:
We hope to utilize a VGA display for the hexadecimal values selected by the system instead of displaying them on the DE0’s seven-segment displays. These values will gradually fall down the display until they reach the bottom. If the value reaches the display’s bottom, the player’s score will be set to 0. 

## Stretch Goals:
Have multiple hexadecimal values displayed simultaneously, functioning as multiple on-screen enemies
Create a board that utilizes multiple buttons instead of multiple switches
Extra graphics and display additions

## Responsibilities: 
Tim will be responsible for writing Verilog code for creating and manipulating matrix designs. This code will coincide with Tim’s research into creating a VGA display on a monitor for our project to meet our ideal goal.
Alex will be responsible for writing the Verilog code needed to create and manipulate state machines that determine the player’s progress within the game, such as losing the game or scoring a point. Helen and Tim will also assist with the Verilog as needed. 
Helen will be responsible for the coding of our 8-bit seven-segment display and for creating a counting system for the player’s score using the DE0. 

# VGA Flippy Bit

## Description:
Creating a modified version of Flippy Bit in a black and white VGA display with the monsters being the values dropping down in the matrix. The inputs are the 8 switches. The outputs are the score display, the monster values, the binary values represented by the led, and the hexadecimal values from the switch input. 

## Approach: 
This project will use the VGA output on the DE0 to a display. On the display, there will be a 2 digit hexadecimal number falling from the top of the screen. The user will then need to input the hexadecimal number in binary format on the switched on the DE0. Once the number is correctly input, the hexadecimal number will disappear and the score will be increased by one. 

## Responsibilities:
Tim will be responsible for creating Verilog code for creating and manipulating matrix designs. This code will coincide with Tim’s research into creating a VGA display on a monitor for our project.
Alex will be responsible for writing the Verilog code needed to create and manipulate state machines that determine the player’s progress within the game, such as losing the game or scoring a point. Helen and Tim will also assist with the Verilog as needed. 
Helen will be responsible for the coding of our 8-bit seven-segment display and for creating a counting system for the player’s score using the DE0. Both will be displayed using the DE0’s seven-segment display systems.
