import { test } from "bun:test";
import { Presenter } from "./nbviewer";
import { make } from "../pkg/types";
import * as nbviewer from "../internal/nbviewer";

test("jupyter render", async () => {
  const presenter = new Presenter();
  const text = await Bun.file("web/notebook/leanmemo.ipynb").text();
  const notebook = make<nbviewer.Notebook>();
  const output = await presenter.render(notebook(text));
  console.log("html: ", output);
});
