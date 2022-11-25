import { TestBed } from '@angular/core/testing';

import { ImageConvolutionService } from './image-convolution.service';

describe('ImageConvolutionService', () => {
  let service: ImageConvolutionService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(ImageConvolutionService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
