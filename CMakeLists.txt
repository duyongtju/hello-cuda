# CMakeLists.txt for G4CU project

set(TARGET_NAME hello_cuda)

project(${TARGET_NAME})

# required cmake version
cmake_minimum_required(VERSION 2.8)

find_package(CUDA)

add_subdirectory(cuda)
set (EXTRA_LIBS ${EXTRA_LIBS} gpu)

include_directories(${CMAKE_SOURCE_DIR}/Common)

CUDA_ADD_EXECUTABLE(${TARGET_NAME} main.cpp)

target_link_libraries (${TARGET_NAME} ${EXTRA_LIBS})
