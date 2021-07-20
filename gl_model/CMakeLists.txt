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

# 生成可执行文件所需的includes路径
target_include_directories(${PROJECT_NAME} 
    PRIVATE 
    ${PROJECT_SOURCE_DIR}/../include/learning 
    ${PROJECT_SOURCE_DIR}/../include/
    ${PROJECT_SOURCE_DIR}/../include/imgui
)

target_compile_options(${PROJECT_NAME} 
    PRIVATE 
    $<$<PLATFORM_ID: Linux, Darwin>: -O2 -g>
)

# Extra libraries
list(APPEND EXTRA_LIBS imgui glad)

if (APPLE)
    list(APPEND EXTRA_LIBS 
        libassimp.dylib
        libIrrXML.dylib
        libglfw3.a
        libz.dylib
        libpthread.a
        -lm
        -lstdc++
        -framework Cocoa
        -framework OpenGL 
        -framework IOKit 
        -framework CoreVideo
        -ldl
    )

    target_link_directories(${PROJECT_NAME} 
        PRIVATE 
        ${PROJECT_SOURCE_DIR}/../lib/macos
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

        target_link_directories(${PROJECT_NAME} 
            PRIVATE 
            ${PROJECT_SOURCE_DIR}/../lib
        )
elseif (WIN32)
    list(APPEND EXTRA_LIBS 
        glfw3.lib 
        IrrXMLd.lib 
        zlibstaticd.lib
        assimp-vc142-mtd.lib
    )

    target_link_directories(${PROJECT_NAME} 
        PRIVATE 
        ${PROJECT_SOURCE_DIR}/../lib/win64
    )
endif()

target_link_libraries(${PROJECT_NAME} PUBLIC ${EXTRA_LIBS})
