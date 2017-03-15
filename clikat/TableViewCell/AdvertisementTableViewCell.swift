//
//  AdvertisementTableViewCell.swift
//  clikat
//
//  Created by Sierra 4 on 07/03/17.
//  Copyright © 2017 codebrew. All rights reserved.
//

import UIKit

class AdvertisementTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource{
    var temp:Int = 0
    var begin = false
    var advertisement = [#imageLiteral(resourceName: "CLIKAT"),#imageLiteral(resourceName: "Screen Shot 2017-03-15 at 3.43.08 PM"),#imageLiteral(resourceName: "Screen Shot 2017-03-15 at 3.43.08 PM")]
    
    
    
    @IBOutlet weak var pageControl: UIPageControl!

    @IBOutlet weak var SearchBar: UISearchBar!
    @IBOutlet weak var AdvertisementCollectionView: UICollectionView!
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        let nib = UINib(nibName: identifierNibTableCells.colCELL1.rawValue, bundle: nil)
        AdvertisementCollectionView.register(nib, forCellWithReuseIdentifier: DataIdentifier.colcell1.rawValue)
        AdvertisementCollectionView.delegate = self
       AdvertisementCollectionView.dataSource = self
        // Initialization code
        startTimer()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func scrollToNextCell(){
              
        if begin == true
        {
            pageControl.currentPage = 0
            begin = false
        }
        else
        {
            self.AdvertisementCollectionView.scrollToItem(at: IndexPath(row: temp, section: 0), at: .right, animated: true)
            if(temp == 2){
                temp = 0
            }
            else {
                temp = temp + 1
            }
            
        }
          }
    func startTimer() {
        
        _ = Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(AdvertisementTableViewCell.scrollToNextCell), userInfo: nil, repeats: true);
        
        
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
        pageControl.currentPage = Int(( AdvertisementCollectionView.contentOffset.x / AdvertisementCollectionView.contentSize.width) * CGFloat(advertisement.count))
        //print("pageControl\(pageControl.currentPage)")
        if AdvertisementCollectionView.contentSize.width ==  AdvertisementCollectionView.contentOffset.x + UIScreen.main.bounds.size.width
        {
            begin = true
            
        }
        
    }

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section:Int) -> Int
    {
        return 3
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath)  -> UICollectionViewCell
    {
        let CollectionCell1 = collectionView.dequeueReusableCell(withReuseIdentifier:DataIdentifier.colcell1.rawValue, for : indexPath) as! firstCollectionViewCell
        CollectionCell1.advertisementImage.image = advertisement[indexPath.row]
        
        return CollectionCell1
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
    }
}
