//
//  SizeitAPIEvent.swift
//  sizeit
//
//  Created by Zero thirteen on 17/06/21.
//

import UIKit
import SwiftyJSON

public class SizeitAPIEvent: NSObject {
    
    private var getFitted = "getFitted"
    private var addToCart = "addToCart"
    private var visitHome = "visitHome"
    private var visitProduct = "visitProduct"
    private var returnKey = "return"
    private var buy = "buy"
    
    
    /*
     * CALL THIS FUNCTION WHEN USER CLICK ON "FIND MY SIZE" BUTTON.
     *
     * {
     * "eventType": "getFitted",
     * "projectName": "Test", - enter your project name here
     * "origin": "https://storename.com", - enter your origin/website url
     * "platform": "iOS",
     * "userId": "userId", - If user is login then pass userId other wise pass null or empty
     * "products": [
     * {
     * "sku": "sku_id_n1", - enter n1 product sku id
     * "productSkuAbTest": - if user size for this product exists: true, else: false
     * },
     * {
     * "sku": "sku_id_n2", - enter n2 product sku id
     * "productSkuAbTest": - if user size for this product exists: true, else: false
     * }
     * ],
     * "orderValue": "product_value", - enter value/price of this product
     * "abTest": "true/false", - if user has no size the pass = false, else: true
     * "region": "region name" - enter region of device
     * }
     */
    
    public func getFitted(projectName: String, origin: String, userId: String = UUID().description) {
        var param = [String : Any]()
        param["eventType"] = getFitted
        param["projectName"] = projectName
        param["origin"] = origin
        param["platform"] = platform
        param["userId"] = userId
        param["products"] = []
        param["orderValue"] = ""
        param["abTest"] = hasSizes()
        param["region"] = country
        print(param)
        eventAPIMaster(param: param)
    }
    
    
    /*
     * CALL THIS FUNCTION WHEN USER OPEN THE APP.
     *
     * {
     * "eventType": "visitHome",
     * "projectName": "Test", - enter your project name here
     * "origin": "https://storename.com", - enter your origin/website url
     * "platform": "android",
     * "userId": "userId", - If user is login then pass userId other wise pass null or empty
     * "products": [
     * {
     * "sku": "sku_id_n1", - enter n1 product sku id
     * "productSkuAbTest": - if user size for this product exists: true, else: false
     * },
     * {
     * "sku": "sku_id_n2", - enter n2 product sku id
     * "productSkuAbTest": - if user size for this product exists: true, else: false
     * }
     * ],
     * "orderValue": "product_value", - enter value/price of this product
     * "abTest": "true/false", - if user has no size the pass = false, else: true
     * "region": "region name" - enter region of device
     * }
     */
    
    public func visitHome(projectName: String, origin: String, userId: String = UUID().description) {
        var param = [String : Any]()
        param["eventType"] = visitHome
        param["projectName"] = projectName
        param["origin"] = origin
        param["platform"] = platform
        param["userId"] = userId
        param["products"] = []
        param["orderValue"] = ""
        param["abTest"] = hasSizes()
        param["region"] = country
        print(param)
        eventAPIMaster(param: param)
    }
    
    
    /*
     * CALL THIS FUNCTION WHEN USER VISIT PRODUCT.
     *
     * {
     * "eventType": "visitProduct",
     * "projectName": "Test", - enter your project name here
     * "origin": "https://storename.com", - enter your origin/website url
     * "platform": "android",
     * "userId": "userId", - If user is login then pass userId other wise pass null or empty
     * "products": [
     * {
     * "sku": "sku_id_n1", - enter n1 product sku id
     * "productSkuAbTest": - if user size for this product n1 exists the set true else set else: false
     * },
     * {
     * "sku": "sku_id_n2", - enter n2 product sku id
     * "productSkuAbTest": if user size for this product n2 exists the set true else set else: false
     * }
     * ],
     * "orderValue": "product_value", - enter total value/price of those products
     * "abTest": "true/false", - if user has no size the pass = false, else: true
     * "region": "region name" - enter region of device
     * }
     */
    
    
    public func visitProduct(projectName: String, origin: String, userId: String = UUID().description, productsList:[[String:Any]], orderValue:String) {
        var param = [String : Any]()
        param["eventType"] = visitProduct
        param["projectName"] = projectName
        param["origin"] = origin
        param["platform"] = platform
        param["userId"] = userId
        param["products"] = productsList
        param["orderValue"] = orderValue
        param["abTest"] = hasSizes()
        param["region"] = country
        print(param)
        eventAPIMaster(param: param)
    }
    
    
    
