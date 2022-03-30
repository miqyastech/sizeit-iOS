//
//  ApiManager.swift
//  sizeit
//
//  Created by Jaydeep on 29/10/18.
//

import UIKit
import Alamofire
import SwiftyJSON
import Reachability
import SystemConfiguration

class ApiManager: NSObject {
    
    static var shared = ApiManager()
    
    //MARK: - Post
    func MakePostAPI(name:String, params:[String:Any], progress: Bool = true, vc: UIViewController, isAuth:Bool = true, completionHandler: @escaping (NSDictionary?, String?)-> Void) {
        
        guard ReachabilityTest.isConnectedToNetwork() else {
            showAlert(message: "No internet connection available".localize(), vc: vc)
            return
        }
        
        if progress {
            
        }
        
        Alamofire.request(name, method: .post, parameters: params, encoding: JSONEncoding.default, headers: nil).responseJSON { (response) in
            if response.value != nil {
                completionHandler(response.value as? NSDictionary, nil)
            }
            else {
                completionHandler(nil, response.error?.localizedDescription)
            }
        }
    }
    
    
    func MakePostAPIWithoutVC(name:String, params:[String:Any], progress: Bool = true, completionHandler: @escaping (NSDictionary?, String?)-> Void) {
        
        guard ReachabilityTest.isConnectedToNetwork() else {
            showAlert(message: "No internet connection available".localize(), vc: UIApplication.shared.keyWindow?.rootViewController ?? UIViewController())
            return
        }
        
        if progress {
            
        }
        
        Alamofire.request(name, method: .post, parameters: params, encoding: JSONEncoding.default, headers: nil).responseJSON { (response) in
            if response.value != nil {
                completionHandler(response.value as? NSDictionary, nil)
            }
            else {
                completionHandler(nil, response.error?.localizedDescription)
            }
        }
    }
    
}
