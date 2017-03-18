import { Component } from '@angular/core';
import { NavController, ToastController,ModalController,NavParams,ActionSheetController } from 'ionic-angular';
import { Http,Headers,RequestOptions} from '@angular/http';


import { ItemCreatePage } from '../item-create/item-create';
import { EditItemPagePage } from '../edit-item-page/edit-item-page';
import { AgentCreatePage } from '../agent-create/agent-create';

import { Items } from '../../providers/items';
import { Api } from '../../providers/api';

@Component({
  selector: 'page-list-master',
  templateUrl: 'list-master.html',
  providers: [Api,Items]
})
export class ListMasterPage {

  currentItems: {};

  customerDetails = [];

  constructor(public actionSheetCtrl: ActionSheetController, public navCtrl: NavController,public toastCtrl: ToastController, public items: Items, public modalCtrl: ModalController, public navParams: NavParams, public api: Api)
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
        console.log(this.currentItems);

        /*var rows = [];
        var num;
        for(var i=0, len=res.json().length; i<len; i++){
          this.num = i+1;

        }*/
      }, err => {
        console.error('ERROR', err);
      });
  }


  presentActionSheet(id){

    let headers = new Headers({
      'Content-Type': 'application/x-www-form-urlencoded'
    });

    let options = new RequestOptions({headers: headers});

    let actionSheet = this.actionSheetCtrl.create({
      title: 'Customer',
      buttons:[
        {
          text: 'Edit',
          handler: () =>{
            //this.api.getId('api/editcustomers/'+id, options).subscribe((resp) => {
              console.log('Edit Customer');
              //this.navCtrl.push(EditItemPagePage);
              this.api.get('api/editcustomers/'+id, options).subscribe((data) => {
                
                this.navCtrl.push(EditItemPagePage,{
                  id:data.json().id,
                  f_name: data.json().F_Name,
                  l_name:data.json().L_Name,
                  phone:data.json().Phonenumber
                });
              },(err) => {
                  console.log(err);
              }
            )
          }
        },{
          text: 'Delete',
          handler: (item) =>{
            this.api.delete('api/editcustomers/'+id, options).subscribe((resp) => {
              this.deleteItem(id);

              let toast = this.toastCtrl.create({
                message: "Customer successfully deleted",
                duration: 2000,
                position: 'top'
              });
              toast.present();
              this.navCtrl.push(ListMasterPage);
            },(err) => {
                console.log(err);
            }
          )}
        },{
          text: 'Cancel',
          role: 'cancel',
          handler: () =>{
            console.log('Cancel');
          }
        }
      ]
    });
    actionSheet.present();
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

   newAgent:{}
  addAgent() {
    let addModal = this.modalCtrl.create(AgentCreatePage);
    addModal.onDidDismiss(agent => {
      if (agent) {
        this.add(this.newAgent);
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
