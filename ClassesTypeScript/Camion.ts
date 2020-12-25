import { Boisseau } from './Boisseau';

class Camion {
    
    private plaque: string;
	private plein: boolean;
	private typeCereale: string;
	private quantite: number;
	private destination: string;
	private action: boolean;
	private boisseau : Boisseau;
	
	constructor(plaque, plein, typeCereale, quantite, destination, action){ //Pas de boisseau puisqu'il peut ne pas en avoir
		this.plaque = plaque;
		this.plein = plein;
		this.typeCereale = typeCereale;
		this.quantite = quantite;
		this.destination = destination;
		this.action = action;
	}
 }