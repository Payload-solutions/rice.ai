

//const URL = "http://127.0.0.1"
const URL = "http://165.22.1.10";


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

export const RealRecordsLastOne = {
    apiUrl: URL+":3000/last-one"
}


export const filterConv = {
    apiUrl: URL+":5000/train"
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


