from typing import Any


def values_formatter(value: Any):
    try:
        return "{0:.3f} %".format(value)
    except Exception as e:
        pass


def predicction_difference(conv_value_nitrogen, conv_value_loss):
    return float("{0:.3f}".format(abs(float(conv_value_nitrogen) - float(conv_value_loss))))




def recomendation(conv_value_nitrogen,  conv_value_loss):
    result = abs(float(conv_value_nitrogen) - float(conv_value_loss))
    #if float(conv_value_nitrogen) <= 60 and float(conv_value_loss) <= 60:
    if result <= 2.0:   
        return "La imagen dada no corresponde a una imagen de planta de arroz, es probable que no haya coincidencia de pixeles o que los angulos no permitan la detección de la misma, prueba otra imagen"
    
    return f"La planta se encuentra con una coloración aceptable con una presencia de nitrogeno de {float(conv_value_nitrogen):.2f}" if float(conv_value_nitrogen) >= 85.00 else f"Coloración amarilla con una presencia de nitrogeno de {float(conv_value_loss):.2f}; considerar incluir más nitrógeno en el cultivo"