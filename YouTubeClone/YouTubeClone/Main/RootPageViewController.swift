//
//  RootPageViewController.swift
//  YouTubeClone
//
//  Created by Guadalupe Morales carmona on 29/12/22.
//

import UIKit

protocol RootPageProtocol : AnyObject {
    
    func currentPage (_ index: Int)
    
}
class RootPageViewController: UIPageViewController {
    
    var subViewControllers = [UIViewController]()
    var currentIndex : Int = 0
    weak var delegateRootPage : RootPageProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        dataSource = self
        setupViewControllers()
    }
    
    
    private func setupViewControllers () {
        subViewControllers = [
            HomeViewController(),
            VideosViewController(),
            PlaylistsViewController(),
            ChannelViewController(),
            AboutViewController()
        ]
        
        
        _ = subViewControllers.enumerated().map({$0.element.view.tag = $0.offset})
        
        //por default mostrará HOME q es el index 0
        setViewControllersFromIndex(index: 0, direction: .forward)
    }
    
    
    func setViewControllersFromIndex(index : Int, direction : NavigationDirection, animated : Bool = true) {
        
        setViewControllers([subViewControllers[index]], direction: direction, animated: animated)
    }
    
    
}
extension RootPageViewController: UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    
    //Le digo al PageViewController cuantas n cantidad de Views va a tener
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return subViewControllers.count
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        let index : Int = subViewControllers.firstIndex(of: viewController) ?? 0
        if index <= 0 {
            return  nil
        }
        return subViewControllers[index - 1]
        
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        let index : Int = subViewControllers.firstIndex(of: viewController) ?? 0
        if index >= subViewControllers.count - 1 {
            return  nil
        }
        return subViewControllers[index + 1]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        print("finished: ", finished)
        if let index = pageViewController.viewControllers?.first?.view.tag{
            currentIndex = index
            delegateRootPage?.currentPage(index)
        }
    }
}
