/**
 * @description Controller for handling Agentforce homepage banner URLs.
 */
public with sharing class AgentforceHomepageController {
  /**
   * @description Returns the URL for the Agentforce homepage banner image by index.
   * @param index The index of the banner image.
   * @return The URL of the banner image, or null if not found.
   */
  @AuraEnabled(cacheable=true)
  public static String getAgentforceBannerUrl(Integer index) {
    String docName =
      'agentforceHomepageBanner' + ((index > 0) ? index + '' : '');
    return getBannerUrlFromName(docName);
  }

  /**
   * @description Helper method to get banner URL from the document name.
   * @param docName The name of the Document.
   * @return The constructed URL, or null if the document is not found or accessible.
   */
  private static String getBannerUrlFromName(String docName) {
    try {
      // CRUD check before querying Document
      if (Schema.sObjectType.Document.isAccessible()) {
        Document doc = [SELECT Id FROM Document WHERE Name = :docName LIMIT 1];
        System.debug(
          LoggingLevel.INFO,
          'file URL: ' +
            '/servlet/servlet.ImageServer?id=' +
            doc.Id +
            '&oid=' +
            UserInfo.getOrganizationId()
        );
        return '/servlet/servlet.ImageServer?id=' +
          doc.Id +
          '&oid=' +
          UserInfo.getOrganizationId();
      } else {
        System.debug(LoggingLevel.WARN, 'No access to Document object.');
        return null;
      }
    } catch (Exception e) {
      // Handle exceptions and return null if the file is not found
      System.debug(
        LoggingLevel.ERROR,
        'Error retrieving file ID: ' + e.getMessage()
      );
      return null;
    }
  }
}
