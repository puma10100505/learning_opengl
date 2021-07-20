cmake_minimum_required(VERSION 3.0...3.21)

project(gl_model VERSION 1.0)

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED True)

# 收集用于生成目标的源代码目录(可替代file(GLOB ...))
aux_source_directory(${PROJECT_SOURCE_DIR} SRC)
aux_source_directory(${PROJECT_SOURCE_DIR}/../lib/ SRC)
aux_source_directory(${PROJECT_SOURCE_DIR}/../include/learning/ SRC)

# Target: 生成可执行文件目标
add_executable(${PROJECT_NAME} ${SRC})

target_compile_options(${PROJECT_NAME} 
    PRIVATE 
    $<$<PLATFORM_ID:"Linux">:-O2 -g>
)

# 生成可执行文件所需的includes路径
target_include_directories(${PROJECT_NAME} 
    PRIVATE 
    ${PROJECT_SOURCE_DIR}/../include/learning 
    ${PROJECT_SOURCE_DIR}/../include/
    ${PROJECT_SOURCE_DIR}/../include/imgui
)

# 生成可执行文件所需的libraries路径
target_link_directories(${PROJECT_NAME} 
    PRIVATE 
    ${PROJECT_SOURCE_DIR}/../lib/win64
)

list(APPEND EXTRA_LIBS imgui glad)

if (APPLE)
    list(APPEND EXTRA_LIBS 
        libassimp.dylib
        libIrrXML.dylib
        libz.dylib
        libpthread.a
        -lm
        -lstdc++
        -ldl
    )
elseif(UNIX)
    list(APPEND EXTRA_LIBS
        libassimp.a
        libglfw3.a
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
    list(APPEND EXTRA_LIBS 
        glfw3.lib 
        IrrXMLd.lib 
        zlibstaticd.lib
        assimp-vc142-mtd.lib
    )
endif()

target_link_libraries(${PROJECT_NAME} PUBLIC ${EXTRA_LIBS})

# 生成可执行文件目标所需链接的libraries
# if (APPLE)
#     target_link_libraries(
#         ${PROJECT_NAME}
#         PUBLIC
#         libassimp.dylib
#         libIrrXML.dylib
#         libz.dylib
#         libpthread.a
#         -lm
#         -lstdc++
#         -ldl
#     )
# elseif (UNIX)
#     target_link_libraries(
#         ${PROJECT_NAME}
#         PUBLIC
#         libassimp.a
#         libglfw3.a
#         -lz 
#         -lXi 
#         -lXrandr 
#         -lXxf86vm 
#         -lXinerama 
#         -lXcursor 
#         -lIrrXML
#         -lrt 
#         -lm  
#         -lX11 
#         -lGLU 
#         -lGL 
#         -lpthread
#         -lstdc++
#         -ldl
#     )
# elseif (WIN32)
#     target_link_libraries(
#         ${PROJECT_NAME} 
#         PUBLIC
#         glfw3.lib 
#         IrrXMLd.lib 
#         zlibstaticd.lib
#         assimp-vc142-mtd.lib
#         glad
#         imgui
#     )
# endif()