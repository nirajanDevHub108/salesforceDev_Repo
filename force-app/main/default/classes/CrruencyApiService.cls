public with sharing class CrruencyApiService {
    public static void getExchangeRates() {
        //prepare the request
        // this is for callout only

        HttpRequest req = new HttpRequest();
        /* step.1 send the end point*/
        req.setEndpoint('https://open.er-api.com/v6/latest/USD');
        /* step1.2 set the header */
        req.setHeader('Content-Type', 'application/json');
        req.setHeader('Accept', 'application/json');
        /* step1.2 set the header */
        req.setMethod('GET');//GET,PUT,POST
        
        /* step-2 send the request */
        Http http = new Http();
        try{
             HttpResponse res = http.send(req);  
        /* step-4 process the response */
        /* getStatus()
           getStatusCode()
           getBody()
           getHeader()
           getXmlStreamReader()
           getBodyAsBlob()
        */
        String responseBody = res.getBody();
        Integer statusCode = res.getStatusCode();
        String status = res.getStatus();
        System.debug('result of currency api :'+ status);
        System.debug('result of currency api :'+ responseBody);
        System.debug('result of currency api :'+ statusCode);
            
        }catch(System.CallOutException calloutExp){
            System.debug('System.CalloutException .... '+
calloutExp.getStackTraceString());

            if(String.valueOf(calloutExp).startsWith('System.CalloutException:Unauthorised endpoint')){{
                // Remote Site missing Error -
                System.debug(' CalloutException ');
                
                
            }
            
        }
    }catch(System.Exception ex){
            System.debug('Exception Executed ... '+ ex.getStackTraceString());
            if(String.valueOf(ex).startsWith('System.CalloutException: Unauthorised endpoint')){
                System.debug('Executed');
            
        }
             

    }
}
}
