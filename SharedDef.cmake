cmake_minimum_required(VERSION 3.0...3.21)

macro(include_directories param_project_name)
    target_include_directories(${param_project_name} 
        PRIVATE 
        ${PROJECT_SOURCE_DIR}/include/learning 
        ${PROJECT_SOURCE_DIR}/include/
        ${PROJECT_SOURCE_DIR}/include/imgui
    )
endmacro(include_directories)

macro(link_extra_libs param_project_name)
    message("in macro, project source dir: ${PROJECT_SOURCE_DIR}")
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
            -ldl
        )

        target_link_directories(${param_project_name}
            PRIVATE 
            ${SOLUTION_ROOT}/lib/macos
            /usr/local/lib
        )

        set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -framework Cocoa -framework OpenGL -framework IOKit -framework CoreVideo")

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

            target_link_directories(${param_project_name}
                PRIVATE 
                ${SOLUTION_ROOT}/lib
            )
    elseif (WIN32)
        list(APPEND EXTRA_LIBS 
            glfw3.lib 
            IrrXMLd.lib 
            zlibstaticd.lib
            assimp-vc142-mtd.lib
        )

        target_link_directories(${param_project_name}
            PRIVATE 
            ${SOLUTION_ROOT}/lib/win64
        )
    endif()

    target_compile_options(${param_project_name} 
        PRIVATE 
        $<$<PLATFORM_ID: Linux, Darwin>: -O2 -g>
    )  
    
    # Extra libraries
    target_link_libraries(${param_project_name} PUBLIC ${EXTRA_LIBS})

endmacro(link_extra_libs )

