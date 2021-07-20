cmake_minimum_required(VERSION 3.0...3.21)

project(glad)

add_library(glad STATIC glad.c)

target_include_directories(glad PUBLIC ${CMAKE_SOURCE_DIR}/include)