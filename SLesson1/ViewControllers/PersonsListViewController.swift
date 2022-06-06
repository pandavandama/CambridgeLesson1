//
//  PersonsListViewController.swift
//  SLesson1
//
//  Created by Константин Кифа on 06.06.2022.
//

import UIKit
import simd

class PersonsListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    
    
    
    
    
    var personsList: PersonsList?
    var cellCount: Int = 0
    
    
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(PersonsElementTableViewCell.nib(), forCellReuseIdentifier: PersonsElementTableViewCell.ID)
        tableView.delegate = self
        tableView.dataSource = self
        
        let sharedSession = URLSession.shared
        
        if let url = URL(string: "https://swapi.dev/api/people/"){
            let request = URLRequest(url: url)
            
            let dataTask = sharedSession.dataTask(with: request,  completionHandler : {(data, response, error) -> Void in
                
                if let data = data{
                    DispatchQueue.main.async {
                        
                        let json = String(data: data, encoding: .utf8)!
                        let decoder = JSONDecoder()
                        do{
                            let res = try decoder.decode(PersonsList.self, from: json.data(using: .utf8)!)
                            
                            self.personsList = res
                            print(self.personsList!.results)
                            self.cellCount = self.personsList!.results.count
                            self.tableView.reloadData()
                        }catch{
                            print(error)
                        }
                    }
                }
            })
            dataTask.resume()
        }
        
        
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 170
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("calling")
        return cellCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: PersonsElementTableViewCell.ID, for: indexPath) as! PersonsElementTableViewCell
        
        if(personsList != nil){
            do{
                cell.nameLabel!.text = personsList?.results[indexPath.row].name
            }
            catch{
                print(error)
            }
        }
        
        return cell
    }
    
    
}

struct PersonsList : Decodable{
    let count: Int
    let next: String
    let previous: Int?
    let results: [PersonsResult]
    
    
}
struct PersonsResult : Decodable{
    let name: String
    let height: String
    let mass: String
    let hair_color: String
    let skin_color: String
    let eye_color: String
    let birth_year: String
    let gender: String
    let homeworld: String
    let films: [String]
    let species: [String]
    let vehicles: [String]
    let starships: [String]
    let created: String
    let edited: String
    let url: String
    
}
