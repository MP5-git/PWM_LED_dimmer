<!---

This file is used to generate your project datasheet. Please fill in the information below and delete any unused
sections.

You can also include images in this folder and reference them in the markdown. Each image must be less than
512 kb in size, and the combined size of all images must be less than 1 MB.
-->


# Tiny Tapeout Project

TinyTapeout is an educational project that makes it easier and cheaper
than ever to get your digital designs manufactured on a real chip.

When your design is ready, you can submit it for manufacturing on a 
physical chip with Tiny Tapeout.

To learn more, follow the tutorial at https://tinytapeout.com/digital_design/


# Tiny Tapeout Project: 7-Segment Display: PWM / Animation Controller

## Overview

This Tiny Tapeout project demonstrates a **multi-mode digital design** using:

- A **7-segment display** (including the decimal point)
- **DIP switches** as user inputs
- Internal logic for **PWM generation** and **LED animations**

The design allows the user to switch between two main operating modes:

1. **PWM LED Dimmer**
2. **7-Segment LED Animation**

The active mode and sub-functions are controlled entirely via DIP switches, making the project easy to test both in simulation (e.g. Wokwi) and on real Tiny Tapeout silicon.

---

## Features

- Mode selection via DIP switches  
- PWM brightness control with edge-triggered inputs  
- Visual feedback using a 7-segment display  
- Two different animation patterns with fixed frequencies  
- Safe boundary handling (no overflow or underflow of brightness levels)

---

## Inputs and Outputs

### Inputs (DIP Switches)

| Switch | Name | Function |
|------:|------|----------|
| 0 | `SW0` | Increase brightness (rising edge) |
| 1 | `SW1` | Decrease brightness (rising edge) |
| 2 | `SW2` | Mode select (PWM / Animation) |
| 3 | `SW3` | Animation type select |

> **Note:**  
> Switches `SW0` and `SW1` are **edge-sensitive**. Only a **rising edge** (OFF → ON) triggers an action.

---

### Outputs

- **7-Segment Display**
  - Displays digits `0`–`9`
  - Used to show brightness level or animation patterns
- **Decimal Point (DP) LED**
  - Used as a PWM-driven LED for brightness visualization

---

## Operating Modes

### Mode Selection (SW2)

| SW2 | Mode |
|----:|------|
| OFF | PWM LED Dimmer |
| ON  | 7-Segment Animation |

---

## Mode 1: PWM LED Dimmer

**Activated when:**  
`SW2 = OFF`

### Description

In PWM LED Dimmer mode, the project behaves like a **digital brightness controller**.  
The brightness level is adjusted using two DIP switches and visualized both numerically and via PWM brightness.

---

### Brightness Control

| Switch | Action |
|------:|--------|
| SW0 | Increase brightness (rising edge) |
| SW1 | Decrease brightness (rising edge) |

- Brightness levels range from **0 to 9**
- Each step represents a higher or lower PWM duty cycle
- Changes only occur on **rising edges**
- Once the minimum (`0`) or maximum (`9`) is reached, further changes in that direction are ignored

---

### Display Behavior

#### 7-Segment Display

- Shows the current brightness level as a digit from **0 to 9**
- Example:
  - `0` → minimum brightness
  - `9` → maximum brightness

#### Decimal Point (DP LED)

- Driven by the PWM signal
- Brightness corresponds to the duty cycle
- Duty-cycle mapping:

| Display Value | Duty Cycle |
|--------------:|-----------|
| 0 | 0% |
| 1 | ~11% |
| 2 | ~22% |
| ... | ... |
| 9 | 100% |

This allows the user to **see and feel** the effect of PWM dimming in real time.

---

### Boundary Protection

- Brightness **cannot go below 0**
- Brightness **cannot exceed 9**
- Input edges beyond these limits are safely ignored

---

## Mode 2: 7-Segment Animation

**Activated when:**  
`SW2 = ON`

In this mode, the 7-segment display is used purely for **visual animations**, independent of PWM dimming.

---

### Animation Selection (SW3)

| SW3 | Animation |
|----:|-----------|
| OFF | All LEDs flashing |
| ON  | Outer LEDs rotating (circle animation) |

---

### Animation 1: All LEDs Flashing

**Activated when:**  
`SW2 = ON`, `SW3 = OFF`

#### Description

- All segments of the 7-segment display flash ON and OFF together
- Flash frequency:
  - **5 / 3 Hz** (~1.67 Hz)
- Creates a clear, attention-grabbing blinking pattern

---

### Animation 2: Outer LEDs Rotating (Circle Animation)

**Activated when:**  
`SW2 = ON`, `SW3 = ON`

#### Description

- Only the **outer segments** of the 7-segment display are used
- Segments light up sequentially to create a **rotating circle effect**
- Rotation frequency:
  - **10 / 3 Hz** (~3.33 Hz)
- Produces a smooth and visually appealing animation

---

## Usage Summary

### Quick Start

1. Power the design or start simulation
2. Use `SW2` to select the operating mode
3. Depending on the mode:
   - Adjust brightness using `SW0` / `SW1`
   - Select animation using `SW3`
4. Observe output on the 7-segment display and DP LED

---


## Simulation & Manufacturing

- Designed for **Wokwi** simulation
- Fully compatible with **Tiny Tapeout** fabrication flow
- Can be submitted directly as a Tiny Tapeout project

For more information on Tiny Tapeout digital design, see:  
https://tinytapeout.com/digital_design/

---

## External hardware

No external hardware required.

---

## License & Credits

This project is intended for **educational use** as part of the Tiny Tapeout ecosystem.

Feel free to modify, extend, or reuse this design for learning and experimentation.


