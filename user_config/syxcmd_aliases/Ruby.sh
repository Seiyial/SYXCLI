# Bundle
alias bx='bundle exec'
alias bi='bundle install'

# Rake
alias rk='rake'

# Hanami
alias ha='bundle exec hanami'
alias hadb='HANAMI_ENV=test bundle exec hanami db prepare && bundle exec hanami db prepare'
alias rkt='rake test'

# Rails
alias rr='clear && tput setaf 9 && echo "
    Rails Server
    
=========================" && rails server'
alias rdbrs='rails db:reset'
alias rdbm='rails db:migrate'
alias rdbss='rails db:seed'
alias r='rails'