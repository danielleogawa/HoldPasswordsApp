//
//  LoginViewModel.swift
//  HoldPasswordsApp
//
//  Created by Danielle Nozaki Ogawa on 2022/07/09.
//

import Foundation
protocol LoginViewModelDelegate {
    func loginSucessed(usuario: Usuario?)
    func loginFailed()
}


class LoginViewModel {
    var delegate: LoginViewModelDelegate?
    private let service: ServiceCoreData = .init()
    
    private var usuarios: [Usuario] {
        try! service.fetchUsuario()
    }
    
    func getUsuario(email: String?, senha: String?){
        
        if let usuario = usuarios.first(where: {
            return $0.senha == senha && $0.email == email
        }) {
            delegate?.loginSucessed(usuario: usuario)
        } else {
            delegate?.loginFailed()
        }
        
    }
    
    func getUsuario(usuario: Usuario) -> SenhasViewControllerViewModel? {
        return SenhasViewControllerViewModel(usuario: usuario)
    }
    
    
}
