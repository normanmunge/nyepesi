import { Injectable, Inject } from '@angular/core';
import { Http, Headers,RequestOptions } from '@angular/http';
import 'rxjs/add/operator/map';

/**
 * Api is a generic REST Api handler. Set your API url first.
 */
@Injectable()
export class Api {
  url: string = 'http://127.0.0.1:8000';

  constructor(public http: Http) {
  }


  get(endpoint: string, params?: any, options?: RequestOptions) {

    return this.http.get(this.url + '/' + endpoint, options);
  }

  getList(endpoint: string, options?: RequestOptions) {
    return this.http.get(this.url + '/' + endpoint, options);
  }

  getAccessLevel(endpoint: string, options?: RequestOptions) {
    return this.http.get(this.url + '/' + endpoint, options);
  }

  post(endpoint: string, body: any, options?: RequestOptions) {
    return this.http.post(this.url + '/' + endpoint, body, options);
  }


  put(endpoint: string, body: any, options?: RequestOptions) {
    return this.http.put(this.url + '/' + endpoint, body, options);
  }

  delete(endpoint: string, body: any, options?: RequestOptions) {
    return this.http.post(this.url + '/' + endpoint, body, options);
  }

  patch(endpoint: string, body: any, options?: RequestOptions) {
    return this.http.put(this.url + '/' + endpoint, body, options);
  }
}
