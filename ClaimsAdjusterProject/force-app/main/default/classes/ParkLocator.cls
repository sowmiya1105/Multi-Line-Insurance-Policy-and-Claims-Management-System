public class ParkLocator {

    public static String[] country(String country) {

        ParkService.ParksImplPort service =
            new ParkService.ParksImplPort();

        String[] result = service.byCountry(country);

        return result;
    }
}