import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class UsersService {

  private baseUrl = 'http://localhost:8181/api/users';

  constructor(private http: HttpClient) { }

  getUserById(userId: number): Observable<any> {
    return this.http.get(`${this.baseUrl}/${userId}`);
  }

  getUserByEmail(userEmail: string): Observable<any> {
    return this.http.get(`${this.baseUrl}/email/${userEmail}`);
  }

  createUsers(user: object): Observable<object> {
    return this.http.post(`${this.baseUrl}`, user);
  }

  updateUsers(userId: number, value: any): Observable<object> {
    return this.http.put(`${this.baseUrl}/${userId}`, value);
  }

  deleteUsers(userId: number): Observable<any> {
    return this.http.delete(`${this.baseUrl}/${userId}`, { responseType: 'text' });
  }

  getUsersList(): Observable<any> {
    return this.http.get(`${this.baseUrl}`);
  }

}
