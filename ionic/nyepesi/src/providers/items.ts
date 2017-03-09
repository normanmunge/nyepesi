import { Injectable } from '@angular/core';
import { Http} from '@angular/http';
import 'rxjs/add/operator/map';

import { Api } from './api';

import { Item } from '../models/item';

@Injectable()
export class Items {

  constructor(public http: Http, public api: Api) {
  }

  firstname;
  lastname;
  phonenumber;
  query() {
      return this.api.getList('customers/')
      .subscribe(res => {

        this.firstname = res.json().F_Name,
        this.lastname = res.json().L_Name,
        this.phonenumber = res.json().phonenumber
        console.log(this.firstname);
      }, err => {
        console.error('ERROR', err);
      });
  }

  add(item: Item) {
  }

  delete(item: Item) {
  }

}
