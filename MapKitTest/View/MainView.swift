import UIKit
import MapKit
import SnapKit

protocol MainViewDelegate: AnyObject {
    func showInfo(capital: Capital)
}

final class MainView: UIView {
    weak var delegate: MainViewDelegate?

    private let mapView: MKMapView = {
        let map = MKMapView()
        map.addAnnotations(CapitalFactory().createCapitals())
        return map
    }()

    private let segmentedControl: UISegmentedControl = {
        let segmented = UISegmentedControl(items: ["Normal", "Híbrido", "Satélite"])
        segmented.selectedSegmentIndex = 0
        segmented.backgroundColor = .darkGray
        return segmented
    }()

    override init(frame: CGRect) {
        super.init(frame: .zero)
        mapView.delegate = self
        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup() {
        buildViewHierarchy()
        addConstraints()
        addActions()
    }

    private func buildViewHierarchy() {
        addSubview(mapView)
        mapView.addSubview(segmentedControl)
    }

    private func addConstraints() {
        mapView.snp.makeConstraints {
            $0.edges.equalTo(self)
        }

        segmentedControl.snp.makeConstraints {
            $0.top.equalTo(mapView).offset(20)
            $0.centerX.equalTo(mapView)
        }
    }

    private func addActions() {
        segmentedControl.addTarget(self, action: #selector(segmentAction(_:)), for: .valueChanged)
    }

    @objc
    private func segmentAction(_ segmentedControl: UISegmentedControl) {
            switch (segmentedControl.selectedSegmentIndex) {
            case 0:
                mapView.mapType = .standard
            case 1:
                mapView.mapType = .hybrid
            case 2:
                mapView.mapType = .satellite
            default:
                break
            }
        }
}

extension MainView: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard annotation is Capital else { return nil }

        let identifier = "Capital"
        let annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)

        if let annotationView = annotationView {
            annotationView.annotation = annotation
            return annotationView

        } else {
            let annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            annotationView.canShowCallout = true
            annotationView.pinTintColor = .blue

            let button = UIButton(type: .detailDisclosure)
            annotationView.rightCalloutAccessoryView = button

            return annotationView
        }
    }

    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        guard let capital = view.annotation as? Capital else { return }

        delegate?.showInfo(capital: capital)
    }
}
