exclude(:test_shared_marking, "The target code has already been changed")
exclude(:test_push_over_ary_max, 'Sometimes AppVeyor has insufficient memory to run this test')
# https://ci.appveyor.com/project/ruby/ruby/builds/20728419/job/o73q9fy1ojfibg5v
exclude(:test_unshift_over_ary_max, 'Sometimes AppVeyor has insufficient memory to run this test')
# https://ci.appveyor.com/project/ruby/ruby/builds/20427662/job/prq9i2lkfxv2j0uy
exclude(:test_splice_over_ary_max, 'Sometimes AppVeyor has insufficient memory to run this test')