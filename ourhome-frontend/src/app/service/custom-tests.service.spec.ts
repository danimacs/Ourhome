import { TestBed } from '@angular/core/testing';

import { CustomTestsService } from './custom-tests.service';

describe('custom-testsService', () => {
  let service: CustomTestsService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(CustomTestsService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
