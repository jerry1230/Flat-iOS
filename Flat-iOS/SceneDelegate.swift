//
//  SceneDelegate.swift
//  Flat-iOS
//
//  Created by LM on 2021/5/12.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    @available(iOS 13.0, *)
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        
        let windowScene = scene as! UIWindowScene
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.backgroundColor = .white
        self.window?.windowScene = windowScene
        let mainStoryboardFileName = Bundle.main.infoDictionary?["UIMainStoryboardFile"] as! String
        let mainStoryBoard = UIStoryboard(name: mainStoryboardFileName, bundle: Bundle.main)
        let isLogin = false
        if isLogin {
            self.window?.rootViewController = mainStoryBoard.instantiateInitialViewController()
        }else{
            self.window?.rootViewController = FlatLoginVC()
        }
        self.window?.makeKeyAndVisible()
        
        // Get URL components from the incoming user activity.
        guard let userActivity = connectionOptions.userActivities.first,
            userActivity.activityType == NSUserActivityTypeBrowsingWeb,
            let incomingURL = userActivity.webpageURL,
            let components = NSURLComponents(url: incomingURL, resolvingAgainstBaseURL: true) else {
            return
        }

        // Check for specific URL components that you need.
        guard let path = components.path,
            let params = components.queryItems else {
            return
        }
        print("path = \(path)")

        if let albumName = params.first(where: { $0.name == "albumname" })?.value,
            let photoIndex = params.first(where: { $0.name == "index" })?.value {
            
            print("album = \(albumName)")
            print("photoIndex = \(photoIndex)")
        } else {
            print("Either album name or photo index missing")
        }
//        guard let _ = (scene as? UIWindowScene) else { return }

    }

    @available(iOS 13.0, *)
    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    @available(iOS 13.0, *)
    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    @available(iOS 13.0, *)
    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    @available(iOS 13.0, *)
    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    @available(iOS 13.0, *)
    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }
    
    @available(iOS 13.0, *)
    func goToRootVC(_ toRoot:Bool) {
        let mainStoryboardFileName = Bundle.main.infoDictionary?["UIMainStoryboardFile"] as! String
        let mainStoryBoard = UIStoryboard(name: mainStoryboardFileName, bundle: Bundle.main)
        self.window?.rootViewController = toRoot ? mainStoryBoard.instantiateInitialViewController():FlatLoginVC()
        self.window?.makeKeyAndVisible()
    }
}

