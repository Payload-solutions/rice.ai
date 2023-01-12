

//const URL = "http://127.0.0.1:8000"
//const URL = "http://0.0.0.0:8000"
const URL = "http://159.223.205.198:8000";


export const SignupEnvironment = {
    apiUrl: URL+"http://127.0.0.1:8000/user/user/"
}

export const ConvEnvironment = {
    apiUrl: URL+"/cnn/play_cnn"
}

export const LoginEnvironment = {
    apiUrl: URL+""
}


export const MainEnvironment = {
    apiUrl: URL+"/cnn/main/"
}


export const ListImagesEnvironment = {
    apiUrl: URL+"/images_class/images"
}


export const TrainRecords = {
    apiUrl: URL+"/cnn/cnn/"
}


export const IotRecors = {
    apiUrl: "http://159.223.205.198:3000/iot-values"
}


export interface IMain{
    images_stored: number,
    highest_value: string
}

export interface IList{
    img_name: string,
    img: string,
    category: string,
    tag_label: string
}


export interface ITraining{
    img_name: string,
    img: string,
    healthy: string,
    sick: string,
    recomendation: string
}


