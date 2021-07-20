cmake_minimum_required(VERSION 3.0...3.21)

aux_source_directory(${CMAKE_CURRENT_SOURCE_DIR} imgui_source)

message(${imgui_source})

add_library(imgui ${imgui_source})

target_include_directories(imgui PUBLIC 
    ${CMAKE_SOURCE_DIR}/include/imgui
    ${CMAKE_SOURCE_DIR}/include/
)