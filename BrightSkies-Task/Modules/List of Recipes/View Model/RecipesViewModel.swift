//
//  RecipesViewModel.swift
//  BrightSkies-Task
//
//  Created by Amir on 6/12/21.
//  Copyright © 2021 Amir. All rights reserved.
//


import Foundation
import RxSwift
import RxCocoa
import SwiftyJSON

class RecipesViewModel: BaseViewModel {
    
    let isLoading: ActivityIndicator =  ActivityIndicator()
    lazy var msg = BehaviorRelay<String>(value: "")
    var recipes = BehaviorRelay<[RecipesModel]>(value: [])
    
    lazy var isData  = BehaviorRelay<Bool>(value: false)
    lazy var isMessage  = BehaviorRelay<Bool>(value: false)

    
    func getRecipes(){
        self.dependencies.api.regularRequest(apiRouter: .getRecipes)
            .trackActivity(isLoading)
            .observeOn(MainScheduler.asyncInstance)
            .subscribe {[weak self] (event) in
                guard let `self` = self else { return }
                switch event {
                case .next(let result):
                    switch result {
                    case .success(value: let response):
                        print(response)
                        let json = JSON(response as Any)
                        var list_ = [RecipesModel]()
                        for list_Json in json.arrayValue{
                            let value = RecipesModel(fromJson: list_Json)
                            list_.append(value)
                        }
                        self.recipes.accept(list_)
                        self.isData.accept(true)
                    case .failure(let error):
                        self.msg.accept(error.message)
                    }
                default:
                    break
                }
        }.disposed(by: disposeBag)
    } 
}
