import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        
        let components = URLComponents(url: url, resolvingAgainstBaseURL: true)
        if components?.scheme == "themoviemanager" && components?.path == "authenticate" {
            
            // reinstanciate rootVC after redirection back? just initialization doesn't work
            let loginVC = window?.rootViewController as! LoginViewController
            
            TMDBClient.createSessionId(completion: loginVC.handleSessionResponse(success:error:))
        }
        return true
    }
    
}

