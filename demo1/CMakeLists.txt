file(GLOB_RECURSE sources CONFIGURE_DEPENDS include/*.h include/*.hpp src/*.c src/*.cpp src/*.cc)

add_executable(demo1 ${sources})

#target_link_libraries(demo1 PUBLIC benchmark::benchmark)

target_include_directories(demo1 PUBLIC include)

include(./cmake)

add_subdirectory(./example)
add_subdirectory(./test)