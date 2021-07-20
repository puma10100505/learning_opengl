cmake_minimum_required(VERSION 3.0...3.21)

set(ASSETS_PATH_BASE ${PROJECT_SOURCE_DIR})

configure_file(CommonDefines.h.in CommonDefines.h)

message(${PROJECT_BINARY_DIR})