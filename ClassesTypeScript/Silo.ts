import { Cellule } from './Cellule';

class Silo {
    private idSilo: number;
    private nbCellules: number;
    private cellules: Array<Cellule>;
	
	constructor(idSilo, nbCellules, cellules){
		this.idSilo = idSilo;
		this.nbCellules = nbCellules;
		this.cellules = cellules;
	}
}
