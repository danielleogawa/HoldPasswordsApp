//
//  SenhasViewController.swift
//  HoldPasswordsApp
//
//  Created by Danielle Nozaki Ogawa on 2022/07/08.
//

import UIKit

class SenhasViewController: UIViewController {
    @IBOutlet weak var novaSenhaButton: UIButton!

    @IBOutlet weak var senhasTableView: UITableView!
    @IBOutlet weak var pesquisarTextField: UITextField!
    
    var viewModel: SenhasViewControllerViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel?.delegate = self
        senhasTableView.dataSource = self
        senhasTableView.delegate = self
        configuraTela()
    }
    
    private func configuraTela(){
        novaSenhaButton.roundAllCorners(button: novaSenhaButton, cornerRadiusNumber: 20, borderWidthNumber: 0)
        pesquisarTextField.roundAllCorners(textField: pesquisarTextField, cornerRadiusNumber: 20, borderWidthNumber: 1, color: UIColor.gray.cgColor)
    }
    @IBAction func addNovaSenha(_ sender: Any) {
        let alert = UIAlertController(title: "Adicionar Nova Senha", message: "Preencha os dados", preferredStyle: .alert)
        
        var textFieldLocal = UITextField()
        var textFieldSenha = UITextField()
        
        alert.addTextField { textField in
            textField.placeholder = "site"
            textFieldLocal = textField
        }
        alert.addTextField { textField in
            textField.placeholder = "senha"
            textFieldSenha = textField
        }
        
        let adicionar = UIAlertAction(title: "Salvar", style: .default) { action in
            self.viewModel?.addSenha(local: textFieldLocal.text, senha: textFieldSenha.text)
        }
        
        alert.addAction(adicionar)
        present(alert, animated: true)
    }
    
}

extension SenhasViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel?.getQuantidadeDeSenhas() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "senhaCell", for: indexPath) as? SenhaTableViewCell
        let senha = viewModel?.getSenha(posicao: indexPath.row)
        
        cell?.configuraCelula(senha: senha)
        
        return cell ?? UITableViewCell()
    }
    
    
}

extension SenhasViewController: UITableViewDelegate {
    
}

extension SenhasViewController: SenhaViewModelDelegate {
    func atualizaTableView() {
        senhasTableView.reloadData()
    }
    
}
