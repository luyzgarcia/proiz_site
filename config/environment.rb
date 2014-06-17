# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
ProizAdmin::Application.initialize!

Time::DATE_FORMATS[:create] = "%d de %B de %Y"