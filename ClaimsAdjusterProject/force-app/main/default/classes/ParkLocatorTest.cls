@isTest
private class ParkLocatorTest {

    @isTest
    static void testCountry() {

        Test.setMock(
            WebServiceMock.class,
            new ParkServiceMock()
        );

        String[] result = ParkLocator.country('India');

        System.assertNotEquals(null, result);
    }

    private class ParkServiceMock implements WebServiceMock {

        public void doInvoke(
            Object stub,
            Object request,
            Map<String, Object> response,
            String endpoint,
            String soapAction,
            String requestName,
            String responseNS,
            String responseName,
            String responseType
        ) {
            ParkService.byCountryResponse response_x =
                new ParkService.byCountryResponse();

            response_x.return_x = new String[] {
                'Test Park 1',
                'Test Park 2'
            };

            response.put('response_x', response_x);
        }
    }
}