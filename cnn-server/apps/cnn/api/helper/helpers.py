

def recomendation(conv_value_nitrogen,  conv_value_loss):
    if float(conv_value_nitrogen) <= 60 and float(conv_value_loss) <= 60:
        return "La imagen dada no corresponde a una imagen de planta de arroz, es probable que no haya coincidencia de pixeles o que los angulos no permitan la detección de la misma, prueba otra imagen"
    return "La planta se encuentra con una coloración aceptable para su etapa" if float(conv_value_nitrogen) >= 85.00 else "Coloración amarilla; considerar incluir más nitrógeno en el cultivo"