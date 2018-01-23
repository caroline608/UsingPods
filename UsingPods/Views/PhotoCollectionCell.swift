//
//  PhotoCollectionCell.swift
//  UsingPods
//
//  Created by Alex Paul on 1/22/18.
//  Copyright © 2018 Alex Paul. All rights reserved.
//

import UIKit
import SnapKit
import Kingfisher

class PhotoCollectionCell: UICollectionViewCell {
    // image
    lazy var imageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

// MARK:- Setup Views
extension PhotoCollectionCell {
    private func setupViews() {
        backgroundColor = .white
        setupImageView()
    }
    
    private func setupImageView() {
        addSubview(imageView)
        // TODO: use SnapKit to layout constraints
        imageView.snp.makeConstraints { (make) in
            make.edges.equalTo(self)
        }
    }
}

// MARK:- Helper Methods
extension PhotoCollectionCell {
    public func configureCell(photo: Photo) {
        
        
        // TODO: fix the image flickering here using Kingfisher
        imageView.kf.indicatorType = .activity
        imageView.kf.setImage(with: photo.url_m, placeholder: UIImage.init(named: "placeholder-image"), options: nil, progressBlock: nil) { (image, error, cacheType, url) in
        
        }
        
//        DispatchQueue.global().async {
//            do {
//                let imageData = try Data.init(contentsOf: photo.url_m)
//                let image  = UIImage.init(data: imageData)
//                DispatchQueue.main.async {
//                    self.imageView.image = image
//                }
//            } catch {
//                print("image processing error: \(error.localizedDescription)")
//            }
//        }
    }
}
