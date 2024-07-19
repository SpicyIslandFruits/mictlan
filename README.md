# Idea

* ソースコードグラフ
* 逆設計DNNモデル
* なんでもグラフデータ化
* pkgとinternalは同じレイヤとみなせるかなぁ

# Reference

* [NNの仕組み](https://www.3blue1brown.com/topics/neural-networks)
* [サンプルコード付き](http://neuralnetworksanddeeplearning.com/chap1.html)
* [サンプルコードpython3](https://github.com/unexploredtest/neural-networks-and-deep-learning)

# Note

* 設計中は人に例えるとわかりやすい

# TODO

Networkの構造が不適切なので、テンソルを扱えるライブラリ等をDIして
neuron単位等でのweightの置き換えができることをインターフェースとして定義する。
多分processorと同じ感じになる

アインシュタインが問題を解くとき定義に95％の時間をさくと言っている
その部分がinternalに置かれたinterfaceにあたると思う

lakeの設定でビルド関連の設定ファイルをbuildディレクトリにうつしてソースルート
