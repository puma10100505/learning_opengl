cmake_minimum_required(VERSION 3.0...3.21)

project(
    learning-OpenGL 
    VERSION 1.0
    LANGUAGES CXX
)

add_subdirectory(glad)
add_subdirectory(imgui)

add_subdirectory(gl_model)