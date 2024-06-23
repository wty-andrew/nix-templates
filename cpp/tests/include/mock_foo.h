#ifndef MOCK_FOO_H
#define MOCK_FOO_H

#include <gmock/gmock.h>

#include "foo.h"

class MockFoo : public Foo {
public:
  MOCK_METHOD0(do_something, void());
  MOCK_CONST_METHOD0(get_something, int());
};

class MockFoo2 : public Foo {
public:
  int value;
  void do_something() override {}
  int get_something() const override { return value; }
};

#endif  // MOCK_FOO_H
