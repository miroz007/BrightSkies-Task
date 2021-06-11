//
//  UIStoryboard+Controllers.swift
//  BrightSkies-Task
//
//  .
//  Copyright © 2021 . All rights reserved.
//

import Foundation
import UIKit

extension UIStoryboard {
    
    static var main: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: nil)
    }
    
}


extension UIStoryboard {
    
    
    //    var homeViewController: HomeVC {
    //        guard let viewController = instantiateViewController(withIdentifier: String(describing: HomeVC.self)) as? HomeVC else {
    //            fatalError(String(describing: HomeVC.self) + "\(NSLocalizedString("couldn't be found in Storyboard file", comment: ""))")
    //        }
    //        return viewController
    //    }
}


final class ContentSizedTableView: UITableView {
    override var contentSize:CGSize {
        didSet {
            invalidateIntrinsicContentSize()
        }
    }

    override var intrinsicContentSize: CGSize {
        layoutIfNeeded()
        return CGSize(width: UIView.noIntrinsicMetric, height: contentSize.height)
    }
}
