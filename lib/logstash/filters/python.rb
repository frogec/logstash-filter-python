# encoding: utf-8
require "logstash/filters/base"
require "logstash/namespace"

# This  filter will replace the contents of the default 
# message field with whatever you specify in the configuration.
#
# It is only intended to be used as an .
class LogStash::Filters::PythonScriptExecutor < LogStash::Filters::Base

  # Setting the config_name here is required. This is how you
  # configure this filter from your Logstash config.
  #
  # filter {
  #    {
  #     message => "My message..."
  #   }
  # }
  #
  config_name "python"
  
  # Replace the message with this value.
  config :path, :validate => :string, :required => true #path to python script
  config :parameters_field_name, :required => true #field where the parameter for script is
  config :result_field_name, :validate => :string, :required => false, :default => "Python result" #result field name

  public
  def register
    # Add instance variables 
  end # def register

  public
  def filter(event)
    params = event[@parameters_field_name]

    if params.kind_of?(Array) #if multiple parameters, add them to string seperated by ' '
      params.join(' ')
    end

    result = `python #{@path} #{params}`
    event[@result_field_name] = result

    # filter_matched should go in the last line of our successful code
    filter_matched(event)
  end # def filter
end # class LogStash::Filters::PythonScriptExecutor
