//
//  MainQueueDispatchDecorator.swift
//  FruitStore
//
//  Created by Kleyton Lopes on 20/09/21.
//

import Foundation

class MainQueueDispatchDecorator<T> {
    private let instance: T

    init(_ instance: T) {
        self.instance = instance
    }

    func dispatch(completion: @escaping () -> Void) {
        guard Thread.isMainThread else { return DispatchQueue.main.async(execute: completion) }
        completion()
    }
}

extension MainQueueDispatchDecorator: Authentication where T: Authentication {
    func auth(authenticationModel: AuthenticationModel, completion: @escaping (Authentication.Result) -> Void) {
        instance.auth(authenticationModel: authenticationModel) { [weak self] result in
            self?.dispatch { completion(result) }
        }
    }
}
