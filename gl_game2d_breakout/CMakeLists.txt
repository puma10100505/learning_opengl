cmake_minimum_required(VERSION 2.8)

project(gl_game2d_breakout)
set(bin_name gl_game2d_breakout)

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++17 -Wall --stdlib=libc++ -g -O2 ")

set(solution_root ${CMAKE_CURRENT_SOURCE_DIR}/../)
set(project_root ${CMAKE_CURRENT_SOURCE_DIR}/)

message(${solution_root})
message(${project_root})
# message(${CMAKE_BINARY_DIR})

file(GLOB source 
    ${project_root}/main.cpp 
    ${project_root}/*.cpp 
    ${solution_root}/lib/*.cpp 
    ${solution_root}/include/learning/*.cpp 
)

message(${source})

include_directories(
    /usr/local/include
    ${solution_root}/include/learning
    ${solution_root}/include
    ${solution_root}/include/imgui
)

# link_directories(
#     ${solution_root}/lib 
#     /usr/local/lib 
# )

find_library(lib_assimp assimp
    ${solution_root}/lib
)

find_library(lib_glfw glfw ${solution_root}/lib)
find_library(lib_glad glad ${solution_root}/lib)

add_executable(
    ${bin_name}
    # ${app}
    ${source}
)

target_link_libraries(
    ${bin_name}
    ${lib_assimp}
    ${lib_glad}
    ${lib_glfw}
    -lstdc++
)

install(PROGRAMS ${CMAKE_BINARY_DIR}/${bin_name} DESTINATION ${solution_root}/bin)

# execute_process(COMMAND "export PATH=$PATH:${solution_root}/bin")