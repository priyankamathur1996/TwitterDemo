
import UIKit
import TwitterKit
import TwitterCore

class ViewController: UIViewController,TWTRComposerViewControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //MARK: - This is the default Twitter button
        let logInButton = TWTRLogInButton(logInCompletion: { session, error in
            
            if (session != nil) {

                print("error:", session?.userName as Any)
                print("userID:", session?.userID as Any )
                print("authToken:", session?.authToken as Any)
                
            } else {
                print("error:",error?.localizedDescription as Any)
            }
        })
        logInButton.center = self.view.center
        self.view.addSubview(logInButton)
        
        
        print("I'm doing first commit!!!")
        
    }

    
    
    @IBAction func tapTwitter(_ sender: UIButton) {
        login()
    }
    

    //MARK:- Call this function in custom button
    func login() {
            if (TWTRTwitter.sharedInstance().sessionStore.hasLoggedInUsers()) {
                // App must have at least one logged-in user to compose a Tweet
                guard let shareImg2 = UIImage.init(named: "uk") else{
                    print("failed init share img")
                    return
                }
               
                let composer = TWTRComposerViewController.init(initialText: "UK flag picture will be tweeted", image: shareImg2, videoURL: nil)
                composer.delegate = self
                present(composer, animated: true, completion: nil)
                
            } else {
                // Log in, and then check again
                TWTRTwitter.sharedInstance().logIn { session, error in
                    if session != nil { // Log in succeeded
                        
                        guard let shareImg2 = UIImage.init(named: "usa") else{
                            print("failed init share img")
                            return
                        }
                        
                        let composer = TWTRComposerViewController.init(initialText: "USA flag picture will be tweeted", image: shareImg2, videoURL: nil)
                        composer.delegate = self
                        self.present(composer, animated: true, completion: nil)
                        
                        
                        
                    } else {
                        let alert = UIAlertController(title: "No Twitter Accounts Available", message: "You must log in before presenting a composer.", preferredStyle: .alert)
                        self.present(alert, animated: false, completion: nil)
                    }
                }
            }
    }
    
    
    
    //MARK:- TWTRComposerViewControllerDelegate
    
    func composerDidCancel(_ controller: TWTRComposerViewController) {
        print("composerDidCancel, composer cancelled tweet")
    }
    
    func composerDidSucceed(_ controller: TWTRComposerViewController, with tweet: TWTRTweet) {
        print("composerDidSucceed tweet published")
    }
    func composerDidFail(_ controller: TWTRComposerViewController, withError error: Error) {
        print("composerDidFail, tweet publish failed == \(error.localizedDescription)")
    }
    
}

