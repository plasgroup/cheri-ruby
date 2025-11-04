# Creating an ISEQ
iseq = RubyVM::InstructionSequence.compile('puts "Hello"')

# Inspecting
puts iseq.disasm

# Executing
iseq.eval