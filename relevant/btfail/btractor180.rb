# dtoa race condition
assert_equal '[:ok, :ok, :ok]', %q{
  n = 3
  n.times.map{
    Ractor.new{
      10_000.times{ rand.to_s }
      :ok
    }
  }.map(&:take)
}
