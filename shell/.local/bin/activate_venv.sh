#!/bin/sh

venv="$(ls "$HOME/.venv/" | fzf)"
source "$HOME/.venv/$venv/bin/activate"
