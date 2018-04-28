//
//  DashboardHomePresenter.swift
//  BiometricLogin
//
//  Created by Zaim Ramlan on 28/04/2018.
//  Copyright (c) 2018 ZaimRamlan. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol DashboardHomePresentationLogic {
  func presentFetchFromDataStoreResult(with response: DashboardHomeModels.FetchFromDataStore.Response)
  func presentToggleUseBiometricsResult(with response: DashboardHomeModels.ToggleUseBiometrics.Response)
}

class DashboardHomePresenter: DashboardHomePresentationLogic {
  weak var viewController: DashboardHomeDisplayLogic?

  // MARK: Fetch Data From DataStore
  
  func presentFetchFromDataStoreResult(with response: DashboardHomeModels.FetchFromDataStore.Response) {
    let viewModel = DashboardHomeModels.FetchFromDataStore.ViewModel(biometricsType: response.biometricsType, useBiometrics: response.useBiometrics)
    viewController?.displayFetchFromDataStoreResult(with: viewModel)
  }  
  
  // MARK: Use Case - Toggle Use Biometrics
  
  func presentToggleUseBiometricsResult(with response: DashboardHomeModels.ToggleUseBiometrics.Response) {
    let viewModel = DashboardHomeModels.ToggleUseBiometrics.ViewModel()
    viewController?.displayToggleUseBiometricsResult(with: viewModel)
  }
}