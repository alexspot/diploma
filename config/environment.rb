# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
DemoApp::Application.initialize!

Time::DATE_FORMATS[:ua_datetime] = "%Y.%m.%d at %k:%M:%S"