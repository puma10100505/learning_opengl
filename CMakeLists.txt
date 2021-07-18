cmake_minimum_required(VERSION 2.8...3.13)

project(learning_opengl)

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11 -Wall -g -O2 ")
set(solution_root ${CMAKE_CURRENT_SOURCE_DIR})

include_directories(
    /usr/local/include
    ${solution_root}/include/learning
    ${solution_root}/include
    ${solution_root}/include/imgui
)

if (UNIX)
    find_library(lib_assimp assimp 
        ${solution_root}/lib
    )

    find_library(lib_glfw glfw3 
        ${solution_root}/lib 
    )

    link_directories(
        ${solution_root}/lib
        /usr/local/lib 
    )
elseif (WIN32)
    find_library(lib_glfw glfw3
        ${solution_root}/lib/win64
    )

    link_directories(
        ${solution_root}/lib/win64
    )
endif()

#add_subdirectory(gl_basic)
add_subdirectory(gl_model)
#add_subdirectory(gl_light)
#add_subdirectory(gl_multilights)

