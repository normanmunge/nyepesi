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
          //console.log(res.json());
          window.localStorage.setItem('user', res.json().token);
          this.isLoggedIn = true;
          this.userLevel();
        }
      }, err => {
        //console.error('ERROR', err);
      });

    return seq;
  }

  userLevel(){
    let token = localStorage.getItem('user');

    let headers = new Headers({
      'Content-Type': 'application/x-www-form-urlencoded',
      'Bearer':'${token}'
    });


    let options = new RequestOptions({headers: headers});

    this.api.getAccessLevel('o/authorize/', options).subscribe(res => {
            console.log(res);
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
   * Log the user out, which forgets the session
   */
  logout() {
    this._user = null;
  }

  /**
   * Process a login/signup response to store user data
   */
  _loggedIn(resp) {
    this._user = resp.user;
  }
}
