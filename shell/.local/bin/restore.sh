deleted="$(printf "\n" | trash-restore | head -n -1 | awk -v filter="^${PWD}/[^/]*$" '$4~filter {print $1, $4}')"
ids="$(echo "$deleted" | fzf --multi | cut -d' ' -f1 | tr '\n' ',')"
ids="${ids%,}"

echo "$ids" | exec trash-restore >/dev/null
