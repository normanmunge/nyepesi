import { Component } from '@angular/core';
import { NavController, AlertController, NavParams } from 'ionic-angular';
import {AuthService} from '../../providers/auth-service';


@Component({
  selector: 'page-customer',
  templateUrl: 'customer.html'
})
export class CustomerPage {
  createSuccess = false;
  registerCredentials = {firstname: '',secondname: '', phonenumber: ''};

  constructor(public navCtrl: NavController,
              public navParams: NavParams,
              private auth: AuthService,
              private alertCtrl:AlertController) {}

  public registerAgent(){
    this.auth.register(this.registerCredentials).subscribe(success => {
      if(success){
        this.createSuccess = true;
          this.showPopup("Success", "Account Created.");
      }else{
        this.showPopup("Error", "Problem Creating Account");
      }
    },
    error => {
      this.showPopup("Error", error);
    });
  }

  showPopup(title,text){
    let alert = this.alertCtrl.create({
      title: title,
      subTitle: text,
      buttons:[
        {
          text: 'OK',
          handler: data => {
            if(this.createSuccess){
              //takes it to the root directory
              this.navCtrl.popToRoot();
            }
          }
        }
      ]
    });
    alert.present();
  }
  /*
  ionViewDidLoad() {
    console.log('ionViewDidLoad AgentPage');
  }
  */

}
