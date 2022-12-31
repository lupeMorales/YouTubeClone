//
//  HomeViewController.swift
//  YouTubeClone
//
//  Created by Guadalupe Morales carmona on 29/12/22.
//

import UIKit

class HomeViewController: UIViewController {
    
    lazy var presenter = HomePresenter(delegate: self)

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


}

extension HomeViewController : HomeViewProtocol {
    func getData(list: [[Any]]) {
        print("list:" , list)
    }
    
    
}
