//
//  LoginViewModel.swift
//  BrightSkies-Task
//
//  Created by Amir on 6/11/21.
//  Copyright © 2021 Amir. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import Alamofire

class LoginViewModel: BaseViewModel {
    
//    let isLoading: ActivityIndicator =  ActivityIndicator()
//    lazy var msg = BehaviorRelay<String>(value: "")
    lazy var push = BehaviorRelay<Bool>(value: false)

    func login() {
        self.push.accept(true)
    }
    
    
    
}
