#include <stdio.h>

int main(int argc, char const *argv[]) {
  /* code */
  if (argc != 4) {
    printf("Modo de uso: %s <input.png> <kernel.txt> <output.png>\n", argv[0]);
    printf("\t<input.png> es la imagen a filtrar\n");
    printf("\t<kernel.txt> es el filtro a usar\n");
    printf("\t<output.png> es donde se guardará la imagen resultante\n");
    return 1;
  }
  return 0;
}
