from PIL import Image
from tensorflow.keras import backend as K
from tensorflow.python.keras.models import model_from_json
from tensorflow.keras.preprocessing.image import img_to_array
from tensorflow.keras.utils import CustomObjectScope
from tensorflow.python.keras.initializers import glorot_uniform




def prediction(x: str):
    """image path sent by the post method

    Args:
        x (str): _description_
    Return:
        a dictionary given the values with the prediction
    """
    K.reset_uids()

    model = "models/testing_difference.json"
    weights = "models/testing_difference.hdf5"

    with CustomObjectScope({'GlorotUniform': glorot_uniform()}):
        with open(model, 'r') as f:
            model = model_from_json(f.read())
            model.load_weights(weights)

    print(f"currently working in the image {x}")
    image = Image.open(x)
    image = image.resize((224, 224))

    value = img_to_array(image) / 255.0
    value = value.reshape(1, 224, 224, 3)

    result = model.predict(value)
    result = result[0].tolist()
    
    # return {
    #     "cat":f"{result[0]}",
    #     "dog":f"{result[1]}",
    #     "rice":f"{result[2]}"
    # }
    
    
    return {
        "message": "it's a rice" if result[2] >= 0.75 else "it isn't a rice leaf"
    }
    
