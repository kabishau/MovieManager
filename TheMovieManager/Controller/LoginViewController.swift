import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var loginViaWebsiteButton: UIButton!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        emailTextField.text = ""
        passwordTextField.text = ""
    }
    
    @IBAction func loginTapped(_ sender: UIButton) {
        //performSegue(withIdentifier: "completeLogin", sender: nil)
        TMDBClient.getRequestToken(completion: handleRequestTokenResponse(success:error:))
    }
    
    @IBAction func loginViaWebsiteTapped() {
        TMDBClient.getRequestToken { (success, error) in
            if success {
                DispatchQueue.main.async {
                    UIApplication.shared.open(TMDBClient.Endpoints.webAuth.url, options: [:], completionHandler: nil)
                }
            }
        }
        
        //performSegue(withIdentifier: "completeLogin", sender: nil)
    }
    
    func handleRequestTokenResponse(success: Bool, error: Error?) {
        if success {
            print(TMDBClient.Auth.requestToken)
            
            DispatchQueue.main.async {
                TMDBClient.login(username: self.emailTextField.text ?? "", password: self.passwordTextField.text ?? "", completion: self.handleLoginRequest(success:error:))
            }
        }
    }
    
    func handleLoginRequest(success: Bool, error: Error?) {
        print(TMDBClient.Auth.requestToken)
        if success {
            TMDBClient.createSessionId(completion: handleSessionResponse(success:error:))
        }
    }
    
    func handleSessionResponse(success: Bool, error: Error?) {
        print(TMDBClient.Auth.sessionId)
        if success {
            DispatchQueue.main.async {
                self.performSegue(withIdentifier: "completeLogin", sender: nil)
            }
        }
    }
}
