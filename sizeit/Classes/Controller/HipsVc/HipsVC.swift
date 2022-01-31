//
//  HipsVC.swift
//  sizeit
//
//  Created by iMac on 29/01/22.
//

import UIKit

class HipsVC: UIViewController {
    
    //MARK:- Variable Declaration
    
    var arrBodyTypeModel : [BodyTypeModel]  = [] {
        didSet {
            collectionView.reloadData()
        }
    }
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

        // Do any additional setup after loading the view.
        setupUI()
    }
    
    func setupArray() {
        arrBodyTypeModel.append(BodyTypeModel(imgNormal:getImageForPod(named: "ic_unselected_narrow"), imgSelected: getImageForPod(named: "ic_selected_narrow"), name: "Narrow".localize()))
        arrBodyTypeModel.append(BodyTypeModel(imgNormal: getImageForPod(named: "ic_unselected_medium"), imgSelected: getImageForPod(named: "ic_selected_medium"), name: "Medium".localize()))
        arrBodyTypeModel.append(BodyTypeModel(imgNormal: getImageForPod(named: "ic_unselected_wide"), imgSelected:getImageForPod(named: "ic_selected_wide"), name: "Wide".localize()))
    }
    
    func setupUI() {
        setupArray()
        lblTitle.text = "FIND MY SIZE".localize().capitalized
        
        let strFirst = createAttributedStringWithDynamic(str: "Which shape best describes your".localize(), font: themeFont(size: 25, fontname: .aliceR), color: app_black_color)
        let strSecond = createAttributedStringWithDynamic(str: "hips".localize(), font: themeFont(size: 25, fontname: .aliceR), color: app_dark_blue_color)
        let strThird = createAttributedStringWithDynamic(str: "?", font: themeFont(size: 25, fontname: .aliceR), color: app_black_color)
        
        let strMain = NSMutableAttributedString()
        strMain.append(strFirst)
        strMain.append(strSecond)
        strMain.append(strThird)
        
        lblSubTitle.attributedText = strMain
        
        btnContinueTitle.setTitle("Continue".localize(), for: .normal)
        
        imgBG.image = imgBGMain
    }
}

//MARK:- Action Zone

extension HipsVC {
    
    @IBAction func btnContinueAction(_ sender:UIButton) {
        let obj = mainStoryboard.instantiateViewController(withIdentifier: "FinalOutlputVC") as! FinalOutlputVC
        obj.imgBGMain = imgBGMain
        self.navigationController?.pushViewController(obj, animated: true)
    }
    
}

//MARK:- CollectionView Delegate and Datasource

extension HipsVC:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
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
