set(MAIN_EXECUTABLE_NAME main)

file(GLOB_RECURSE sources CONFIGURE_DEPENDS include/*.h include/*.hpp src/*.c src/*.cpp src/*.cc)

add_executable(${MAIN_EXECUTABLE_NAME} ${sources})

#target_link_libraries(${MAIN_EXECUTABLE_NAME} PUBLIC benchmark::benchmark)

target_include_directories(${MAIN_EXECUTABLE_NAME} PUBLIC include)

include(./cmake)

add_subdirectory(./example)
add_subdirectory(./test)

if (CMAKE_CXX_COMPILER_ID MATCHES "GNU")
    target_compile_definitions(${MAIN_EXECUTABLE_NAME} PUBLIC COMPILER="gcc")
elseif (CMAKE_CXX_COMPILER_ID MATCHES "NVIDIA")
    target_compile_definitions(${MAIN_EXECUTABLE_NAME} PUBLIC COMPILER="nvcc")
elseif (CMAKE_CXX_COMPILER_ID MATCHES "Clang")
    target_compile_definitions(${MAIN_EXECUTABLE_NAME} PUBLIC COMPILER="clang")
elseif (CMAKE_CXX_COMPILER_ID MATCHES "MSVC")
    target_compile_definitions(${MAIN_EXECUTABLE_NAME} PUBLIC COMPILER="msvc")
endif()

add_custom_target(run COMMAND $<TARGET_FILE:${MAIN_EXECUTABLE_NAME}>)
add_custom_target(configure COMMAND ${CMAKE_EDIT_COMMAND} -B ${CMAKE_BINARY_DIR})