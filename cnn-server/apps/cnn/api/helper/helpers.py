from typing import Any


def values_formatter(value: Any) -> str:
    try:
        return "{0:.3f} %".format(value)

    except Exception as e:
        print("Error in the valuating prediction format ", str(e))
        return "0"


def prediction_difference(conv_value_nitrogen, conv_value_loss):
    return float("{0:.3f}".format(abs(float(conv_value_nitrogen) - float(conv_value_loss))))


def recommendation(conv_value_nitrogen, conv_value_loss):
    result = abs(float(conv_value_nitrogen) - float(conv_value_loss))
    # if float(conv_value_nitrogen) <= 60 and float(conv_value_loss) <= 60:
    if result <= 2.0:
        return "La imagen dada no corresponde a una imagen de planta de arroz, es probable que no haya coincidencia " \
               "de pixeles o que los angulos no permitan la detección de la misma, prueba otra imagen"

    return f"La planta se presenta un rango de concentración de nitrtógeno de  {float(conv_value_nitrogen):.2f} %" if float(
        conv_value_nitrogen) >= 85.00 else f"Coloración amarilla con una deficiencia de {float(abs(97 - float(conv_value_loss))):.2f}; considerar incluir mayor cantidad de (NO3-N) en el cultivo"
