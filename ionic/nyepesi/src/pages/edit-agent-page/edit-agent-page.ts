import { Component, ViewChild } from '@angular/core';
import { Validators, FormBuilder, FormGroup } from '@angular/forms';
import { NavController, NavParams, ToastController, ViewController } from 'ionic-angular';
import { Injectable,Inject } from '@angular/core';
import { TabsPage } from '../tabs/tabs';
import { Http,Headers,RequestOptions} from '@angular/http';
import { Api } from '../../providers/api';
import { ListAgentsPage} from '../list-agents/list-agents';

@Component({
  selector: 'page-edit-agent-page',
  templateUrl: 'edit-agent-page.html'
})
export class EditAgentPagePage {

  isReadyToSave: boolean;

  item: any;
  form: FormGroup;
  f_name:any;
  l_name: any;
  phonenum: any;
  email: any;
  county: any;
  constituency: any;
  locality:any;
  id: any;
  user: any;
  constructor(public navCtrl: NavController,private navParams: NavParams, public viewCtrl: ViewController, public api: Api, formBuilder: FormBuilder,public toastCtrl: ToastController,) {
    this.form = formBuilder.group({
      f_name: ['', Validators.required],
      l_name: ['', Validators.required],
      phone: ['', Validators.required],
      email: ['', Validators.required],
      county: ['', Validators.required],
      constituency: ['', Validators.required],
      locality: ['', Validators.required]
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
    this.email = this.navParams.get("email");
    this.county = this.navParams.get("county");
    this.constituency = this.navParams.get("constituency");
    this.locality = this.navParams.get("locality");
    this.id = this.navParams.get("id");
    this.user = this.navParams.get("user");
  }
  /**
   * The user cancelled, so we dismiss without sending data back.
   */
  cancel() {
    this.viewCtrl.dismiss();
  }

  // Edit Agent
  editAgent() {
    var firstname = this.form.value.f_name  || this.f_name;
    var lastname = this.form.value.l_name || this.l_name;
    var phone =  this.form.value.phone || this.phonenum;
    var email = this.form.value.email || this.email;
    var county = this.form.value.county || this.county;
    var constituency = this.form.value.constituency || this.constituency;
    var locality = this.form.value.locality || this.locality;
    var user = this.user


    //this.item = {F_Name: firstname,L_Name: lastname,Phonenumber: phone,Email:email,County: county,Constituency:constituency,Localit:locality}
    this.item = "F_Name="+firstname+"&L_Name="+lastname+"&Phonenumber="+phone+"&Email="+email+"&County="+county+"&Constituency="+constituency+"&Locality="+locality+"&User="+user

    let headers = new Headers({
      'Content-Type': 'application/x-www-form-urlencoded',
    });

    let options = new RequestOptions({headers: headers});

    let seq = this.api.put('api/editagents/'+this.id, this.item, options);

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
        this.navCtrl.push(ListAgentsPage,{
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
