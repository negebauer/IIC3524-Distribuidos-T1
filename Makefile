compile: imagelib/imagelib.c t1/t1.c
	gcc-7 -lpng -o secuential imagelib/imagelib.c t1/t1.c -I.
	gcc-7 -lpng -fopenmp -o parallel imagelib/imagelib.c t1/t1.c -I.
