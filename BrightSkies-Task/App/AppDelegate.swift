//
//  AppDelegate.swift
//  BrightSkies-Task
//
//  Created by Amir Samir on 31/05/2021.
//

import UIKit
import RxSwift
import CoreData

@UIApplicationMain

class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    var newBackImage = UIImage(named: "coloredBackArrow")
    private let disposeBag = DisposeBag()
    
    lazy var navigationController: UINavigationController = {
        let navigationController = UINavigationController()
        navigationController.navigationBar.isTranslucent = false
        navigationController.isNavigationBarHidden = true
        navigationController.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController.navigationBar.shadowImage = UIImage()
        navigationController.navigationBar.tintColor = .blue
        navigationController.navigationBar.backIndicatorImage = newBackImage
        navigationController.navigationBar.backIndicatorTransitionMaskImage = newBackImage
        return navigationController
    }()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Set navigation controller as root view
        if #available(iOS 13.0, *) {
            window?.overrideUserInterfaceStyle = .light
        }
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = self.navigationController
        setRoot(window: window)
        return true
    }
    
    
    
    // MARK: - Core Data stack
    
    lazy var applicationDocumentsDirectory: URL = {
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return urls.last!
    }()
    
    lazy var managedObjectModel: NSManagedObjectModel = {
        let modelURL = Bundle.main.url(forResource: "BrightSkies-Task", withExtension: "momd")!
        return NSManagedObjectModel(contentsOf: modelURL)!
    }()
    
    lazy var persistentStoreCoordinator: NSPersistentStoreCoordinator = {
        let coordinator = NSPersistentStoreCoordinator(managedObjectModel: self.managedObjectModel)
        let url = self.applicationDocumentsDirectory.appendingPathComponent("BrightSkies-Task.sqlite")
        var failureReason = "There was an error creating or loading the application's saved data."
        
        do {
            try coordinator.addPersistentStore(ofType: NSSQLiteStoreType, configurationName: nil, at: url, options: nil)
        } catch {
            var dict = [String: Any]()
            dict[NSLocalizedDescriptionKey] = "Failed to initialize the application's saved data"
            dict[NSLocalizedFailureReasonErrorKey] = failureReason
            
            dict[NSUnderlyingErrorKey] = error as NSError
            let wrappedError = NSError(domain: "YOUR_ERROR_DOMAIN", code: 9999, userInfo: dict)
            NSLog("Unresolved error \(wrappedError), \(wrappedError.userInfo)")
            abort()
        }
        
        return coordinator
    }()
    
    lazy var managedObjectContext: NSManagedObjectContext = {
        let coordinator = self.persistentStoreCoordinator
        var managedObjectContext = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
        managedObjectContext.persistentStoreCoordinator = coordinator
        return managedObjectContext
    }()
    
}

