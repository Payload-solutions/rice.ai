

def recomendation(conv_value):
    if float(conv_value) <= 10:
        return "the image provided it's not a leaf image, please consider to send a valid image"
    return "Leaf healthy" if float(conv_value) >= 85.00 else "Loss nitrogen"