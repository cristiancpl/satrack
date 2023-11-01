import { ItemBase } from "./itemBase";
import { Tarea } from "./tarea";

export class Estado extends ItemBase {
  tareas: Tarea[];
}
