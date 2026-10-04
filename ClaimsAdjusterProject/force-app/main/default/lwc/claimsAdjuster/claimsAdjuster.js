import { LightningElement, wire } from 'lwc';
import getAssignedClaims from '@salesforce/apex/ClaimsAdjusterController.getAssignedClaims';

export default class ClaimsAdjuster extends LightningElement {
    claims = [];
    error;

    @wire(getAssignedClaims)
    wiredClaims({ data, error }) {
        if (data) {
            this.claims = data;
            this.error = undefined;
        } else if (error) {
            this.error = error;
            this.claims = [];
        }
    }

    get hasClaims() {
        return this.claims.length > 0;
    }
}