cmake_minimum_required(VERSION 3.0...3.21)

project(gl_basic VERSION 1.0 )

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED True)

add_executable(${PROJECT_NAME}
    *.cpp
    ${CMAKE_SOURCE_DIR}/../lib/*.cpp 
    ${CMAKE_SOURCE_DIR}/../lib/*.c 
    ${CMAKE_SOURCE_DIR}/../include/learning/*.cpp)

target_include_directories(${PROJECT_NAME} 
    PUBLIC 
    ${CMAKE_SOURCE_DIR}/../include
    ${CMAKE_SOURCE_DIR}/../include/learning
    ${CMAKE_SOURCE_DIR}/../include/imgui
    "/usr/local/include" 
)

target_link_directories(${PROJECT_NAME}
    PUBLIC
    ${CMAKE_SOURCE_DIR}/../lib
)

add_library(BasicLibraries STATIC )

target_link_libraries(${PROJECT_NAME}
    PRIVATE 
    
)

