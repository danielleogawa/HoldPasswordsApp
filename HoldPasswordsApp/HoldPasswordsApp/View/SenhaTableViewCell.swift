//
//  SenhaTableViewCell.swift
//  HoldPasswordsApp
//
//  Created by Danielle Nozaki Ogawa on 2022/07/08.
//

import UIKit

class SenhaTableViewCell: UITableViewCell {

    @IBOutlet weak var siteLabel: UILabel!
    @IBOutlet weak var senhaLabel: UILabel!
    @IBOutlet weak var eyeButton: UIButton!
    
    private var senhaUniversal: Senhas?
    private var senhaIsHidden: Bool = true
    
    @IBAction func verSenhaButtonPressed(_ sender: Any) {
        if senhaIsHidden {
            senhaIsHidden = false
            atualizaSenha()
            eyeButton.setImage(UIImage(systemName: "eye"), for: .normal)
        } else {
            senhaIsHidden = true
            atualizaSenha()
            eyeButton.setImage(UIImage(systemName: "eye.slash"), for: .normal)
        }

    }
    
    func configuraCelula(senha: Senhas?) {
        senhaUniversal = senha
        siteLabel.text = senhaUniversal?.local
        atualizaSenha()
        eyeButton.roundAllCorners(button: eyeButton, cornerRadiusNumber: 15, borderWidthNumber: 0)
    }
    
    func atualizaSenha(){
        if senhaIsHidden {
            senhaLabel.text = "*****"
        } else {
            senhaLabel.text = senhaUniversal?.senha
        }
    }
}
