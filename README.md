# Mictlan Monorepo

いちいちレポジトリ作るの面倒くさいんで、全部ひとつのプロジェクトにぶち込んでます。いろんなモジュールをごちゃまぜにした感じ。要するにごった煮プロジェクトってわけ。

[サイト](https://mictlan.share.zrok.io/phpdemo/index.php)

# Idea

- ソースコードグラフ
- 逆設計 DNN モデル
- なんでもグラフデータ化
- pkg と internal は同じレイヤとみなせるかなぁ
- ベルの不等式成り立たない方の証明書きたい
- lean tutorial 全部やって書き残す

# Reference

- [NN の仕組み](https://www.3blue1brown.com/topics/neural-networks)
- [サンプルコード付き](http://neuralnetworksanddeeplearning.com/chap1.html)
- [サンプルコード python3](https://github.com/unexploredtest/neural-networks-and-deep-learning)

# Note

- 設計中は人に例えるとわかりやすい
- アインシュタインが問題を解くとき定義に 95％の時間をさくと言っている
  その部分が internal に置かれた interface にあたると思う

# TODO

Network の構造が不適切なので、テンソルを扱えるライブラリ等を DI して
neuron 単位等での weight の置き換えができることをインターフェースとして定義する。
多分 processor と同じ感じになる

https 対応させて nginx で http2 使用する

jupyter notebook をおいてそれをホストするエンドポイントを bun で作る

どっかで使えそうな[js ライブラリ](https://github.com/statelyai/xstate)

前バイトでやった [php の auth モジュール](https://github.com/SpicyIslandFruits/koemade) 持ってくる

[redpanda university](https://university.redpanda.com/) をやってインフラに導入する

graph rag と fine tuning と leanDojo

vpn サーバーとファイルサーバーとメールサーバーも立てたい

前作った php の認証を移植すれば機械学習系を外部から操作するエンドポイント作れる

[日本語解説](https://lean-ja.github.io/lean-by-example/)

[数学の問題集](https://artofproblemsolving.com/wiki/index.php/AMC_12_Problems_and_Solutions)の証明を Lean で書いてみたい

github だと iframe で jupyter の結果表示している

ローディング画面とかほしいので作って、iframe で表示するように elysia と nbviewer を改良する

lean 4 第二章の練習問題をやる

[キスキットのチュートリアル](https://youtu.be/0RPFWZj7Jm0?si=PM7WxTkXPc4rgVvw)やってみる

自分のメールサーバーほしい、ドメイン借りて DKIM とか設定する

TODO リストをかける昨日がほしい、php で作って、ログインは例の mysql でやる

アイコンつけたい、AI に書いてもらおう
