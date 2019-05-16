import UIKit

extension UIViewController {
    
    @IBAction func logoutTapped(_ sender: UIBarButtonItem) {
        
        DispatchQueue.main.async {
            TMDBClient.logout {
                self.dismiss(animated: true, completion: nil)
            }
        }
    }
}
