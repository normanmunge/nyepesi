import { Component } from '@angular/core';
import { NavController } from 'ionic-angular';
import { Items } from '../../providers/items';
import {SearchPage} from '../search/search';
import { Tab1Root } from '../pages';
import { Tab2Root } from '../pages';
import { Tab3Root } from '../pages';
import { Tab4Root } from '../pages';

@Component({
  selector: 'page-admin',
  templateUrl: 'admin.html'
})
export class AdminPage {
  tab4Root: any = Tab4Root;
  //tab2Root: any = Tab2Root;
  //tab3Root: any = Tab3Root;

  //tab1Title = "Home";
  //tab2Title = "Search";
  //tab3Title = "Profile";

  constructor(public navCtrl: NavController) {
  }

  searchpage(){
    this.navCtrl.push(SearchPage);
  }
}
