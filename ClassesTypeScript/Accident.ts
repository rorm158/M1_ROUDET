import { Capteur } from './Capteur';
import { Sonde } from './Sonde';

class Accident {
    
    private idAccident: number;
    private libelle: string;
    private source: string;
    private description: string;
	private date: Date;
	private capteurs: Array<Capteur>; //Plusieurs capteurs possibles pour un accident
	private sondes: Array<Sonde>; //Plusieurs sondes possibles pour un accident
	
	constructor(idAccident, libelle, source, description, date, capteurs, sondes){
		this.idAccident = idAccident;
		this.libelle = libelle;
		this.source = source;
		this.description = description;
		this.date = date;
		this.capteurs = capteurs;
		this.sondes = sondes;
	}
	
	function Enregistre(): void{
		
	}
 }