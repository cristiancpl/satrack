import { Categoria } from "./categoria";
import { Estado } from "./estado";
import { ItemBase } from "./itemBase";

export class Tarea extends ItemBase {
  categoria: Categoria | undefined;
  estado: Estado | undefined;
  fecha_limite: Date | undefined;
  descripcion: string;
}
