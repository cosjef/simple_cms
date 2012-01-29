class Subject < ActiveRecord::Base
has_many :pages

# Ensures subject has a name
validates_presence_of :name
validates_length_of :name, :maximum => 255

scope :visible, where(:visible => true)
scope :invisible, where(:visible => false)
scope :search, lambda {|query| where(["name LIKE ?", "%#{query}%"])}


end
