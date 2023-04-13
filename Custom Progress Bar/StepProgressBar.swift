//
//  StepProgressBar.swift
//  Custom Progress Bar
//
//  Created by Rustem Manafov on 10.04.23.
//

import Foundation
import UIKit

public class StepProgressBar: UIView {
    
    private var stackView: UIStackView!
    private var circles: [UIView] = []
    private var lines: [UIView] = []
    
    public var currentPage: Int = 0 {
        didSet {
            updateColors()
        }
    }
    
    public override func draw(_ rect: CGRect) {
        super.draw(rect)
        createStackView()
    }
    
    func createStackView() {
        stackView = UIStackView()
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.axis = .horizontal
        stackView.spacing = 0
        
        self.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1),
            stackView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 1),
            stackView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
        
        
        createCircle()
        createLine()
        createCircle()
        createLine()
        createCircle()
    }
    
    func createCircle() {
        let circleView = UIView()
        circleView.backgroundColor = .gray
        circleView.layer.cornerRadius = self.frame.size.height/2
        circleView.clipsToBounds = true
        
        stackView.addArrangedSubview(circleView)
        circleView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            circleView.widthAnchor.constraint(equalTo: circleView.heightAnchor),
        ])
        
        circles.append(circleView)
    }

    func createLine() {
        let lineFillerView = UIView()
        
        let totalWidth = self.frame.size.width
        let totalHeight = self.frame.size.height
        let count: CGFloat = 3
        let width: CGFloat = (totalWidth - totalHeight * count) / (count - 1)
        
        stackView.addArrangedSubview(lineFillerView)
        lineFillerView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            lineFillerView.widthAnchor.constraint(equalToConstant: width),
        ])
        
        let line = UIView()
        line.backgroundColor = .gray
        
        lineFillerView.addSubview(line)
        line.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            line.centerXAnchor.constraint(equalTo: lineFillerView.centerXAnchor),
            line.centerYAnchor.constraint(equalTo: lineFillerView.centerYAnchor),
            line.widthAnchor.constraint(equalTo: lineFillerView.widthAnchor),
            line.heightAnchor.constraint(equalToConstant: 4)
        ])
        
        lines.append(line)
    }
    func updateColors() {
        for i in 0..<circles.count {
            circles[i].backgroundColor = i < currentPage ? .green : .gray
        }
        for i in 0..<lines.count {
            lines[i].backgroundColor = i < currentPage ? .green : .gray
        }
    }
    
    
    @IBAction func forwardButton(_ sender: Any) {
        
        if currentPage < 4 {
            currentPage += 1
        }
    }
    
    @IBAction func backButton(_ sender: Any) {
        if currentPage > 0 {
            currentPage -= 1
        }
        
    }
    
}
