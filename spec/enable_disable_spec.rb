require 'spec_helper'

describe "EasyNils" do
  describe "disable_easy_nils method" do
    it "should be called globally" do
      disable_easy_nils
      lambda { nil.callthis }.should raise_exception(NoMethodError)
      enable_easy_nils
      lambda { nil.callthis }.should_not raise_exception
    end
    it "should take a flag parameter" do
      disable_easy_nils(true)
      lambda { nil.callthis }.should raise_exception(NoMethodError)
      disable_easy_nils(false)
      lambda { nil.callthis }.should_not raise_exception
      enable_easy_nils(true)
      lambda { nil.callthis }.should_not raise_exception
      enable_easy_nils(false)
      lambda { nil.callthis }.should raise_exception(NoMethodError)
    end
  end
end