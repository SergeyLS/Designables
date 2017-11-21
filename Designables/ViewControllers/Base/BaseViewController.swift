//
//  BaseViewController.swift
//  Shopping List
//
//  Created by Сергей Гориненко on 4/20/17.
//  Copyright © 2017 Sergey Leskov. All rights reserved.
//

import UIKit

public class BaseViewController: UIViewController {

    private static let placeholderAnimationDuration = 0.3
    private static let placeholderAnimationDelay = 0.5
    private static let placeholderBackgroundColor: [CGFloat] = [80.0/255.0, 80.0/255.0, 80.0/255.0, 0.65]
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        
        //self.navigationController?.navigationBar.topItem?.title = ""
        
        //addObservers()
    }
    
    public override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
        print("[BaseVC] didReceiveMemoryWarning: \(String(describing: self))")
    }
    
    public override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        NSObject.cancelPreviousPerformRequests(withTarget: self, selector: #selector(showLoadingPlaceholderView), object: nil)
    }

    deinit {
        //removeObservers()
    }
    
    // MARK: - Accessors
    
    public var loadingPlaceholderViewHidden = true {
        didSet {
            if loadingPlaceholderViewHidden {
              hideLoadingPlaceholderView()
            } else {
                perform(#selector(showLoadingPlaceholderView), with: nil, afterDelay: BaseViewController.placeholderAnimationDelay)
            }
        }
    }
    
    private var placeholderBackgroundColor: UIColor = {
        return UIColor(red: BaseViewController.placeholderBackgroundColor[0], green: BaseViewController.placeholderBackgroundColor[1], blue: BaseViewController.placeholderBackgroundColor[2], alpha: BaseViewController.placeholderBackgroundColor[3])
    }()
    
    private lazy var loadingPlaceholderView: UIView = {
        let resultView = UIView(frame: self.view.bounds)
        resultView.autoresizingMask = [.flexibleLeftMargin, .flexibleWidth, .flexibleRightMargin, .flexibleTopMargin, .flexibleHeight, .flexibleBottomMargin]
        resultView.backgroundColor = self.placeholderBackgroundColor
        resultView.alpha = 0.0
        
        let indicatorView = UIActivityIndicatorView(activityIndicatorStyle: .whiteLarge)
        indicatorView.autoresizingMask = [.flexibleLeftMargin, .flexibleWidth, .flexibleRightMargin, .flexibleTopMargin, .flexibleHeight, .flexibleBottomMargin]
        var indicatorRect = indicatorView.frame
        indicatorRect.origin.x = CGFloat(floorf(Float(resultView.frame.size.width - indicatorRect.size.width) / 2))
        indicatorRect.origin.y = CGFloat(floorf(Float(resultView.frame.size.height - indicatorRect.size.height) / 2))
        indicatorView.frame = indicatorRect
        indicatorView.startAnimating()
        
        resultView.addSubview(indicatorView)
        self.view.addSubview(resultView)
        
        return resultView
    }()

    // MARK: -

    @objc private func showLoadingPlaceholderView() {
        view.bringSubview(toFront: loadingPlaceholderView)
        
        UIView.animate(withDuration: BaseViewController.placeholderAnimationDuration) {
            self.loadingPlaceholderView.alpha = 1.0
        }
    }

    private func hideLoadingPlaceholderView() {
        NSObject.cancelPreviousPerformRequests(withTarget: self, selector: #selector(showLoadingPlaceholderView), object: nil)
        
        UIView.animate(withDuration: BaseViewController.placeholderAnimationDuration) {
            self.loadingPlaceholderView.alpha = 0.0
        }
    }
    
    
}
