/**
 * @description Service to get currency exchange rates using external API.
 */
public with sharing class CrruencyApiService {
    /**
     * @description Performs an HTTP GET to fetch the latest USD exchange rates.
     *              Handles response and exceptions with proper logging.
     */
    public static void getExchangeRates() {
        // Prepare the request for a callout to the currency API
        HttpRequest req = new HttpRequest();
        req.setEndpoint('https://open.er-api.com/v6/latest/USD');
        req.setHeader('Content-Type', 'application/json');
        req.setHeader('Accept', 'application/json');
        req.setMethod('GET');

        Http http = new Http();
        try {
            HttpResponse res = http.send(req);
            String responseBody = res.getBody();
            Integer statusCode = res.getStatusCode();
            String status = res.getStatus();

            System.debug(LoggingLevel.INFO, 'result of currency api :' + status);
            System.debug(LoggingLevel.INFO, 'result of currency api :' + responseBody);
            System.debug(LoggingLevel.INFO, 'result of currency api :' + statusCode);

        } catch (System.CallOutException calloutExp) {
            System.debug(LoggingLevel.ERROR, 'System.CalloutException .... ' + calloutExp.getStackTraceString());
            if (String.valueOf(calloutExp).startsWith('System.CalloutException:Unauthorised endpoint')) {
                // Remote Site missing Error -
                System.debug(LoggingLevel.ERROR, 'CalloutException: Unauthorised endpoint');
            }
        } catch (System.Exception ex) {
            System.debug(LoggingLevel.ERROR, 'Exception Executed ... ' + ex.getStackTraceString());
            if (String.valueOf(ex).startsWith('System.CalloutException: Unauthorised endpoint')) {
                System.debug(LoggingLevel.ERROR, 'Executed - Unauthorised endpoint');
            }
        }
    }
}
