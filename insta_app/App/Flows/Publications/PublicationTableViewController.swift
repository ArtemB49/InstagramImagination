//
//  PublicationTableViewController.swift
//  insta_app
//
//  Created by Артем Б on 25.08.2018.
//  Copyright © 2018 Артем Б. All rights reserved.
//

import UIKit

class PublicationTableViewController: UITableViewController {
    
    let requestFactory = RequestFactory().makePublicationRequestFactory()
    
    var publications: [Publication] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        if let token = Credential.token {
            requestFactory.getSelfPublication(by: token) { response in
                switch response.result {
                case .success(let publicationResult):
                    self.updateUI(data: publicationResult)
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
    
    func updateUI(data: SelfPublicationResult) {
        self.publications = data.data
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }


    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return publications.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: "publicationCell",
            for: indexPath
            )  as! PublicationTableViewCell
        
        let publication = publications[indexPath.row]
        
        cell.ownerLabel.text = publication.user.userName
        cell.captionLabel.text = publication.caption.text
        cell.imageURL = publication.images.thumbnail.url

        return cell
    }
    
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
