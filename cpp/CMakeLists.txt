cmake_minimum_required(VERSION 3.29)
project(cpp-template LANGUAGES CXX)

# Build type
if(NOT CMAKE_BUILD_TYPE)
  set(CMAKE_BUILD_TYPE Debug)
endif()
message(STATUS "Build type: " ${CMAKE_BUILD_TYPE})

# Compiler options
set(CMAKE_CXX_STANDARD 23)
set(CMAKE_CXX_EXTENSIONS OFF)
set(CMAKE_CXX_FLAGS "-Wall")

# Libraries
list(APPEND CMAKE_MODULE_PATH ${PROJECT_SOURCE_DIR}/cmake_modules)

include_directories(
  ${PROJECT_SOURCE_DIR}/include
)

set(PROJECT_LIBRARY ${PROJECT_NAME})
add_library(${PROJECT_LIBRARY} OBJECT
  src/foo.cpp
)
target_link_libraries(${PROJECT_LIBRARY}
)

# Application
add_executable(main app/main.cpp)
target_link_libraries(main
  ${PROJECT_LIBRARY}
)

install(TARGETS main DESTINATION bin)

# Testing
include(CTest)

if(BUILD_TESTING)
  add_subdirectory(tests)
endif()
