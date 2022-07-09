//
//  CadastroViewControllerViewModel.swift
//  HoldPasswordsApp
//
//  Created by Danielle Nozaki Ogawa on 2022/07/09.
//

import Foundation
protocol CadastroViewModelDelegate {
    func cadastroEfetuadoComSucesso(usuario: Usuario)
    func cadastroFailed()
}

class CadastroViewControllerViewModel {
    
    var delegate: CadastroViewModelDelegate?
    private let service: ServiceCoreData = .init()
    
    private var usuarios: [Usuario] {
        try! service.fetchUsuario()
    }
    
    func addNovoUsuario(nome: String?, email: String?, senha: String?){
        guard let nome = nome,
              let email = email,
              let senha = senha
            else {
            return
        }
        service.saveUsuario(nome: nome, senha: senha, email: email)
        verificaUsuarioLogado(email: email, senha: senha)
        
    }
    

    
    private func verificaUsuarioLogado(email: String, senha: String?){
        if let usuario = usuarios.first(where: {
            return $0.senha == senha && $0.email == email
        }) {
            delegate?.cadastroEfetuadoComSucesso(usuario: usuario)
        } else {
            delegate?.cadastroFailed()
        }
    }
    
}
