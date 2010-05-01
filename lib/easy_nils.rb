require 'rubygems'
gem 'meta_programming', '>= 0.0.6'
require 'meta_programming'

class NilClass
  def not_nil?; false; end
  @@warnings = false
  @@disable_easy_nils = false
  define_method_missing_chain(:easy_nils) do |sym, *args|
    unless @@disable_easy_nils
      nil
    else
      method_missing_without_easy_nils(sym, *args)
    end
  end

  def self.warnings(flag)
    @@warnings = flag
  end

  def self.disable_easy_nils(flag)
    @@disable_easy_nils = flag
  end
end

module Kernel
  def enable_easy_nils_warnings(flag)
    NilClass.warnings(flag)
  end
  def disable_easy_nils(flag=true)
    NilClass.disable_easy_nils(flag)
  end
  def enable_easy_nils(flag=true)
    NilClass.disable_easy_nils(!flag)
  end
end
