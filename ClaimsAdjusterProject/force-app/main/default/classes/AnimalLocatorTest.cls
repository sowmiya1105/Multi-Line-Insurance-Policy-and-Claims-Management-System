@isTest
private class AnimalLocatorTest {

    @isTest
    static void AnimalLocatorMock10() {

        Test.setMock(
            HttpCalloutMock.class,
            new AnimalLocatorMock()
        );

        String result = AnimalLocator.getAnimalNameById(3);

        String expectedResult = 'chicken';

        System.assertEquals(result, expectedResult);
    }
}