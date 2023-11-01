import { Component, Input, Output, EventEmitter } from '@angular/core';
import { Estado } from '../../models/estado';
import { MatDialog } from '@angular/material/dialog';
import { CrearTareaComponent } from '../crear-tarea/crear-tarea.component';

@Component({
  selector: 'app-estado',
  templateUrl: './estado.component.html',
})
export class EstadoComponent {
  @Input() estado: Estado;
  constructor(public dialog: MatDialog) { }


  @Output() actualizarTareaEvent = new EventEmitter<boolean>();


  EditarTarea(id: number) {

    const dialogRef = this.dialog.open(CrearTareaComponent, {
      width: '500px',
      data: id
    });


    dialogRef.afterClosed().subscribe(result => {
      this.actualizarTareaEvent.next(true);
    });


  }
}
