import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root'
})
export class ImageConvolutionService {

  constructor(private http:HttpClient) {}

  uploadImage(image:any) {
    return this.http.post<any>("http://localhost:8000/cnn/play_cnn/", image);
  }
}
