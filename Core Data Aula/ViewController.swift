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
        
        let requisicao = NSFetchRequest<NSFetchRequestResult>(entityName: "Produto")
        
        //ordenar de A-Z ou Z-A
        let ordenacaoAZ = NSSortDescriptor(key: "descricao", ascending: true)
//        let ordenacaoPreco = NSSortDescriptor(key: "preco", ascending: false)
        
        //aplicar filtros
//        let predicate = NSPredicate(format: "descricao == %@", "Agua")
        let filtroDescricao = NSPredicate(format: "descricao contains [c] %@", "gu")
//        let predicate = NSPredicate(format: "descricao beginswith [c] %@", "g")
        let filtroPreco = NSPredicate(format: "preco >= %@", "5.00")
        
        let combinacao = NSCompoundPredicate(andPredicateWithSubpredicates: [filtroDescricao,filtroPreco])
        
        
        //Aplicar
        requisicao.sortDescriptors = [ordenacaoAZ]
        requisicao.predicate = combinacao
        
        do {
            let produtos = try context.fetch(requisicao)
            
            if produtos.count > 0 {
                var _contador :Int = 0
                
                for produto in produtos as! [NSManagedObject] {
                    let descricaoProduto = produto.value(forKey: "descricao")
                    let corProduto = produto.value(forKey: "cor")
                    let precoProduto = produto.value(forKey: "preco")
                    
                    print("Produto \(_contador+1):\nDescricao: \(descricaoProduto ?? "Sem Descricao")\nCor: \(corProduto ?? "Sem Cor")\nPreco: \(precoProduto ?? 0)\n---------------------")
                    
                    _contador += 1
                }
                
            } else {
                print("Nenhum produto encontrado")
            }
        } catch {
            print("Erro ao recuperar produtos")
        }
        
//        //criar objeto
//        let produto = NSEntityDescription.insertNewObject(forEntityName: "Produto", into: context)
//
//        produto.setValue("Agua", forKey: "descricao")
//        produto.setValue("prata", forKey: "cor")
//        produto.setValue(5.00, forKey: "preco")
//
//        do {
//            try context.save()
//            print("Dados salvos com sucesso")
//        } catch {
//            print("Erro ao salvar")
//        }
        
//        //criar requisicao
//        let requisicao = NSFetchRequest<NSFetchRequestResult>(entityName: "Usuario")
//
//        do {
//            let usuarios = try context.fetch(requisicao)
//
//            if usuarios.count > 0 {
//                var _contador : Int = 0
//                for usuario in usuarios as! [NSManagedObject]{
//                    let nomeUsuario = usuario.value(forKey: "nome")
//                    let idadeUsuario = usuario.value(forKey: "idade")
//                    let loginUsuario = usuario.value(forKey: "login")
//                    let senhaUsuario = usuario.value(forKey: "senha")
//
//                    print("Usuario \(_contador+1):\nNome: \(nomeUsuario ?? "Nome de usuario nao encontrado")\nIdade: \(idadeUsuario ?? "Idade de usuario nao encontrada")\nLogin: \(loginUsuario ?? "Login de usuario nao encontrado")\n" +
//                        "Senha: \(senhaUsuario ?? "Senha de usuario nao encontrada")\n-------------------")
//                    _contador += 1
//                }
//
//            } else {
//                print("Nenhum usuario encontrado")
//            }
//        } catch {
//            print("Erro ao recuperar os usuarios")
//        }
        
//        //criar entidade
//        let usuario = NSEntityDescription.insertNewObject(forEntityName: "Usuario", into: context)
//
//        //configura objeto
//        usuario.setValue("figueiredo", forKey: "nome")
//        usuario.setValue(42, forKey: "idade")
//        usuario.setValue("vagabundo", forKey: "login")
//        usuario.setValue("moveisconquista", forKey: "senha")
//
//        //salvar ou persistir o objeto
//        do {
//            try context.save()
//            print("Dados salvos com sucesso")
//        } catch  {
//            print("Erro ao salvar os dados")
//        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

