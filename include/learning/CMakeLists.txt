cmake_minimum_required(VERSION 3.0...3.21)

project(learning)

aux_source_directory(${CMAKE_CURRENT_SOURCE_DIR} LEARNING_SRC)

add_library(${PROJECT_NAME} STATIC ${LEARNING_SRC})

message(${SOLUTION_ROOT})

target_include_directories(${PROJECT_NAME} PUBLIC 
    ${SOLUTION_ROOT}/src/learning
    ${SOLUTION_ROOT}/include
    ${SOLUTION_ROOT}/src/stb_image
)