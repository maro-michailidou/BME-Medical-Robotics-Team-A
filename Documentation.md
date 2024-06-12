# BME Robotic Finger Project Team A

## Overview


## File Descriptions

### MATLAB Scripts and Functions


### GUI Development Files
 
- **GUI_inverse_kinematics.m**: Solves the inverse kinematics problem for given phalanges lengths, end effector's (fingertip) position and orientation (x, y, z, total angle with respect to x-axis in x-z plane) and returns to the GUI the 4 angles solutions, along with some additional information about their validity check, calling internally check_valid_angles().
  
- **GUI_get_all_positions.m**: Returns to the GUI the positions for all 3 joints (MCP, PIP, DIP) and for the end effector (fingertip), using a predetermined modified DH parameters table and the general transformation matrix and given as
 argument the lengths of the three phalanges and the angles that must be calculated first during inverse kinematics solution. The GUI uses this
 function to visualize explicitly each phalange in 3D plot.

- **check_valid_angles.m**: Called inside GUI_inverse_kinematics. Checks if the given joint angles are within the operational limits of the robotic finger. Performs validation check for all four angles, ensuring they are inside the valid ranges specified.


## How to Use

0. **Prerequisites**:  