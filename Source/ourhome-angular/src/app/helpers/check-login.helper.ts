import { Injectable } from '@angular/core';
import { Router, CanActivate } from '@angular/router';
import { TokenStorageService } from '../service/authentication/token-storage.service';

@Injectable()
export class CheckLoginHelper implements CanActivate {

  constructor(private router: Router, private tokenStorageService: TokenStorageService) {}

  canActivate() {
    const user = this.tokenStorageService.getUser();

    if (user == null){
      this.router.navigate(['login']);
      return false;
    }

    return true;
  }

}
