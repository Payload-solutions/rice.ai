import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ConvolutionComponent } from './convolution.component';

describe('ConvolutionComponent', () => {
  let component: ConvolutionComponent;
  let fixture: ComponentFixture<ConvolutionComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ConvolutionComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(ConvolutionComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
