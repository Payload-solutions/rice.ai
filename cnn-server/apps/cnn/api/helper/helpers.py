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
    # print(f"result nitrogen {float(conv_value_nitrogen)} and loss: {float(conv_value_loss)}")
    # if result <= 0.5:
    #     return "No es una imagen de arroz, prueba con otra"

    # if result >= 89:
    #     return "No es una planta de arroz, prueba con otra"

    return f"{float(conv_value_nitrogen):.2f} % Nitrógeno" if float(
        conv_value_nitrogen) >= 79.00 else f"{float(abs(97 - float(conv_value_loss))):.2f} % Nitrógeno; incluir (NO3-N) en el cultivo"
