//
//  File.swift
//  sizeit
//
//  Created by Jaydeep on 21/04/21.
//

import Foundation
import UIKit 
import CoreText

enum themeFonts : String
{
    case mavenR = "MavenPro-Regular"
    case mavenB = "MavenPro-Bold"
    case aliceR = "Alice-Regular"
    case mavenM = "MavenPro-Medium"
    
}

extension UIFont
{
    
}

func themeFont(size : Float,fontname : themeFonts) -> UIFont
{
    if UIScreen.main.bounds.width <= 320
    {
        return UIFont(name: fontname.rawValue, size: CGFloat(size) - 2.0)!
    }
    else
    {
        return UIFont(name: fontname.rawValue, size: CGFloat(size))!
    }
    
}

extension UIFont {
    static func registerFont(bundle: Bundle, fontName: String, fontExtension: String) -> Bool {
        guard let fontURL = bundle.url(forResource: fontName, withExtension: fontExtension) else {
            fatalError("Couldn't find font \(fontName)")
        }

        guard let fontDataProvider = CGDataProvider(url: fontURL as CFURL) else {
            fatalError("Couldn't load data from the font \(fontName)")
        }

        guard let font = CGFont(fontDataProvider) else {
            fatalError("Couldn't create font from data")
        }

        var error: Unmanaged<CFError>?
        let success = CTFontManagerRegisterGraphicsFont(font, &error)
        guard success else {
            print("Error registering font: maybe it was already registered.")
            return false
        }

        return true
    }
}


