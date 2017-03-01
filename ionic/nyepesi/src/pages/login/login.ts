import { Component } from '@angular/core';
import { NavController, AlertController, LoadingController, Loading, NavParams } from 'ionic-angular';
import {AuthService} from '../../providers/auth-service';
import {AgentPage} from '../agent/agent';


@Component({
  selector: 'page-login',
  templateUrl: 'login.html'
})

export class LoginPage {
  loading: Loading;
  registerCredentials = {email: '', password: ''};

  constructor(public navCtrl: NavController,
              public navParams: NavParams,
              private auth:AuthService,
              private alertCtrl: AlertController,
              private loadingCtrl: LoadingController) {}

public forgotAccount(){
  //this.nav.push(ForgotLoginPage);
}

public login(){
  this.showLoading()
  this.auth.login(this.registerCredentials).subscribe(allowed =>{
    if(allowed){
      setTimeout(()=>{
        this.loading.dismiss();
        this.navCtrl.setRoot(AgentPage)
      });
    } else{
      this.showError("Access Denied");
    }
  },
  error =>{
    this.showError(error);
  });
}

showLoading(){
  this.loading = this.loadingCtrl.create({
    content: 'Please wait...'
  });
  this.loading.present();
}

showError(text){
  setTimeout(()=>{
    this.loading.dismiss();
  });

  let alert = this.alertCtrl.create({
    title: 'Failed',
    subTitle: text,
    buttons: ['OK']
  });
  alert.present(prompt);
}

/*
  ionViewDidLoad() {
    console.log('ionViewDidLoad LoginPage');
  }
*/

}
