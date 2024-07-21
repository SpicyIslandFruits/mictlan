# phpdemo

php のリモートデバッグ環境

docker で php 動かしてデバッグもするからローカルに影響がない

デバッグのポートを 9003 にするとなぜか docker から windows の wsl に接続できなかった

他にもつながらない時はポートの制限確認する

xdebug client の設定は${workspaceFolder}/.vscode/launch.json を参照
