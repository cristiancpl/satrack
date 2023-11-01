import { Injectable } from "@angular/core";

import { HttpClient } from "@angular/common/http";
import { Observable, map } from "rxjs";
import { environment } from "../../../../environments/environment";
import { ItemBase } from "../models/itemBase";
import { Estado } from "../models/estado";


const API_ESTADOS_URL = `${environment.apiUrl}Estados`;

@Injectable({
  providedIn: 'root',
})
export class EstadosService {

  constructor(private http: HttpClient) { }

  GetEstados(): Observable<Estado[]> {
    return this.http.get<Estado[]>(API_ESTADOS_URL).pipe(map(result => {
      return result;
    }));
  }




}
