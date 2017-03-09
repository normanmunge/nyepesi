import { Component } from '@angular/core';
import { NavController, ToastController } from 'ionic-angular';
import {Validators, FormBuilder, FormGroup } from '@angular/forms';
import { TranslateService } from 'ng2-translate/ng2-translate';

import { MainPage } from '../../pages/pages';
import { FirstRunPage } from '../../pages/pages';
import { User } from '../../providers/user';

@Component({
  selector: 'page-login',
  templateUrl: 'login.html'
})
export class LoginPage {
  // The account fields for the login form.
  // If you're using the username field with or without email, make
  // sure to add it to the type
  private account: FormGroup;
  login: {};
  // Our translated text strings
  private loginErrorString: string;
  private loginError = 'Wrong username/password combination';

  constructor(public navCtrl: NavController,
              public user: User,
              private formBuilder: FormBuilder,
              public toastCtrl: ToastController,
              public translateService: TranslateService) {

    this.translateService.get('LOGIN_ERROR').subscribe((value) => {
      this.loginErrorString = value;
    });

    this.account = this.formBuilder.group({
      phone: ['', Validators.required],
      password: ['', Validators.required],
    });
  }

  // Attempt to login in through our User service
  doLogin() {
    var phone = this.account.value.phone;
    var password = this.account.value.password;
    this.login = "username="+phone+"&password="+password+"&grant_type=password&client_id=fjTgW84SioZFHV5hG0u3XPiCdNqELDjxI4Z9sH5w"
    //"phone="+phone+"&password="+password+"&grant_type=password&client_id=vqUG5XpzODxbtwFFY9qrOvhOxjPabJBEj5zcSjZL";
    this.user.login(this.login).subscribe((resp) => {
      //console.log(resp.json());
      this.navCtrl.push(MainPage);
    }, (err) => {
      this.navCtrl.push(FirstRunPage);
      // Unable to log in
      let toast = this.toastCtrl.create({
        message: this.loginError,
        duration: 3000,
        position: 'top'
      });
      toast.present();
    });
  }
}