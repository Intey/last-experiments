cmake_minimum_required(VERSION 3.18)
project(experiment)

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall -pedantic")
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib)
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)

# for VIM YCM Language engine
set(CMAKE_EXPORT_COMPILE_COMMANDS 1)

# ROS
# add_subdirectory(src/listener)

#IMGUI
set(IMGUI_DIR ./3rdparty/imgui)

# LIBRARY
file(GLOB SOURCES ./3rdparty/imgui/*.cpp)
find_package(glfw3 3.3 REQUIRED)
find_package(OpenGL REQUIRED)

add_library(qs_visualizer 
  ${SOURCES} 
  ${IMGUI_DIR}/backends/imgui_impl_opengl3.cpp
  ${IMGUI_DIR}/backends/imgui_impl_glfw.cpp
  )

target_include_directories(qs_visualizer PUBLIC ${IMGUI_DIR} ${IMGUI_DIR}/backends)
target_link_libraries(qs_visualizer glfw OpenGL::GL ${CMAKE_DL_LIBS})


add_executable(main 
  src/main.cpp
  )
target_include_directories(main PUBLIC src)
target_link_libraries(main qs_visualizer)

set_property(TARGET main PROPERTY CXX_STANDARD 20)
set_property(TARGET qs_visualizer PROPERTY CXX_STANDARD 20)

