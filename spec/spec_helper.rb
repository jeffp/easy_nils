require 'rubygems'
require 'lib/easy_nils'

class NilClass
  def not_nil?; false; end
  define_ghost_method(/.*/) do |obj, sym|
    nil
  end
end
