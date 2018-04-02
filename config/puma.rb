# Puma can serve each request in a thread from an internal thread pool.
# The `threads` method setting takes two numbers: a minimum and maximum.
# Any libraries that use thread pools should be configured to match
# the maximum value specified for Puma. Default is set to 5 threads for minimum
# and maximum; this matches the default thread size of Active Record.
#


environment ENV.fetch("RAILS_ENV") { "development" }

port        ENV.fetch("PORT") { 3000 }

if ENV.fetch("RAILS_ENV") == "development"
  preload_app!
else
  bind  "unix:///home/deploy/feel/shared/tmp/sockets/puma.sock"
  pidfile "/home/deploy/feel/shared/tmp/pids/puma.pid"
  state_path "/home/deploy/feel/shared/tmp/sockets/puma.state"
  directory "/home/deploy/feel/current"

  workers 1
  threads 5, 5

  daemonize true

  activate_control_app 'unix:///home/deploy/feel/shared/tmp/sockets/pumactl.sock'

  prune_bundler
end
