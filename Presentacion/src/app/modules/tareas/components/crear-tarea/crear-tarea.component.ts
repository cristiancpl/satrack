import { AfterViewInit, Component, Inject, OnInit } from '@angular/core';
import { EstadosService } from '../../services/estados.service';
import { Estado } from '../../models/estado';
import { CategoriasService } from '../../services/categorias.service';
import { Categoria } from '../../models/categoria';
import { DrawerComponent } from '../../../../_metronic/kt/components';
import { Tarea } from '../../models/tarea';
import { TareasService } from '../../services/tareas.service';
import { MAT_DIALOG_DATA, MatDialogRef } from '@angular/material/dialog';
import { MatSnackBar } from '@angular/material/snack-bar';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';



@Component({
  selector: 'app-crear-tarea',
  templateUrl: './crear-tarea.component.html',
})
export class CrearTareaComponent implements OnInit {

  form: FormGroup;
  estados: Estado[] = [];
  categorias: Categoria[] = [];
  tareaActual = new Tarea();
  EsEdicion: boolean = false;
  fechaMinima: Date;

  constructor(private fb: FormBuilder,
    private estadosService: EstadosService,
    private categoriasService: CategoriasService,
    private tareasService: TareasService,
    public dialogRef: MatDialogRef<CrearTareaComponent>,
    @Inject(MAT_DIALOG_DATA) public data: number,
    private snackBar: MatSnackBar) { }

  ngOnInit(): void {
    this.Inicializar();

    // Editar tarea
    if (this.data) {
      this.GetTareaPorId(this.data);
      this.EsEdicion = true;
    }

    this.initForm();
  }

  Inicializar(): void {
    this.GetEstados();
    this.GetCategorias();
    this.tareaActual = new Tarea();
    this.fechaMinima = new Date();
  }


  initForm() {
    this.form = this.fb.group({
      nombre: ['', [Validators.required, Validators.maxLength(50)]],
      descripcion: ['', Validators.maxLength(100)],
      estado: ['', [Validators.required]],
      categoria: ['', [Validators.required]],
      fecha_limite: ['', [Validators.required]],      
    });


  }

  GetEstados() {
    this.estadosService.GetEstados().subscribe({
      next: (data) => {
        this.estados = data ? data : [];
      },
      error: (error) => console.error(error)
    });
  }


  GetCategorias() {
    this.categoriasService.GetCategorias().subscribe({
      next: (data) => {
        this.categorias = data ? data : [];
      },
      error: (error) => console.error(error)
    });
  }


  GuardarTarea() {
    this.tareasService.GuardarTarea(this.tareaActual).subscribe({
      next: (data) => {
        this.snackBar.open('Tarea guardada con éxito', undefined, { duration: 5000 });
        this.dialogRef.close();
      },
      error: (error) => console.error(error)
    });
  }


  GetTareaPorId(id: number) {
    this.tareasService.GetTareaPorId(id).subscribe({
      next: (data) => {
        this.tareaActual = data ? data : new Tarea();
        this.tareaActual.estado = this.estados.find(x => x.id == this.tareaActual?.estado?.id);
        this.tareaActual.categoria = this.categorias.find(x => x.id == this.tareaActual?.categoria?.id);
      },
      error: (error) => console.error(error)
    });
  }


  EliminarTarea() {
    if (confirm('¿Desea eliminar la tarea?')) {
      this.tareasService.ElmiarTarea(this.tareaActual.id).subscribe({
        next: (data) => {
          this.snackBar.open('Tarea eliminada con éxito', undefined, { duration: 5000 });
          this.dialogRef.close();  
        },
        error: (error) => console.error(error)
      });
    }
  }


}
