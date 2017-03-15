//
//  AdvertisementTableViewCell.swift
//  clikat
//
//  Created by Sierra 4 on 07/03/17.
//  Copyright © 2017 codebrew. All rights reserved.
//

import UIKit

class AdvertisementTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource{

    @IBOutlet weak var SearchBar: UISearchBar!
    @IBOutlet weak var AdvertisementCollectionView: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        let nib = UINib(nibName: "firstCollectionViewCell", bundle: nil)
        AdvertisementCollectionView.register(nib, forCellWithReuseIdentifier: "CollectionCell1")
        AdvertisementCollectionView.delegate = self
       AdvertisementCollectionView.dataSource = self
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section:Int) -> Int
    {
        return 3
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt IndexPath: IndexPath)  -> UICollectionViewCell
    {
        let CollectionCell1 = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionCell1", for : IndexPath) as! firstCollectionViewCell
        
        return CollectionCell1
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        
        
        
    }
}
