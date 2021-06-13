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
    
    var loginVC: LoginVC {
        guard let viewController = instantiateViewController(withIdentifier: String(describing: LoginVC.self)) as? LoginVC else {
            fatalError(String(describing: LoginVC.self) + "\(NSLocalizedString("couldn't be found in Storyboard file", comment: ""))")
        }
        return viewController
    }
    
    var recipesVC: RecipesVC {
        guard let viewController = instantiateViewController(withIdentifier: String(describing: RecipesVC.self)) as? RecipesVC else {
            fatalError(String(describing: RecipesVC.self) + "\(NSLocalizedString("couldn't be found in Storyboard file", comment: ""))")
        }
        return viewController
    }
    
    var recipeDetailsVC: RecipeDetailsVC {
        guard let viewController = instantiateViewController(withIdentifier: String(describing: RecipeDetailsVC.self)) as? RecipeDetailsVC else {
            fatalError(String(describing: RecipeDetailsVC.self) + "\(NSLocalizedString("couldn't be found in Storyboard file", comment: ""))")
        }
        return viewController
    }
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
