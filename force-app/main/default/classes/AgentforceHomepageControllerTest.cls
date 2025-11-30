@isTest
public class AgentforceHomepageControllerTest {
  @isTest
  static void testController() {
    User u = new User(
      Username = 'standarduser@test.com',
      Alias = 'stduser',
      Email = 'standarduser@test.com',
      EmailEncodingKey = 'UTF-8',
      LastName = 'Testing',
      LanguageLocaleKey = 'en_US',
      LocaleSidKey = 'en_US',
      ProfileId = UserInfo.getProfileId(),
      TimeZoneSidKey = 'America/Los_Angeles'
    );
    insert u;

    System.runAs(u) {
      String bannerUrl = AgentforceHomepageController.getAgentforceBannerUrl(1);
      System.assertNotEquals(null, bannerUrl, 'Banner URL should not be null');
      // Optionally, add more assertions as needed
    }
  }
}
