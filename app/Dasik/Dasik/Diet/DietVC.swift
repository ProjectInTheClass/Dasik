//
//  DietVC.swift
//  Dasik
//
//  Created by 희준이 on 2021/06/04.
//

import Foundation
import SwiftUI

var dateSelected : String = ""

class DietVC: UIHostingController<DetailView> {
    
  init() {
    
    let view = DetailView()
    super.init(rootView: view)

  }

  @objc required dynamic init?(coder aDecoder: NSCoder) {

    fatalError("init(coder:) has not been implemented")
  }

}
