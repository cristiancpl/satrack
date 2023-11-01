import { Component } from '@angular/core';
import { TareasService } from '../../services/tareas.service';
import { Tarea } from '../../models/tarea';

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
