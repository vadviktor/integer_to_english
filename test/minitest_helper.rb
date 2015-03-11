require 'pathname'
require Pathname.new(__dir__).parent + 'lib/integer_to_english'

require 'minitest/autorun'
require 'minitest/reporters'

if ENV['MINITEST_REPORTER'] == 'RUBYMINE'
  Minitest::Reporters.use! Minitest::Reporters::RubyMineReporter.new
else
  Minitest::Reporters.use! Minitest::Reporters::ProgressReporter.new
end
