//
//  API.swift
//  MovieApp
//
//  Created by Amir Samir on 12/11/18.
//  Copyright © 2018 Amir Samir. All rights reserved.
//

import Foundation
import RxSwift
import RxAlamofire
import Alamofire

final class API {
    
    static let shared:API = {
        let instance = API()
        return instance
    }()
    
    private init() {
        
    }
    
    
    private static func handleDataRequest(dataRequest: Observable<DataRequest>) -> Observable<(Any)?> {
        
        if NetworkReachabilityManager()!.isReachable == false {
            return Observable<(Any)?>.create({ (observer) -> Disposable in
                observer.on(.next(["Error":"Unable to contact the server" , "IsInternetOff":true]))
                observer.on(.completed)
                return Disposables.create()
            })
        }
        
        return Observable<(Any)?>.create({ (observer) -> Disposable in
            dataRequest.observeOn(MainScheduler.instance).subscribe({ (event) in
                
                switch event {
                    
                case .next(let e):
                    plog(e.description)
                    e.responseJSON(completionHandler: { (dataResponse) in
                        
                        switch dataResponse.result {
                            
                        case .success(let data):
                            print(data)
                            guard let json = data as? (Any) else {
                                observer.onNext(nil)
                                return
                            }
                            
                            plog("HEADER RESPONSE CODE : \(dataResponse.response!.statusCode)")
                            if let status = dataResponse.response?.statusCode , status == 401 {
                                APIManager.shared.sessionManager.cancelAllRequests()
                                observer.onNext(nil)
                                //Application.appCoordinator?.showUnAuth()
                                return
                            }
                            
                            observer.onNext(json)
                            
                        case .failure(let error):
                            plog(error)
                            let errorCode = (error as NSError).code
                            if errorCode == -1005 || errorCode == -1009 {
                                observer.onNext(["Error": NSLocalizedString("Unable to contact the server", comment: ""),
                                                 "IsInternetOff":true])
                            } else {
                                observer.onNext(["Error":error.localizedDescription,
                                                 "IsInternetOff":false])
                            }
                            observer.onCompleted()
                        }
                    })
                case .error(let error):
                    plog(error)
                    observer.onNext(["Error":error.localizedDescription])
                    observer.onNext(nil)
                    
                case .completed:
                    observer.onCompleted()
                }
            })
        })
    }
    
    
    func regularRequest(apiRouter :APIRouter) -> Observable<APIResult<(Any)>> {
        return API.handleDataRequest(dataRequest: APIManager.shared.requestObservable(api: apiRouter)).map({ (response) -> APIResult<(Any)> in
            print(response as Any)
            return APIResult.success(value: response ?? [:])
        })
        
    }
    
    
}
