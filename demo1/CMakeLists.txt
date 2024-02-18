file(GLOB_RECURSE sources CONFIGURE_DEPENDS include/*.h include/*.hpp src/*.c src/*.cpp src/*.cc)

add_executable(main ${sources})

#target_link_libraries(main PUBLIC benchmark::benchmark)

target_include_directories(main PUBLIC include)

include(./cmake)

add_subdirectory(./example)
add_subdirectory(./test)

if (CMAKE_CXX_COMPILER_ID MATCHES "GNU")
    target_compile_definitions(main PUBLIC COMPILER="gcc")
elseif (CMAKE_CXX_COMPILER_ID MATCHES "NVIDIA")
    target_compile_definitions(main PUBLIC COMPILER="nvcc")
elseif (CMAKE_CXX_COMPILER_ID MATCHES "Clang")
    target_compile_definitions(main PUBLIC COMPILER="clang")
elseif (CMAKE_CXX_COMPILER_ID MATCHES "MSVC")
    target_compile_definitions(main PUBLIC COMPILER="msvc")
endif()

add_custom_target(run COMMAND $<TARGET_FILE:main>)
add_custom_target(configure COMMAND $<CMAKE_EDIT_COMMAND>)