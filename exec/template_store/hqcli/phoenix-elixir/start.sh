#!/usr/bin/env bash

export MIX_ENV=prod &&
PORT=<***PORT***> elixir --detached -S mix phx.server
