#include <gmock/gmock.h>

#include "mock_foo.h"

using namespace testing;

class FooTest : public Test {
public:
  int some_value = 10;
};

TEST_F(FooTest, CanDoSomething) {
  MockFoo foo;
  EXPECT_CALL(foo, do_something());
  foo.do_something();
}

TEST_F(FooTest, CanGetSomething) {
  MockFoo2 foo;
  foo.value = some_value;
  auto return_value = foo.get_something();
  ASSERT_THAT(return_value, Eq(some_value));
}
