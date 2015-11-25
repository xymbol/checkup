require 'test_helper'

class CheckTest < ActiveSupport::TestCase
  %i(ok not other).each do |name|
    test "fixture #{name} is valid" do
      assert checks(name).valid?
    end
  end
end
