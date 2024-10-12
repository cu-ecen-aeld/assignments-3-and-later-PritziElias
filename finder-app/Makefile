writer: writer.o
	${CROSS_COMPILE}gcc -Wall writer.o -o writer

# TODO -> Add support for cross compilation

writer.o: writer.c
	${CROSS_COMPILE}gcc -c -Wall writer.c

clean: 
	rm -f writer *.o