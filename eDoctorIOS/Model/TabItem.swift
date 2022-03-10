import UIKit

enum TabItem: String, CaseIterable {
    case home
    case profile

    var viewController: UIViewController {
        switch self {
        case .home:
            return HomeTabVC()
        case .profile:
            return ProfileTabVC()
        }
    }

    var icon: UIImage {
        switch self {
        case .home:
            return UIImage(named: "icon-home-active")!
        case .profile:
            return UIImage(named: "icon-profile-active")!
        }
    }

    var displayTitle: String {
        return self.rawValue.capitalized(with: nil)
    }
}
