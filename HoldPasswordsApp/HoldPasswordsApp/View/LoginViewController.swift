//
//  LoginViewController.swift
//  HoldPasswordsApp
//
//  Created by Danielle Nozaki Ogawa on 2022/07/08.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var senhaTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var novoCadastroButton: UIButton!
    
    
    let viewModel = LoginViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        styleTextField()
        viewModel.delegate = self
    }
    
    private func styleTextField(){
        emailTextField.roundTopCorners(textField: emailTextField, cornerRadiusNumber: 15, borderWidthNumber: 1, color: UIColor.black.cgColor)
        senhaTextField.roundAllCorners(textField: senhaTextField, cornerRadiusNumber: 0, borderWidthNumber: 1, color: UIColor.black.cgColor)
        loginButton.roundBottomCorners(button: loginButton, cornerRadiusNumber: 15, borderWidthNumber: 1)
        novoCadastroButton.roundAllCorners(button: novoCadastroButton, cornerRadiusNumber: 20, borderWidthNumber: 1)
    }
    
    @IBAction func loginButtonAction(_ sender: Any) {
        viewModel.getUsuario(email: emailTextField.text, senha: senhaTextField.text)
        
    }
    
    @IBAction func novoCadastroButtonAction(_ sender: Any) {
        performSegue(withIdentifier: "cadastrar", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let senhasVC = segue.destination as? SenhasViewController
        let usuario = sender as! Usuario
        senhasVC?.viewModel = viewModel.getUsuario(usuario: usuario)
    }
}

extension LoginViewController: LoginViewModelDelegate {
    func loginSucessed(usuario: Usuario?) {
        performSegue(withIdentifier: "loginSucessed", sender: usuario)
    }
    
    func loginFailed() {
        let alerta = UIAlertController(title: "Usuário incorreto", message: "Verifique se sua senha ou email está correto", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default)
        
        alerta.addAction(okAction)
        present(alerta, animated: true)
    }
    
    
}
