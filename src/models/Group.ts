export default class Group {
    private idGroup : number;
    private nom : string;
    // private asset: Asset;



    constructor(idGroup: number, name: string, idCreateur: number  ){
        this.idGroup = idGroup;
        this.nom = name;
    }

    get id(): number {
        return this.idGroup;
    }

    get name(): string {
        return this.nom;
    };

};