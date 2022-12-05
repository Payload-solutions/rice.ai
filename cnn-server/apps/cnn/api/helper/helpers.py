

def recomendation(conv_value_nitrogen,  conv_value_loss):
    if float(conv_value_nitrogen) <= 50 and float(conv_value_loss) <= 49:
        return "the image provided it's not a leaf image, please consider to send a valid image"
    return "Leaf healthy" if float(conv_value_nitrogen) >= 85.00 else "Loss nitrogen"