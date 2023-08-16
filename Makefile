init: deploy install_essential install_nvim

deploy:
	sh ./scripts/deploy.sh

install_essential:
	sh ./scripts/install_essential.sh

install_nvim: install_node
	sh ./scripts/install_nvim.sh

install_node:
	sh ./scripts/install_node.sh

