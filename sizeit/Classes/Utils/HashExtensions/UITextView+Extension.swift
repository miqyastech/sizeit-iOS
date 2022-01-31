//
//  Created by HashMob on 06/07/19.
//  Copyright © 2021 HashMob. All rights reserved.
//

import Foundation
import UIKit

extension UITextView
{
    open override func awakeFromNib(){
        
        if (self.tag == 0){
            let currentFontName = self.font?.fontName
            let currentFontSize = self.font?.pointSize
            
            if IS_IPHONE_4_OR_4S(){
                self.font = UIFont(name: currentFontName!, size: currentFontSize! * 0.75)
            }else if IS_IPHONE_5_OR_5S() {
                self.font = UIFont(name: currentFontName!, size: currentFontSize! * 0.85)
            }else if IS_IPHONE_6_OR_6S() {
                self.font = UIFont(name: currentFontName!, size: currentFontSize! * 0.9)
            }else if IS_IPHONE_6P_OR_6SP() {
                self.font = UIFont(name: currentFontName!, size: currentFontSize! * 0.9)
            }else if IS_IPHONE_11P() {
                self.font = UIFont(name: currentFontName!, size: currentFontSize!)
            }else if IS_IPHONE_11_OR_11PROMAX() {
                self.font = UIFont(name: currentFontName!, size: currentFontSize! * 1.1)
            }else if IS_IPHONE_12_OR_12PRO() {
                self.font = UIFont(name: currentFontName!, size: currentFontSize! * 1.1)
            }else if IS_IPHONE_12MINI() {
                self.font = UIFont(name: currentFontName!, size: currentFontSize!)
            }else if IS_IPHONE_12ProMAX() {
                self.font = UIFont(name: currentFontName!, size: currentFontSize! * 1.15)
            }else{
                self.font = UIFont(name: currentFontName!, size: currentFontSize!)
            }
        }
        
    }
    
}
