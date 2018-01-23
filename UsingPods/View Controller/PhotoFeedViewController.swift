//
//  PhotoFeedViewController.swift
//  UsingPods
//
//  Created by Alex Paul on 1/22/18.
//  Copyright © 2018 Alex Paul. All rights reserved.
//

import UIKit

class PhotoFeedViewController: UIViewController {
    
    private let photoFeed = PhotoFeed()
    
    // TODO: implement data model
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(photoFeed)
        photoFeed.collectionView.dataSource = self
        photoFeed.photoSearchBar.delegate = self
        photoFeed.addressSearchBar.delegate = self
        configureNavBar()
    }
    
    private func configureNavBar() {
        navigationController?.navigationBar.barTintColor = .orange
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .never
        navigationItem.titleView = photoFeed.photoSearchBar
    }
}

extension PhotoFeedViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20 // TODO: replace test items with data model 
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCollectionCell", for: indexPath) as! PhotoCollectionCell
        cell.backgroundColor = .white
        // TODO: configure cell
        return cell
    }
}

extension PhotoFeedViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // TODO: segue to DeatilViewController
    }
}

extension PhotoFeedViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        var address: String? = nil
        if let text = photoFeed.addressSearchBar.text {
            if text.isEmpty {
                address = "Queens, NY"
            } else {
                address = text
            }
        }
        guard let photoSearchText = photoFeed.photoSearchBar.text,
            !photoSearchText.isEmpty else { print("photo search is nil - empty"); return }
        guard let addressSearchText = address else { print("address search can't be nil"); return }
        
        // TODO: use AppleLocationService to geocode the address to a CLLocation
        print("photo serch text: \(photoSearchText)")
        print("address search text: \(addressSearchText)")
    }
}
