

export interface IUser{
    id: number,
    username: string,
    password: string,
    lastName: string,
    email: string,
    imageUrl: string,
    isActive: boolean,
    isStaff: boolean,
    isSuperUser: boolean,
    userCreatedAt: string,
    userUpdatedAt: string
}


export interface IUserLogin{
    username: string,
    password: string
}