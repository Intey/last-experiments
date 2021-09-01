find_package(roscpp REQUIRED)
find_package(rosconsole REQUIRED)
find_package(roscpp_serialization REQUIRED)

add_executable(listener listener.cpp)

set_property(TARGET listener PROPERTY CXX_STANDARD 20)
target_compile_options(listener PRIVATE -pedantic -Wall)

target_link_libraries(listener 
  roscpp 
  rosconsole 
  roscpp_serialization
  )
