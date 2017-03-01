import { Injectable } from '@angular/core';
import { Http } from '@angular/http';
import {Observable} from 'rxjs/Observable';
import 'rxjs/add/operator/map';

export class User{
  pass: string;
  email: string;

  constructor(pass: string, email: string){
    this.pass = pass;
    this.email = email;
  }
}



@Injectable()
export class AuthService {

  constructor(public http: Http) {

  }

  currentUser: User;

  public login(credentials){
    if(credentials.email === null || credentials.password === null){
      return Observable.throw("Please insert credentials");
    }
    else{
      return Observable.create(observer =>{
        //make call to back end
        let access = (credentials.password === "pass" && credentials.email === "email");
        this.currentUser = new User('Norman', 'normanmunge@gmail.com');
        observer.next(access);
        observer.complete();
      });
    }
  }


  public register(credentials){
    if(credentials.email === null || credentials.password === null){
      return Observable.throw("Please insert credentials");
    }
    else{
      //store creds in backend
      return Observable.create(observer =>{
        observer.next(true);
        observer.complete();
      });
    }
  }

  public getUserInfo(): User{
    return this.currentUser;
  }

  public logout(){
    return Observable.create(observer =>{
      this.currentUser = null;
      observer.next(true);
      observer.complete();
    })
  }
}
