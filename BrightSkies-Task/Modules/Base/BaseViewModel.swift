//
//  BaseViewModel.swift
//  BrightSkies-Task
//
//  Created by Amir Samir on 01/06/2021.
//


import Foundation
import RxSwift

public typealias EmptyCompletion = () -> Void
public typealias CompletionObject<T> = (_ response: T) -> Void
public typealias CompletionOptionalObject<T> = (_ response: T?) -> Void
//public typealias CompletionResponse = (_ response: Result<Void, Error>) -> Void
typealias Dependencies = HasAPI & HasWindow //& HasCoreData
typealias Animation = (UITableViewCell, IndexPath, UITableView) -> Void




class BaseViewModel {
    // Dispose Bag
    let disposeBag = DisposeBag()
    typealias Dependencies = HasAPI & HasCoreData
   
    // Dependencies
    let dependencies: AppDependency
    
    init() {
        self.dependencies = AppDependency(window: Application.window!, managedContext: Application.managedObjectContext)
    }

}
