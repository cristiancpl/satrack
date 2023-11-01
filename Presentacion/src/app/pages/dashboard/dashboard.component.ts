import { Component } from '@angular/core';
import { Tarea } from '../../modules/tareas/models/tarea';
import { TareasService } from '../../modules/tareas/services/tareas.service';


@Component({
  selector: 'app-dashboard',
  templateUrl: './dashboard.component.html',
  styleUrls: ['./dashboard.component.scss'],
})
export class DashboardComponent {

  tareas: Tarea[] = [];

  constructor(private tareasService: TareasService) { }

  ngOnInit() {
    this.GetTareas();
  }

  GetTareas() {
    this.tareasService.GetTareas().subscribe({
      next: (data) => this.tareas = data ? data : [],
      error: (error) => console.error(error)
    });
  }


}
