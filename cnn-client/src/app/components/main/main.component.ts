import { HttpClient } from '@angular/common/http';
import { Component, OnInit } from '@angular/core';
import { ModalDismissReasons, NgbDatepickerModule, NgbModal } from '@ng-bootstrap/ng-bootstrap';
import { Chart, registerables } from 'chart.js';
import { Observable } from 'rxjs';
import { MainEnvironment, IMain, TrainRecords } from 'src/app/models/environment';
import { SelectionType } from '@swimlane/ngx-datatable';
import { AuthenticationService } from 'src/app/services/authentication.service';

@Component({
  selector: 'app-main',
  templateUrl: './main.component.html',
  styleUrls: ['./main.component.css']
})
export class MainComponent implements OnInit {
  closeResult = '';
  selectionType: SelectionType = SelectionType.checkbox;
  public chart: any;
  url = MainEnvironment.apiUrl;
  convUrl = TrainRecords.apiUrl;
  rows$!: Observable<any[]>;
  mainBody: IMain | any = {};
  convBody: any = [];
  userLogged: string | any = "";
  columns = [
    { prop: 'img_name' },
    { prop: 'img' },
    { prop: 'healthy' },
    { prop: 'sick' },
    { prop: 'created_at' },
    { prop: 'recommendation' }
  ];

  constructor(private http: HttpClient, private authenticationService: AuthenticationService,
    private modalService: NgbModal) {
    Chart.register(...registerables);
  }



  ngOnInit(): void {
    //this.lineGenerateChart();
    this.loadMainValues();
    this.loadingConvolution();
    this.rows$ = this.getRows();
    //console.log(this.mainBody);
  }

  getRows(): Observable<any[]> {
    return this.http.get<any[]>('http://127.0.0.1:8000/cnn/cnn/');
  }

  loadMainValues() {
    this.http.get<any>(this.url)
      .subscribe(res => {
        console.log(res)
        this.mainBody = res;
      })
    this.userLogged = this.authenticationService.getUserName();

  }


  loadingConvolution() {
    this.http.get<any>(this.convUrl)
      .subscribe(res => {
        console.log(res);
        this.convBody = res;
      }, err => {
        console.log(err);
      })
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

  private getDismissReason(reason: any): string {
    if (reason === ModalDismissReasons.ESC) {
      return 'by pressing ESC';
    } else if (reason === ModalDismissReasons.BACKDROP_CLICK) {
      return 'by clicking on a backdrop';
    } else {
      return `with: ${reason}`;
    }
  }
}



