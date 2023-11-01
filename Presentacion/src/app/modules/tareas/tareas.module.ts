import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { RouterModule } from '@angular/router';
import { DropdownMenusModule, ModalsModule } from '../../_metronic/partials';
import { TareasComponent } from './tareas.component';

import { InlineSVGModule } from 'ng-inline-svg-2';
import { EstadoComponent } from './components/estado/estado.component';
import { CrearTareaComponent } from './components/crear-tarea/crear-tarea.component';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import {MatDatepickerModule} from '@angular/material/datepicker';
import { MatNativeDateModule } from '@angular/material/core';
import { MatInputModule } from '@angular/material/input';
import { MatDialogModule } from '@angular/material/dialog';
import { MatSnackBarModule } from '@angular/material/snack-bar';




@NgModule({
  declarations: [
    TareasComponent,
    EstadoComponent,
    CrearTareaComponent
  ],
  imports: [
    CommonModule,
    RouterModule.forChild([
      {
        path: '',
        component: TareasComponent,
      },
    ]),
    ModalsModule,
    InlineSVGModule,
    DropdownMenusModule,
    FormsModule,
    ReactiveFormsModule,

    MatInputModule,
    MatDatepickerModule,
    MatNativeDateModule,
    MatDialogModule,
    MatSnackBarModule
    
  ],
  exports: [
    CrearTareaComponent
  ],
})
export class TareasModule {}
