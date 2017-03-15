//
//  ThirdTableViewCell.swift
//  clikat
//
//  Created by Sierra 4 on 07/03/17.
//  Copyright © 2017 codebrew. All rights reserved.
//

import UIKit

class ThirdTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{

    @IBOutlet weak var lblRecommended: UILabel!
    @IBOutlet weak var thirdCollectionView: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        let nib = UINib(nibName: identifierNibTableCells.colCELL4.rawValue, bundle: nil)
        thirdCollectionView.register(nib, forCellWithReuseIdentifier: DataIdentifier.colcell4.rawValue)
        // Initialization code
       thirdCollectionView.delegate = self
       thirdCollectionView.dataSource = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
     func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section:Int) -> Int
    {
        return 5
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt IndexPath: IndexPath)  -> UICollectionViewCell
    {
        let Collectioncell4 = collectionView.dequeueReusableCell(withReuseIdentifier: DataIdentifier.colcell4.rawValue, for : IndexPath) as! fourthCollectionViewCell
        
        return Collectioncell4
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
    }
    func collectionView(_ collectionView: UICollectionView,layout collectionViewLayout: UICollectionViewLayout,sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width:(self.thirdCollectionView.frame.width/2), height: self.thirdCollectionView.frame.height)
        
    }

    
}
