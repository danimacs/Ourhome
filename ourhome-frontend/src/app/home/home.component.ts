import {Component, OnInit} from '@angular/core';
import {ActivatedRoute, Router} from '@angular/router';
import {HomesService} from '../service/homes.service';
import {WishesService} from '../service/wishes.service';
import {TokenStorageService} from '../service/token-storage.service';
import {CheckCompatibilityHelper} from '../helpers/check-compatibility.helper';

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.css'],
})
export class HomeComponent implements OnInit {

  user;
  homes;

  constructor(
    private router: Router,
    private route: ActivatedRoute,
    private wishesService: WishesService,
    private homesService: HomesService,
    private tokenStorageService: TokenStorageService,
    private checkCompatibilityHelper: CheckCompatibilityHelper
  ) {
  }

  ngOnInit(): void {
    this.user = this.tokenStorageService.getUser();

    this.homesService.getActiveHomes().subscribe(resp => {
      this.homes = resp;
    });
  }

  getFilteredHomes(event): void {
    this.homes = event;
  }

  addWish(home: object): void {
    if (this.user.role === 'search') {
      const wish = {
        user: this.user,
        home
      };

      this.wishesService.saveWish(wish).subscribe();
    }
  }

  removeWish(homeId: number): void {
    if (this.user.role === 'search') {
      this.wishesService.deleteWish(this.user.id, homeId).subscribe();
    }
  }

  checkCompatibility(defaultTestResponses: string): boolean {
    return this.checkCompatibilityHelper.check(defaultTestResponses);
  }

}
