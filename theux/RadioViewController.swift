//
//  RadioViewController.swift
//  theux
//
//  Created by Guillaume Wehrling on 28/01/2017.
//  Copyright © 2017 david. All rights reserved.
//

import UIKit

class RadioViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate  {
    
    private var img = ["radio", "radio2"]
    private var dateH = ["28/01/2017 19h02", "28/01/2017 18h22"]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // tell the collection view how many cells to make
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.img.count
    }
    
    // make a cell for each cell index path
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // get a reference to our storyboard cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellRadio", for: indexPath as IndexPath) as! ImageCollectionViewCell
        
        cell.img.image = UIImage(named: img[indexPath.row])
        cell.dateHourLabel.text = dateH[indexPath.row]
        
        return cell
    }
    
    // MARK: - UICollectionViewDelegate protocol
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // handle tap events
        print("You selected cell #\(indexPath.item)!")
    }

}
