## How it works

This project implements a 4-bit full adder. It takes two 4-bit inputs (A and B) 
and a 1-bit carry-in, and produces a 4-bit sum and a 1-bit carry-out.

The pin mapping is:
- ui_in[3:0] - input A
- ui_in[4] - carry-in
- uio_in[3:0] - input B
- uo_out[3:0] - sum output
- uo_out[4] - carry out

The adder uses an always_comb block to compute a 5-bit result, then splits it 
into a 4-bit sum and 1-bit carry-out.

## How to test

The cocotb testbench in test/test.py tests the adder with 8 test cases covering
zero inputs, basic addition, mid-range values, max values with and without 
carry-in, and carry propagation. Each test checks both the 4-bit sum and 
carry-out against the expected result.

## External hardware

None.
