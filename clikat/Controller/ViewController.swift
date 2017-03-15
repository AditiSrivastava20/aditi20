//
//  ViewController.swift
//  clikat
//
//  Created by Sierra 4 on 07/03/17.
//  Copyright © 2017 codebrew. All rights reserved.
//

import UIKit
import Alamofire
import ObjectMapper
import Kingfisher
import SVProgressHUD

class ViewController: UIViewController {
    var headersticky : stickyHeader?
    @IBOutlet weak var leftbtn: UIButton!
  
    
    @IBOutlet weak var tableView: UITableView!
    var userModel : model?
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib1 = UINib(nibName: identifierNibTableCells.tblCELL1.rawValue, bundle: nil)
        tableView.register(nib1, forCellReuseIdentifier: DataIdentifier.tblcell1.rawValue)
        let nib2 = UINib(nibName: identifierNibTableCells.tblCELL2.rawValue, bundle: nil)
        tableView.register(nib2, forCellReuseIdentifier: DataIdentifier.tblcell2.rawValue)
        let nib3 = UINib(nibName:identifierNibTableCells.tblCELL3.rawValue, bundle: nil)
        tableView.register(nib3, forCellReuseIdentifier: DataIdentifier.tblcell3.rawValue)
        /*let nib4 = UINib(nibName: "ThirdTableViewCell", bundle: nil)
         tableView.register(nib4, forCellReuseIdentifier: "TableCell4")*/
        // Do any additional setup after loading the view, typically from a nib.
        
        
        tableView.delegate = self
        tableView.dataSource =  self
        
        tableView.estimatedRowHeight = 230
        tableView.rowHeight = UITableViewAutomaticDimension
        
       // Alamofire.request("https://appbean.clikat.com/get_all_category")
        
        SVProgressHUD.show()
        SVProgressHUD.setDefaultAnimationType(SVProgressHUDAnimationType.native)
        SVProgressHUD.setDefaultMaskType(SVProgressHUDMaskType.black)
        
        fetchData()
    }
    func fetchData() {
        
        let param:[String:Any] = [constants.param1.rawValue: constants.paramString.rawValue, constants.param2.rawValue: constants.paramSrtring2.rawValue]
        
        ApiHandler.fetchData(parameters: param) { (jsonData) in
            self.userModel = Mapper<model>().map(JSONObject: jsonData)
            
            print(self.userModel?.message ?? constants.nilWrapping.rawValue)
            self.tableView.reloadData()
            SVProgressHUD.dismiss()
            
        }
    }
    
    func menufunctionright(completionHandler:@escaping() -> ())
    {
        let menus : slidepanelViewController = self.storyboard!.instantiateViewController(withIdentifier: DataIdentifier.slidepanel.rawValue) as! slidepanelViewController
        self.view.addSubview(menus.view)
        self.addChildViewController(menus)
        menus.view.layoutIfNeeded()
        
        
        menus.view.frame=CGRect(x: 0 - UIScreen.main.bounds.size.width, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height);
        
        UIView.animate(withDuration: 0.3, animations: { () -> Void in
            menus.view.frame=CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height);
        }, completion:{completed in
            if completed {
                completionHandler()
            }
        })
        
    }
    
    @IBAction func leftPanel(_ sender: UIButton) {
        
        
        leftbtn.isEnabled = false
        menufunctionright(){_ in
        }
        leftbtn.isEnabled = true
    }
    

}



extension ViewController : UITableViewDelegate ,UITableViewDataSource
{
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let nib = UINib(nibName: identifierNibTableCells.viewHeader.rawValue, bundle: nil)
        let headersticky = nib.instantiate(withOwner: nil, options: nil)[0] as? stickyHeader
        if(section == 2){
            
            headersticky?.stickyLabel.font = UIFont(name: (headersticky?.stickyLabel.font.fontName)!, size: 15)
            headersticky?.stickyLabel.text = constants.param3.rawValue
            headersticky?.stickyButton.titleLabel!.font =  UIFont(name: constants.param8.rawValue, size: 15)
            headersticky?.stickyButton.isHidden = false
            return headersticky
        }else{
            headersticky?.stickyLabel.font = UIFont(name:(headersticky?.stickyLabel.font.fontName)!, size: 15)
            
            headersticky?.stickyLabel.text = constants.param4.rawValue
            headersticky?.stickyButton.isHidden = true
            return headersticky
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if(section == 2 || section == 3)
        {
            return 30
        }else{
            return 0
        }
    }
    public func numberOfSections(in tableView: UITableView) -> Int {
     return 4
    }
    
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch(indexPath.section)
        {
        case 0:
        /* let AdvertisementTableViewCell1 = tableView.dequeueReusableCell(withIdentifier: "TableCell1", for: indexPath) as? AdvertisementTableViewCell*/
         let AdvertisementTableViewCell1 = tableView.dequeueReusableCell(withIdentifier: DataIdentifier.tblcell1.rawValue, for: indexPath) as! AdvertisementTableViewCell

        return AdvertisementTableViewCell1
         
        case 1:
         /*let FirstTableViewCell1 = tableView.dequeueReusableCell(withIdentifier: "TableCell2", for: indexPath) as! FirstTableViewCell*/
         let FirstTableViewCell1 = tableView.dequeueReusableCell(withIdentifier: DataIdentifier.tblcell2.rawValue, for: indexPath) as! FirstTableViewCell
         FirstTableViewCell1.datafill = self.userModel?.idata?.english
        // print(self.userModel?.idata?.english ?? )
          FirstTableViewCell1.firstCollectionView.reloadData()
         return FirstTableViewCell1
         
        case 2,3:
         /*let SecondTableViewCell1 = tableView.dequeueReusableCell(withIdentifier: "TableCell3", for: indexPath) as? SecondTableViewCell*/
         let SecondTableViewCell1 = tableView.dequeueReusableCell(withIdentifier: DataIdentifier.tblcell3.rawValue, for: indexPath) as? SecondTableViewCell
         SecondTableViewCell1?.tableSection = indexPath.section
         SecondTableViewCell1?.secondCollectionView.reloadData()
     
         return SecondTableViewCell1!
         
                   
        default:
            
          /*  let AdvertisementTableViewCell1 = tableView.dequeueReusableCell(withIdentifier: "TableCell1", for: indexPath) as? AdvertisementTableViewCell*/
            let AdvertisementTableViewCell1 = tableView.dequeueReusableCell(withIdentifier: DataIdentifier.tblcell1.rawValue, for: indexPath) as? AdvertisementTableViewCell
            
            return AdvertisementTableViewCell1!
            
    }
}
   
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        if(indexPath.section  == 1){
            return (6 * 160)
        }
        else {
         return 220
            
            
        }
    }

}

