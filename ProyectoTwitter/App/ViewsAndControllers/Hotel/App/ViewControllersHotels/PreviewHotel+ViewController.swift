//
//  PreviewHotel+ViewController.swift
//  ProyectoTwitter
//
//  Created by soliduSystem on 24/11/22.
//

import UIKit
import MapKit

private extension MKMapView {
    func centerToLocation(
        _ location: CLLocation,
        regionRadius: CLLocationDistance = 1000
    ) {
        let coordinateRegion = MKCoordinateRegion(
            center: location.coordinate,
            latitudinalMeters: regionRadius,
            longitudinalMeters: regionRadius)
        setRegion(coordinateRegion, animated: true)
    }
}

class PreviewHotel_ViewController: UIViewController {
    //MARK: - Override func
    override func viewDidLoad() {
        super.viewDidLoad()
        slides = createSlides()
        setupSlideScrollView(slides: slides)
        self.scrollViewImage.delegate = self
        
        pageControl.numberOfPages = slides.count
        pageControl.currentPage = 0
        view.bringSubviewToFront(pageControl)
        self.mapKitView.centerToLocation(locationHotel)
        
        let annotation = MKPointAnnotation()
        let centerCoordinate = CLLocationCoordinate2D(latitude: 23.256054, longitude:-106.459264)
        annotation.coordinate = centerCoordinate
        annotation.title = "Title"
        self.mapKitView.addAnnotation(annotation)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.scrollView.contentSize = CGSizeMake(0, self.btnReservar.frame.origin.y + self.btnReservar.frame.size.height + 20)
    }
    
    //MARK: - Private Var / Let
    
    //MARK: - Public Var / Let
    private let locationHotel = CLLocation(latitude: 23.256054, longitude: -106.459264);
    private var slides:[slide_hotel] = []
    
    //MARK: - @IBOutlet
    @IBOutlet weak var btnReservar: UIButton!
    @IBOutlet weak var mapKitView: MKMapView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var scrollViewImage: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
}

//MARK: - @IBAction
extension PreviewHotel_ViewController {
    
}
//MARK: - public func
extension PreviewHotel_ViewController {
    
}
//MARK: - Private func
extension PreviewHotel_ViewController {
    func createSlides() -> [slide_hotel] {
        let slide1 : slide_hotel = Bundle.main.loadNibNamed("SlideHotel", owner: self)?.first as! slide_hotel
        slide1.imgSlide.image = UIImage(named: "EmptyState")
        
        let slide2 : slide_hotel = Bundle.main.loadNibNamed("SlideHotel", owner: self)?.first as! slide_hotel
        slide2.imgSlide.image = UIImage(named: "EmptyState")
        
        let slide3 : slide_hotel = Bundle.main.loadNibNamed("SlideHotel", owner: self)?.first as! slide_hotel
        slide3.imgSlide.image = UIImage(named: "EmptyState")
        
        let slide4 : slide_hotel = Bundle.main.loadNibNamed("SlideHotel", owner: self)?.first as! slide_hotel
        slide4.imgSlide.image = UIImage(named: "EmptyState")
        
        let slide5 : slide_hotel = Bundle.main.loadNibNamed("SlideHotel", owner: self)?.first as! slide_hotel
        slide5.imgSlide.image = UIImage(named: "EmptyState")
        
        return [slide1, slide2, slide3, slide4, slide5]
    }
    
    func setupSlideScrollView(slides : [slide_hotel]) {
        scrollViewImage.frame = CGRect(x: 0, y: 0, width: scrollViewImage.superview!.frame.width, height: scrollViewImage.superview!.frame.height)
        scrollViewImage.contentSize = CGSize(width: scrollViewImage.superview!.frame.width * CGFloat(slides.count), height: scrollViewImage.superview!.frame.height)
        scrollViewImage.isPagingEnabled = true
        
        for i in 0 ..< slides.count {
            slides[i].frame = CGRect(x: scrollViewImage.superview!.frame.width * CGFloat(i), y: 0, width: scrollViewImage.superview!.frame.width, height: scrollViewImage.superview!.frame.height)
            scrollViewImage.addSubview(slides[i])
        }
    }
}
//MARK: - Services
extension PreviewHotel_ViewController {
    
}
//MARK: - UIScrollViewDelegate
extension PreviewHotel_ViewController : UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageIndex = round(scrollView.contentOffset.x/view.frame.width)
        pageControl.currentPage = Int(pageIndex)
    }
}
