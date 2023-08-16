init: deploy install_essential install_nvim install_tmux

deploy:
	sh ./scripts/deploy.sh

install_essential:
	sh ./scripts/install_essential.sh

install_nvim: install_node
	sh ./scripts/install_nvim.sh

install_tmux:
	sh ./scripts/install_tmux.sh

install_node:
	sh ./scripts/install_node.sh

install_go:
	sh ./scripts/install_go.sh

install_rust:
	sh ./scripts/install_rust.sh
