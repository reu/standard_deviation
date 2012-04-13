#include <ruby.h>
#include <math.h>

static VALUE stdev(VALUE self) {
  int i, size;
  double total, mean, variance;

  size  = RARRAY_LEN(self);
  total = variance = 0;
  VALUE *array = RARRAY_PTR(self);

  for (i = 0; i < size; i++) {
    total += NUM2DBL(array[i]);
  }

  mean = total / size;

  for (i = 0; i < size; i++) {
    variance += pow((NUM2DBL(array[i]) - mean), 2);
  }

  return rb_float_new(sqrt(variance / (size - 1)));
}

static VALUE stdevp(VALUE self) {
  int i, size;
  double total, mean, variance;

  size  = RARRAY_LEN(self);
  total = variance = 0;
  VALUE *array = RARRAY_PTR(self);

  for (i = 0; i < size; i++) {
    total += NUM2DBL(array[i]);
  }

  mean = total / size;

  for (i = 0; i < size; i++) {
    variance += pow((NUM2DBL(array[i]) - mean), 2);
  }

  return rb_float_new(sqrt(variance / size));
}

void Init_standard_deviation() {
  rb_define_method(rb_cArray, "stdev", stdev, 0);
  rb_define_alias(rb_cArray, "standard_deviation", "stdev");
  rb_define_method(rb_cArray, "stdevp", stdev, 0);
}
