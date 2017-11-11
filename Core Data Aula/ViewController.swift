//
//  ViewController.swift
//  Core Data Aula
//
//  Created by Bruno Lopes de Mello on 09/11/2017.
//  Copyright © 2017 Bruno Lopes de Mello. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        //criar entidade
        let usuario = NSEntityDescription.insertNewObject(forEntityName: "Usuario", into: context)
        
        //configura objeto
        usuario.setValue("Anna Carolina", forKey: "nome")
        usuario.setValue(24, forKey: "idade")
        usuario.setValue("annacarolina", forKey: "login")
        usuario.setValue("bacon", forKey: "senha")
        
        //salvar ou persistir o objeto
        do {
            try context.save()
            print("Dados salvos com sucesso")
        } catch  {
            print("Erro ao salvar os dados")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

