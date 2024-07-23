# Mictlan Monorepo

いちいちレポジトリ作るの面倒くさいんで、全部ひとつのプロジェクトにぶち込んでます。いろんなモジュールをごちゃまぜにした感じ。要するにごった煮プロジェクトってわけ。

[サイト](https://b7ra0lmmjhmi.share.zrok.io/phpdemo/index.php)

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

# TODO

Network の構造が不適切なので、テンソルを扱えるライブラリ等を DI して
neuron 単位等での weight の置き換えができることをインターフェースとして定義する。
多分 processor と同じ感じになる

アインシュタインが問題を解くとき定義に 95％の時間をさくと言っている
その部分が internal に置かれた interface にあたると思う

lake の設定でビルド関連の設定ファイルを build ディレクトリにうつしてソースルート

https 対応させて nginx で http2 使用する

次なんか作るなら bun でやる

[使ってみたい](https://github.com/statelyai/xstate)