    /*
     * CALL THIS FUNCTION WHEN USER ADD PRODUCT TO CART.
     *
     * <p>
     * {
     * "eventType": "addToCart",
     * "projectName": "Test", - enter your project name here
     * "origin": "https://storename.com", - enter your origin/website url
     * "platform": "android",
     * "userId": "userId", - If user is login then pass userId other wise pass null or empty
     * "products": [
     * {
     * "sku": "sku_id_n1", - enter n1 product sku id
     * "productSkuAbTest": - if user size for this product n1 exists the set true else set else: false
     * },
     * {
     * "sku": "sku_id_n2", - enter n2 product sku id
     * "productSkuAbTest": if user size for this product n2 exists the set true else set else: false
     * }
     * ],
     * "orderValue": "product_value", - enter total value/price of those products
     * "abTest": "true/false", - if user has no size the pass = false, else: true
     * "region": "region name" - enter region of device
     * }
     */
    
    
    public func addToCart(projectName: String, origin: String, userId: String = UUID().description, productsList:[[String:Any]], orderValue:String) {
        var param = [String : Any]()
        param["eventType"] = addToCart
        param["projectName"] = projectName
        param["origin"] = origin
        param["platform"] = platform
        param["userId"] = userId
        param["products"] = productsList
        param["orderValue"] = orderValue
        param["abTest"] = hasSizes()
        param["region"] = country
        print(param)
        eventAPIMaster(param: param)
    }
    
    
    /*
     * CALL THIS FUNCTION WHEN USER BUY PRODUCT.
     *
     * <p>
     * {
     * "eventType": "buy",
     * "projectName": "Test", - enter your project name here
     * "origin": "https://storename.com", - enter your origin/website url
     * "platform": "android",
     * "userId": "userId", - If user is login then pass userId other wise pass null or empty
     * "products": [
     * {
     * "sku": "sku_id_n1", - enter n1 product sku id
     * "productSkuAbTest": - if user size for this product n1 exists the set true else set else: false
     * },
     * {
     * "sku": "sku_id_n2", - enter n2 product sku id
     * "productSkuAbTest": if user size for this product n2 exists the set true else set else: false
     * }
     * ],
     * "orderValue": "product_value", - enter total value/price of those products
     * "abTest": "true/false", - if user has no size the pass = false, else: true
     * "region": "region name" - enter region of device
     * }
     */
    
    
    public func buyProduct(projectName: String, origin: String, userId: String = UUID().description, productsList:[[String:Any]], orderValue:String) {
        var param = [String : Any]()
        param["eventType"] = buy
        param["projectName"] = projectName
        param["origin"] = origin
        param["platform"] = platform
        param["userId"] = userId
        param["products"] = productsList
        param["orderValue"] = orderValue
        param["abTest"] = hasSizes()
        param["region"] = country
        print(param)
        eventAPIMaster(param: param)
    }
    
    
    /*
     * CALL THIS FUNCTION WHEN USER RETURN PRODUCT.
     *
     * <p>
     * {
     * "eventType": "return",
     * "projectName": "Test", - enter your project name here
     * "origin": "https://storename.com", - enter your origin/website url
     * "platform": "android",
     * "userId": "userId", - If user is login then pass userId other wise pass null or empty
     * "products": [
     * {
     * "sku": "sku_id_n1", - enter n1 product sku id
     * "productSkuAbTest": - if user size for this product n1 exists the set true else set else: false
     * },
     * {
     * "sku": "sku_id_n2", - enter n2 product sku id
     * "productSkuAbTest": if user size for this product n2 exists the set true else set else: false
     * }
     * ],
     * "orderValue": "product_value", - enter total value/price of those products
     * "abTest": "true/false", - if user has no size the pass = false, else: true
     * "region": "region name" - enter region of device
     * }
     */
    
    
    public func returnProduct(projectName: String, origin: String, userId: String = UUID().description, productsList:[[String:Any]], orderValue:String) {
        var param = [String : Any]()
        param["eventType"] = returnKey
        param["projectName"] = projectName
        param["origin"] = origin
        param["platform"] = platform
        param["userId"] = userId
        param["products"] = productsList
        param["orderValue"] = orderValue
        param["abTest"] = hasSizes()
        param["region"] = country
        print(param)
        eventAPIMaster(param: param)
    }
    
    
    
    //MARK:- Master API Function
    private func eventAPIMaster(param:[String : Any]) {
        ApiManager.shared.MakePostAPIWithoutVC(name: "https://events.miqyas.net/api/v1/create", params: param) {(response, error) in
            if response != nil {
                print(response!)
            }
            
        }
    }
    
    
    private func hasSizes() -> Bool {
        let json = loadJSON(key: Measurement_key)
        if json.isEmpty {
            return false
        }
        return true
    }
    
    
}
