cmake_minimum_required(VERSION 2.8)

project(gl_depth_testing)
set(bin_name gl_depth_testing)

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11 -Wall -g -O2 ")

set(solution_root ${CMAKE_CURRENT_SOURCE_DIR}/../../)
set(project_root ${CMAKE_CURRENT_SOURCE_DIR}/)

file(GLOB source 
    ${project_root}/main.cpp 
    ${project_root}/*.cpp 
    ${solution_root}/lib/*.cpp 
    ${solution_root}/include/learning/*.cpp 
)

message(${solution_root})

include_directories(
    /usr/local/include
    ${solution_root}/include/learning
    ${solution_root}/include
    ${solution_root}/include/imgui
    #/System/Library/Frameworks
)

find_library(lib_assimp assimp
    ${solution_root}/lib
)

find_library(lib_glfw glfw3 ${solution_root}/lib)
find_library(lib_glad glad ${solution_root}/lib)

message(${lib_glfw})
message(${lib_glad})

link_directories(
    ${solution_root}/lib 
    /usr/local/lib 
)

add_executable(
    ${bin_name}
    ${source}
)

target_link_libraries(
    ${bin_name}
    ${lib_assimp}
    ${lib_glad}
    ${lib_glfw}
    -lglfw3  
    -lIrrXML 
    -lz 
    -lXi 
    -lXrandr 
    -lXxf86vm 
    -lXinerama 
    -lXcursor 
    -lrt 
    -lm 
    -lglad 
    -lX11 
    -lGLU 
    -lGL 
    -lpthread
    -lstdc++
    -ldl
)

install(PROGRAMS ${CMAKE_BINARY_DIR}/${bin_name} DESTINATION ${solution_root}/bin)
