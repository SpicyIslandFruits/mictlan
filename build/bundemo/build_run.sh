bun build --compile --minify --sourcemap ../../cmd/bundemo/index.ts --outfile ../../out/bundemo/app
nohup ../../out/bundemo/app &
