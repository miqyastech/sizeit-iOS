//
//  BodyTypeModel.swift
//  sizeit
//
//  Created by iMac on 29/01/22.
//

import Foundation
import UIKit

struct BodyTypeModel {
    
    var imgNormal = UIImage()
    var imgSelected = UIImage()
    var name = String()
    var isSelected = Bool()
    
    init(imgNormal:UIImage,imgSelected:UIImage,name:String) {
        self.imgNormal = imgNormal
        self.name = name
        self.imgSelected = imgSelected
    }
}
