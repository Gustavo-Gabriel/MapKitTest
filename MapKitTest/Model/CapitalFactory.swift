import MapKit

final class CapitalFactory {
    func createCapitals() -> [Capital] {
        let capitals = [
            Capital(title: "London",
                    coordinate: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275),
                    info: "Home to the 2012 Summer Olympics.",
                    link: "https://en.wikipedia.org/wiki/London"),
            Capital(title: "Oslo",
                    coordinate: CLLocationCoordinate2D(latitude: 59.95, longitude: 10.75),
                    info: "Founded over a thousand years ago.",
                    link: "https://pt.wikipedia.org/wiki/Oslo"),
            Capital(title: "Paris",
                    coordinate: CLLocationCoordinate2D(latitude: 48.8567, longitude: 2.3508),
                    info: "Often called the City of Light.",
                    link: "https://pt.wikipedia.org/wiki/Paris"),
            Capital(title: "Rome",
                    coordinate: CLLocationCoordinate2D(latitude: 41.9, longitude: 12.5),
                    info: "Has a whole country inside it.",
                    link: "https://pt.wikipedia.org/wiki/Roma"),
            Capital(title: "Washington DC",
                    coordinate: CLLocationCoordinate2D(latitude: 38.895111, longitude: -77.036667),
                    info: "Named after George himself.",
                    link: "https://pt.wikipedia.org/wiki/Washington,_D.C.")
        ]

        return capitals
    }
}
