import { Component, ViewChild } from '@angular/core';
import { Validators, FormBuilder, FormGroup } from '@angular/forms';
import { NavController, ToastController, ViewController } from 'ionic-angular';
import { Injectable,Inject } from '@angular/core';
import { TabsPage } from '../tabs/tabs';
import { Http,Headers,RequestOptions} from '@angular/http';
import { Api } from '../../providers/api';
import { ListMasterPage } from '../list-master/list-master';


/*
  Generated class for the ItemCreate page.

  See http://ionicframework.com/docs/v2/components/#navigation for more info on
  Ionic pages and navigation.
*/
@Component({
  selector: 'page-agent-create',
  templateUrl: 'agent-create.html',
  providers:[Api]
})
export class AgentCreatePage {

  isReadyToSave: boolean;

  item: any;

  form: FormGroup;

  constructor(public navCtrl: NavController, public viewCtrl: ViewController, public api: Api, formBuilder: FormBuilder,public toastCtrl: ToastController,) {
    this.form = formBuilder.group({
      f_name: ['', Validators.required],
      l_name: ['', Validators.required],
      phone: ['', Validators.required],
    });

    // Watch the form for changes, and
    this.form.valueChanges.subscribe((v) => {
      this.isReadyToSave = this.form.valid;
    });
  }

  ionViewDidLoad() {

  }
  /**
   * The user cancelled, so we dismiss without sending data back.
   */
  cancel() {
    this.viewCtrl.dismiss();
  }

  // Create new customer
  private newUser = "New Agent Created"
  createAgent() {
    var firstname = this.form.value.f_name;
    var lastname = this.form.value.l_name;
    var phone = this.form.value.phone;
    this.item = "F_Name="+firstname+"&L_Name="+lastname+"&Phonenumber="+phone

    let headers = new Headers({
      'Content-Type': 'application/x-www-form-urlencoded',
    });

    let options = new RequestOptions({headers: headers});

    let seq = this.api.post('api/customers/', this.item, options);

    seq
      .subscribe(res => {
        //display success message
        let toast = this.toastCtrl.create({
          message: this.newUser,
          duration: 3000,
          position: 'top'
        });
        toast.present();

        //push data to the list items page
        this.navCtrl.push(ListMasterPage,{
          newdata: this.item
        });
        this.navCtrl.push(TabsPage, {index: "1"});

        //close the modal
        this.viewCtrl.dismiss(this.form.value);
        }, err => {
        //console.error('ERROR', err);
      });

    return seq;

  }

  /**
   * The user is done and wants to create the item, so return it
   * back to the presenter.
   */
  done() {
    if(!this.form.valid) { return; }
    this.viewCtrl.dismiss(this.form.value);
  }
}
