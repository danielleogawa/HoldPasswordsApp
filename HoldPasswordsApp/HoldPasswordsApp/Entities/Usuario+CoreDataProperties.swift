//
//  Usuario+CoreDataProperties.swift
//  HoldPasswordsApp
//
//  Created by Danielle Nozaki Ogawa on 2022/07/08.
//
//

import Foundation
import CoreData


extension Usuario {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Usuario> {
        return NSFetchRequest<Usuario>(entityName: "Usuario")
    }

    @NSManaged public var nome: String?
    @NSManaged public var email: String?
    @NSManaged public var senha: String?
    @NSManaged public var senhas: NSSet?
    
    public var wrappedNome: String {
        nome ?? "sem nome"
    }
    
    public var wrappedEmail: String {
        email ?? "sem email"
    }
    
    public var wappedSenhaUsuario: String {
        senha ?? ""
    }
    
    public var senhaArray: [Senhas] {
        let set = senhas as? Set<Senhas> ?? []
        
        return set.sorted {
            $0.wrappedSenha < $1.wrappedSenha
        }
    }

}

// MARK: Generated accessors for senhas
extension Usuario {

    @objc(addSenhasObject:)
    @NSManaged public func addToSenhas(_ value: Senhas)

    @objc(removeSenhasObject:)
    @NSManaged public func removeFromSenhas(_ value: Senhas)

    @objc(addSenhas:)
    @NSManaged public func addToSenhas(_ values: NSSet)

    @objc(removeSenhas:)
    @NSManaged public func removeFromSenhas(_ values: NSSet)

}

extension Usuario : Identifiable {

}
