import { Component, OnInit } from '@angular/core';
import { ImageConvolutionService } from 'src/app/services/image-convolution.service';

@Component({
  selector: 'app-convolution',
  templateUrl: './convolution.component.html',
  styleUrls: ['./convolution.component.css']
})


export class ConvolutionComponent implements OnInit {

  file:any;

  constructor(private imageService:ImageConvolutionService) { }

  ngOnInit(): void {
  }


  getFile(event: any){
    this.file = event.target.files[0];
  }


  uploadImage(){
    const formData = new FormData();
    formData.append('img_name', "imageee")
    formData.append('accuracy', "imageee")
    formData.append('loss', "imageee")
    formData.append('img', this.file);
    this.imageService.uploadImage(formData)
    .subscribe(res=>{
      console.log(res);
    }, (error)=>{
      console.log(error);
    })
  }

}
