cmake_minimum_required(VERSION 2.8...3.13)

project(gl_model)

set(bin_name gl_model)
set(project_root ${CMAKE_CURRENT_SOURCE_DIR}/)

# Source Code
file(GLOB source 
    ${project_root}/*.cpp 
    ${solution_root}/lib/*.cpp
    ${solution_root}/lib/*.c 
    ${solution_root}/include/learning/*.cpp 
)

# Execute
add_executable(
    ${bin_name}
    ${source}
)

if (APPLE)
    target_link_libraries(
        ${bin_name}
        ${lib_assimp}
        ${lib_glfw}
        -lz 
        -lIrrXML 
        -lm 
        -lpthread
        -lstdc++
        -ldl
    )
elseif (UNIX)
    target_link_libraries(
        ${bin_name}
        ${lib_assimp}
        ${lib_glfw} 
        -lz 
        -lXi 
        -lXrandr 
        -lXxf86vm 
        -lXinerama 
        -lXcursor 
        -lIrrXML
        -lrt 
        -lm  
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

file(REMOVE_RECURSE ${solution_root}/bin)
file(MAKE_DIRECTORY ${solution_root}/bin)


#message(${CMAKE_BINARY_DIR}/${bin_name}/${bin_name})
#message(${solution_root}/bin/${bin_name})

#file(COPY ${CMAKE_BINARY_DIR}/${bin_name}/${bin_name} DESTINATION ${solution_root}/bin/${bin_name})


# add_custom_command(
#         TARGET deploy POST_BUILD
#         COMMAND ${CMAKE_COMMAND} -E cp
#                 ${CMAKE_BINARY_DIR}/${bin_name}/${bin_name}
#                 ${solution_root}/bin/${bin_name})

add_custom_command(
    # 指令依附的目標
    TARGET deploy
    # 自訂指令的執行時機
    POST_BUILD
    # COMMAND關鍵字後為執行指令
    COMMAND
        ${CMAKE_COMMAND} -E copy ${CMAKE_BINARY_DIR}/${bin_name}/${bin_name}  ${solution_root}/bin/
)