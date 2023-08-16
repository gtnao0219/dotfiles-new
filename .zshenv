export GOPATH="${HOME}/dev"

typeset -gx -U path
path=(
  "${GOPATH}/bin"(N-/)
  /usr/local/go/bin(N-/)
  "$path[@]"
)
