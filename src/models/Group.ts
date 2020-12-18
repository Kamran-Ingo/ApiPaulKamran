import User from './User';

export default class Group {
    private idGroup : number;
    private nom : string;
    private createur : User;
    // private asset: Asset;



    constructor(idGroup: number, name: string, creator: User  ){
        this.createur = creator;
        this.idGroup = idGroup;
        this.nom = name;
    }

    get id(): number {
        return this.idGroup;
    }

    get name(): string {
        return this.nom;
    };

    get creator(): User {
        return this.createur;
    };

};