#ifndef FOO_H
#define FOO_H

class Foo {
public:
  virtual void do_something() = 0;
  virtual int get_something() const = 0;
  virtual ~Foo(){};
};

#endif  // FOO_H
