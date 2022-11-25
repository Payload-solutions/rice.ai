import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root'
})
export class ImageConvolutionService {

  constructor(private http:HttpClient) {}

  uploadImage(image:any) {
    return this.http.post<any>("http://127.0.0.1:8000/user/user/convolution", image);
  }
}
