import { Component, OnInit } from '@angular/core';
import {
  ModalDismissReasons,
  NgbDatepickerModule,
  NgbModal,
} from '@ng-bootstrap/ng-bootstrap';

import { IConvolutionBody } from 'src/app/models/IConvolution';
//import {MatProgressBarModule} from '@angular/material/progress-bar';

@Component({
  selector: 'app-convolution',
  templateUrl: './convolution.component.html',
  styleUrls: ['./convolution.component.css'],
})
export class ConvolutionComponent implements OnInit {
  closeResult = '';
  file: any;
  imgUrl: any;

  convolution: IConvolutionBody[] = [];

  constructor(private modalService: NgbModal) { }

  ngOnInit(): void { }

  open(content: any) {
    this.modalService
      .open(content, { ariaLabelledBy: 'modal-basic-title' })
      .result.then(
        (result) => {
          //this.closeResult = `Closed with: ${result}`;
        },
        (reason) => {
          //this.closeResult = `Dismissed ${this.getDismissReason(reason)}`;
        }
      );
  }

  private getDismissReason(reason: any): string {
    if (reason === ModalDismissReasons.ESC) {
      return 'by pressing ESC';
    } else if (reason === ModalDismissReasons.BACKDROP_CLICK) {
      return 'by clicking on a backdrop';
    } else {
      return `with: ${reason}`;
    }
  }

  getFile(event: any) {
    this.file = event.target.files[0];
    var reader = new FileReader();
    reader.readAsDataURL(this.file);
    reader.onload = (_event) => {
      this.imgUrl = reader.result;
    }



    for (let prop in this.file) {
      console.log(prop);

    }
  }

  uploadImage(event: Event) {

    var i = 0;
    function move() {
      if (i == 0) {
        i = 1;
        var elem:any = document.getElementById("myBar");
        var width = 1;
        var id = setInterval(frame, 10);
        function frame() {
          if (width >= 100) {
            clearInterval(id);
            i = 0;
          } else {
            width++;
            elem.style.width = width + "%";
          }
        }
      }
    }

    move();
    event.preventDefault();
    const formData = new FormData();
    formData.append('img_name', 'dick_tag');
    formData.append('img', this.file);
    console.log(formData);

    // let headers = new HttpHeaders();
    // headers = headers.append('Content-Type', 'multipart/form-data; boundary {}');
    // headers = headers.append('enctype', 'multipart/form-data');

    fetch('http://127.0.0.1:8000/cnn/play_cnn', {
      method: 'post',
      body: formData,
    })
      .then((res) => res.json())
      .then((data) => {
        console.log(data)
        const convBody: IConvolutionBody = {
          img_name: data.Content.img_name,
          healthy: data.Content.healthy,
          sick: data.Content.sick
        }
        this.convolution.push(convBody);

      })
      .catch((error) => {
        console.log(error);
      });

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
