//
//  SMS.swift
//  BaseProject_EH
//
//  Created by Emad ios on 1/16/20.
//  Copyright © 2020 Emad. All rights reserved.
//

import Foundation
import FCAlertView

enum FCType {
    case success
    case warning
    case error
}

extension UIView {
    
    func showSimpleAlert(_ title : String? , _ sms : String?,_ alertType : FCType  ) {
        
        let alert  = FCAlertView()
        alert.dismissOnOutsideTouch = true
        
        switch alertType {
        case .success:
            alert.makeAlertTypeSuccess()
        case.warning:
            alert.makeAlertTypeCaution()
        case.error:
            alert.makeAlertTypeWarning()
        }
        alert.showAlert(withTitle: title, withSubtitle: sms, withCustomImage: nil, withDoneButtonTitle: "Okay", andButtons: nil)
        
    }
}


