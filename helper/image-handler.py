#!/usr/bin/env python

import os
from pprint import pprint
from PIL import Image
IMAGE_DIR = "RiceImages"


"""
see the properties for the images
"""
def get_data_from_image() -> None:
    list_images = [x for x in os.listdir(IMAGE_DIR)]
    
    for x in list_images:
        img = Image.open(os.path.join(IMAGE_DIR, x))
        data = img.load()
        a, b = img.size
        all_pixels = list()
        for c in range(a):
            for d in range(b):
                cpixels = data[c,d]
                all_pixels.append(cpixels)
                
        print(data)
        print(all_pixels)
        break


def resizing_images() -> None:
    """_summary_
    """
    return



