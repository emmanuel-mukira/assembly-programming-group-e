# Starting GDB 
gdb --silent my_program 

Explanation: 
● –silent: Suppresses startup information. 
● gdb my_program: Starts GDB debugging session with my_program. 


Displays register values in a dedicated window. 
● Assembly Layout: (gdb) layout asm / lay asm
● Register Layout: (gdb) layout reg / lay reg


# Show in hexadecimal
p/x $rax

# Show in decimal
p/d $rax

# Show in binary
p/t $rax

# Show as character (for AL)
p/c $al
