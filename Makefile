compile: imagelib/imagelib.c t1/secuential.c t1/parallel.c
	gcc-7 -lpng -o secuential imagelib/imagelib.c t1/secuential.c -I.
	gcc-7 -lpng -fopenmp -o parallel imagelib/imagelib.c t1/parallel.c -I.
