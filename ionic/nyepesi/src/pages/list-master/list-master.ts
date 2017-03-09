import { Component } from '@angular/core';
import { NavController, ModalController,NavParams } from 'ionic-angular';


import { ItemCreatePage } from '../item-create/item-create';

import { Items } from '../../providers/items';
import { Api } from '../../providers/api';

@Component({
  selector: 'page-list-master',
  templateUrl: 'list-master.html',
  providers: [Api,Items]
})
export class ListMasterPage {
  currentItems: {};

  constructor(public navCtrl: NavController, public items: Items, public modalCtrl: ModalController, public navParams: NavParams, public api: Api)
  {}

  /**
   * The view loaded, let's query our items for the list
   */
  ionViewDidLoad() {

    this.query();
    this.navParams.get("newdata");
  }

  firstname;
  lastname;
  phonenumber;
  num;
  query() {
      return this.api.getList('api/customers/')
      .subscribe(res => {
        this.currentItems = res.json();
        /*var rows = [];
        var num;
        for(var i=0, len=res.json().length; i<len; i++){
          this.num = i+1;

        }*/
      }, err => {
        console.error('ERROR', err);
      });
  }

  /**
   * Prompt the user to add a new item. This shows our ItemCreatePage in a
   * modal and then adds the new item to our data source if the user created one.
   */
   newCustomer:{}

  addItem() {
    let addModal = this.modalCtrl.create(ItemCreatePage);
    addModal.onDidDismiss(item => {
      if (item) {
        this.add(this.newCustomer);
      }
    })
    addModal.present();
  }




  add(customer: any) {

  }

  /**
   * Delete an item from the list of items.
   */
  deleteItem(item) {
    this.items.delete(item);
  }


}
