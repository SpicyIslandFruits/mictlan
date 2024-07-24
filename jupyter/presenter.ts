import * as nbviewer from "../internal/nbviewer";
import { type Brand, make } from "../pkg/types";

// HTMLはviewmodel
export type HTML = Brand<string, "HTML">;

export class Presenter implements nbviewer.Presenter<Promise<HTML>> {
  async render(notebook: nbviewer.Notebook): Promise<HTML> {
    try {
      const respose = new Response(notebook);
      const output =
        await Bun.$`jupyter nbconvert --to html --stdin --stdout < ${respose}`.text();
      const html = make<HTML>();
      return html(output);
    } catch (error) {
      console.error("Failed to convert notebook:", error);
      throw error;
    }
  }
}
