//
//  LabelText.swift
//  eDoctorIOS
//
//  Created by MeoMeo on 09/03/2022.
//

import UIKit

enum Font: String {
    case systemBold = "System-Bold"
    case systemMedium = "CustomFont-Medium"
    case systemRegular = "CustomFont-Regular"

    enum Size {
        case title, subTitle, large, normal, small

        var value: CGFloat {
            switch self {
            case .title:
                return 24
            case .subTitle:
                return 20
            case .large:
                return 16
            case .normal:
                return 14
            case .small:
                return 12
            }
        }
    }
}

struct FontManager {
    func createFont(size: Font.Size, font: Font) -> UIFont {
        let fontSize = size.value
        let fontName = font
        if let uifont = UIFont(name: fontName.rawValue, size: fontSize) {
            return uifont
        }
        return UIFont.systemFont(ofSize: size.value)
    }
}

// MARK: - Title Regular

class cTitleLabel: UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)

        self.initialize()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        self.initialize()
    }

    init() {
        super.init(frame: .zero)

        self.initialize()
    }

    func initialize() {
        let font = FontManager().createFont(size: Font.Size.title, font: Font.systemBold)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.font = font
    }
}

// MARK: - SubTitle Regular

class cSubTitleLabel: UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)

        self.initialize()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        self.initialize()
    }

    init() {
        super.init(frame: .zero)

        self.initialize()
    }

    func initialize() {
        let font = FontManager().createFont(size: Font.Size.subTitle, font: Font.systemMedium)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.font = font
    }
}

// MARK: - Large Regular

class cLargeLabel: UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)

        self.initialize()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        self.initialize()
    }

    init() {
        super.init(frame: .zero)

        self.initialize()
    }

    func initialize() {
        let font = FontManager().createFont(size: Font.Size.large, font: Font.systemRegular)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.font = font
    }
}

// MARK: - Normal Regular

class cNormalLabel: UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)

        self.initialize()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        self.initialize()
    }

    init() {
        super.init(frame: .zero)

        self.initialize()
    }

    func initialize() {
        let font = FontManager().createFont(size: Font.Size.normal, font: Font.systemRegular)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.font = font
    }
}

// MARK: - Small Regular

class cSmallLabel: UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)

        self.initialize()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        self.initialize()
    }

    init() {
        super.init(frame: .zero)

        self.initialize()
    }

    func initialize() {
        let font = FontManager().createFont(size: Font.Size.small, font: Font.systemRegular)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.font = font
    }
}
