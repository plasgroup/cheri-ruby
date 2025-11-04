workers = (0...8).map do
    Ractor.new do
      loop do
        10_000.times.map { Object.new }
        Ractor.yield Time.now
      end
    end
  end

  1_000.times { idle_worker, tmp_reporter = Ractor.select(*workers) }
  