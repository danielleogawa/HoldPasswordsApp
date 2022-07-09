//
//  ServiceCoreData.swift
//  HoldPasswordsApp
//
//  Created by Danielle Nozaki Ogawa on 2022/07/08.
//

import Foundation
import CoreData
import UIKit

class ServiceCoreData {
    // MARK: - metodos privados
    private let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    private func saveContext(){
        let appDelegate = (UIApplication.shared.delegate as! AppDelegate)
        appDelegate.saveContext()
    }
    
    
    //MARK: - Armazenamento do usuario
    func saveUsuario(nome: String, senha: String, email: String) {
        let usuario = Usuario(context: context)
        usuario.nome = nome
        usuario.senha = senha
        usuario.email = email
        saveContext()
    }
    
    func fetchUsuario() throws -> [Usuario] {
        let usuarios = try context.fetch(Usuario.fetchRequest())
        return usuarios
    }
    
    //MARK: - Armazenamento de senhas
    
    func saveSenha(usuario: Usuario, local: String, senha: String){
        let senhaSalva = Senhas(context: context)
        senhaSalva.senha = senha
        senhaSalva.local = local
        usuario.addToSenhas(senhaSalva)
        saveContext()
    }
    
    func fetchSenhasSalvas() throws -> [Senhas] {
        let senhas = try context.fetch(Senhas.fetchRequest())
        return senhas
    }
    
}
