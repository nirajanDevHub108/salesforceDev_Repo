/**
 * @description This class demonstrates best practices for Apex development.
 */
public class BadPracticeExample {
  // ✅ Use protected or private fields and avoid hardcoded credentials
  private static final String API_KEY = System.Label.API_KEY; // Assume using a custom label

  // ✅ Remove unused variables or use them meaningfully
  private Integer counter = 0;

  /**
   * @description Processes data with proper logging and structure.
   */
  public void processData() {
    for (Integer i = 0; i < 10; i++) {
      counter += i;
    }
    logInfo('Processed ' + counter + ' items.');
  }

  /**
   * @description Handles risky operations with proper error handling.
   */
  public void riskyOperation() {
    try {
      Integer result = 10 / 0;
    } catch (Exception e) {
      logError('Error occurred: ' + e.getMessage());
    }
  }

  /**
   * @description Logs informational messages.
   * @param message The message to log.
   */
  private void logInfo(String message) {
    // Replace with a proper logging framework if available
    System.debug(LoggingLevel.INFO, message);
  }

  /**
   * @description Logs error messages.
   * @param message The error message to log.
   */
  private void logError(String message) {
    System.debug(LoggingLevel.ERROR, message);
  }

  // ✅ Use private fields and proper naming conventions
  private String internalData;

  /**
   * @description Performs a defined task.
   */
  public void doStuff() {
    logInfo('Doing stuff...');
  }
}
