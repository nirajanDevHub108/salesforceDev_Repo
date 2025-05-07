import { LightningElement } from 'lwc';
import { NavigationMixin } from 'lightning/navigation';

export default class NavigateToAccountHomePage extends NavigationMixin(LightningElement) {

    navigateToAccountHomePage(){
        this[NavigationMixin.Navigate]({
            type: 'standard__objectPage',
            attributes:{
                objectApiName: 'Account',
                actionName: 'home'
            }
        });
    }
    navigateToAccountRecordPage(){
        this[NavigationMixin.Navigate]({
            type: 'standard__recordPage',
            attributes:{
                recordId:'001gL000000wsUiQAI',
                objectApiName: 'Account',
                actionName: 'view'
            }
        });
    }
}
