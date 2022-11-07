const username: string = "0xpayload";


const addition = (a: number, b: number): number => {
    return a + b;
}

addition(15, 15);

class Person {
    private age: number
    private lName: string
    constructor(age: number, lname: string){
        this.age = age;
        this.lName = lname;
    }
}

const Arthur = new Person(30, "Negreiros");

console.log(Arthur)