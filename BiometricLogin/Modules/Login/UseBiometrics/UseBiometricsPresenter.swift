//
//  UseBiometricsPresenter.swift
//  BiometricLogin
//
//  Created by Zaim Ramlan on 26/04/2018.
//  Copyright (c) 2018 ZaimRamlan. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol UseBiometricsPresentationLogic {
  func presentUseBiometricsResult(with response: UseBiometricsModels.UseBiometrics.Response)
}

class UseBiometricsPresenter: UseBiometricsPresentationLogic {
  weak var viewController: UseBiometricsDisplayLogic?
  
  // MARK: Use Case - UseBiometrics
  
  func presentUseBiometricsResult(with response: UseBiometricsModels.UseBiometrics.Response) {
    let viewModel = UseBiometricsModels.UseBiometrics.ViewModel(isSuccessful: response.isSuccessful)
    viewController?.displayUseBiometricsResult(with: viewModel)
  }
}
