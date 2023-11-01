import { Injectable } from "@angular/core";
import { HttpClient } from "@angular/common/http";
import { Observable, map } from "rxjs";
import { environment } from "../../../../environments/environment";
import { Categoria } from "../models/categoria";


const API_CATEGORIAS_URL = `${environment.apiUrl}Categorias`;

@Injectable({
  providedIn: 'root',
})
export class CategoriasService {

  constructor(private http: HttpClient) { }

  GetCategorias(): Observable<Categoria[]> {
    return this.http.get<Categoria[]>(API_CATEGORIAS_URL).pipe(map(result => {
      return result;
    }));
  }

}
