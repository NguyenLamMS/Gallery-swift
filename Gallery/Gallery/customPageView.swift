//
//  PageView.swift
//  Home 2
//
//  Created by Binh Phan on 8/2/18.
//  Copyright © 2018 Binh Phan. All rights reserved.
//

import UIKit
class customPageView: UIPageViewController, UIPageViewControllerDataSource {
    var imgArray = [UIImage]()
    var index: Int = 0
    public func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        if index == 0 {
            return nil
        }
        self.index += -1
        let page = PageView()
        page.imgView.image = imgArray[index]
        return page
    }
    
    public func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        if index == imgArray.count - 1 {
            return nil
        }
        self.index += 1
        let page = PageView()
        page.imgView.image = imgArray[index]
        return page
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource = self
        let pageView = PageView()
        pageView.imgView.image = imgArray[index]
        setViewControllers([pageView], direction: .forward, animated: true, completion: nil)
    }
}
class PageView: UIViewController, UIScrollViewDelegate {
    var imgView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.isUserInteractionEnabled = true
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        return iv
    }()
    var scrollImg: UIScrollView = {
        let v = UIScrollView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .black
        return v
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollImg.delegate = self
        scrollImg.alwaysBounceVertical = false
        scrollImg.alwaysBounceHorizontal = false
        scrollImg.showsVerticalScrollIndicator = false
        scrollImg.flashScrollIndicators()
        
        scrollImg.minimumZoomScale = 1.0
        scrollImg.maximumZoomScale = 3.0
        scrollImg.delegate = self
        let doubleTapGest = UITapGestureRecognizer(target: self, action: #selector(handleDoubleTapScrollView(recognizer:)))
        doubleTapGest.numberOfTapsRequired = 2
        scrollImg.addGestureRecognizer(doubleTapGest)
        self.view.addSubview(scrollImg)
        scrollImg.addSubview(imgView)
        imgView.contentMode = .scaleAspectFit
        imgView.layer.cornerRadius = 11.0
        imgView.clipsToBounds = false
        NSLayoutConstraint.activate([
            scrollImg.topAnchor.constraint(equalTo: view.topAnchor),
            scrollImg.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollImg.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollImg.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            scrollImg.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            scrollImg.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            imgView.topAnchor.constraint(equalTo: scrollImg.topAnchor),
            imgView.leadingAnchor.constraint(equalTo: scrollImg.leadingAnchor),
            imgView.trailingAnchor.constraint(equalTo: scrollImg.trailingAnchor),
            imgView.bottomAnchor.constraint(equalTo: scrollImg.bottomAnchor),
            
            imgView.centerXAnchor.constraint(equalTo: scrollImg.centerXAnchor),
            imgView.centerYAnchor.constraint(equalTo: scrollImg.centerYAnchor)
            ])
    }
    @objc func handleDoubleTapScrollView(recognizer: UITapGestureRecognizer) {
        if scrollImg.zoomScale == 1 {
            scrollImg.zoom(to: zoomRectForScale(scale: scrollImg.maximumZoomScale, center: recognizer.location(in: recognizer.view)), animated: true)
        } else {
            scrollImg.setZoomScale(1, animated: true)
        }
    }
    
    func zoomRectForScale(scale: CGFloat, center: CGPoint) -> CGRect {
        var zoomRect = CGRect.zero
        zoomRect.size.height = imgView.frame.size.height / scale
        zoomRect.size.width  = imgView.frame.size.width  / scale
        let newCenter = imgView.convert(center, from: scrollImg)
        zoomRect.origin.x = newCenter.x - (zoomRect.size.width / 2.0)
        zoomRect.origin.y = newCenter.y - (zoomRect.size.height / 2.0)
        return zoomRect
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return self.imgView
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
}
