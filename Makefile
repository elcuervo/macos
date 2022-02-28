SHELL := bash

.PHONY: update
update:
	nix --extra-experimental-features "nix-command flakes" flake update

.PHONY: switch
switch:
	darwin-rebuild switch --flake .

.PHONY: key
key:
	ssh-keygen -o -a 100 -t ed25519 -C "${USER}@${HOST}"

.PHONY: setup
setup:
	bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	sh <(curl -L https://nixos.org/nix/install)
	echo "run\tprivate/var/run" | sudo tee -a /etc/synthetic.conf

.PHONY: bootstrap
bootstrap:
	nix \
    --extra-experimental-features "nix-command flakes" \
    build \
    github:elcuervo/macos\#corax \
    --no-write-lock-file
	./result/sw/bin/darwin-rebuild switch \
		--flake github:elcuervo/macos\#corax
