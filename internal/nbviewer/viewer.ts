import type { Brand } from "../../pkg/types";

export type Name = Brand<string, "Name">;
export type Notebook = Brand<string, "Notebook">;

export interface Library {
  notebook(name: Name): Promise<Notebook>;
}

export interface Presenter<T> {
  render(notebook: Notebook): T;
}

export class App<T> {
  constructor(private library: Library, private presenter: Presenter<T>) {
    this.library = library;
    this.presenter = presenter;
  }

  async show(name: Name): Promise<T> {
    const notebook = await this.library.notebook(name);
    return this.presenter.render(notebook);
  }
}
