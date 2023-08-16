deply:
	sh ./scripts/deply.sh

init:
	sh ./scripts/init.sh

install_node:
	sh ./scripts/install_node.sh

install_nvim: install_node
	sh ./scripts/install_nvim.sh

