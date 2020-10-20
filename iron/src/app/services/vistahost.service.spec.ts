import { TestBed } from '@angular/core/testing';

import { VistahostService } from './vistahost.service';

describe('VistahostService', () => {
  let service: VistahostService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(VistahostService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
