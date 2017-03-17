import { Component } from '@angular/core';
import { NavController } from 'ionic-angular';
import { Items } from '../../providers/items';
import {SearchPage} from '../search/search';
import { Tab1Root } from '../pages';
import { Tab2Root } from '../pages';
import { Tab3Root } from '../pages';
import { Tab5Root } from '../pages';

@Component({
  selector: 'page-tabs',
  templateUrl: 'tabs.html',
  providers: [Items]
})

export class TabsPage {
  tab1Root: any = Tab1Root;
  tab5Root: any = Tab5Root;
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
