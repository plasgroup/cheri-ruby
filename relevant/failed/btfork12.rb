assert_finish 10, %q{
  begin
    children = (1..10).map{
      Thread.start{fork{}}.value
    }
    while !children.empty? and pid = Process.wait
      children.delete(pid)
    end
  rescue NotImplementedError
  end
}, '[ruby-core:22158]'
