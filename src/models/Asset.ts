export default class Asset {
    private nom: string;
    protected lien: string;

    constructor(nom: string, link:string){
        this.nom = nom;
        this.lien = link;
    }

    get link(): string {
        return this.lien;
    }
    get name(): string {
        return this.nom;
    }
};