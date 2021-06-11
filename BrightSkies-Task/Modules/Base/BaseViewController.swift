//
//  BaseViewController.swift
//  BrightSkies-Task
//
//  Created by Amir Samir on 01/06/2021.
//

import UIKit
import RxSwift
import RxCocoa
import RxGesture
import NVActivityIndicatorView

class BaseViewController: UIViewController , NVActivityIndicatorViewable{

    let disposeBag = DisposeBag()
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    deinit {
        print("deinit :\(self.description)")
    }
    
    func killLoading(){
        self.stopAnimating()
    }
    func startLoading()
    {
        self.startAnimating()
    }
}

