require "capistrano/coreos/version"

# Load extra tasks
load File.expand_path("../tasks/coreos.rake", __FILE__)
load File.expand_path("../tasks/systemd.rake", __FILE__)

module Capistrano
  module CoreOS
    # Your code goes here...
  end
end
