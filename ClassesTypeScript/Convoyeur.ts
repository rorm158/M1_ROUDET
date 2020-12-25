import { Capteur } from './Capteur';
import { Boisseau } from './Boisseau';

class Convoyeur {
    
    private idConvoyeur: number;
	private vitesse: number;
	private marche: boolean; //true = en marche, false = à l'arrêt
	private action: boolean;
	private capteur : Capteur;
	private boisseau : Boisseau;
	
	constructor(idConvoyeur, vitesse, marche, action, capteur, boisseau){
		this.idConvoyeur = idConvoyeur;
		this.vitesse = vitesse;
		this.marche = marche;
		this.action = action;
		this.capteur = capteur;
		this.boisseau = boisseau;
	}
	
	function BloqueConvoyeur(){
		
	}
 }