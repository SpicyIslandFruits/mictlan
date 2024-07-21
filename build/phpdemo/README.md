# phpdemo

phpのリモートデバッグ環境

dockerでphp動かしてデバッグもするからローカルに影響がない

デバッグのポートを9003にするとなぜかdockerからwindowsのwslに接続できなかった

xdebug clientの設定は${workspaceFolder}/.vscode/launch.jsonを参照