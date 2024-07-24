import * as nbviewer from "../internal/nbviewer";
import { make } from "../pkg/types";
import { join } from "path";

export class Library implements nbviewer.Library {
  async notebook(name: nbviewer.Name): Promise<nbviewer.Notebook> {
    if (!/^[a-zA-Z0-9_-]+$/.test(name)) {
      throw Error("invalid notebook name");
    }
    const fullpath = join("web/notebook/", `${name}.ipynb`);
    const file = Bun.file(fullpath);
    if (await file.exists()) {
      const notebook = make<nbviewer.Notebook>();
      const noteText = await file.text();
      return notebook(noteText);
    } else {
      throw Error("notebook not found");
    }
  }
}
