import { Injectable } from "@angular/core";

import { HttpClient, HttpHeaders } from "@angular/common/http";
import { Observable, map } from "rxjs";
import { environment } from "../../../../environments/environment";
import { Tarea } from "../models/tarea";


const API_TAREAS_URL = `${environment.apiUrl}Tareas`;

@Injectable({
  providedIn: 'root',
})
export class TareasService {

  constructor(private http: HttpClient) { }

  GetTareas(): Observable<Tarea[]> {

    return this.http.get<Tarea[]>(API_TAREAS_URL).pipe(map(result => {
      return result;
    }));
  }


  GetTareaPorId(id: number): Observable<Tarea> {
    return this.http.get<Tarea>(`${API_TAREAS_URL}/${id}`).pipe(map(result => {
      return result;
    }));
  }


  GuardarTarea(tarea: Tarea): Observable<Tarea> {

    const httpOptions =
    {
      headers: new HttpHeaders({
        "Content-Type": "application/json"
      })
    };

    return this.http.post<Tarea>(API_TAREAS_URL, JSON.stringify(tarea), httpOptions).pipe(map(result => {
      return result;
    }));
  }

  ElmiarTarea(id: number): Observable<Tarea> {
    return this.http.delete<Tarea>(`${API_TAREAS_URL}/${id}`).pipe(map(result => {
      return result;
    }));
  }


}
