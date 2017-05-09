compile: imagelib/imagelib.c t1/t1.c
	gcc -lpng -o secuential imagelib/imagelib.c t1/t1.c -I.
	gcc -lpng -fopenmp -o parallel imagelib/imagelib.c t1/t1.c -I.
