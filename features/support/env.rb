require 'rspec'
require 'aruba/cucumber'

PROJECT_ROOT     = File.expand_path(File.join(File.dirname(__FILE__), '..', '..')).freeze
TEMP_DIR         = File.join(PROJECT_ROOT, 'tmp').freeze
LOCAL_RAILS_ROOT = File.join(TEMP_DIR, 'rails_root').freeze
RACK_FILE        = File.join(TEMP_DIR, 'rack_app.rb').freeze

# Append local rails root to path
$:<< LOCAL_RAILS_ROOT

Before do
  FileUtils.rm_rf(LOCAL_RAILS_ROOT)
end

Before do
  @dirs = ["tmp"]
  @aruba_timeout_seconds = 25
  @aruba_io_wait_seconds = 3
end
