import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { VistaHostComponent } from './vista-host.component';

describe('VistaHostComponent', () => {
  let component: VistaHostComponent;
  let fixture: ComponentFixture<VistaHostComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ VistaHostComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(VistaHostComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
