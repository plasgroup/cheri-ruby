# yield/move can fail
assert_equal "allocator undefined for Thread", %q{
  r = Ractor.new do
    obj = Thread.new{}
    Ractor.yield obj
  rescue => e
    e.message
  end
  r.take
}
