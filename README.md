# DSD_Project_Hamming_code_error_detection_and_correction_in_verilog
A Hamming Code Error Detection and Correction System is a Digital Systems Design project designed to detect and correct a single-bit error in a 4-bit data word using 3 parity bits.

The system begins by generating a random 4-bit data word and calculates the necessary parity bits using an Arithmetic and Logic Unit (ALU). These parity bits are then concatenated with the original data bits, forming a 7-bit Hamming code for transmission.

During transmission, the data may encounter errors in an error-prone channel. The ALU then verifies the received parity bits, detecting any errors using XOR operations. If an error is found, the system identifies its position and corrects it by flipping the erroneous bit.

This project is implemented using Verilog programming in Active-HDL.
