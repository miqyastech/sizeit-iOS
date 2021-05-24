//
//  SizeIt.swift
//  Sizeit
//
//  Created by Jaydeep on 11/04/21.
//

import UIKit
import SwiftyJSON

public class SizeIt:UIViewController,SizeitTrackingDelegate {
    
    //MARK: - Variables
    //USE : This function return size when selection is complete
    public var handlerUpdate:(String) -> Void = {_ in}
    
    //MARK: - Functions
    //USE : This function return user has selected size erlier or not
    public func hasSizes() -> Bool {
        let json = loadJSON(key: Measurement_key)
        if json.isEmpty {
            return false
        }
        return true
    }
    
    //USE : This function return size if available in passed attribute
    public func getSizeByAttribute(attributeName:String) -> String {
        let json = loadJSON(key: Measurement_key)
        if json.isEmpty {
            return  ""
        }
        
        let model = MeasurementsModel(JSON: json.dictionaryObject!)
        let filter = model?.data?.sizes?.filter({ (data) -> Bool in
            return data.name == attributeName
        })
        return (filter?.first?.size ?? "")
    }
    
    //USE : This function return all size
    public func getAllSizes() -> [JSON] {
        let json = loadJSON(key: Measurement_key)
        if json.isEmpty {
            return []
        }
        return json["data"]["size"].arrayValue
    }
    
    //USE : This function open size picker
    public func openSizePopup(userId:String,attributeName:String,controller:UIViewController,key:String) {
        apiKey = key
        kUserId = userId
        let obj = mainStoryboard.instantiateViewController(withIdentifier: "SelectHeightVC") as! SelectHeightVC
        obj.delegate = self
        obj.categoryName = attributeName
        let nav = UINavigationController(rootViewController: obj)
        nav.modalTransitionStyle = .coverVertical
        nav.modalPresentationStyle = .currentContext
        controller.present(nav, animated: true, completion: nil)
    }
    
    //USE : This function return selected size
    func SizeitTrackingFinish(size: String) {
        handlerUpdate(size)
    }
    
    //USE : This function setup language
    public func setupLanguage(isEnglish:Bool) {
        AppLanuage = isEnglish ? SizeItLanguage.English.rawValue : SizeItLanguage.Arabic.rawValue
    }
    
    //USE : This function is return bool value like either true or false if size attribute is avilable or not
    public func isAttributeSizeAvailable(attributeName:String) -> Bool {
        if let jsonString = userDefault.string(forKey: Measurement_key) {
            let sizeJson = JSON.init(parseJSON:jsonString)
            let arrSize = sizeJson["data"]["sizes"].arrayValue
            if let isSizeAvailale = arrSize.first(where: {$0["name"].stringValue.lowercased() == attributeName.lowercased()}) {
                if isSizeAvailale["size"].stringValue.lowercased() != "not available".lowercased() {
                    return true
                }
            }
        }
        return false
    }
    
}
