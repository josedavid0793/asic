import { TestBed } from '@angular/core/testing';

import { GerentesService } from './gerentes.service';

describe('GerentesService', () => {
  let service: GerentesService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(GerentesService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
