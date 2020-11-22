import {Pod} from "./pod";
import {Service} from "./service";
import {BaseModel} from './traits/baseModel';

export class Deployment extends BaseModel{
    pods: Array<Pod>;
    services: Array<Service>;

    constructor(data: any){
        super(data);
        this.pods = [];
        this.services = [];
    }
}
