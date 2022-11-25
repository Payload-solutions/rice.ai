"""Handling images from the new images store in the current server to 
the path to be trained again"""


def validate_image(request, field, update=False):
    try:
        request = request.copy()
        if update:
            if type(request[field]) == str: request.__delitem__(field)
        else:
            if type(request[field]) == str: request.__setitem__(field)
        
        return request
    except Exception as e:
        print(str(e))


