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
        
        //MARK:- Facebook Event
        /*SizeitUtils().initUsers(userID: "1234", hashSize: obj.hasSizes(), data: "test")
        SizeitUtils().visitProduct(userID: "1234", product_sku: "Skirts-S,M,L,XL,XXL", hashSize: obj.hasSizes(), data: "")
        SizeitUtils().addProductToCart(userID: "1234", product_sku: "Skirts-S,M,L,XL,XXL", hashSize: obj.hasSizes(), data: "")
        SizeitUtils().buyProduct(userID: "1234", product_sku: "Skirts-S,M,L,XL,XXL", hashSize: obj.hasSizes(), data: "")
        SizeitUtils().returnProduct(userID: "1234", product_sku: "Skirts-S,M,L,XL,XXL", hashSize: obj.hasSizes(), data: "")
        let param = [
            "parma1": "parma1",
            "parma2": "parma2",
            "parma3": "parma3"]
        SizeitUtils().addCustomEvent(userID: "1234", param: param)*/
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK:- @IBAction
    @IBAction func btnFindMyFitAction(_ sender: UIButton) {
        // MARK:- Pass attribute name and userID
        let strCurrentSize = obj.getSizeByAttribute(attributeName: "Outer Wear-FREE")
        if strCurrentSize.isEmpty {
            obj.openSizePopup(userId: "1", attributeName: "Outer Wear-FREE",controller: self)
            obj.handlerUpdate = {[weak self] size in
                self?.btnMySize.setTitle("Your size is \(size)", for: .normal)
            }
        } else {
            btnMySize.setTitle("Your size is \(strCurrentSize)", for: .normal)
        }
    }
}

