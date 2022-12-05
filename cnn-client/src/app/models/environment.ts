

const URL = "http://127.0.0.1:8000"


export const SignupEnvironment = {
    apiUrl: URL+"/user/user/"
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


export interface IMain{
    images_stored: number,
    highest_value: string
}

