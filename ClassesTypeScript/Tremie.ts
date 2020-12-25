import { LotCereales } from './LotCereales';

class Tremie
{
  private plein: boolean;
  private typeCereale: string;
  private quantite: number;
  private lotCereale: LotCereales;
  
  constructor(plein, typeCereale, quantite, lotCereale){
	this.plein = plein;
	this.typeCereale = typeCereale;
	this.quantite = quantite;
	this.lotCereale = lotCereale;
  }
}