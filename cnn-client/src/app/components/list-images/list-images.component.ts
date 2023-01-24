import { HttpClient } from '@angular/common/http';
import { Component, OnInit } from '@angular/core';
import { IList, ListImagesEnvironment } from 'src/app/models/environment';
import { ModalDismissReasons, NgbDatepickerModule, NgbModal }from '@ng-bootstrap/ng-bootstrap';

@Component({
  selector: 'app-list-images',
  templateUrl: './list-images.component.html',
  styleUrls: ['./list-images.component.css']
})
export class ListImagesComponent implements OnInit {

  url = ListImagesEnvironment.apiUrl;
  listBody: any = [];
  //listBody: any= {};
  constructor(private http:HttpClient, private modalService: NgbModal) { }

  ngOnInit(): void {
    this.loadImagesFrontDataBase();
  }
  open(content: any) {
		this.modalService.open(content, { ariaLabelledBy: 'modal-basic-title' }).result.then(
			(result) => {
				//this.closeResult = `Closed with: ${result}`;
			},
			(reason) => {
				//this.closeResult = `Dismissed ${this.getDismissReason(reason)}`;
			},
		);
	}


  loadImagesFrontDataBase(){
    this.http.get<any>(this.url)
      .subscribe(
        res=>{
        //console.log(res.json());
        this.listBody = res;
        
      }, err=>
      console.log(err)
      );
  }

}
