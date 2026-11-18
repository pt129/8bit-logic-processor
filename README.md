# 8-bit bit-serial logic processor

Add the five .sv files as Vivado design sources. Set logic_processor_top as top.
Ports: 
- Input: Clk, Reset, LoadA, LoadB, Execute, Din[7:0], F[2:0], R[1:0]
- Output: Aval[7:0], Bval[7:0].

# Function selection F: 
| F | Meaning |
| --- | --- |
| '000' | 'AND' | 
| '001' | 'OR' |
| '010' | 'XOR' |
| '011' | 'xFF' |
| '100' | 'NAND' | 
| '101' | 'NOR' | 
| '110' | 'XNOR' |
| '111' | 'CLR' |

# Routing R: 
| R | Meaning |
| --- | --- |
| '00' | 'A/B unchanged' | 
| '01' | 'result -> B' | 
| '10' | 'result -> A' | 
| '11' | 'swap A and B' |

IMPORTANT: This is synthesizable core RTL, NOT a complete pushbutton-safe board design.
External switches/buttons must be electrically valid and synchronized to Clk.
Mechanical pushbuttons require debouncing. If Execute is active-low, invert it
before using this top module. Consult your board documentation to verify polarity.
Keep F and R stable for all 8 shifts. 
At 100 MHz the operation takes 40 ns; observe final LEDs or use simulation/ILA.
