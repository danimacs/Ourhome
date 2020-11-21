import { Component } from '@angular/core';
import { Router } from '@angular/router';
import { UsersService } from '../service/users.service';
import { AuthService } from '../service/authentication/auth.service';
import { TokenStorageService } from '../service/authentication/token-storage.service';

@Component({
  selector: 'app-register',
  templateUrl: './register.component.html',
  styleUrls: ['./register.component.css']
})
export class RegisterComponent {

  constructor(
    private usersService: UsersService,
    private authService: AuthService,
    private tokenStorageService: TokenStorageService,
    private router: Router
  ) {}

  name: string;
  surnames: string;
  urlPhoto: string;
  description: string;
  age: number;
  email: string;
  phone: number;
  password: string;
  role: number;
  showPhone: number;
  acceptPolicy: boolean;

  register(): void {
    if (this.acceptPolicy === true) {
      const user = {
        name: this.name,
        surnames: this.surnames,
        urlPhotos: this.urlPhoto,
        description: this.description,
        age: this.age,
        email: this.email,
        password: this.password,
        role: (this.role === 1) ? 'have' : 'search',
        showPhone: this.showPhone,
      };

      this.authService.login({email: 'admin@ourhome.com', password: 'password'}).subscribe(resp => {
        this.tokenStorageService.saveToken(resp.headers.get('Authorization'));

        this.usersService.getUserByEmail(this.email).subscribe(resp1 => {
            if (resp1 == null) {
              this.tokenStorageService.saveUser(user);

              this.router.navigate(['initial-test']);
            } else {
              alert('El email ya se ha registrado');
            }
          }
        );
      });
    }else {
      // Put error
      console.log('Error...');
    }
  }
}
