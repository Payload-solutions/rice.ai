#!/usr/bin/env python


import os
import torch
from torch import nn
from torch.utils.data import Dataset
from torchvision import transforms
from pprint import pprint
from PIL import Image

IMAGES = "testing-images"




class RiceDataset(Dataset):
    def __init__(self, base_dir, split="train", transform=None) -> None:
        super(RiceDataset, self).__init__()
        path = os.path.join(base_dir, f"{split}_signs")
        files = os.listdir(path)
        
        self.finlenames = [os.path.join(base_dir, x) for x in files if x.endswith(".jpg")]
        self.targets = [int(f[0]) for f in files]
        self.transform = transform

    def __len__(self):
        return len(self.finlenames)

    def __getitem__(self, index):
        image = Image.open(self.finlenames[index])
        if self.transform:
            image = self.transform(image)
        return image, self.targets[index]

class Net(nn.Module):
    def __init__(self, num_channels: int) -> None:
        super(Net, self).__init__()
        
        self.num_channels = num_channels
        
        self.conv1 = nn.Conv2d(3, self.num_channels, kernel_size=3, stride=1, padding=1)
        self.conv2 = nn.Conv2d(self.num_channels, self.num_channels*2, kernel_size=3, stride=1, padding=1)
        self.conv3 = nn.Conv2d(self.num_channels*2, self.num_channels*4, kernel_size=3, stride=1, padding=1)

    def forward(self) -> torch.Tensor:
        return 




def main():
    list_values = os.listdir("train")
    for x in list_values:
        tensor = transforms.ToTensor()
        tensor = tensor(Image.open(os.path.join("train", x)))
        print(tensor.shape)
        
        


if __name__ == "__main__":
    main()