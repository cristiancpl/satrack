import { Component } from '@angular/core';
import { Tarea } from './models/tarea';
import { TareasService } from './services/tareas.service';
import { EstadosService } from './services/estados.service';
import { ItemBase } from './models/itemBase';
import { Estado } from './models/estado';
import { Categoria } from './models/categoria';
import { MatDialog } from '@angular/material/dialog';
import { CrearTareaComponent } from './components/crear-tarea/crear-tarea.component';


@Component({
  selector: 'app-tareas',
  templateUrl: './tareas.component.html',
  styleUrls: ['./tareas.component.scss'],
})
export class TareasComponent {

  estados: Estado[] = [];

  constructor(public dialog: MatDialog,
    private tareasService: TareasService,
    private estadosService: EstadosService) { }

  ngOnInit() {
    this.GetEstadosTareas();
  }


  crearTarea() {

    const dialogRef = this.dialog.open(CrearTareaComponent, { width: '500px' });


    dialogRef.afterClosed().subscribe(result => {
      this.GetEstadosTareas();
    });


  }

  GetTareas() {
    this.tareasService.GetTareas().subscribe({
      next: (data) => {
        if (data) {
          for (let estado of this.estados) {
            estado.tareas = data.filter(x => x.estado?.id == estado.id);
          }
        }
      },
      error: (error) => console.error(error)
    });
  }


  GetEstadosTareas() {
    this.estadosService.GetEstados().subscribe({
      next: (data) => {
        this.estados = data ? data : [];
        this.GetTareas();
      },
      error: (error) => console.error(error)
    });
  }


  RefrescarTareas(seActualizo: boolean) {
    if (seActualizo) {
      this.GetTareas();
    }    
  }


}
