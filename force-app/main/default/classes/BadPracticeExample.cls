public class BadPracticeExample {

    // ⚠️ Avoid hardcoded credentials
    private static final String API_KEY = '1234567890abcdef';

    // ⚠️ Avoid unused variables
    private Integer unusedCounter;

    // ⚠️ Avoid long methods
    public void processData() {
        System.debug('Starting process...');
        for (Integer i = 0; i < 100; i++) {
            System.debug('Processing item: ' + i);
        }
        System.debug('Finished processing.');
    }

    // ⚠️ Avoid empty catch blocks
    public void riskyOperation() {
        try {
            Integer result = 10 / 0;
        } catch (Exception e) {
            // silently ignore
        }
    }

    // ⚠️ Avoid using System.debug in production code
    public void logSomething() {
        System.debug('Logging something...');
    }

    // ⚠️ Avoid public fields
    public String publicData;

    // ⚠️ Avoid naming violations
    public void do_stuff() {
        System.debug('Doing stuff...');
    }
}
