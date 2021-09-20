//
//  LocalAuthentication.swift
//  FruitStore
//
//  Created by Kleyton Lopes on 16/09/21.
//

func makeLocalAuthentication(localValidator: LocalLoginValidator) -> Authentication {
    let localAuthentication = LocalAuthentication(loginValidator: localValidator)
    return MainQueueDispatchDecorator(localAuthentication)
}
