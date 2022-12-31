//
//  MainViewController.swift
//  YouTubeClone
//
//  Created by Guadalupe Morales carmona on 29/12/22.
//

import UIKit

class MainViewController: UIViewController {
    
    var rootPageViewController : RootPageViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? RootPageViewController {
            destination.delegateRootPage = self
            rootPageViewController = destination
        }
    }
}

extension MainViewController : RootPageProtocol{
    func currentPage(_ index: Int) {
        print("current page", index)
    }
    
    
}
