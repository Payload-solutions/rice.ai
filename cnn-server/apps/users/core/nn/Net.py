"""Neural network model creation"""

import tensorflow as tf
from tensorflow.keras import (
    regularizers,
    models,
    optimizers
)
from tensorflow.keras.layers import (
    Dense,
    Conv2D,
    Flatten,
    MaxPooling2D,
    Dropout,
    Activation,
    BatchNormalization
)
from tensorflow.keras.models import Sequential
from tensorflow.keras.callbacks import ModelCheckpoint
from tensorflow.keras.preprocessing.image import ImageDataGenerator

from typing import Any

import os
import sys


def create_and_load_convolution_model() -> Any:
    # image folders
    MAIN_PATH = "image_set"
    TRAIN_PATH = f"{MAIN_PATH}/train"
    TEST_PATH = f"{MAIN_PATH}/test"

    train_gen = ImageDataGenerator(
        rescale=1./255,
        rotation_range=40,
        width_shift_range=0.2,
        height_shift_range=0.2,
        shear_range=0.2,
        horizontal_flip=True
    )

    test_gen = ImageDataGenerator(
        rescale = 1./255
    )

    train_generator = train_gen.flow_from_directory(
        TRAIN_PATH,
        target_size=(64, 64),
        batch_size=32,
        class_mode="categorical"
    )
    test_generator = test_gen.flow_from_directory(
        TEST_PATH,
        target_size=(64, 64),
        batch_size=32,
        class_mode="categorical"
    )


    model = Sequential()

    # first model convolution
    model.add(Conv2D(32, kernel_size=(2,2), padding="same",  kernel_regularizer=regularizers.l2(1e-4), input_shape=(64,64,3)))
    model.add(Activation('relu'))

    # second model convolution
    model.add(Conv2D(32, kernel_size=(2,2), padding="same", kernel_regularizer=regularizers.l2(1e-4)))
    model.add(Activation('relu'))
    model.add(BatchNormalization())
    model.add(MaxPooling2D(pool_size=(2, 2)))
    model.add(Dropout(0.2))

    # third convolution, more deep
    model.add(Conv2D(
        64,
        kernel_size=(2, 2),
        padding="same",
        kernel_regularizer=regularizers.l2(1e-4)
    ))
    model.add(Activation("relu"))
    model.add(BatchNormalization())
    model.add(Dropout(0.2))

    # fourth convolution
    model.add(Conv2D(
        64,
        kernel_size=(2, 2),
        padding="same",
        kernel_regularizer=regularizers.l2(1e-4)
    ))
    model.add(Activation("relu"))
    model.add(BatchNormalization())
    model.add(MaxPooling2D(pool_size=(2, 2)))
    model.add(Dropout(0.3))

    # fifth convolution
    model.add(Conv2D(
        64,
        kernel_size=(2, 2),
        padding="same",
        kernel_regularizer=regularizers.l2(1e-4)
    ))
    model.add(Activation("relu"))
    model.add(BatchNormalization())

    # sixth convolution
    model.add(Conv2D(
        64,
        kernel_size=(2, 2),
        padding="same",
        kernel_regularizer=regularizers.l2(1e-4)
    ))
    model.add(Activation("relu"))
    model.add(BatchNormalization())
    model.add(MaxPooling2D(pool_size=(2, 2)))
    model.add(Dropout(0.4))

    # classification flatten
    model.add(Flatten())
    model.add(Dense(2, activation="softmax"))

    # compiling

    model.compile(loss="categorical_crossentropy",
                optimizer=optimizers.Adam(),
                metrics=["accuracy"])


    model.load_weights()
    return model

def init_training():
    return os.listdir()