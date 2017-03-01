import { NgModule, ErrorHandler } from '@angular/core';
import { IonicApp, IonicModule, IonicErrorHandler } from 'ionic-angular';

import { AuthService } from '../providers/auth-service';

import { MyApp } from './app.component';
import { HomePage } from '../pages/home/home';
import { LoginPage } from '../pages/login/login';
import { AgentPage } from '../pages/agent/agent';
import { CustomerPage } from '../pages/customer/customer';

@NgModule({
  declarations: [
    MyApp,
    LoginPage,
    AgentPage,
    HomePage,
    CustomerPage
  ],
  imports: [
    IonicModule.forRoot(MyApp)
  ],
  bootstrap: [IonicApp],
  entryComponents: [
    MyApp,
    LoginPage,
    AgentPage,
    HomePage,
    CustomerPage
  ],
  providers: [AuthService, {provide: ErrorHandler, useClass: IonicErrorHandler}]
})
export class AppModule {}
