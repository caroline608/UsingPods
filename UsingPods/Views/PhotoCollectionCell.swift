//
//  PhotoCollectionCell.swift
//  UsingPods
//
//  Created by Alex Paul on 1/22/18.
//  Copyright © 2018 Alex Paul. All rights reserved.
//

import UIKit

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
    }
}

// MARK:- Helper Methods
extension PhotoCollectionCell {
    public func configureCell(photo: Photo) {
        // TODO: fix the image flickering here using Kingfisher
        DispatchQueue.global().async {
            do {
                let imageData = try Data.init(contentsOf: photo.url_m)
                let image  = UIImage.init(data: imageData)
                DispatchQueue.main.async {
                    self.imageView.image = image
                }
            } catch {
                print("image processing error: \(error.localizedDescription)")
            }
        }
    }
}
