//
//  SceneCoordinator.swift
//  RxMemo
//
//  Created by 강병우 on 2020/08/08.
//  Copyright © 2020 강병우. All rights reserved.
//

import Foundation

import RxSwift
import RxCocoa

class SceneCoordinator: SceneCoordinatorType {
    private let bag = DisposeBag()
    
    private var window: UIWindow
    private var currentVC: UIViewController
    
    required init(window: UIWindow) {
        self.window = window
        currentVC = window.rootViewController!
    }
    
    @discardableResult
    func transition(to scene: Scene, using style: TransitionStyle, animated: Bool)
    -> Completable {
        let subject = PublishSubject<Void>()
        let target = scene.instantiate()
        
        switch style {
        case .root:
            window.rootViewController = target
            subject.onCompleted()
        case .push:
            guard let navigationController = currentVC.navigationController else {
                subject.onError(TransitionError.navigationControllerMissing)
                break
            }
            navigationController.pushViewController(target, animated: animated)
            currentVC = target
            subject.onCompleted()
        case .modal:
            currentVC.present(target, animated: animated) {
                subject.onCompleted()
            }
            currentVC = target
            
            return subject.ignoreElements() // ??
        }
    }
    
    @discardableResult
    func close(animated: Bool) -> Completable {
        return Completable.create { [unowned self] completable in
            if let presentViewController = self.currentVC.presentingViewController {
                self.currentVC.dismiss(animated: animated) {
                    self.currentVC = presentViewController
                    completable(.completed)
                }
            } else if let navigationController = self.currentVC.navigationController {
                guard navigationController.popViewController(animated: animated) != nil else {
                    completable(.error(TransitionError.cannotPop))
                    return Disposables.create()
                }
                self.currentVC = navigationController.viewControllers.last!
                completable(.completed)
            } else {
                completable(.error(TransitionError.unknown))
            }
            
            return Disposables.create()
        }
    }
}
