//
//  ViewController.swift
//  HoldPasswordsApp
//
//  Created by Danielle Nozaki Ogawa on 2022/07/08.
//

import UIKit

class CadastroViewController: UIViewController {

    @IBOutlet weak var nomeCompletoTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var senhaTextField: UITextField!
    @IBOutlet weak var cadastrarButton: UIButton!
    @IBOutlet weak var voltarButton: UIButton!
    
    let viewModel = CadastroViewControllerViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        configuraTela()
    }

    private func configuraTela(){
        nomeCompletoTextField.roundTopCorners(textField: nomeCompletoTextField, cornerRadiusNumber: 15, borderWidthNumber: 1, color: UIColor.black.cgColor)
        emailTextField.roundAllCorners(textField: emailTextField, cornerRadiusNumber: 0, borderWidthNumber: 1, color: UIColor.black.cgColor)
        senhaTextField.roundAllCorners(textField: senhaTextField, cornerRadiusNumber: 0, borderWidthNumber: 1, color: UIColor.black.cgColor)
        cadastrarButton.roundBottomCorners(button: cadastrarButton, cornerRadiusNumber: 15, borderWidthNumber: 1)
        voltarButton.roundAllCorners(button: voltarButton, cornerRadiusNumber: 20, borderWidthNumber: 0)
    }
    
    
    @IBAction func cadastrarButtonAction(_ sender: Any) {
        viewModel.addNovoUsuario(nome: nomeCompletoTextField.text, email: emailTextField.text, senha: senhaTextField.text)
    }
    
    @IBAction func voltarButtonAction(_ sender: Any) {
        dismiss(animated: true)
    }
}

extension CadastroViewController: CadastroViewModelDelegate{
    func cadastroFailed() {
        print("cadastro erro")
    }
    
    func cadastroEfetuadoComSucesso(usuario: Usuario) {
        performSegue(withIdentifier: "cadastroSucessed", sender: usuario)
    }
}
