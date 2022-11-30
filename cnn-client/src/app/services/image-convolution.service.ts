import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root'
})
export class ImageConvolutionService {

  constructor(private http:HttpClient) {}

  uploadImage(convBody:any) {
    return this.http.post<any>("http://localhost:8000/cnn/play_cnn", convBody, {headers: new HttpHeaders ({
      'Content-Type':  'multipart/form-data',
    })});
  }
}
