//
//  LoadingScreenModel.swift
//  Cumulus
//
//  Created by Joseph Szafarowicz on 5/27/20.
//  Copyright © 2020 Joseph Szafarowicz. All rights reserved.
//

import Foundation
import UIKit

var newLoad: Bool = false
var loadFrame: CGRect = CGRect(x: 0, y: 0, width: 815, height: 815)
let loadingView: UIView = UIView(frame: loadFrame)
let activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
