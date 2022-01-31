//
//  FinalOutlputVC.swift
//  sizeit
//
//  Created by iMac on 31/01/22.
//

import UIKit

class FinalOutlputVC: UIViewController {
    
    //MARK:- Varible Declaration
    
    var imgBGMain = UIImage()
    
    //MARK:- Outlet Zone
    
    @IBOutlet weak var lblTitle:UILabel!
    @IBOutlet var lblAddToCartTitle:[UILabel]!
    @IBOutlet var lblOutOfStockTitle:[UILabel]!
    @IBOutlet weak var btnViewCartOutlet:UIButton!
    @IBOutlet weak var lblDescription:UILabel!
    @IBOutlet weak var imgFirst:UIImageView!
    @IBOutlet weak var imgSecond:UIImageView!
    @IBOutlet weak var lblOutputOne:UILabel!
    @IBOutlet weak var lblOutputSecond:UILabel!
    @IBOutlet weak var imgBG:UIImageView!
    @IBOutlet weak var vwFirstAddCart:CustomView!
    @IBOutlet weak var vwFirstOutOfStock:CustomView!
    @IBOutlet weak var vwSecondAddCart:CustomView!
    @IBOutlet weak var vwSecondOutOfStock:CustomView!
    
    //MARK:- View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
    

    func setupUI() {
        
        lblTitle.text = "Your size recommendation".localize()
        lblAddToCartTitle.forEach { lbl in
            lbl.text = "Add to Cart".localize().uppercased()
        }
        lblOutOfStockTitle.forEach { lbl in
            lbl.text = "Out of Stock!".localize().uppercased()
        }
        lblDescription.text = "We think this will fit best, but the below sizes might work if you like a tighter fit." .localize()
        btnViewCartOutlet.setTitle("View Cart".localize(), for: .normal)
        
        imgBG.image = imgBGMain
        
        imgFirst.image = imgBGMain
        imgSecond.image = imgBGMain
    }
}

//MARK:- Action Zone

extension FinalOutlputVC {
    
    @IBAction func btnViewCartAction(_ sender:UIButton) {
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: view_cart_notification_key), object: nil)
    }
    
    @IBAction func btnAddToCartAction(_ sender:UIButton) {
        
    }
    
}
