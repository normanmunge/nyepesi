import { Component } from '@angular/core';
import { NavController, ToastController,ModalController,NavParams,ActionSheetController } from 'ionic-angular';
import { Http,Headers,RequestOptions} from '@angular/http';


import { ItemCreatePage } from '../item-create/item-create';
import { EditAgentPagePage } from '../edit-agent-page/edit-agent-page';
import { AgentCreatePage } from '../agent-create/agent-create';

import { Items } from '../../providers/items';
import { Api } from '../../providers/api';

@Component({
  selector: 'page-list-agents',
  templateUrl: 'list-agents.html',
  providers: [Api,Items]
})
export class ListAgentsPage {
  currentItems: {};

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
      return this.api.getList('api/agents/')
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
              this.api.get('api/editagents/'+id, options).subscribe((data) => {

                this.navCtrl.push(EditAgentPagePage,{
                  id:data.json().id,
                  f_name: data.json().F_Name,
                  l_name:data.json().L_Name,
                  phone:data.json().Phonenumber,
                  email:data.json().Email,
                  county:data.json().County,
                  constituency:data.json().Constituency,
                  locality:data.json().Locality,
                  user:data.json().User
                });
              },(err) => {
                  console.log(err);
              }
            )
          }
        },{
          text: 'Delete',
          handler: (item) =>{
            this.api.delete('api/editagents/'+id, options).subscribe((resp) => {
              this.deleteItem(id);

              let toast = this.toastCtrl.create({
                message: "Agent successfully deleted",
                duration: 2000,
                position: 'top'
              });
              toast.present();
              this.navCtrl.push(ListAgentsPage);
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
