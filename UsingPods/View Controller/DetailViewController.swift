//
//  DetailViewController.swift
//  UsingPods
//
//  Created by Alex Paul on 1/22/18.
//  Copyright © 2018 Alex Paul. All rights reserved.
//

//  TODO: implement detail view controller 

import UIKit

class DetailViewController: UIViewController {
    
    let detailView = DetailView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(detailView)
    }

}
