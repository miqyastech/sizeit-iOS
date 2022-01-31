//
//  Constant.swift
//  sizeit
//
//  Created by Jaydeep on 29/10/18.
//

import Foundation
import UIKit
import SwiftyJSON

//MARK: - Variables
let bundleName = Bundle(identifier: "org.cocoapods.sizeit")
let userDefault = UserDefaults.standard
let mainStoryboard = UIStoryboard(name: "Sizeit", bundle: bundleName)
var Measurement_key = "Measurement_key"
var Size_notification_key = "Size_notification_key"
let colorGray = UIColor(red: 96/255, green: 106/255, blue: 113/255, alpha: 1)
var view_cart_notification_key = "view_cart_notification_key"

var apiKey: String = "8MYHPT4-6364FZJ-Q2SW96P-GEBF9QP"
var kUserId: String = ""
var kHeight: Int = 0
var kWeight: Int = 0
var kAge: Int = 0
var kBelly: Int = 0
var kHip: Int = 0
var kBrand: Int = 0
var kBrandSize: Int = 0

var isFT: Bool = false
var heightIndex: Int?

var isLBS: Bool = false
var widthIndex: Int?

var selectedAgeIndex: Int?
var selectedStomachIndex: Int?
var selectedHipsIndex: Int?

var AppLanuage: String = "en"

let countryLocale = NSLocale.current
let countryCode = countryLocale.regionCode
let country = (countryLocale as NSLocale).displayName(forKey: NSLocale.Key.countryCode, value: countryCode ?? "")

var platform = "iOS"

func resetData() {
    isFT = false
    heightIndex = nil
    
    isLBS = false
    widthIndex = nil
    
    selectedAgeIndex = nil
    selectedStomachIndex = nil
    selectedHipsIndex = nil
}

enum SizeItLanguage: String {
    case English = "en"
    case Arabic = "ar"
}

func isKeyPresentInUserDefaults(key: String) -> Bool {
    return UserDefaults.standard.object(forKey: key) != nil
}

public func saveJSON(j: JSON, key: String) {
    userDefault.setValue(j.rawString()!, forKey: key)
    // here I save my JSON as a string
}

public func loadJSON(key: String) -> JSON {
    return isKeyPresentInUserDefaults(key: key) ? JSON.init(parseJSON: userDefault.value(forKey: key) as! String) : JSON()
    // JSON from string must be initialized using .parse()
}

public func deleteJSON(key:String) {
    userDefault.removeObject(forKey: key)
}

func getImageForPod(named:String) -> UIImage {
   return UIImage(named: named,in: bundleName, compatibleWith: nil) ?? UIImage()
}

func showAlert(message: String, vc:UIViewController) {
    let alert = UIAlertController(title: "Alert", message: message, preferredStyle: UIAlertController.Style.alert)
    alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
    vc.present(alert, animated: true, completion: nil)
}

extension UIButton {
    func underline() {
        if let textUnwrapped = self.titleLabel?.text {
            let underlineAttribute = [NSAttributedString.Key.underlineStyle: NSUnderlineStyle.styleSingle.rawValue]
            let underlineAttributedString = NSAttributedString(string: textUnwrapped, attributes: underlineAttribute)
            self.setAttributedTitle(underlineAttributedString, for: .normal)
        }
    }
    
    func removeUnderline() {
        if let textUnwrapped = self.titleLabel?.text {
            let underlineAttributedString = NSAttributedString(string: textUnwrapped, attributes: nil)
            self.setAttributedTitle(underlineAttributedString, for: .normal)
        }
    }
}

extension CGRect {
    var center: CGPoint {
        return CGPoint(x: self.midX, y: self.midY)
    }
}

extension UIViewController: UIGestureRecognizerDelegate {
    @objc func dismissVC(){
        NotificationCenter.default.removeObserver(self, name: Notification.Name(rawValue: view_cart_notification_key), object: nil)
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func btnCloseAction(_ sender:UIButton) {
        dismissVC()
    }
    
    @IBAction func btnBackAction(_ sender:UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}

extension String {
    func localize() -> String {
        if AppLanuage == SizeItLanguage.English.rawValue {
            return localized("en")
        }
        else {
            return localized("ar")
        }
//        return NSLocalizedString(self, tableName: nil, bundle: bundleName!, value: "", comment: "")
    }
}

extension String {
    func withBoldText(text: String, font: UIFont? = nil) -> NSAttributedString {
        let _font = font ?? UIFont.systemFont(ofSize: 14, weight: .regular)
        let fullString = NSMutableAttributedString(string: self, attributes: [NSAttributedString.Key.font: _font])
        let boldFontAttribute: [NSAttributedString.Key: Any] = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: _font.pointSize), NSAttributedString.Key.underlineStyle: NSUnderlineStyle.styleThick.rawValue, NSAttributedString.Key.foregroundColor : UIColor.black]
        let range = (self as NSString).range(of: text)
        fullString.addAttributes(boldFontAttribute, range: range)
        return fullString
    }
}

extension String {
    func localized(_ lang:String) ->String {
        let path = bundleName?.path(forResource: lang, ofType: "lproj")
        let bundle = Bundle(path: path!)
        
        return NSLocalizedString(self, tableName: nil, bundle: bundle!, value: "", comment: "")
    }
}


extension UIColor {
    convenience init(hexString: String) {
        let hex = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt64()
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
    }
}

func createAttributedStringWithDynamic(str:String,font:UIFont,color:UIColor) -> NSMutableAttributedString  {
    
    let interactableText = NSMutableAttributedString(string:str)
    
    interactableText.addAttribute(NSAttributedString.Key.font,
                                  value: font,
                                  range: NSRange(location: 0, length: interactableText.length))
    
    interactableText.addAttribute(NSAttributedString.Key.foregroundColor,
                                  value: color, range: NSRange(location: 0, length: interactableText.length))
    
    return interactableText
    
}


// MARK:- Color

let app_black_color = UIColor(hexString: "#3A3A3D")
let app_theme_color =  UIColor(hexString: "#F0F0FD")
let app_theme_second_text_color =  UIColor(hexString: "#425081")
let app_theme_text_color =  UIColor(hexString: "#979ECA")
let app_theme_dark_color =  UIColor(hexString: "#8F88D8")
let app_light_gray_color = UIColor(hexString: "#F2F2F8")
let app_dark_gray_color = UIColor(hexString: "#5E606")
let app_dark_blue_color = UIColor(hexString: "#867BFF")
let app_second_black_color = UIColor(hexString: "#444444")


