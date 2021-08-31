//
//  ViewController.swift
//  SizeIt
//
//  Created by Jaydeep on 04/18/2021.
//  Copyright (c) 2021 Jaydeep. All rights reserved.
//

import UIKit
import sizeit

class ViewController: UIViewController {
    
    //MARK:- @IBOutlet
    @IBOutlet weak var btnMySize:UIButton!
    
    //MARK:- Variables
    let obj = SizeIt()
    
    //MARK:- Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        obj.setupLanguage(isEnglish: true)
        
        //MARK:- Facebook Event
        /*let isSizeAvailable = obj.isAttributeSizeAvailable(attributeName: "Skirts-S,M,L,XL,XXL")
        SizeitUtils().initUsers(userID: "1234", hashSize: isSizeAvailable, data: "test")
        SizeitUtils().visitProduct(userID: "1234", product_sku: "Skirts-S,M,L,XL,XXL", hashSize: isSizeAvailable, data: "")
        SizeitUtils().addProductToCart(userID: "1234", product_sku: "Skirts-S,M,L,XL,XXL", hashSize: isSizeAvailable, data: "")
        SizeitUtils().buyProduct(userID: "1234", product_sku: "Skirts-S,M,L,XL,XXL", hashSize: isSizeAvailable, data: "")
        SizeitUtils().returnProduct(userID: "1234", product_sku: "Skirts-S,M,L,XL,XXL", hashSize: isSizeAvailable, data: "")
        let param = [
            "parma1": "parma1",
            "parma2": "parma2",
            "parma3": "parma3"]
        SizeitUtils().addCustomEvent(userID: "1234", param: param)*/
        // Do any additional setup after loading the view, typically from a nib.
        
//        print("result",obj.isAttributeSizeAvailable("Skirts-S,M,L,XL,XXL"))
        
        eventExample()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    //MARK:- Sample Method
    
    func eventExample() {
        //1. event -> getFitted
        // userId = If user is login then pass userId otherwise pass null or empty
        SizeitAPIEvent().getFitted(projectName: "femi9", origin: "https://www.femi9.com", userId: "123")
        
        
        //2. event - visitHome
        SizeitAPIEvent().visitHome(projectName: "femi9", origin: "https://www.femi9.com", userId: "123")

        //3. event - visitProduct
        // productList = add product list in array format.
        // sku = product sku id.
        // productSkuAbTest = if user has size of this particular product like x, xx, L then set TRUE otherwise set FALSE
//        var arrProduct = [[String:Any]]()
//        arrProduct.append(["price":"100","currency":"sar","product_id" : "FU21-0000012B", "productSkuAbTest":true])
//        SizeitAPIEvent().visitProduct(projectName: "femi9", origin: "https://www.femi9.com", userId: "123", productsList: arrProduct, orderValue: "560")
        
        //4. event - addToCart
        // productList = add product list in array format.
        // sku = product sku id.
        // productSkuAbTest = if user has size of this particular product like x, xx, L then set TRUE otherwise set FALSE
//        var arrProduct1 = [[String:Any]]()
//        arrProduct1.append(["price":"100","currency":"sar","product_id" : "FU21-0000012B", "productSkuAbTest":true])
//        SizeitAPIEvent().addToCart(projectName: "femi9", origin: "https://www.femi9.com", userId: "123", productsList: arrProduct1, orderValue: "560")
        
        //5. event - buy
        // productList = add product list in array format.
        // sku = product sku id.
        // productSkuAbTest = if user has size of this particular product like x, xx, L then set TRUE otherwise set FALSE
//        var arrProduct2 = [[String:Any]]()
//        arrProduct2.append(["price":"100","currency":"sar","product_id" : "FU21-0000012B", "productSkuAbTest":true])
//        arrProduct2.append(["price":"100","currency":"sar","product_id" : "FU21-0000097A", "productSkuAbTest":true])
//        SizeitAPIEvent().buyProduct(projectName: "femi9", origin: "https://www.femi9.com", userId: "123", productsList: arrProduct2, orderValue: "560")
        
        //6. event - return
        // productList = add product list in array format.
        // sku = product sku id.
        // productSkuAbTest = if user has size of this particular product like x, xx, L then set TRUE otherwise set FALSE
//        var arrProduct3 = [[String:Any]]()
//        arrProduct3.append(["price":"100","currency":"sar","product_id" : "FU21-0000012B", "productSkuAbTest":true])
//        SizeitAPIEvent().returnProduct(projectName: "femi9", origin: "https://www.femi9.com", userId: "123", productsList: arrProduct3, orderValue: "560")
        
    }
    
    
    
    //MARK:- @IBAction
    @IBAction func btnFindMyFitAction(_ sender: UIButton) {
        // MARK:- Pass attribute name and userID
        let strCurrentSize = obj.getSizeByAttribute(attributeName: "Outer Wear-FREE")
        if strCurrentSize.isEmpty {
            obj.openSizePopup(userId: "1", attributeName: "Outer Wear-FREE",controller: self, key: "8MYHPT4-6364FZJ-Q2SW96P-GEBF9QP")
            obj.handlerUpdate = {[weak self] size in
                self?.btnMySize.setTitle("Your size is \(size)", for: .normal)
            }
        } else {
            btnMySize.setTitle("Your size is \(strCurrentSize)", for: .normal)
        }
    }
}

