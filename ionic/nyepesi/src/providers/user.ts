import { Injectable,Inject } from '@angular/core';
import { Http,Headers,RequestOptions} from '@angular/http';
import { Api } from './api';
import 'rxjs/add/operator/map';
import 'rxjs/add/operator/toPromise';


@Injectable()
export class User {
  _user: any;
  public isLoggedIn;
  constructor(public http: Http,public api: Api) {
     this.isLoggedIn = false
  }

  /**
   * Send a POST request to our login endpoint with the data
   * the user entered on the form.
   */
  login(accountInfo: any) {
    let headers = new Headers({
      'Content-Type': 'application/x-www-form-urlencoded',
    });

    let options = new RequestOptions({headers: headers});

    let seq = this.api.post('o/token/', accountInfo, options);

    seq
      .subscribe(res => {
        // If the API returned a successful response, mark the user as logged in
        if(res.json().success) {
          //let level = this.api.getAccessLevel('api/person/', user,this.options);
          //console.log(res.json());
          window.localStorage.setItem('user', res.json().access_token);
          this.isLoggedIn = true;
          this.userLevel(res.json().access_token);
        }
      }, err => {
        //console.error('ERROR', err);
      });

    return seq;
  }

  userLevel(token){

    let headers = new Headers({
      'Content-Type': 'application/x-www-form-urlencoded',
      'Authorization':'Bearer '+token
    });


    let options = new RequestOptions({headers: headers});

    this.api.getAccessLevel('api/person/', options).subscribe(res => {
            console.log(res.json());
            window.localStorage.setItem("firstname",res.json().F_Name);
            window.localStorage.setItem("lastname",res.json().L_Name);
            window.localStorage.setItem("email",res.json().Email);
            window.localStorage.setItem("phone",res.json().Phonenumber);
          }, err => {
            //console.error('ERROR', err);
          });
  }

  /**
   * Send a POST request to our signup endpoint with the data
   * the user entered on the form.
   */
  signup(accountInfo: any) {
    let seq = this.api.post('signup', accountInfo).share();

    seq
      .map(res => res.json())
      .subscribe(res => {
        // If the API returned a successful response, mark the user as logged in
        if(res.status == 'success') {
          this._loggedIn(res);
        }
      }, err => {
        console.error('ERROR', err);
      });

    return seq;
  }



  /**
   * Process a login/signup response to store user data
   */
  _loggedIn(resp) {
    this._user = resp.user;
  }
}
