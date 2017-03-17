import { Component } from '@angular/core';
import { NavController, NavParams } from 'ionic-angular';
import { AgentCreatePage } from '../agent-create/agent-create';
import { ItemCreatePage } from '../item-create/item-create';

/*
  Generated class for the Display page.

  See http://ionicframework.com/docs/v2/components/#navigation for more info on
  Ionic pages and navigation.
*/
@Component({
  selector: 'page-display',
  templateUrl: 'display.html'
})
export class DisplayPage {

  constructor(public navCtrl: NavController, public navParams: NavParams) {}

  ionViewDidLoad() {
    console.log('ionViewDidLoad DisplayPage');
  }

  addAgent(){
    this.navCtrl.push(AgentCreatePage);
  }

  addCustomer(){
    this.navCtrl.push(ItemCreatePage);
  }

}
