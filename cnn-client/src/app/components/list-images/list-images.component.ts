import { HttpClient } from '@angular/common/http';
import { Component, OnInit } from '@angular/core';
import { IList, ListImagesEnvironment } from 'src/app/models/environment';

@Component({
  selector: 'app-list-images',
  templateUrl: './list-images.component.html',
  styleUrls: ['./list-images.component.css']
})
export class ListImagesComponent implements OnInit {

  url = ListImagesEnvironment.apiUrl;
  listBody: any = [];
  //listBody: any= {};
  constructor(private http:HttpClient) { }

  ngOnInit(): void {
    this.loadImagesFrontDataBase();
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
