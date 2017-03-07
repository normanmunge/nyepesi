import { Component } from '@angular/core';
import {Validators, FormBuilder, FormGroup } from '@angular/forms';
import { NavController, LoadingController, Loading } from 'ionic-angular';
import {AuthService} from '../../providers/auth-service';


@Component({
  selector: 'page-login',
  templateUrl: './login.html',
  providers: [AuthService]
})

export class LoginPage {
  loading: Loading;
  private login: FormGroup;

  constructor(
              private auth:AuthService,
              private navCtrl: NavController,
              private formBuilder: FormBuilder,
              private loadingCtrl: LoadingController) {
                this.login = formBuilder.group({
                  phone: ['',Validators.required],
                  password: ['', Validators.required],
                });
              }

public forgotAccount(){
  //this.nav.push(ForgotLoginPage);
  console.log('forgotAccount');
}

public loginForm(){
  this.showLoading();
  console.log('ujinga');

}

showLoading(){
  this.loading = this.loadingCtrl.create({
    content: 'Please wait...'
  });
  this.loading.present();
}


/*
  ionViewDidLoad() {
    console.log('ionViewDidLoad LoginPage');
  }
*/

}
