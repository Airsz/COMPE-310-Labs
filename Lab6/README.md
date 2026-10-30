# Lab 6: Arduino External LED Blink

## Circuit Design
* **Components:** Arduino Uno, Breadboard, LED, 330 Ω resistor, wires.
* **Wiring:** Pin 12 connects to the LED anode (+). The cathode (-) connects through a 330 Ω resistor to GND[cite: 3].

## Code & Pin Explanation
* `pinMode(12, OUTPUT)` sets Pin 12 as a digital output.
* `digitalWrite` toggles Pin 12 between 5V (HIGH) and 0V (LOW) with 1000 ms delays to blink the LED once per second[cite: 3].