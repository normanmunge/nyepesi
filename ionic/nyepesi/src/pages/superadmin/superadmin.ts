import { Component, ViewChild } from '@angular/core';
import { NavController, Nav } from 'ionic-angular';

import { ContentPage } from '../content/content';
import { AdminPage } from '../admin/admin';
import { TabsPage } from '../tabs/tabs';

import { ListAgentsPage } from '../list-agents/list-agents';
import {SearchPage} from '../search/search';
import { LoginPage } from '../login/login';
import { AgentCreatePage } from '../agent-create/agent-create';
import { ItemCreatePage } from '../item-create/item-create';
import { SettingsPage } from '../settings/settings';

/*
  Generated class for the Menu page.

  See http://ionicframework.com/docs/v2/components/#navigation for more info on
  Ionic pages and navigation.
*/
@Component({
  selector: 'page-superadmin',
  templateUrl: 'superadmin.html'
})
export class SuperadminPage {
  // A reference to the ion-nav in our component
  @ViewChild(Nav) nav: Nav;

  rootPage: any = AdminPage;

  pages: Array<{title: string, component: any}>;

  constructor(public navCtrl: NavController) {
    // used for an example of ngFor and navigation
    this.pages = [
      { title: 'Register Agent', component: AgentCreatePage },
      { title: 'List Agents', component: ListAgentsPage },
      { title: 'Register Customer', component: ItemCreatePage },
      { title: 'List Customers', component: TabsPage }
    ];
  }

  ionViewDidLoad() {}

  openPage(page) {
     // Reset the content nav to have just this page
     // we wouldn't want the back button to show in this scenario
     //this.nav.setRoot(page.component);
     this.navCtrl.push(page.component);
   }

   searchpage(){
     this.navCtrl.push(SearchPage);
   }

   /**
    * Log the user out, which forgets the session
    */
   logout() {
     window.localStorage.removeItem('user');
     this.navCtrl.setRoot(LoginPage);
   }
}
