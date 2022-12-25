//
//  HomeViewController+ViewModel.swift
//  Image Hiscord
//
//  Created by 김진우 on 2022/12/25.
//

import UIKit

import RxSwift
import RxRelay

extension HomeViewController {
    struct Dependency {
        var imageWorker: ImageWorkerProtocol
    }
    
    struct Payload {
    }
    
    struct Input {
        let selectImageButtonTap: PublishRelay<Void> = .init()
        let detailButtonTap: PublishRelay<Void> = .init()
    }
    
    struct State {
        let image: BehaviorSubject<UIImage?> = .init(value: nil)
        let imageMeta: BehaviorSubject<ImageMeta?> = .init(value: nil)
        
        private let disposeBag = DisposeBag()
        
        init(input: Input, dependency: Dependency) {
            input.selectImageButtonTap.map { void in
                return UIImage()
            }
            .bind(to: image)
            .disposed(by: disposeBag)
            
            
            image.compactMap { $0 }
                .map { dependency.imageWorker.extractImageMeta(image: $0) }
                .map { $0.flatMap { $0 } }
                .bind(to: imageMeta)
                .disposed(by: disposeBag)
        }
    }
    
    struct Output {
        let selectedImage: Observable<UIImage?>
        let isActiveDetailButton: Observable<Bool>
        let imageName: Observable<String?>
        let imageDate: Observable<String?>
        
        init(state: State) {
            self.selectedImage = state.image
            self.isActiveDetailButton = state.image.map { $0 != nil }
            
            self.imageName = state.image.map
        }
    }
}

extension HomeViewController {
    final class ViewModel {
        // MARK: - Property
        let dependency: Dependency
        let payload: Payload
        let disposeBag: DisposeBag = .init()
        
        let input: Input = .init()
        let state: State
        let output: Output
        
        // MARK: - Init
        init(dependency: Dependency, payload: Payload) {
            self.dependency = dependency
            self.payload = payload
            
            self.state = .init(input: input, dependency: dependency)
            self.output = .init(state: state)
        }
    }
}
