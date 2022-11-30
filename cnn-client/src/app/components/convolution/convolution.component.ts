import { Component, OnInit } from '@angular/core';
import { ImageConvolutionService } from 'src/app/services/image-convolution.service';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { IConvolutionBody } from 'src/app/models/IConvolution';


@Component({
  selector: 'app-convolution',
  templateUrl: './convolution.component.html',
  styleUrls: ['./convolution.component.css']
})


export class ConvolutionComponent implements OnInit {


  file:any;
  constructor(private imageService:ImageConvolutionService, 
    private http:HttpClient) { }

  ngOnInit(): void {
  }


  getFile(event: any){    
    this.file = event.target.files[0];
  }


  uploadImage(event: Event){
    event.preventDefault();
    const formData  = new FormData();
    formData.append("img_name", "dick_tag");
    formData.append("img", this.file);
    console.log(formData);



    let headers = new HttpHeaders();
    headers = headers.append('Content-Type', 'multipart/form-data; boundary {}');
    headers = headers.append('enctype', 'multipart/form-data');

    fetch("http://127.0.0.1:8000/cnn/play_cnn",{
    method: "post",
    body:formData
  }).catch((error)=>{console.log(error)});


    // this.http.post("http://127.0.0.1:8000/cnn/play_cnn", formData, {headers})
    // .subscribe(res=>{
    //   console.log(res)
    // }, err =>{
    //   console.log(err);
    // })

    // this.imageService.uploadImage(formData)
    //   .subscribe(res=>{
    //     console.log(res)
    //   }, err =>{
    //     console.log(err);
    //   })
    
  }

}
