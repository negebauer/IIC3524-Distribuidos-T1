#include "../imagelib/imagelib.h"
// #include <omp.h>
#include <stdio.h>
#include <stdlib.h>
#include <time.h>

void timePrint(time_t start) {
  printf("\tTime: %f\n", (double)(time(NULL) - start));
};

int main(int argc, char *argv[]) {
  /* The program receives 3 params */
  if (argc != 4) {
    printf("Modo de uso: %s <input.png> <kernel.txt> <output.png>\n", argv[0]);
    printf("\t<input.png> es la imagen a filtrar\n");
    printf("\t<kernel.txt> es el filtro a usar\n");
    printf("\t<output.png> es donde se guardará la imagen resultante\n");
    return 1;
  }

  time_t start;

  /* We read the image from the file */
  printf("Task: Reading image\n");
  start = time(NULL);
  char *input_file = argv[1];
  Image *img_in = img_png_read_from_file(input_file);
  Image *img_out = img_png_read_from_file(input_file);
  timePrint(start);

  /* Let's read the kernel file */
  printf("Task: Reading mask kernel\n");
  start = time(NULL);
  const char *kernel_file_path = argv[2];
  FILE *kernel_file = fopen(kernel_file_path, "r");
  int rows, cols;
  fscanf(kernel_file, "%i %i", &rows, &cols);
  int center_row = rows / 2;
  int center_col = cols / 2;
  float **kernel = malloc(rows * sizeof(float *));
  for (int row = 0; row < rows; row++) {
    kernel[row] = malloc(cols * sizeof(float));
  }
  for (int row = 0; row < rows; row++) {
    for (int col = 0; col < cols; col++) {
      if (!fscanf(kernel_file, "%f", &kernel[row][col])) {
        break;
      }
    }
  }
  fclose(kernel_file);
  timePrint(start);

  /* Let's create our new image */
  printf("Task: Applying mask\n");
  start = time(NULL);
#pragma omp parallel for
  for (int img_row = 0; img_row < img_in->height; img_row++) {
    for (int img_col = 0; img_col < img_in->width; img_col++) {
      // Let's clear the image first
      img_out->pixels[img_row][img_col].R = 0;
      img_out->pixels[img_row][img_col].G = 0;
      img_out->pixels[img_row][img_col].B = 0;

      for (int kernel_row = 0; kernel_row < rows; kernel_row++) {
        for (int kernel_col = 0; kernel_col < cols; kernel_col++) {
          int pixel_row = img_row - center_row + kernel_row;
          int pixel_col = img_col - center_col + kernel_col;
          float weight = kernel[kernel_row][kernel_col];
          if (pixel_row < 0) {
            pixel_row = 0;
          } else if (pixel_row >= img_in->height) {
            pixel_row = img_in->height - 1;
          }
          if (pixel_col < 0) {
            pixel_col = 0;
          } else if (pixel_col >= img_in->width) {
            pixel_col = img_in->width - 1;
          }
          img_out->pixels[img_row][img_col].R +=
              weight * img_in->pixels[pixel_row][pixel_col].R;
          img_out->pixels[img_row][img_col].G +=
              weight * img_in->pixels[pixel_row][pixel_col].G;
          img_out->pixels[img_row][img_col].B +=
              weight * img_in->pixels[pixel_row][pixel_col].B;
        }
      }
    }
  }
  timePrint(start);

  /* We save the filtered image to a png */
  printf("Task: Saving image\n");
  start = time(NULL);
  char *output_file = argv[3];
  img_png_write_to_file(img_out, output_file);
  timePrint(start);

  /* We release the resources used by the images */
  printf("Task: Clearing resources\n");
  start = time(NULL);
  img_destroy(img_in);
  img_destroy(img_out);

  /* We release the resources used by the kernel  */
  for (int row = 0; row < rows; row++) {
    free(kernel[row]);
  }
  free(kernel);
  timePrint(start);
  return 0;
}
