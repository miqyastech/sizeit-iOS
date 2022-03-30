//
//  SizeitUtils.swift
//  sizeit
//
//  Created by Jaydeep on 21/04/21.
//

import Foundation
import FBSDKCoreKit

public class SizeitUtils: NSObject {
    private var INIT_USER: String = "INIT_USER"
    private var PRODUCT_VISIT: String = "PRODUCT_VISIT"
    private var PRODUCT_ADD_TO_CART: String = "PRODUCT_ADD_TO_CART"
    private var BUY_PRODUCT: String = "BUY_PRODUCT"
    private var RETURN_PRODUCT: String = "RETURN_PRODUCT"
    private var CUSTOM: String = "CUSTOM"
    
    /**
       * ADD USER INTO FB EVENT
       *
       * @param activity
       * @param userID   - CURRENT LOGGED IN USER ID.
       * @param hashSize - PASS TRUE IF USER HAS SIZE like, M, L, X, XL, XXL.
       * @param data     - YOU CAN ADD OTHER STRING/JSON INFORMATION FOR FUTURE USE.
       */
    public func initUsers(userID: String, hashSize: Bool, data: String) {
        let param = [
            "user_id": userID,
            "hash_size": hashSize ? 1 : 0,
            "data": data] as [String : Any]
        print(param)
//        AppEvents.logEvent(AppEvents.Name.init(INIT_USER), parameters: param)
//        AppEvents.logEvent(AppEvents.Name.init(INIT_USER), parameters: param)
    }
    
    /**
       * ADD VISIT PRODUCT EVENT
       *
       * @param activity
       * @param userID      - CURRENT LOGGED IN USER ID.
       * @param product_sku - PASS TRUE IF USER HAS SIZE like, M, L, X, XL, XXL.
       * @param hashSize    - PASS TRUE IF USER HAS SIZE like, M, L, X, XL, XXL.
       * @param data        - YOU CAN ADD OTHER STRING/JSON INFORMATION FOR FUTURE USE.
       */

      public func visitProduct(userID: String, product_sku: String, hashSize: Bool, data: String) {
        let param = [
            "user_id": userID,
            "hash_size": hashSize ? 1 : 0,
            "product_sku": product_sku,
            "data": data] as [String : Any]
        print(param)
//        AppEvents.logEvent(AppEvents.Name.init(PRODUCT_VISIT), parameters: param)
      }
    
    /**
        * ADD PRODUCT TO CART EVENT
        *
        * @param activity
        * @param userID      - CURRENT LOGGED IN USER ID.
        * @param product_sku - PRODUCT NAME OF PRODUCT ID
        * @param hashSize    - PASS TRUE IF USER HAS SIZE like, M, L, X, XL, XXL.
        * @param data        - YOU CAN ADD OTHER STRING/JSON INFORMATION LIKE, SKU ID, RECEIPT NUMBER, ORDER DETAILS, ETC.. FOR FUTURE USE.
        */
    public func addProductToCart(userID: String, product_sku: String, hashSize: Bool, data: String) {
        let param = [
            "user_id": userID,
            "hash_size": hashSize ? 1 : 0,
            "product_sku": product_sku,
            "data": data] as [String : Any]
        print(param)
//        AppEvents.logEvent(AppEvents.Name.init(PRODUCT_ADD_TO_CART), parameters: param)
       }

    /**
       * BUY PRODUCT EVENT
       *
       * @param activity
       * @param userID      - CURRENT LOGGED IN USER ID.
       * @param hashSize    - PASS TRUE IF USER HAS SIZE like, M, L, X, XL, XXL.
       * @param product_sku - PRODUCT NAME OF PRODUCT ID
       * @param data        - YOU CAN ADD OTHER STRING/JSON INFORMATION LIKE, SKU ID, RECEIPT NUMBER, ORDER DETAILS, ETC.. FOR FUTURE USE.
       */
    public func buyProduct(userID: String, product_sku: String, hashSize: Bool, data: String) {
        let param = [
            "user_id": userID,
            "hash_size": hashSize ? 1 : 0,
            "product_sku": product_sku,
            "data": data] as [String : Any]
        print(param)
//        AppEvents.logEvent(AppEvents.Name.init(BUY_PRODUCT), parameters: param)
    }

    /**
        * RETURN PRODUCT EVENT
        *
        * @param activity
        * @param userID      - CURRENT LOGGED IN USER ID.
        * @param hashSize    - PASS TRUE IF USER HAS SIZE like, M, L, X, XL, XXL.
        * @param product_sku - PRODUCT NAME OF PRODUCT ID
        * @param data        - YOU CAN ADD OTHER STRING/JSON INFORMATION LIKE, SKU ID, RECEIPT NUMBER, ORDER DETAILS, ETC.. FOR FUTURE USE.
        */
       public func returnProduct(userID: String, product_sku: String, hashSize: Bool, data: String) {
        let param = [
            "user_id": userID,
            "hash_size": hashSize ? 1 : 0,
            "product_sku": product_sku,
            "data": data] as [String : Any]
        print(param)
//        AppEvents.logEvent(AppEvents.Name.init(RETURN_PRODUCT), parameters: param)
       }
    
    /**
        * @param activity
        * @param userID   - CURRENT LOGGED IN USER ID.
        * @param param   - ADD CUSTOM PARAMS WHAT EVER YOU WANT.
        */
    public func addCustomEvent(userID: String, param: [String : Any]) {
        var params =  param
        params["user_id"] = userID
        print(params)
//        AppEvents.logEvent(AppEvents.Name.init(CUSTOM), parameters: param)
    }
}
