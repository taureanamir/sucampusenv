# Be sure to restart your server when you modify this file.

# ActiveSupport::Reloader.to_prepare do
#   ApplicationController.renderer.defaults.merge!(
#     http_host: 'example.org',
#     https: false
#   )
# end

class ActiveRecord::Base
  def self.escape_sql(array)
    self.send(:sanitize_sql_array, array)
  end
end