import User from './User';
import Group from './Group';

export default class Member {
    protected utilisateur: number;
    protected groupe: number;

    constructor(idUser: number, idGroup: number) {
        this.utilisateur = idUser;
        this.groupe = idGroup;
    }

    get user(): number {
        return this.utilisateur;
    }

    get group(): number {
        return this.groupe;
    }
};