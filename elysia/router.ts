import Elysia from "elysia";

export function launch(port: number) {
  // ここで設定する関数をinternalに作る。
  // データの変換があればここでやる、あんまなさそうだけど
  new Elysia()
    .get("bundemo/", () => "hello")
    .get("bundemo/hi", () => "hi")
    .get("*", (req) => req.path)
    .listen(port);
}
