//
//  slidepanelViewController.swift
//  clikat
//
//  Created by Sierra 4 on 10/03/17.
//  Copyright © 2017 codebrew. All rights reserved.
//

import UIKit

class slidepanelViewController: UIViewController {
    
    @IBOutlet weak var viewoutlet: UIView!
    @IBOutlet weak var userImaage: UIImageView!
    @IBOutlet weak var imageView: UIView!
    @IBOutlet weak var tableOutlet: UITableView!
    
    var Options :[[String]] = [[name.home.rawValue,name.live.rawValue,name.cart.rawValue,
                              name.promotion.rawValue,name.notification.rawValue,name.compare.rawValue],[name.favorite.rawValue,name.pending.rawValue,name.schedule.rawValue,name.rate.rawValue,name.history.rawValue,name.point.rawValue,name.share.rawValue,name.terms.rawValue,name.about.rawValue,name.setting.rawValue]]
    
    var imageicon :[[String]] = [[image.imgone.rawValue,image.imgone.rawValue,image.imgone.rawValue,
                                 image.imgone.rawValue,image.imgone.rawValue,image.imgone.rawValue],[image.imgone.rawValue,image.imgone.rawValue,image.imgone.rawValue,image.imgone.rawValue,image.imgone.rawValue,image.imgone.rawValue,image.imgone.rawValue,image.imgone.rawValue,image.imgone.rawValue,image.imgone.rawValue]]
    override func viewDidLoad() {
            super.viewDidLoad()
        if !UIAccessibilityIsReduceTransparencyEnabled() {
            self.viewoutlet.backgroundColor = UIColor.clear
            
            let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.dark)
            let blurEffectView = UIVisualEffectView(effect: blurEffect)
            
            //always fill the view
            blurEffectView.frame = self.viewoutlet.bounds
            blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            
            self.view.addSubview(blurEffectView) //if you have more UIViews, use an insertSubview API to place it where needed
            self.view.sendSubview(toBack: blurEffectView)
            
        } else {
            //self.viewSideMenu.backgroundColor = UIColor.black
        }                   }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let viewMenuBack : UIView = view
        
        UIView.animate(withDuration: 0.3, animations: { () -> Void in
            var frameMenu : CGRect = viewMenuBack.frame
            frameMenu.origin.x = -1 * UIScreen.main.bounds.size.width
            viewMenuBack.frame = frameMenu
            viewMenuBack.layoutIfNeeded()
            viewMenuBack.backgroundColor = UIColor.clear
        }, completion: { (finished) -> Void in
            viewMenuBack.removeFromSuperview()
            
        })
    }
    
}
extension slidepanelViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return Options[section].count
    
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        guard let cell: TableViewCell = tableView.dequeueReusableCell(withIdentifier: DataIdentifier.tableView.rawValue, for: indexPath) as? TableViewCell else{ return TableViewCell()}
        cell.labelname.text = Options[indexPath.section][indexPath.row]
       cell.iconimage.image = UIImage(named:imageicon[indexPath.section][indexPath.row])
        return cell
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return Options.count
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let view = UIView(frame: CGRect.init(x: 0, y: 0, width: 246, height: 43))
        view.backgroundColor = UIColor.gray
        let label = UILabel(frame: CGRect.init(x: 20, y: 0, width: 150, height: 43))
        label.textAlignment = .left
        label.textColor = UIColor.white;
        label.font = label.font.withSize(12)
        label.font = UIFont.boldSystemFont(ofSize: 12.0)
        label.text = constants.param7.rawValue
        
        view.addSubview(label)
        return view
        
           }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        var height : CGFloat  = 0
        if(section == 1)
        {
            height = 43
        }
        else
        {
            height = 0
        }
        return height
        
        }
    
}
