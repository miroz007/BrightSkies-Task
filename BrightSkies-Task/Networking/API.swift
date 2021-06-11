//
//  API.swift
//  BrightSkies-Task
//
//  .
//  Copyright © 2021 . All rights reserved.
//

import Foundation
import RxSwift
import RxAlamofire
import Alamofire
import SwiftyJSON

class API {
    
    static let shared:API = {
        let instance = API()
        return instance
    }()
    
    init() {
        
    }
    
   private static func handleDataRequest(dataRequest: Observable<DataRequest>) -> Observable<JSON?> {
        if NetworkReachabilityManager()!.isReachable == false {
            return Observable<JSON?>.create({ (observer) -> Disposable in
                observer.on(.next(["Error":NSLocalizedString("Unable to contact the server", comment: "") ,
                                   "IsInternetOff":true]))
                observer.on(.completed)
                return Disposables.create()
            })
        }
        return Observable<JSON?>.create({ (observer) -> Disposable in
            dataRequest.observeOn(MainScheduler.instance).subscribe({ (event) in
                switch event {
                case .next(let e):
//                    plog(e.debugDescription)
                    e.responseJSON(completionHandler: { (dataResponse) in
                        switch dataResponse.result {
                        case .success(let data):
                            let json = JSON(data)
                            observer.onNext(json)
                        case .failure(let error):
                            plog(error)
                            let errorCode = (error as NSError).code
                            if errorCode == -1005 || errorCode == -1009 {
                                observer.onNext(["error": NSLocalizedString("Unable to contact the server", comment: ""),
                                                 "IsInternetOff":true])
                            } else {
                                observer.onNext(["error":error.localizedDescription,
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
    
    
    func regularRequest(apiRouter :APIRouter) -> Observable<APIResult<[String:Any]>> {
        return API.handleDataRequest(dataRequest: APIManager.shared.requestObservable(api: apiRouter)).map({ (response) -> APIResult<[String:Any]> in
            return APIResult.success(value: response?.dictionaryValue ?? [:])
        })
    }
    

}
