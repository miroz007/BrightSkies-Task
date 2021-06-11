//
//  UIImageView+SDWebImage.swift
//  BrightSkies-Task
//
//  Created by  on 11/13/18.
//  Copyright © 2021 . All rights reserved.
//

import Foundation
import SDWebImage


extension UIImageView {
    
    public func downloadImageWithCaching(with url: String,placeholderImage: UIImage? = nil){
        if url == ""{
            self.image = placeholderImage
            return
        }
        guard let imageURL = URL.init(string: url) else{
            self.image = placeholderImage
            return
        }
        self.sd_setImage(with: imageURL, placeholderImage: placeholderImage, options: [.retryFailed])
    }
    
}


extension UIImageView {

    public func sd_setImageWithURLWithFade(url: URL!, placeholderImage placeholder: UIImage!)
    {        self.sd_setImage(with: url, placeholderImage: placeholder) { (image, error, cacheType, url) -> Void in

        if let downLoadedImage = image
        {
            if cacheType == .none
            {
                self.alpha = 0
                UIView.transition(with: self, duration: 0.2, options: UIView.AnimationOptions.transitionCrossDissolve, animations: { () -> Void in
                    self.image = downLoadedImage
                    self.alpha = 1
                    }, completion: nil)

            }
        }
        else
        {
            self.image = placeholder
        }
        }
    }
}

