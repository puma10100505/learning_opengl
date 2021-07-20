cmake_minimum_required(VERSION 3.0...3.21)

project(
    learning-OpenGL 
    VERSION 1.0
    LANGUAGES CXX
)

add_subdirectory(include)

#target_include_directories(${PROJECT_NAME} PUBLIC ${PROJECT_BINARY_DIR})

add_subdirectory(glad)
add_subdirectory(imgui)

add_subdirectory(gl_model)

# include(InstallRequiredSystemLibraries)
# set(CPACK_PACKAGE_VERSION_MAJOR "${Tutorial_VERSION_MAJOR}")
# set(CPACK_PACKAGE_VERSION_MINOR "${Tutorial_VERSION_MINOR}")
# include(CPack)