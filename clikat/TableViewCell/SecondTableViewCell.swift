//
//  SecondTableViewCell.swift
//  clikat
//
//  Created by Sierra 4 on 07/03/17.
//  Copyright © 2017 codebrew. All rights reserved.
//

import UIKit
import Kingfisher

class SecondTableViewCell: UITableViewCell {
    var tableSection:Int?
    @IBOutlet weak var Viewall: UIButton!
    @IBOutlet weak var lbloffers: UILabel!
    @IBOutlet weak var secondCollectionView: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        let nib = UINib(nibName: identifierNibTableCells.colCELL3.rawValue, bundle: nil)
        secondCollectionView.register(nib, forCellWithReuseIdentifier: DataIdentifier.colcell3.rawValue)
        let nib2 = UINib(nibName: identifierNibTableCells.colCELL4.rawValue, bundle: nil)
        secondCollectionView.register(nib2, forCellWithReuseIdentifier: DataIdentifier.colcell4.rawValue)
        
        // Initialization code
        secondCollectionView.delegate = self
        secondCollectionView.dataSource = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}

extension SecondTableViewCell: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{

      
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return 5
    }
    
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        if(tableSection == 2)
        {
            

        let CVCell3 = collectionView.dequeueReusableCell(withReuseIdentifier: DataIdentifier.colcell3.rawValue, for: indexPath) as! thirdCollectionViewCell
        return CVCell3
    }
        else
        {
            let Collectioncell4 = collectionView.dequeueReusableCell(withReuseIdentifier: DataIdentifier.colcell4.rawValue, for : indexPath)
            
            return Collectioncell4
            
            
        }
    
     
   /* func collectionView(_ collectionView: UICollectionView,layout collectionViewLayout: UICollectionViewLayout,sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width:(self.secondCollectionView.frame.width/2)-15, height: self.secondCollectionView.frame.height)
        
    }*/
    
    }
}
