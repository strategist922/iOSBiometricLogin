//
//  UseEmailPasswordViewController.swift
//  BiometricLogin
//
//  Created by Zaim Ramlan on 25/04/2018.
//  Copyright (c) 2018 ZaimRamlan. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol UseEmailPasswordDisplayLogic: class {
  func displayFetchFromDataStoreResult(with viewModel: UseEmailPasswordModels.FetchFromDataStore.ViewModel)  
  func displayUseEmailPasswordResult(with viewModel: UseEmailPasswordModels.UseEmailPassword.ViewModel)
}

class UseEmailPasswordViewController: UIViewController, UseEmailPasswordDisplayLogic {

  // MARK: Properties

  var router: (NSObjectProtocol & UseEmailPasswordRoutingLogic & UseEmailPasswordDataPassing)?
  var interactor: UseEmailPasswordBusinessLogic?

  // MARK: Object lifecycle
  
  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    setup()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    setup()
  }
  
  // MARK: Setup
  
  private func setup() {
    let viewController = self
    let interactor = UseEmailPasswordInteractor()
    let presenter = UseEmailPasswordPresenter()
    let router = UseEmailPasswordRouter()

    viewController.router = router
    viewController.interactor = interactor
    interactor.presenter = presenter
    presenter.viewController = viewController
    router.viewController = viewController
    router.dataStore = interactor
  }
  
  // MARK: Routing
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    // if let scene = segue.identifier {
    //   let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
    //   if let router = router, router.responds(to: selector) {
    //     router.perform(selector, with: segue)
    //   }
    // }
  }
  
  // MARK: View Lifecycle

  override func viewDidLoad() {
    super.viewDidLoad()
    setupTexts()
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    setupFetchFromDataStore()
  }
    
  // MARK: Texts

  var someLabel = UILabel()
  func setupTexts() {

    // MARK: Font Setting

    let fontName = "A font name"
    let fontSize = CGFloat(14.0)
    var font     = UIFont(name: fontName, size: fontSize)

    if font == nil { font = UIFont.systemFont(ofSize: fontSize) }

    // MARK: Texts

    someLabel.text = "Some Text"

    // MARK: Button

    //let text = Localiser.sharedInstance.string(for: "Module.Sub Module.Element")
    let text = ""
    someButton.setTitle(text, for: .normal)
    someButton.titleLabel?.font = font
  }

  // MARK: Fetch Data From DataStore

  @IBOutlet var userAttributeLabel: UILabel!
  func setupFetchFromDataStore() {
    let request = UseEmailPasswordModels.FetchFromDataStore.Request()
    interactor?.fetchFromDataStore(with: request)
  }
  
  func displayFetchFromDataStoreResult(with viewModel: UseEmailPasswordModels.FetchFromDataStore.ViewModel) {
    someLabel.text = viewModel.userAttribute
  }  

  // MARK: Use Case - UseEmailPassword

  var someButton = UIButton()
  @IBAction func someButtonClicked(_ sender: Any) {
    let request = UseEmailPasswordModels.UseEmailPassword.Request(variableToPass: someLabel.text)
    interactor?.UseEmailPassword(with: request)
  }

  func displayUseEmailPasswordResult(with viewModel: UseEmailPasswordModels.UseEmailPassword.ViewModel) {
    if viewModel.containsErrors {

      // 1. Handle UIElement changes based on user input

      // for handling errors that is caused
      // by invalid user input
      print(viewModel.variablePassed?.errorMessage ?? "")

      // 2. Handle Generic Error Message

      // for handling errors that is caused
      // by service call from worker
      if viewModel.genericErrorMessage != nil {
        
        // handle generic error
        print(viewModel.genericErrorMessage ?? "")
      }
    }
    else {

      // 1. Handle UIElement changes based on user input

      // set UIElements back to normal state

      // 2. Route to the screen after

      // route to next screen
      router?.routeToSomewhere()
    }
  }
}
