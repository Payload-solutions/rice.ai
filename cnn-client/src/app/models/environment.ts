

//const URL = "http://127.0.0.1"
//const URL = "http://0.0.0.0:8000"
const URL = "http://159.223.205.198";


export const SignupEnvironment = {
    apiUrl: URL+":8000/user/user/"
}

export const ConvEnvironment = {
    apiUrl: URL+":8000/cnn/play_cnn"
}

export const LoginEnvironment = {
    apiUrl: URL+":8000"
}


export const MainEnvironment = {
    apiUrl: URL+":8000/cnn/main/"
}


export const ListImagesEnvironment = {
    apiUrl: URL+":8000/images_class/images"
}


export const TrainRecords = {
    apiUrl: URL+":8000/cnn/cnn/"
}


export const IotRecords = {
    //apiUrl: "http://159.223.205.198:3000/iot-values"
    apiUrl: URL+":3000/iot-values"
}

export const RealRecords = {
    apiUrl: URL+":3000/last-environ"
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


