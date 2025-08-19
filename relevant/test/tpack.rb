# frozen_string_literal: true

# require "test/unit"

# class TpackTest < Test::Unit::TestCase
# 	def test_pack_unpack_long_long
		# Test j directive (long long)
		numbers = [9223372036854775807, -9223372036854775808] 
		packed = numbers.pack("j*")
		unpacked = packed.unpack("j*")
		# assert_equal numbers, unpacked
		puts numbers, unpacked

		# Test J directive (unsigned long long) 
		unsigned = [18446744073709551615, 0]
		packed = unsigned.pack("J*")
		unpacked = packed.unpack("J*")
		puts unsigned, unpacked
	# end

	# def test_pack_unpack_pointer
		# Test p directive (pointer to string)
		str = "test string"
		packed = [str].pack("p")
		unpacked = packed.unpack("p*")
		puts [str], unpacked

		# Test P directive (pointer to fixed-length string)
		packed = [str].pack("P")
		unpacked = packed.unpack("P*") 
		puts [str], unpacked
# 	end
# end