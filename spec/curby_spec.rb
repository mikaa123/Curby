$:.unshift("lib")
require "curby"

describe Curby do

  it "should be accessible from the global namespace" do
    expect {Curby}.to_not raise_error
  end

end
