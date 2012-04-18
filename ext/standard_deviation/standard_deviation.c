#include <ruby.h>
#include <math.h>

static double distance_from_mean(VALUE *array, long size) {
  int i;
  double mean, distance, total = 0;
  double values[size];

  for (i = 0; i < size; i++) {
    double value = NUM2DBL(array[i]);
    values[i] = value;
    total += value;
  }

  mean = total / size;

  for (i = 0; i < size; i++) {
    distance += pow(values[i] - mean, 2);
  }

  return distance;
}

static double compute_sample_variance(VALUE *array, long size) {
  return distance_from_mean(array, size) / (size - 1);
}

static double compute_population_variance(VALUE *array, long size) {
  return distance_from_mean(array, size) / size;
}

static void raise_not_enough_elements() {
  rb_raise(rb_eZeroDivError, "not enough elements");
}

static VALUE sample_variance(VALUE self) {
  long size = RARRAY_LEN(self);
  VALUE *array = RARRAY_PTR(self);

  if (size < 2) raise_not_enough_elements();

  return rb_float_new(compute_sample_variance(array, size));
}

static VALUE population_variance(VALUE self) {
  long size = RARRAY_LEN(self);
  VALUE *array = RARRAY_PTR(self);

  if (size < 2) raise_not_enough_elements();

  return rb_float_new(compute_population_variance(array, size));
}

static VALUE stdev(VALUE self) {
  long size = RARRAY_LEN(self);
  VALUE *array = RARRAY_PTR(self);

  if (size < 2) raise_not_enough_elements();

  return rb_float_new(sqrt(compute_sample_variance(array, size)));
}

static VALUE stdevp(VALUE self) {
  long size = RARRAY_LEN(self);
  VALUE *array = RARRAY_PTR(self);

  if (size < 2) raise_not_enough_elements();

  return rb_float_new(sqrt(compute_population_variance(array, size)));
}

void Init_standard_deviation() {
  rb_define_method(rb_cArray, "stdev", stdev, 0);
  rb_define_alias(rb_cArray, "standard_deviation", "stdev");
  rb_define_method(rb_cArray, "stdevp", stdevp, 0);

  rb_define_method(rb_cArray, "sample_variance", sample_variance, 0);
  rb_define_alias(rb_cArray, "variance", "sample_variance");
  rb_define_method(rb_cArray, "population_variance", population_variance, 0);
}
