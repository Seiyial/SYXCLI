
function s {
	cd server;
	pnpm $@;
	cd ..
}
function f {
	cd frontend;
	pnpm $@;
	cd ..
}
alias p="pnpm"
