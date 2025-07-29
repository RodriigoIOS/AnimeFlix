//
//  HomeViewController.swift
//  AnimeFlix
//
//  Created by Rodrigo on 29/07/25.
//

import UIKit

class HomeViewController: UIViewController {
    
    private let customView = HomeView()
    
    override func loadView() {
        self.view = customView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "AnimeFlix"
    }
}
