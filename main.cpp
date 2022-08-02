#include <iostream>

#include "cuda/add.cuh"
#include "cuda/foo.cuh"
#include "cuda/matrixMul.cuh"

//extern "C"
//void useCUDA();

int main(int argc, char **argv)
{
    std::cout<<"Hello C++"<<std::endl;
    useCUDA();
    addCUDA();

//    std::string strArgv = "-device=0 -wA=5 -hA=5 -wB=5 -wB=5";
//    char **argv = { {"-device=0 -wA=5 -hA=5 -wB=5 -wB=5"}, };
    for(int i=0; i< argc; i++) {
        printf("argv[%d] = %s \n", i, argv[i]);
    }

    matrixMul(1, nullptr);

    return 0;
}
