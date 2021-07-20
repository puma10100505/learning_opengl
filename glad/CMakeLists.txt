cmake_minimum_required(VERSION 3.0...3.21)

add_library(glad glad.c)

target_include_directories(glad PUBLIC ${CMAKE_SOURCE_DIR}/include)

#target_include_directories(glad INTERFACE ${CMAKE_CURRENT_SOURCE_DIR})