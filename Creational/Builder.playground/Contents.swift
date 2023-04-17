import UIKit

protocol ThemeProtocol {
    var backGroundColor: UIColor { get }
    var textColor: UIColor { get }
}

class Theme: ThemeProtocol {
    var backGroundColor: UIColor
    
    var textColor: UIColor
    
    init(backGroundColor: UIColor, textColor: UIColor) {
        self.backGroundColor = backGroundColor
        self.textColor = textColor
    }
    
}

protocol ThemeBuilderProtocol {
    func setBackGround(color: UIColor)
    func setText(color: UIColor)
    func createTheme() -> ThemeProtocol?
}

class ThemeBuilder: ThemeBuilderProtocol {
    private var backGroundColor: UIColor?
    private var textColor: UIColor?
    
    
    func setBackGround(color: UIColor) {
        self.backGroundColor = color
    }
    
    func setText(color: UIColor) {
        self.textColor = color
    }
    
    func createTheme() -> ThemeProtocol? {
        guard let backGroundColor = backGroundColor, let textColor = textColor else { return nil }
        return Theme(backGroundColor: backGroundColor, textColor: textColor)
    }
}

let builder = ThemeBuilder()
builder.setBackGround(color: .black)
builder.setText(color: .white)

let theme = builder.createTheme()


