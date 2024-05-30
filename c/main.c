#include "stdio.h"
#include "stdlib.h"
#include "main.h"

int main(int argc, char const *argv[]){
    printf("El bruh, running functions!\n");

    const char *str = "pabou";
    print_message(str); // second.c

    cpp_call(argc, argv); // cpp_main.cpp
    return 0;
}
