//
//  SceneDelegate.swift
//  eDoctorIOS
//
//  Created by MeoMeo on 04/03/2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }

        print("1")
        let isLogged = UserDefaults.standard.bool(forKey: UserDefaultKey.IsLogged)
        if isLogged {
            // do some thing
            print("User logged")
        } else {
            // Launch LoginScreen
            self.window = UIWindow(windowScene: windowScene)
            let vc = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "Root")
            self.window?.rootViewController = vc
            self.window?.makeKeyAndVisible()
            self.window?.rootViewController?.performSegue(withIdentifier: SegueConst.RootToLogin, sender: self)
        }
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        //
        print("2")
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        print("3")
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        print("4")
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        print("5")
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        print("6")
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.

        // Save changes in the application's managed object context when the application transitions to the background.
        (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
    }
}
