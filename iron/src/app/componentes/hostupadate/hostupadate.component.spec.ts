import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { HostupadateComponent } from './hostupadate.component';

describe('HostupadateComponent', () => {
  let component: HostupadateComponent;
  let fixture: ComponentFixture<HostupadateComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ HostupadateComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(HostupadateComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
