import { Operation } from './Operation';
import { Cellule } from './Cellule';
import { Boisseau } from './Boisseau';
import { Tremie } from './Tremie';

class lotCereales{
    private numLot: string;
    private type: string;
    private poids: number;
	private tauxHumidite: number;
    private qualite: number;
    private origine: string;
    private listeOperation: Array<Operation>;
    private cellule: Cellule;
	private boisseau : Boisseau;
	private tremie: Tremie;
	
	constructor(numLot, type, poids, tauxHumidite, qualite, origine, listeOperation, cellule, boisseau, tremie){
		this.numLot = numLot;
		this.type = type;
		this.poids = poids;
		this.tauxHumidite = tauxHumidite;
		this.qualite = qualite;
		this.origine = origine;
		this.listeOperation = listeOperation;
		this.cellule = cellule;
		this.boisseau = boisseau;
		this.tremie = tremie;
	}
	
	function Pesee(pds): void{
		
	}
	
	function Analyse(tauxH, quali): number{

	}

	function AjouteOperation(op): void{

	}	
	
	function toString(): string{
		
	}
 }


 

 