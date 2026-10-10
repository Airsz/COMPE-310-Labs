# COMPE-310-Labs
# Lab 5
## Part IA
gcc -O0 -S helloworld.c
## Part IB
gcc -O4 -S helloworld.c -o helloworld_O4.s
## Part II
gcc -S HelloWorld.c -o hello_c.s
## Part III
gcc -O0 -S whileloop.c -o whileloop.s
## findmax
gcc -nostdlib -no-pie findmax.s -o findmax
./findmax
