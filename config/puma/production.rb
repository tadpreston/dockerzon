threads_count = ENV.fetch("RAILS_MAX_THREADS") { 5 }
threads threads_count, threads_count

environment 'production'

threads 0,5
workers 2

bind 'unix:///var/run/puma.sock'
plugin :tmp_restart
