cmake_minimum_required(VERSION 3.0...3.21)

project(
    LearningOpenGL 
    VERSION 1.0
    LANGUAGES CXX
)

# add_custom_command(OUTPUT clean_and_prepare_directories
#     COMMAND ${CMAKE_COMMAND} -E remove_directory build 
#     COMMAND ${CMAKE_COMMAND} -E remove_directory cmake-build-debug
#     COMMAND ${CMAKE_COMMAND} -E make_directory cmake-build-debug
# )

# add_custom_target(run DEPENDS clean_and_prepare_directories)

# options and vars
set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED True)
set(SOLUTION_ROOT ${PROJECT_SOURCE_DIR})

# common source files
aux_source_directory(${PROJECT_SOURCE_DIR}/lib/ SRC)
aux_source_directory(${PROJECT_SOURCE_DIR}/include/learning/ SRC)

# include directories
add_subdirectory(include)

# libraries
add_subdirectory(glad)
add_subdirectory(imgui)

add_subdirectory(gl_model)
add_subdirectory(gl_basic)
# add_subdirectory(gl_light)
add_subdirectory(gl_multilights)
add_subdirectory(gl_game2d_breakout)
add_subdirectory(gl_advance_opengl)