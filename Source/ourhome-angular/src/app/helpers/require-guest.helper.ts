import { Injectable } from '@angular/core';
import { Router, CanActivate } from '@angular/router';
import { TokenStorageService } from '../service/authentication/token-storage.service';

@Injectable()
export class RequireGuestHelper implements CanActivate {

  constructor(private router: Router, private tokenStorageService: TokenStorageService) {}

  canActivate(): boolean {
    const user = this.tokenStorageService.getUser();

    if (user != null){
      this.router.navigate(['home']);
      return false;
    }

    return true;
  }

}
