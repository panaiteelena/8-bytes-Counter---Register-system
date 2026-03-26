# Counter – Register v1 (FPGA VHDL Project)

## Overview
This project implements an 8-bit sequential system on an FPGA using VHDL. The system operates either as a parallel register or as a binary down counter, depending on control inputs.

The design is implemented and tested on the BASYS3 FPGA development board using Vivado.

---

## Project Requirements
- 8-bit sequential circuit
- Priority active-high reset
- Two selection inputs for mode control
- Clock signal with a 1-second period
- Bitstream verification on BASYS3 board

---

## Functional Description

### Parallel Register Mode
- Loads an 8-bit input value
- Stores the value until updated
- Used for stable data storage

### Binary Down Counter Mode
- Decrements the stored value every clock cycle
- Clock period is 1 second (using a frequency divider)

  <img width="707" height="469" alt="image" src="https://github.com/user-attachments/assets/08599eed-ae46-4ac0-a674-607252ecd657" />


### Control Logic

| Selection | Mode              |
|----------|-------------------|
| 0       | Parallel Register |
| 1       | Down Counter      |

- Includes priority reset (active HIGH)

---

## Implementation Details

### Technologies Used
- VHDL
- Vivado Design Suite
- BASYS3 FPGA board

### BASYS3 Features
- Artix-7 FPGA (XC7A35T)
- 16 switches, 16 LEDs
- 5 buttons
- 4-digit 7-segment display
- VGA output
- USB-JTAG interface

---

## Constraints File (.xdc)
- Maps clock and reset to buttons
- Maps selection inputs to switches
- Maps outputs to LEDs
- Implements 1 Hz clock using a frequency divider

  <img width="573" height="618" alt="image" src="https://github.com/user-attachments/assets/35a29e1e-0021-454d-b656-a12cb426d50a" />

  <img width="576" height="559" alt="image" src="https://github.com/user-attachments/assets/8bf854c5-2c73-4230-ac4c-43f8f64d0fb0" />



---

## Design Flow

1. Write VHDL code
2. Simulate in Vivado
3. Add constraints file (.xdc)
4. Run synthesis
5. Perform timing simulation
6. Implement design
7. Generate bitstream
8. Program FPGA via USB
9. Test on BASYS3:
   - Parallel register functionality
   - Down counter functionality

---

## Results
- Both modes function correctly
- Successful switching between modes
- Verified on hardware using LEDs

---

## Conclusion
This project demonstrates the implementation of a sequential digital system using VHDL on FPGA. It reinforces knowledge of digital design, FPGA workflows, and hardware description languages.

---

## References
- BASYS3 Reference Manual  
  https://reference.digilentinc.com/reference/programmable-logic/basys-3/reference-manual  

---

## Authors
- Gheorghiță Leonardo - Davide  
- Franiuc Cristian - Nicolae  
- Panaite Elena - Alexandra  

Supervisor: Assist. PhD Student Ionica Pletea
