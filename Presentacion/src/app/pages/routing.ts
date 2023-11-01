import { Routes } from '@angular/router';

const Routing: Routes = [
  {
    path: 'tareas',
    loadChildren: () =>
      import('../modules/tareas/tareas.module').then((m) => m.TareasModule),
  },
  {
    path: '',
    redirectTo: '/tareas',
    pathMatch: 'full',
  },
  {
    path: '**',
    redirectTo: 'error/404',
  },
];

export { Routing };
