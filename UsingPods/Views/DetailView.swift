//
//  DetailView.swift
//  UsingPods
//
//  Created by Alex Paul on 1/22/18.
//  Copyright © 2018 Alex Paul. All rights reserved.
//

//  TODO: autolayout views using SnapKit

import UIKit

class DetailView: UIView {
    lazy var contentView: UIView = {
        let view = UIView()
        return view
    }()
    
    lazy var scrollView: UIScrollView = {
        let sv = UIScrollView()
        sv.delegate = self
        sv.maximumZoomScale = 6.0
        sv.minimumZoomScale = 1.0
        return sv
    }()
    
    lazy var topContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    lazy var dismissButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage.init(named: "dismiss-button"), for: .normal)
        return button
    }()
    
    lazy var imageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
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
extension DetailView {
    private func setupViews() {
        backgroundColor = .white
        setupContentView()
        setupScrollView()
        setupImageView()
        setupTopContainerView()
        setupDismissButton()
    }
    
    private func setupContentView() {
        addSubview(contentView)
        // TODO: use SnapKit to layout constraints
    }
    
    private func setupScrollView() {
        contentView.addSubview(scrollView)
        // TODO: use SnapKit to layout constraints
    }
    
    private func setupImageView() {
        scrollView.addSubview(imageView)
        // TODO: use SnapKit to layout constraints
    }
    
    private func setupTopContainerView() {
        contentView.addSubview(topContainerView)
        // TODO: use SnapKit to layout constraints
    }
    
    private func setupDismissButton() {
        contentView.addSubview(dismissButton)
        // TODO: use SnapKit to layout constraints
    }
}

extension DetailView: UIScrollViewDelegate {
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
}
