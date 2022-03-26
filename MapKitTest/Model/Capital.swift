import MapKit

final class Capital: NSObject, MKAnnotation {
    var title: String?
    var coordinate: CLLocationCoordinate2D
    var info: String
    var link: String

    init(title: String, coordinate: CLLocationCoordinate2D, info: String, link: String) {
        self.title = title
        self.coordinate = coordinate
        self.info = info
        self.link = link
    }
}
