alias mpx='tput setaf 99 && if [ -f .env ]; then source .env && printf "$ source .env\n$ iex -S mix phx.server\n\n"; fi && iex -S mix phx.server'
alias mdg='mix deps.get'
alias mpg='mix phx.digest'
