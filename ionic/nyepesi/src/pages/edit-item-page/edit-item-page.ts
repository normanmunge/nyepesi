import { Component, ViewChild } from '@angular/core';
import { Validators, FormBuilder, FormGroup } from '@angular/forms';
import { NavController, NavParams, ToastController, ViewController } from 'ionic-angular';
import { Injectable,Inject } from '@angular/core';
import { TabsPage } from '../tabs/tabs';
import { Http,Headers,RequestOptions} from '@angular/http';
import { Api } from '../../providers/api';
import { ListMasterPage} from '../list-master/list-master';



@Component({
  selector: 'page-edit-item-page',
  templateUrl: 'edit-item-page.html'
})
export class EditItemPagePage {

  isReadyToSave: boolean;

  item: any;
  form: FormGroup;
  f_name:any;
  l_name: any;
  phonenum: any;
  id: any;

  constructor(public navCtrl: NavController,private navParams: NavParams, public viewCtrl: ViewController, public api: Api, formBuilder: FormBuilder,public toastCtrl: ToastController,) {
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
    this.f_name = this.navParams.get("f_name");
    this.l_name = this.navParams.get("l_name");
    this.phonenum = this.navParams.get("phone");
    this.id = this.navParams.get("id");
  }
  /**
   * The user cancelled, so we dismiss without sending data back.
   */
  cancel() {
    this.viewCtrl.dismiss();
  }

  // Create new customer
  editItem() {
    //var change;
    //if(this.editItem()){
    var firstname = this.form.value.f_name  || this.f_name;
    var lastname = this.form.value.l_name || this.l_name;
    var phone =  this.form.value.phone || this.phonenum;
    //}
    //var firstname = this.form.value.f_name;
    //var lastname = this.form.value.l_name;
    //var phone = this.form.value.phone;

    this.item = "F_Name="+firstname+"&L_Name="+lastname+"&Phonenumber="+phone

    let headers = new Headers({
      'Content-Type': 'application/x-www-form-urlencoded',
    });

    let options = new RequestOptions({headers: headers});

    let seq = this.api.put('api/editcustomers/'+this.id, this.item, options);

    seq
      .subscribe(res => {
        //display success message
        let toast = this.toastCtrl.create({
          message: 'Edited User'+this.f_name+' '+this.l_name,
          duration: 3000,
          position: 'top'
        });
        toast.present();

        //push data to the list items page
        this.navCtrl.push(ListMasterPage,{
          newdata: this.item
        });

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
