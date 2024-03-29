import { Component, OnInit, ViewChild } from '@angular/core';
import {
  ModalDismissReasons,
  NgbDatepickerModule,
  NgbModal,
} from '@ng-bootstrap/ng-bootstrap';
import { Subject } from 'rxjs';
import { IConvolutionBody } from 'src/app/models/IConvolution';
import { ConvEnvironment, filterConv, RealRecordsLastOne } from 'src/app/models/environment';
import { HttpClient } from '@angular/common/http';
import { NgbAlert, NgbAlertModule } from '@ng-bootstrap/ng-bootstrap';
import { debounceTime } from 'rxjs/operators';
//import {MatProgressBarModule} from '@angular/material/progress-bar';

@Component({
  selector: 'app-convolution',
  templateUrl: './convolution.component.html',
  styleUrls: ['./convolution.component.css'],
})
export class ConvolutionComponent implements OnInit {


  // alert section
  private _success = new Subject<string>();
  @ViewChild('staticAlert', { static: false }) staticAlert: NgbAlert | any;
  @ViewChild('selfClosingAlert', { static: false }) selfClosingAlert: NgbAlert | any;


  closeResult = '';
  successMessage = '';
  file: any;
  imgUrl: any;
  lastOne = RealRecordsLastOne.apiUrl;

  url = ConvEnvironment.apiUrl;
  filterUrl = filterConv.apiUrl;

  convolution: IConvolutionBody[] = [];
  newConvBody: any = [];

  constructor(private modalService: NgbModal, private http: HttpClient) { }

  ngOnInit(): void {

    setTimeout(() => this.staticAlert.close(), 20000);
    this._success.subscribe((message) => (this.successMessage = message));
		this._success.pipe(debounceTime(5000)).subscribe(() => {
			if (this.selfClosingAlert) {
				this.selfClosingAlert.close();
			}
		});
   }

   public changeSuccessMessage() {
		this._success.next(`${new Date()} - Credenciales incorrectas.`);
	}

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
  }

  uploadImage(event: Event) {

    var i = 0;
    function move() {
      if (i == 0) {
        i = 1;
        var elem: any = document.getElementById("myBar");
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


    fetch(this.filterUrl, {
      method: 'post',
      body: formData,
    })
      .then((res) => res.json())
      .then((data) => {

        if (data['message'] == "YES") {
          fetch(this.url, {
            method: 'post',
            body: formData,
          })
            .then((res) => res.json())
            .then((data) => {
              const convBody: IConvolutionBody = {
                img_name: data.Content.img_name,
                healthy: data.Content.healthy,
                sick: data.Content.sick,
                recommendation: data.Content.recommendation
              }
              this.convolution.push(convBody);
            })
            .catch((error) => {
              console.log(error);
            });

          this.http.get<any>(this.lastOne)
            .subscribe(res => {
              this.newConvBody = res;
            }, err => {
              console.log(err);
            })



        } else {
          this._success.next(`no es una planta de arroz.`);
        }
      })
      .catch((error) => {
        console.log(error);
      });



  }
}
