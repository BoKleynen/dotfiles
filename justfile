switch:
	darwin-rebuild switch --flake $(pwd)

check:
	darwin-rebuild switch check --flake $(pwd)
