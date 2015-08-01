web: bundle exec puma -p $PORT
worker: env TERM_CHILD=1 QUEUE=* bundle exec rake environment resque:work