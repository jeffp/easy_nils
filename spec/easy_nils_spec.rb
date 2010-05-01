require 'spec_helper'

describe "EasyNils" do

  describe "method calls on NilClass" do
    before(:each) do
      NilClass.disable_easy_nils(false)
    end
    it "should return nil" do
      lambda { nil.my_method?.should == nil }.should_not raise_exception
    end
  end
  describe "method calls on methods returning nil" do
    before(:each) do
      NilClass.disable_easy_nils(false)
    end
    it "should return nil" do
      class A1; def nilly; nil; end; end
      lambda { A1.new.nilly.nil?.should == true }.should_not raise_exception
      lambda { A1.new.nilly.empty?.should == nil }.should_not raise_exception
      lambda { A1.new.nilly.blank?.should == nil }.should_not raise_exception
    end
  end
  describe "methods calls returning nil for comparison operators" do
    before(:each) do
      NilClass.disable_easy_nils(false)
    end
    it "should compare correctly" do
      class A2; def nilly; nil; end; end
      lambda { (A2.new.nilly == 2).should == false }.should_not raise_exception
      (A2.new.nilly > 2).should be_false
      (A2.new.nilly <= 2).should be_false
      (A2.new.nilly == nil).should be_true
      (A2.new.nilly != nil).should be_false
      (A2.new.nilly != 5).should be_true
    end
  end

end
