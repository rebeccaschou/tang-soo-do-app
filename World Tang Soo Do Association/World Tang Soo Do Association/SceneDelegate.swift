//
//  SceneDelegate.swift
//  World Tang Soo Do Association
//
//  Created by Rebecca Chou on 4/4/22.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    // Following function from https://fluffy.es/how-to-transition-from-login-screen-to-tab-bar-controller/
    func changeRootViewController(_ vc: UIViewController, animated: Bool = true) {
        guard let window = self.window else { // Check to see that window value is not nil
            return
        }
        
        window.rootViewController = vc // Changes the root view controller to specified view controller

        UIView.transition(with: window, duration: 0.5, options: [.transitionFlipFromLeft], animations: nil, completion: nil) // Add animation to root view controller change (can choose transition style in brackets)
    }

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let _ = (scene as? UIWindowScene) else { return }
        
        // Below in function from https://fluffy.es/how-to-transition-from-login-screen-to-tab-bar-controller/
        let storyboard = UIStoryboard(name: "SyllabusViewController", bundle: nil) // Refer to main storyboard (replace "Main")
        
        // If the user is logged in
        if let loggedUsername = UserDefaults.standard.string(forKey: "username") {
            let mainTabBarController = storyboard.instantiateViewController(identifier: "MainTabBarController") // Instantiate the navigation controller (which contains the main app) and set it as root view controller
            window?.rootViewController = mainTabBarController
        } else {
            // If the user is not logged in
            let loginNavController = storyboard.instantiateViewController(identifier: "LoginNavigationController") // Instantiate the navigation controller (which contains the login screen) and set it as root view controller
            window?.rootViewController = loginNavController
        }
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.

        // Save changes in the application's managed object context when the application transitions to the background.
        (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
    }


}

