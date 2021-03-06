//
//  AppDelegate.swift
//  plusOne
//
//  Created by mona zheng on 6/8/21.
//

import UIKit
import CoreData
import GoogleSignIn
import FirebaseFirestore
import FirebaseCore


@main
class AppDelegate: UIResponder, UIApplicationDelegate, GIDSignInDelegate {
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!,
              withError error: Error!) {
        if let error = error {
            if (error as NSError).code == GIDSignInErrorCode.hasNoAuthInKeychain.rawValue {
                print("The user has not signed in before or they have since signed out.")
            } else {
                print("\(error.localizedDescription)")
            }
            return
        }
        // Perform any operations on signed in user here.
        let userId = user.userID                  // For client-side use only!
        let idToken = user.authentication.idToken! // Safe to send to the server
        let email = user.profile.email!
        
        createOrRetrieveUserAccountInfo(email: email, tokenId: idToken)
        
        // redirects to signed in user's view controller
        let mainStoryboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = mainStoryboard.instantiateViewController(withIdentifier: K.userFeedVCId)
        UIApplication.shared.windows.first?.rootViewController? = vc
        UIApplication.shared.windows.first?.makeKeyAndVisible()
        
    }
    
    func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!,
              withError error: Error!) {
        // Perform any operations when the user disconnects from app here.
        
    }
    
    // Check if user info exists in database
    func createOrRetrieveUserAccountInfo(email: String, tokenId: String){
        let db = Firestore.firestore()
        let userRef = db.collection(K.FStore.usersCollection).whereField(K.User.email, isEqualTo: email)
        
        userRef.getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            }
            
            if let user = querySnapshot, (querySnapshot?.documents.count)! > 0 {
                // retrieve user's info that was previously saved from previous log in
                let document = user.documents[0]
                User.email = (document.data()[K.User.email] as! String)
                
                let choices = document.data()[K.User.reacted] as! Array<Choice>
                for choice in choices {
                    User.savePollIdAndUserChoiceInfo(choiceInfo: choice)
                }
            } else {
                // save new user info
                User.email = email
                db.collection(K.FStore.usersCollection).document().setData([
                    K.User.email : email,
                    K.User.reacted : []
                ]) { err in
                    if let err = err {
                        print("Error writing document: \(err)")
                    } else {
                        print("Document successfully written!")
                    }
                }
            }
        }
    }
    
    // Get clientID
    private var apiKey: String {
        get {
            // 1
            guard let filePath = Bundle.main.path(forResource: "apps.googleusercontent.com", ofType: "plist") else {
                fatalError("Couldn't find file 'apps.googleusercontent.com.plist'.")
            }
            // 2
            let plist = NSDictionary(contentsOfFile: filePath)
            guard let value = plist?.object(forKey: "CLIENT_ID") as? String else {
                fatalError("Couldn't find key 'CLIENT_ID' in 'apps.googleusercontent.com.plist'.")
            }
            return value
        }
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // FireBase Database
        FirebaseApp.configure()
        let db = Firestore.firestore()
        
        print("THIS IS THE DATABASE:", db) // silence warning
        
        
        
        // Initialize sign-in
        GIDSignIn.sharedInstance().clientID = apiKey
        GIDSignIn.sharedInstance().delegate = self
        return true
    }
    
    @available(iOS 9.0, *)
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any]) -> Bool {
        return GIDSignIn.sharedInstance().handle(url)
    }
    
    func application(_ application: UIApplication,
                     open url: URL, sourceApplication: String?, annotation: Any) -> Bool {
        return GIDSignIn.sharedInstance().handle(url)
    }
    
    // MARK: UISceneSession Lifecycle
    
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
    
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    
    // MARK: - Core Data stack
    
    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
         */
        let container = NSPersistentContainer(name: "plusOne")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    // MARK: - Core Data Saving support
    
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
}

