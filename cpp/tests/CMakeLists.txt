find_package(GTest REQUIRED)
find_package(GMock REQUIRED)

include_directories(
  ${PROJECT_SOURCE_DIR}/tests/include
  ${GTEST_INCLUDE_DIRS}
  ${GMOCK_INCLUDE_DIRS}
)

add_executable(runTests tests.cpp test_foo.cpp)
target_link_libraries(runTests
  ${PROJECT_LIBRARY}
  ${GTEST_BOTH_LIBRARIES}
  ${GMOCK_BOTH_LIBRARIES}
)

gtest_discover_tests(runTests)
