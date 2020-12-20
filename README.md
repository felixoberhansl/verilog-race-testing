## Verilog Race Condition Testing

This is a small System Verilog Project that exemplifies how modules in SystemVerilog have to be designed to correctly simulate and synthesize a pipelined register architecture. It consists of a small computation slice which multiplies and adds constant values and has a D-FlipFlop at its output, followed by 2 D-FlipFlops.
Basically it just follows these simple design principles:

* Use non-blocking (`<=`) assignments in sequential logic
* Use blocking (`=`) assignments in combinatorial logic

