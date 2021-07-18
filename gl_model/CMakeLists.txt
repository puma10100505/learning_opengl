cmake_minimum_required(VERSION 2.8...3.13)

project(gl_model)
set(bin_name gl_model)


set(project_root ${CMAKE_CURRENT_SOURCE_DIR}/)

file(GLOB source 
    ${project_root}/*.cpp 
    ${solution_root}/lib/*.cpp
    ${solution_root}/lib/*.c 
    ${solution_root}/include/learning/*.cpp 
)

add_executable(
    ${bin_name}
    ${source}
)

if (UNIX)
target_link_libraries(
    ${bin_name}
    ${lib_assimp}
    ${lib_glfw}
    -lglfw3 
    -lz 
    -lXi 
    -lXrandr 
    -lXxf86vm 
    -lXinerama 
    -lXcursor 
    -lIrrXML
    -lrt 
    -lm 
    -lglad 
    -lX11 
    -lGLU 
    -lGL 
    -lpthread
    -lstdc++
    -ldl
)
elseif (WIN32)
target_link_libraries(
    ${bin_name}
    ${lib_assimp}
    ${lib_glfw}
    IrrXMLd.lib 
    zlibstaticd.lib
    assimp-vc142-mtd.lib
)
endif()

#install(PROGRAMS ${CMAKE_BINARY_DIR}/${bin_name} DESTINATION ${solution_root}/bin)
