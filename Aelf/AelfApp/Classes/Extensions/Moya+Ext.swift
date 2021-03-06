//
//  Moya+Ext.swift
//  RxExamples
//
//  Created by 晋先森 on 2019/5/28.
//  Copyright © 2019 AELF. All rights reserved.
//

import Foundation
import Moya
import Moya_ObjectMapper

typealias ResultCompletion = (_ result:VResult) -> Void

extension MoyaProvider {

    func requestData(_ target: Target) -> Observable<VResult> {

        return Observable.create { [weak self] observer in
            let cancellableToken = self?.request(target) { result in
                switch result {
                case .success(let value):
                    observer.onNext(value.toResult())
                    observer.onCompleted()
                case .failure(let error):
                    logInfo("请求出错：\(error)\n")
                    observer.onError(ResultError.error(type: .networkError))
                }
            }
            
            return Disposables.create {
                cancellableToken?.cancel()
            }
        }
    }


    class func JSONEndpointMapping(_ target: Target) -> Endpoint {

        let url = target.baseURL.appendingPathComponent(target.path).absoluteString.replacingOccurrences(of: "%3F", with: "?")
        return Endpoint(
            url: url,
            sampleResponseClosure: {
                .networkResponse(200, target.sampleData)
        },
            method: target.method,
            task: target.task,
            httpHeaderFields: target.headers
        )
    }
}

// Cache
extension MoyaProvider {

//    func requestCacheData(_ target: Target) -> Observable<VResult> {
//        return cacheObject(target, type: VResult.self)
//    }
}
