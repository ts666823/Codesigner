//
//  AlgotithmMainViewController+collectionView.swift
//  Codesigner
//
//  Created by 唐烁 on 2021/9/9.
//

import UIKit

extension AlgorithmMainViewController:UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView ==  algorithmCollectionView{
            return algorithmData.count
        }
        else
        {
            return dataStructureData.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView ==  algorithmCollectionView{
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AlgorithmCell", for: indexPath) as? AlgorithmCollectionViewCell else {
                fatalError()
            }
            cell.imageView.frame.size = cell.frame.size
            cell.imageView.image = UIImage(named: algorithmData[indexPath.row].imageName)
            cell.title.text = algorithmData[indexPath.row].title
            return cell
        }
        else
        {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DataStructorCell", for: indexPath) as? AlgorithmCollectionViewCell else {
                fatalError()
            }
            cell.imageView.frame.size = cell.frame.size
            cell.imageView.image = UIImage(named: dataStructureData[indexPath.row].imageName)
            cell.title.text = dataStructureData[indexPath.row].title
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        isAlgorithm = true
        if(collectionView == dataStructorCollectionView)
        {
            isAlgorithm = false
        }
        chooseRow = indexPath.row
        performSegue(withIdentifier: "toDetail", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "toDetail")
        {
            let des = segue.destination as!AlgorithmDetailViewController
            if(isAlgorithm){
                des.algorithmData = self.algorithmData[chooseRow]
            }
            else{
                des.algorithmData = self.dataStructureData[chooseRow]
            }
        }
        else if(segue.identifier == "toLearn")
        {
            let des = segue.destination as!SortShowViewController
            if(isAlgorithm){
                des.algorithmData = self.algorithmData[chooseRow]
            }
            else{
                des.algorithmData = self.dataStructureData[chooseRow]
            }
        }
        else
        {}
    }
}
