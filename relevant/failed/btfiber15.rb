assert_equal %q{ok}, %q{
  Fiber.new{
  }.resume
  :ok
}
