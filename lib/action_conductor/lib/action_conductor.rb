$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

require 'action_conductor/base'
require 'action_conductor/errors'
require 'action_conductor/method_mapping'