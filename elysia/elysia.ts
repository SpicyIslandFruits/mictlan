import Elysia from "elysia";

export function launch(port: number) {
  // ここで設定する関数をinternalに作る。
  // データの変換があればここでやる、あんまなさそうだけど
  new Elysia()
    .get("bundemo/", () => "bunで自分用にjupyter notebookをホストするサイト作る予定")
    .get("bundemo/hi", () => "hi")
    .get("*", () => "404 not found")
    .listen(port);
}
