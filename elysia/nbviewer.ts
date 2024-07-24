import Elysia from "elysia";
import * as nbviewer from "../internal/nbviewer";
import * as jupyter from "../jupyter";
import * as localfile from "../localfile";
import { make } from "../pkg/types";

export function launchNotebook(port: number) {
  const app = new nbviewer.App(
    new localfile.Library(),
    new jupyter.Presenter()
  );
  new Elysia()
    .get(
      "nbviewer/:name",
      ({ params: { name } }) => {
        const nbName = make<nbviewer.Name>();
        return app.show(nbName(name));
      },
      {
        afterHandle({ response, set }) {
          set.headers["content-type"] = "text/html;charset=utf8";
        },
      }
    )
    .get("*", () => {
      return "404 not found"
    })
    .listen(port);
}
