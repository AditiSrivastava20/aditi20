//
//  FirstTableViewCell.swift
//  clikat
//
//  Created by Sierra 4 on 07/03/17.
//  Copyright © 2017 codebrew. All rights reserved.
//

import UIKit
import Kingfisher


class FirstTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var datafill: [English]?

    @IBOutlet weak var firstCollectionView: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        let nib = UINib(nibName: identifierNibTableCells.colCELL2.rawValue, bundle: nil)
        firstCollectionView.register(nib, forCellWithReuseIdentifier: DataIdentifier.colcell2.rawValue)
        // Initialization code
       firstCollectionView.delegate = self
       firstCollectionView.dataSource = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section:Int) -> Int
    {
        return 11
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath)  -> UICollectionViewCell
    {
        let Collectioncell2 = collectionView.dequeueReusableCell(withReuseIdentifier: DataIdentifier.colcell2.rawValue, for : indexPath) as! secondCollectionViewCell
        let url = URL(string: datafill?[indexPath.row].image ?? constants.nilWrapping.rawValue)
        Collectioncell2.secondCVimage.kf.setImage(with: url, placeholder: #imageLiteral(resourceName: "aaa"))
      
        Collectioncell2.secondCVlabel.text = datafill?[indexPath.row].name
        Collectioncell2.layer.cornerRadius = 5
        print(datafill?[indexPath.row].name ?? constants.nilWrapping.rawValue)
        return Collectioncell2
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        
        }
    func collectionView(_ collectionView: UICollectionView,layout collectionViewLayout: UICollectionViewLayout,sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width:(self.firstCollectionView.frame.width/2) - 10, height: self.firstCollectionView.frame.width/2)
        if(indexPath.item==10){
            return CGSize(width: 300, height: 150)
        }
        else{
            return CGSize(width: 140, height: 150)
        }
}
}
