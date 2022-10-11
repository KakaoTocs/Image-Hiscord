//
//  ViewModelProtocol.swift
//  Image Hiscord
//
//  Created by 김진우 on 2022/10/11.
//

import RxSwift

protocol ViewModelProtocol {
    associatedtype Dependency
    associatedtype Payload
    associatedtype Input
    associatedtype State
    associatedtype Output
    
    var dependency: Dependency { get }
    var payload: Payload { get }
    var disposeBag: DisposeBag { get }
    
    var input: Input { get }
    var state: State { get }
    var output: Output { get }
    
    init(dependency: Dependency, payload: Payload)
}
