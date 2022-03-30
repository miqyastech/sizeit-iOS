//
//  BodyTypeVC.swift
//  Alamofire
//
//  Created by iMac on 28/01/22.
//

import UIKit

class BodyTypeVC: UIViewController {
    
    //MARK:- Variable Declaration
    
    var arrBodyTypeModel : [BodyTypeModel]  = [] {
        didSet {
            collectionView.reloadData()
        }
    }
    var param = [String:AnyObject]()
    
    //MARK:- OutletZone
    
    @IBOutlet weak var collectionView:UICollectionView!
    @IBOutlet weak var lblTitle:UILabel!
    @IBOutlet weak var lblSubTitle:UILabel!
    @IBOutlet weak var btnContinueTitle:UIButton!
    @IBOutlet weak var imgBG:UIImageView!
    var imgBGMain = UIImage()
    
    //MARK:- View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
    
    func setupUI() {
        setupArray()
        lblTitle.text = "FIND MY SIZE".localize().capitalized
        
        let strFirst = createAttributedStringWithDynamic(str: "Which shape best fits your".localize(), font: themeFont(size: 25, fontname: .aliceR), color: app_black_color)
        let strSecond = createAttributedStringWithDynamic(str: "body type".localize(), font: themeFont(size: 25, fontname: .aliceR), color: app_dark_blue_color)
        let strThird = createAttributedStringWithDynamic(str: "?", font: themeFont(size: 25, fontname: .aliceR), color: app_black_color)
        
        let strMain = NSMutableAttributedString()
        strMain.append(strFirst)
        strMain.append(strSecond)
        strMain.append(strThird)
        
        lblSubTitle.attributedText = strMain
        
        btnContinueTitle.setTitle("Continue".localize(), for: .normal)
        
        imgBG.image = imgBGMain
        
        if AppLanuage == SizeItLanguage.Arabic.rawValue {
            UIView.appearance().semanticContentAttribute = .forceRightToLeft
            
            btnContinueTitle.contentEdgeInsets = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 0)
            btnContinueTitle.imageEdgeInsets = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 0)
        }
    }
    
    func setupArray() {
        arrBodyTypeModel.append(BodyTypeModel(imgNormal:getImageForPod(named: "ic_unselected_first_body_type"), imgSelected: getImageForPod(named: "ic_selected_first_body_type"), name: "Rectangle".localize()))
        arrBodyTypeModel.append(BodyTypeModel(imgNormal: getImageForPod(named: "ic_unselected_second_body_type"), imgSelected: getImageForPod(named: "ic_selected_second_body_type"), name: "Apple".localize()))
        arrBodyTypeModel.append(BodyTypeModel(imgNormal: getImageForPod(named: "ic_unselected_fourth_body_type"), imgSelected: getImageForPod(named: "ic_selected_fourth_body_type"), name: "HourGlass".localize()))
        arrBodyTypeModel.append(BodyTypeModel(imgNormal: getImageForPod(named: "ic_unselected_third_body_type"), imgSelected:getImageForPod(named: "ic_selected_third_body_type"), name: "Pear".localize()))
        
    }
    
}

//MARK:- Action Zone

extension BodyTypeVC {
    
    @IBAction func btnContinueAction(_ sender:UIButton) {
        let arr = arrBodyTypeModel.filter({$0.isSelected})
        if arr.count == 0{
            showAlert(message: "Please select any body type".localize(), vc: self)
            return
        }
        let obj = mainStoryboard.instantiateViewController(withIdentifier: "HipsVC") as! HipsVC
        obj.imgBGMain = imgBGMain
        param["bodyType"] = arr[0].name as AnyObject
        obj.param = param
        self.navigationController?.pushViewController(obj, animated: true)
    }
    
}

//MARK:- CollectionView Delegate and Datasource

extension BodyTypeVC:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrBodyTypeModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BodyTypeCell", for: indexPath) as! BodyTypeCell
        let model = arrBodyTypeModel[indexPath.row]
        cell.imgType.image = model.isSelected ? model.imgSelected : model.imgNormal
        cell.lblName.text = model.name.uppercased()
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.frame.width/CGFloat(arrBodyTypeModel.count)) , height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        for i in 0..<arrBodyTypeModel.count {
            arrBodyTypeModel[i].isSelected = false
        }
        arrBodyTypeModel[indexPath.row].isSelected = true
        collectionView.reloadData()
    }
}
