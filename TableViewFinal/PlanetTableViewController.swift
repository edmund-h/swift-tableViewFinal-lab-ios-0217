//
//  PlanetTableViewController.swift
//  TableViewFinal
//
//  Created by James Campagno on 6/17/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class PlanetTableViewController: UITableViewController {
    let planetCellIdentifier = "PlanetCell"
    var planets: [Planet] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        generatePlanetInfo()
    }
    
    func generatePlanetInfo () {
        let mercury = Planet (name: "Mercury", numberOfMoons: 0, fullOrbit: 0, facts: [
            "Mercury orbits the sun so quickly that even though it rotates on its axis one side always faces the sun."
            ])
        let venus = Planet (name: "Venus", numberOfMoons: 0, fullOrbit: 0, facts: [
            "Venus' atmosphere is so thick that even though Mercury is closer to the sun, Venus' surface is hotter.",
            "Venus is so hot that its rock crust has the texture of sponge cake.",
            "Different as it seems, Venus is considered a 'sister planet' to Earth because of its mass and composition."
            ])
        let earth = Planet (name: "Earth", numberOfMoons: 1, fullOrbit: 365.26, facts:[
            "Earth is the only planet not named after a god.",
            "Earth has a powerful magnetic field.",
            "Earth was once believed to be the center of the universe."
            ])
        let mars = Planet(name: "Mars", numberOfMoons: 2, fullOrbit: 687, facts: [
            "Mars and Earth have approximately the same landmass.",
            "Mars is home to the tallest mountain in the solar system.",
            "Pieces of Mars have fallen to Earth." //PANSPERMIA!!
            ])
        
        planets = [earth, mars]
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return planets.count 
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: planetCellIdentifier, for: indexPath)
            as! PlanetTableViewCell
        let planet = planets[indexPath.row]
        
        cell.planetNameLabel.text = planet.name
        cell.numberOfMoonsLabel.text = "\(planet.numberOfMoons)"
        cell.numberOfDaysFullOrbitLabel.text = "\(planet.fullOrbit)"
        cell.numberOfFacts.text = "\(planet.facts.count) Facts..."
        cell.planetIndex = indexPath.row
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "PlanetToFact" else {return}
        let origin = sender as! PlanetTableViewCell
        let destination = segue.destination as! FactTableViewController
        destination.planet = planets[origin.planetIndex]
        
    }
}
