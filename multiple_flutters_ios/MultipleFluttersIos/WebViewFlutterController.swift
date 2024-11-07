//
//  WebViewFlutterController.swift
//  MultipleFluttersIos
//
//  Created by Arthur Monteiro Alves Melo on 26/09/24.
//

import UIKit
import Flutter
import FlutterPluginRegistrant

class WebViewFlutterController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemRed
        let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
        let flutterEngine = appDelegate.engines.makeEngine(withEntrypoint: "startWebviewFlutter", libraryURI: nil)
        GeneratedPluginRegistrant.register(with: flutterEngine)

        
        let flutterViewController = FlutterViewController(engine: flutterEngine, nibName: nil, bundle: nil)
                
                flutterViewController.isModalInPresentation = true

                addChild(flutterViewController)
                
                guard let flutterView = flutterViewController.view else { return }
                
                print("got here to configure the view")
                
                flutterView.backgroundColor = UIColor.white
                // allows constraint manipulation
                flutterView.translatesAutoresizingMaskIntoConstraints = false
                
                view.addSubview(flutterView)
                
                // set the constraints (edge-to-edge) to the flutter view
                let constraints = [
                    flutterView.topAnchor.constraint(equalTo: view.topAnchor),
                    flutterView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                    flutterView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                    flutterView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
                ]
                
                // apply (activate) the constraints
                NSLayoutConstraint.activate(constraints)
                
                flutterViewController.didMove(toParent: self)
                
                // updates the view with configured layout
                flutterView.layoutIfNeeded()
        
    }
}
