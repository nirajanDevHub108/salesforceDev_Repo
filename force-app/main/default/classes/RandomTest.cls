@isTest
private class RandomTest {
    @isTest
    static void testRandomGeneration() {
        // Test that our random number generation produces correct range
        Integer sides = 6;
        List<Integer> results = new List<Integer>();
        
        // Generate a bunch of random numbers to verify they're in the right range
        for (Integer i = 0; i < 100; i++) {
            Integer roll = (Integer)Math.floor(Math.random() * sides) + 1;
            results.add(roll);
            // Verify each roll is between 1 and sides (inclusive)
            System.assert(roll >= 1 && roll <= sides, 'Roll ' + roll + ' is not in range 1-' + sides);
        }
        
        // Verify we got some variety
        Set<Integer> uniqueRolls = new Set<Integer>(results);
        System.assert(uniqueRolls.size() > 1, 'Should have multiple different roll values');
    }
}
