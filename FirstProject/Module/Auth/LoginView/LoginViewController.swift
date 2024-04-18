//
//  LoginViewController.swift
//  FirstProject
//
//  Created by TeamX Tec on 14/04/2024.
//

import UIKit

class LoginViewController: UIViewController, LoginViewModelDelegate {
   

    @IBOutlet weak var emailTxtField: AppCustomTextField!
    @IBOutlet weak var passwordTxtField: AppCustomTextField!
    var loginViewModel = LoginViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setTextFields()
        loginViewModel.delegate = self
        setNavigationBar()
    }
    func setTextFields(){
        loginViewModel.emailTextField = emailTxtField
        loginViewModel.passwordTextField = passwordTxtField
        self.passwordTxtField.isSecureTextEntry = true
        self.passwordTxtField.keyboardType = .alphabet
    }
    func variableDidChange(newValue: Bool) {
        if newValue {
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "ProfileViewController") as! ProfileViewController
            navigationController?.pushViewController(vc, animated: true)
              } else {
                  print("Variable is false")
                  // Update the UI or perform any necessary actions
              }
    }
    func setNavigationBar() {
        
        self.navigationController?.isNavigationBarHidden = false
        Helper2.getInstance.setNavigationBar(leftBarItem: self.backBarButton(),title: "", isTransparent: true, vc: self)
    }
    @IBAction func SignInAction(_ sender: Any) {
        loginViewModel.performApi()
    }
   
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
