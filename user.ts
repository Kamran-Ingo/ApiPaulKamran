
export default class User {
    // champs
    protected iduser ? : number | null;
    public nom: string | null;
    public prenom: string | null;
    public email: string | null;
    private password: string | null;

    protected table: string = 'user';

    /**
     * Créée une instance de User
     * @param {(User(instance) | null)} id
     * @param {string} [user='']
     * @param {string} [nom='']
     * @param {string} [prenom='']
     * @param {string} [email='']
     * @param {string} [password='']
     * @param {number} [idPays=1]
     * @memberof User
     */

    //constructeur
    constructor(user: User | null, nom: string = '', prenom: string = '', email: string = '' password: string = '')
    {
        if (user == null) {
            this.nom = nom;
            this.prenom = prenom;
            this.email = email;
            this.password = password;
        } else {
            this.nom = user.nom;
            this.prenom = user.prenom;
            this.email = user.email;
            this.password = user.password;

        }
    }

    /****GETTER****/

    get id(): number {
        return <number > this.iduser;
    }

    get fullname(): string {
        return this.prenom + ' ' + this.nom;
    }

    get mail(): string {
        return (this.email === null) ? '' : this.email;
    }

    get code(): string {
        return (this.password === null) ? '' : this.password;;
    }

    /**
     * 
     * Returb the attribute for the register property in the MySQL class
     * @readonly
     * @type {array < string >}
     * @memberof User
     
    get attributInsert(): Array < string >
    {
        return ['nom', 'prenom', 'email', 'password']
    }*/

}
