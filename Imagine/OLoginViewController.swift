//
//  LoginViewController.swift
//  Imagine
//
//  Created by Tejas Nikumbh on 7/16/16.
//  Copyright © 2016 Personal. All rights reserved.
//

import UIKit
import AVFoundation


class OLoginViewController: UIViewController {
    @IBOutlet weak var appName: UILabel!
    @IBOutlet weak var appNameBackground: UIView!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var emailTextField: OPaddedTextField!
    @IBOutlet weak var signUpButtonBottomConstraint: NSLayoutConstraint!
    
    var audioPlayer: AVAudioPlayer!
    
    // MARK:- IB Actions
    @IBAction func signUpTapped(sender: UIButton)
    {
//        let validEmail = OUtils.Validate.email(emailTextField.text!)
//        if !validEmail { // Guard against invalid email address
//            let dialogBox = OUtils.UI.Dialog.displayBox(message: "Please enter a valid Email Address")
//            self.presentViewController(dialogBox, animated: true, completion: nil)
//            return
//        }
//        // Setup User Details for within app use
        OUser.isSignedIn = true
        OUser.email = emailTextField.text!
        // Start the next view controller in case the email is valid
        let homeViewController: OStoryGridViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("OStoryGridViewController") as! OStoryGridViewController
        homeViewController.modalTransitionStyle = .CrossDissolve
        self.presentViewController(homeViewController, animated: true, completion: nil)
    }
    // MARK:- View Lifecycle and other View Controller based methods
    override func viewDidLoad()
    {
        super.viewDidLoad()
        setupStoryGridModel()
        setupGestureRecognizers()
        setupObservers()
        playRainSound()
    }
    override func viewDidAppear(animated: Bool)
    {
        fadeInAppName()
    }
    override func viewWillDisappear(animated: Bool)
    {
        stopRainSound()
        removeObservers()
    }
    override func preferredStatusBarStyle() -> UIStatusBarStyle
    {
        return .LightContent
    }
    // MARK:- Setup Methods
    func setupStoryGridModel() {
        // Do work to fetch stories from server.
        // Preferably call a fetcher method on the OStoryGrid model
    }
    func setupGestureRecognizers()
    {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self,
                                                          action: #selector(OLoginViewController.resignKeyboard(_:)))
        tapGestureRecognizer.cancelsTouchesInView = false
        view.addGestureRecognizer(tapGestureRecognizer)
    }
    func setupObservers()
    {
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(OLoginViewController.keyboardWillShow(_:)), name:UIKeyboardWillShowNotification, object: self.view.window)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(OLoginViewController.keyboardWillHide(_:)), name:UIKeyboardWillHideNotification, object: self.view.window)
    }
    func removeObservers()
    {
        NSNotificationCenter.defaultCenter().removeObserver(self, name: UIKeyboardWillShowNotification, object: self.view.window)
        NSNotificationCenter.defaultCenter().removeObserver(self, name: UIKeyboardWillHideNotification, object: self.view.window)
    }
    // MARK:- Selectors
    func keyboardWillHide(sender: NSNotification)
    {
        let userInfo: [NSObject : AnyObject] = sender.userInfo!
        let keyboardSize: CGSize = userInfo[UIKeyboardFrameBeginUserInfoKey]!.CGRectValue.size
        self.signUpButtonBottomConstraint.constant -= keyboardSize.height
        UIView.animateWithDuration(0.1, animations: { () -> Void in
            self.view.layoutIfNeeded()
        })
    }
    func keyboardWillShow(sender: NSNotification)
    {
        let userInfo: [NSObject : AnyObject] = sender.userInfo!
        let keyboardSize: CGSize = userInfo[UIKeyboardFrameBeginUserInfoKey]!.CGRectValue.size
        let offset: CGSize = userInfo[UIKeyboardFrameEndUserInfoKey]!.CGRectValue.size
        
        if keyboardSize.height == offset.height {
            self.signUpButtonBottomConstraint.constant += keyboardSize.height
            UIView.animateWithDuration(0.1, animations: { () -> Void in
                self.view.layoutIfNeeded()
            })
        } else {
            self.signUpButtonBottomConstraint.constant -= keyboardSize.height - offset.height
            UIView.animateWithDuration(0.1, animations: { () -> Void in
                self.view.layoutIfNeeded()
            })
        }
    }
    func resignKeyboard(gestureRecognizer: UITapGestureRecognizer? = nil)
    {
        view.endEditing(true)
    }
    // MARK:- App Effects
    func playRainSound()
    {
        guard let audioFilePath = NSBundle.mainBundle().pathForResource("rain", ofType: "mp3") else { return }
        let audioFileUrl = NSURL.fileURLWithPath(audioFilePath)
        do { audioPlayer = try AVAudioPlayer(contentsOfURL: audioFileUrl) } catch
        {
            print("Error: Sound File for rain not found")
            return
        }
        audioPlayer.play()
    }
    func stopRainSound()
    {
        audioPlayer.stop()
    }
    func fadeInAppName()
    {
        UIView.animateWithDuration(3, animations: {
            self.appName.alpha = 1.0
            self.appNameBackground.alpha = 0.4
        }) { (Bool) in
            self.appName.hidden = false
        }
    }
}

