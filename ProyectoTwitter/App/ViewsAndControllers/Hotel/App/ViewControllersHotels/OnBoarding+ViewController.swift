//
//  OnBoarding+ViewController.swift
//  ProyectoTwitter
//
//  Created by soliduSystem on 28/11/22.
//

import UIKit

class OnBoarding_ViewController: UIViewController {
    
    //MARK: - Override func
    override func viewDidLoad() {
        super.viewDidLoad()
        slides = createSlides()
        setupSlideScrollView(slides: slides)
        self.scrollView.delegate = self
        pageControl.numberOfPages = slides.count
        pageControl.currentPage = 0
        view.bringSubviewToFront(pageControl)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.scrollViewTimer = Timer.scheduledTimer(withTimeInterval: 3.0, repeats: true, block: { Timer in
            self.scrollViewToRigth(self.scrollView)
        })
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.scrollViewTimer.invalidate()
    }
    
    //MARK: - Private Var / Let
    
    //MARK: - Public Var / Let
    private var slides:[onBoardingViewHotel] = [];
    private var indexScrollView : Int = 1
    private var scrollViewContentOffSetS : CGFloat = 0.0
    private var scrollViewTimer : Timer = Timer()
   
    //MARK: - @IBOutlet
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    
}
//MARK: - @IBAction
extension OnBoarding_ViewController {

}
//MARK: - public func
extension OnBoarding_ViewController {

}
//MARK: - Private func
extension OnBoarding_ViewController {
    private func scrollViewToRigth(_ scrollView : UIScrollView) -> Void {
        if self.indexScrollView >= self.slides.count {
            self.indexScrollView = 1
            self.scrollViewContentOffSetS = 0
        } else {
            self.indexScrollView += 1
            self.scrollViewContentOffSetS += self.view.frame.size.width
        }
        scrollView.setContentOffset(CGPoint(x: self.scrollViewContentOffSetS, y: scrollView.frame.origin.y), animated: true);
    }
    

    
    private func createSlides() -> [onBoardingViewHotel] {

        let slide1 : onBoardingViewHotel = Bundle.main.loadNibNamed("onBoardingHotel", owner: self, options: nil)?.first as! onBoardingViewHotel
        slide1.imageOnBoarding.image = UIImage(named: "imgHotel1")
        slide1.titleOnBoarding.text = "A real-life bear"
        slide1.desOnBoarding.text = "Did you know that Winnie the chubby little cubby was based on a real, young bear in London"
        
        let slide2 : onBoardingViewHotel = Bundle.main.loadNibNamed("onBoardingHotel", owner: self, options: nil)?.first as! onBoardingViewHotel
        slide2.imageOnBoarding.image = UIImage(named: "imgHotel2")
        slide2.titleOnBoarding.text = "A real-life bear"
        slide2.desOnBoarding.text = "Did you know that Winnie the chubby little cubby was based on a real, young bear in London"
        
        let slide3 : onBoardingViewHotel = Bundle.main.loadNibNamed("onBoardingHotel", owner: self, options: nil)?.first as! onBoardingViewHotel
        slide3.imageOnBoarding.image = UIImage(named: "imgHotel3")
        slide3.titleOnBoarding.text = "A real-life bear"
        slide3.desOnBoarding.text = "Did you know that Winnie the chubby little cubby was based on a real, young bear in London"
        
        let slide4 : onBoardingViewHotel = Bundle.main.loadNibNamed("onBoardingHotel", owner: self, options: nil)?.first as! onBoardingViewHotel
        slide4.imageOnBoarding.image = UIImage(named: "imgHotel1")
        slide4.titleOnBoarding.text = "A real-life bear"
        slide4.desOnBoarding.text = "Did you know that Winnie the chubby little cubby was based on a real, young bear in London"
        
        let slide5 : onBoardingViewHotel = Bundle.main.loadNibNamed("onBoardingHotel", owner: self, options: nil)?.first as! onBoardingViewHotel
        slide5.imageOnBoarding.image = UIImage(named: "imgHotel2")
        slide5.titleOnBoarding.text = "A real-life bear"
        slide5.desOnBoarding.text = "Did you know that Winnie the chubby little cubby was based on a real, young bear in London"
        
        return [slide1, slide2, slide3, slide4, slide5]
    }
    
    
    
    private func setupSlideScrollView(slides : [onBoardingViewHotel]) {
        scrollView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        scrollView.contentSize = CGSize(width: view.frame.width * CGFloat(slides.count), height: view.frame.height)
        scrollView.isPagingEnabled = true
        
        for i in 0 ..< slides.count {
            slides[i].frame = CGRect(x: view.frame.width * CGFloat(i), y: 0, width: view.frame.width, height: view.frame.height)
            scrollView.addSubview(slides[i])
        }
    }
}
//MARK: - Services
extension OnBoarding_ViewController {

}
//MARK: - UIScrollViewDelegate
extension OnBoarding_ViewController : UIScrollViewDelegate{
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageIndex = round(scrollView.contentOffset.x/view.frame.width)
        let pageIndex2 = round(scrollView.contentOffset.x/view.frame.width) + 1
        
        pageControl.currentPage = Int(pageIndex)
        self.indexScrollView = Int(pageIndex2)
        self.scrollViewContentOffSetS = scrollView.contentOffset.x
        
        let maximumHorizontalOffset: CGFloat = scrollView.contentSize.width - scrollView.frame.width
        let currentHorizontalOffset: CGFloat = scrollView.contentOffset.x
        
        let maximumVerticalOffset: CGFloat = scrollView.contentSize.height - scrollView.frame.height
        let currentVerticalOffset: CGFloat = scrollView.contentOffset.y
        
        let percentageHorizontalOffset: CGFloat = currentHorizontalOffset / maximumHorizontalOffset
        let percentageVerticalOffset: CGFloat = currentVerticalOffset / maximumVerticalOffset
        
        let percentOffset: CGPoint = CGPoint(x: percentageHorizontalOffset, y: percentageVerticalOffset)
        
        if(percentOffset.x > 0 && percentOffset.x <= 0.25) {
            
            slides[0].imageOnBoarding.transform = CGAffineTransform(scaleX: (0.25-percentOffset.x)/0.25, y: (0.25-percentOffset.x)/0.25)
            slides[1].imageOnBoarding.transform = CGAffineTransform(scaleX: percentOffset.x/0.25, y: percentOffset.x/0.25)
            
        } else if(percentOffset.x > 0.25 && percentOffset.x <= 0.50) {
            slides[1].imageOnBoarding.transform = CGAffineTransform(scaleX: (0.50-percentOffset.x)/0.25, y: (0.50-percentOffset.x)/0.25)
            slides[2].imageOnBoarding.transform = CGAffineTransform(scaleX: percentOffset.x/0.50, y: percentOffset.x/0.50)
            
        } else if(percentOffset.x > 0.50 && percentOffset.x <= 0.75) {
            slides[2].imageOnBoarding.transform = CGAffineTransform(scaleX: (0.75-percentOffset.x)/0.25, y: (0.75-percentOffset.x)/0.25)
            slides[3].imageOnBoarding.transform = CGAffineTransform(scaleX: percentOffset.x/0.75, y: percentOffset.x/0.75)
            
        } else if(percentOffset.x > 0.75 && percentOffset.x <= 1) {
            slides[3].imageOnBoarding.transform = CGAffineTransform(scaleX: (1-percentOffset.x)/0.25, y: (1-percentOffset.x)/0.25)
            slides[4].imageOnBoarding.transform = CGAffineTransform(scaleX: percentOffset.x, y: percentOffset.x)
        }
    }
}
