# Hardware Assignment 2: 4-Digit Seven-Segment Display Driver on Basys3 FPGA Board

## Authors
- **Pramod Kumar Meena (2023CS51175)**
- **Manvendra Rajpurohit (2023CS10936)**

## Problem Statement
1. Design a combinational circuit that accepts a single 4-bit hexadecimal or decimal digit as input from the switches and generates a 7-bit output to drive the seven-segment display of the Basys3 FPGA board.
2. Extend the design to create a timing circuit that controls all four displays, enabling them to display four digits simultaneously.

## Project Overview
This project involves designing and implementing a hardware circuit to drive the 7-segment displays on the Basys3 FPGA board. The design is modular, with each component verified individually before integration.

## Components and Their Functions

### 1. Top-Level Entity (`top_entity.vhd`)
- **Purpose:** Integrates the multiplexer, timing block, and BCD to 7-segment decoder.
- **Inputs:**
  - Four 4-bit inputs representing hexadecimal/decimal digits.
  - Clock signal (100 MHz) and reset signal.
- **Outputs:**
  - `output_anode`: Controls which 7-segment display is active.
  - `output_cathode`: 7-bit signal driving the segments of the display.

### 2. Timing Block (`Timing_circuit.vhd`)
- **Purpose:** Generates the necessary timing signals for display multiplexing.
- **Key Features:**
  - **Clock Division:** Divides the 100 MHz input clock to approximately 1 kHz to avoid display flickering.
  - **Multiplexer Select Signal:** Produces a 2-bit `mux_select` signal that cycles through the four displays.
  - **Anode Control:** Generates the anode signals to activate one display at a time.
  - **Reset Functionality:** Resets the counter and timing signals as needed.

### 3. Multiplexer (`mux4x1.vhd`)
- **Purpose:** Selects one of the four 4-bit inputs based on the `mux_select` signal.
- **Operation:**
  - **Inputs:** Four 4-bit numbers (`i1`, `i2`, `i3`, `i4`).
  - **Control:** 2-bit select signal determining the active input.
  - **Output:** 4-bit digit selected for display.

### 4. BCD to 7-Segment Decoder (`bcd_7.vhd`)
- **Purpose:** Converts a 4-bit BCD input into a 7-bit output for the seven-segment display.
- **Key Features:**
  - **Input:** 4-bit BCD digit.
  - **Output:** 7-bit signal (segments a to g) generated using minimized Boolean expressions.
  - **Logic Optimization:** Karnaugh maps were used to derive optimized Boolean expressions for each segment.

## Design Decisions and Approach
- **Component Breakdown:** The design is divided into modular components to simplify development and testing.
- **Clock Division:** A counter divides the 100 MHz clock to roughly 1 kHz, ensuring flicker-free display refresh.
- **Optimized Combinational Logic:** A detailed truth table and Karnaugh maps were used to derive minimized Boolean expressions for the seven-segment display.

## Implementation Details

### Truth Table & Karnaugh Maps
A comprehensive truth table was developed to define the relationship between the 4-bit inputs and the required 7-bit outputs for the seven-segment display. Karnaugh maps were then used to optimize the Boolean expressions for each segment (a–g).

### Simulation Snapshots
Simulation was performed on the following modules:
- **top_entity**
- **bcd_7**
- **Timing_circuit**

Embed the simulation snapshots in your README using the Markdown image syntax:
```markdown
