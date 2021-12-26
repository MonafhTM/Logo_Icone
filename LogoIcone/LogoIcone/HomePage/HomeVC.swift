//
//  HomeVC.swift
//  LogoIcone
//
//  Created by Monafh on 21/05/1443 AH.
//

import UIKit

class HomeVC: UIPageViewController ,UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    
    
    var arryInformaition = [UIViewController]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        delegate = self
        dataSource = self
        
        pageMoveAndDescription()
        
    }
    
    //    func For the information in firstPage that show for visitors ....
    fileprivate func pageMoveAndDescription() {
        let firstVC = self.storyboard?.instantiateViewController(withIdentifier: "firstPage") as! HomePageVC
        
        firstVC.pageTitle = " ICON "
        firstVC.pageInfo = "free vector icons in one place. Download all the free icons in SVG and PNG formats . Use them for web design , mobile apps "
        //
        let secondVC = self.storyboard?.instantiateViewController(withIdentifier: "firstPage") as! HomePageVC
        
        secondVC.pageTitle = "LOGO"
        secondVC.pageInfo = "IF YOU Find Yourself short on logo Ideas , Explore Our  Logo template TO Find What You Need. "
        
        arryInformaition.append(firstVC)
        arryInformaition.append(secondVC)
        
        //
        if let pageVC = arryInformaition.first{
            setViewControllers([pageVC], direction: .forward, animated: true, completion: nil)
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let currentIndex = arryInformaition.firstIndex(of: viewController) else{
            return nil
        }
        let previousIndex = currentIndex-1
        guard previousIndex >= 0 else {
            return arryInformaition.last
        }
        return arryInformaition[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        guard let currentIndex = arryInformaition.firstIndex(of: viewController) else{
            return nil
        }
        let nextIndex = currentIndex + 1
        guard nextIndex < arryInformaition.count else {
            return arryInformaition.first
        }
        
        return arryInformaition[nextIndex]
    }
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return arryInformaition.count
    }
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return 0
    }
    
}
