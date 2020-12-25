import { LotCereales } from './LotCereales';
import { Sonde } from './Sonde';

class Cellule extends Conteneur {
    private idCellule: number;
    private nbSonde: number;
    private temperature: number;
    private numLot: LotCereal;
	private lotCereale: LotCereales;
	private sondes: Array<Sonde>;
	
	constructor(idCellule, nbSonde, temperature, numLot, lotCereale, sondes){
		super();
		this.idCellule = idCellule;
		this.nbSonde = nbSonde;
		this.temperature = temperature;
		this.numLot = numLot;
		this.lotCereale = lotCereale;
		this.sondes = sondes;
	}
	
	function ForteTemp(){
		
	}
}   
