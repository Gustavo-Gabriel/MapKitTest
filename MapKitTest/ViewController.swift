import UIKit
import MapKit

final class ViewController: UIViewController {

    private let contentView: MainView = MainView()

    override func viewDidLoad() {
        super.viewDidLoad()
        contentView.delegate = self
    }

    override func loadView() {
        view = contentView
    }
}

extension ViewController: MainViewDelegate {
    func showInfo(capital: Capital) {
        if let url = URL(string: capital.link) {
            UIApplication.shared.open(url)
        }
    }
}
