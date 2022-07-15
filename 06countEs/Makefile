all: sampleexam3.asm
	yasm -a x86 -m amd64 -g dwarf2 -f elf64 -o sampleexam3.o sampleexam3.asm
	gcc -m64 -no-pie -o sampleexam3 sampleexam3.o


clean:
	rm *.out
	rm *.o
