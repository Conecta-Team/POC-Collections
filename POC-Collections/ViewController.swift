//
//  ViewController.swift
//  POC-Collections
//
//  Created by José João Silva Nunes Alves on 08/09/21.
//

import UIKit

class ViewController: UIViewController {
    
    let dados: [UIColor] = [.blue, .black, .brown, .yellow, .white, .purple]
    let rootView: View = View()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.rootView.collection.dataSource = self
        self.rootView.collection.delegate = self
        
        self.view = rootView
        
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            self.rootView.collection.scrollToItem(at: IndexPath(row: 1, section: 0), at: .centeredHorizontally, animated: true)
        }
        
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.dados.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = self.rootView.collection.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = dados[indexPath.row]
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = collectionView.frame.width * 0.4
        return CGSize(width: size, height: size)
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        print("hmm")
    }
    
//    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
//        for cell in self.rootView.collection.visibleCells {
//
//            let indexpath = self.rootView.collection.indexPath(for: cell)
//            print(cell.frame.width)
//        }
//    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let centerCell = self.rootView.collection.visibleCells.sorted(by: { cell1, cell2 in
            cell1.frame.width > cell2.frame.width
        }).first
        
        self.rootView.animateViewGrow(color: centerCell?.backgroundColor ?? UIColor.clear)
//        self.rootView.backgroundColor = centerCell?.backgroundColor
//        self.rootView.collection.backgroundColor = centerCell?.backgroundColor
        
//        UIView.animate(withDuration: 1.0, animations: {
//            self.rootView.view2.frame.size.height += 100
//            self.rootView.view2.frame.size.width += 100
//
//        })
        
//        self.rootView.collection.isHidden = true
//        self.rootView.view2.backgroundColor = centerCell?.backgroundColor
//
//        UIView.animate(withDuration: 4) {
//            self.rootView.view2.frame.size.width = self.view.frame.width
//            self.rootView.view2.frame.size.height = self.view.frame.height
//        }
//        self.rootView.view2.backgroundColor = .red
    }
}
