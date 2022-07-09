//
//  SenhasViewControllerViewModel.swift
//  HoldPasswordsApp
//
//  Created by Danielle Nozaki Ogawa on 2022/07/09.
//

import Foundation
protocol SenhaViewModelDelegate {
    func atualizaTableView()
}

class SenhasViewControllerViewModel {
    var delegate: SenhaViewModelDelegate?
    
    private let service: ServiceCoreData = .init()
    
    var usuario: Usuario?
    
    init(usuario: Usuario){
        self.usuario = usuario
    }
    
    
    private var loadSenhas: [Senhas] {
        usuario?.senhaArray ?? []
    }
    
    func getQuantidadeDeSenhas() -> Int {
        return loadSenhas.count
    }
    
    func getSenha(posicao: Int) -> Senhas{
        return loadSenhas[posicao]
    }
    
    func addSenha(local: String?, senha: String?) {
        guard let local = local, let senha = senha else {
            return
        }
        
        service.saveSenha(usuario: usuario!, local: local, senha: senha)
        delegate?.atualizaTableView()
    }
    
}

