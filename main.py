import torch
import torch.nn as nn
import torch.nn.functional as F

"""
Deep learning uses artificial neural networks(models), which
are computing systems that are composed of many layers of 
interconnected units. By passing data through these interconnected
units, a neural network is able to learn how to approximate the 
computations required to transform inputs into outputs
"""


class Net(nn.Module):
    """
    Of course our network, will recognize images. We will use a process built
    into Pytorch called convolution. Convolution adds each element of an image
    to local neighbors, weighted by a kernel, or a small matrix, that helps us
    extract certain features (like edge detection, sharpness. blurriness)
    """

    def __init__(self):
        super(Net, self).__init__()

        """
        (conv1): Conv2d(1, 32, kernel_size=(3, 3), stride=(1, 1))
        (conv2): Conv2d(32, 64, kernel_size=(3, 3), stride=(1, 1))
        """

        # first 2D convolutional layers, taking in 1 input channel (image)
        # outputting 32 convolutional features, with a square kernel size of 3
        self.conv1 = nn.Conv2d(1, 32, 3, 1)
        # Second 2D convolutional layer, taking in the 32 input layers
        # outputting 64 convolutional features, with a square kernel size of 3
        self.conv2 = nn.Conv2d(32, 64, 3, 1)

        # Designed to ensure that adjacent pixels are either all 0s or all active
        # with an input probability
        self.dropout1 = nn.Dropout2d(0.25)
        self.dropout2 = nn.Dropout2d(0.5)

        # first fully connected layers
        self.fc1 = nn.Linear(9216, 128)

        # second fully connected layer that outputs our 10 labels
        self.fc2 = nn.Linear(128, 10)

        # We have finished defining our neural network, now we have to define
        # how our data will pass through it

    # x represents our data
    def forward(self, x):
        # Pass data through conv1
        x = self.conv1(x)
        # we use the rectified-linear activation function over x
        x = F.relu(x)

        # repeat the process with the convolution 2
        x = self.conv2(x)
        x = F.relu(x)

        # Run max pooling over x
        x = F.max_pool2d(x, 2)
        # pass data through dropout1
        x = self.dropout1(x)
        # flatten x with start_dim=1
        x = torch.flatten(x, 1)
        # pass data through fc1

        x = self.fc1(x)
        x = F.relu(x)
        x = self.dropout2(x)
        x = self.fc2(x)
        # After that applying softmax
        output = F.log_softmax(x, dim=1)
        return output


def main():
    try:
        my_nn = Net()
        print(my_nn)
    except Exception as e:
        print(str(e))


if __name__ == "__main__":
    main()
