A brain stroke (BS) occurs when there is an abrupt interruption of blood flow to the brain, which can lead to neuronal damage and functional impairment.The main difficulty in classifying BS is accurately and quickly distinguishing between normal and stroke-affected brain areas using imaging modalities like CT or MRI, 
which is essential for prompt and efficient clinical decision-making. For BS classification with dual-modality pictures, a unique deep learning-based DEMO-BARN architecture has been developed in order to address this problem. To enhance picture quality and avoid noise issues, the Contrast Stretching Adaptive Bilateral (CSAB) filter was used to 
pre-process the dual input images (MRI and PET) produced from the Kaggle dataset. Fine features are extracted from the pre-processed pictures using ResNeXt. 
The dwarf mongoose optimization (DMO) technique can be used to eliminate extraneous data and choose the most important features for further examination after feature extraction. The BS is divided into normal and stroke classes by Inception-ResNet1 based on the features that were chosen. To evaluate the suggested DEMO-BARN model, the following metrics were used: f1 score, accuracy, recall, precision, and specificity.  

Dwarf Mongoose Optimization Algorithm

![image alt](https://raw.githubusercontent.com/nparimalavit/-DwarfMongooseOptimizationAlgorithm/909b9f079e25f26f0707576fff4d1c0e3e40697d/Picture1.jpg)








Environment
Matlab (2025 a)
•	Image processing toolkit
•	Machine Learning toolkit
•	Deep learning toolkit
Datasets
We obtained the Kaggle dataset for this study. This dataset helps evaluate health trends and patterns. Every data entry contains patient-relevant information. This dataset analyzes recalled indicative estimations to predict BS in patients. The dataset didn't include patient names, addresses, or SSNs. In the experiment dataset, patient confidentiality is not at danger. The dataset has 5110 samples. Every sample has 11 attributes and 1 target value. Data is divided into training and testing. The model is trained on 80% of the data and tested on 20%.

Brain2025




Augmented Images
  
Train
Edit the brain_code.m file of the corresponding dataset for training configuration and run the following command to train.


Test
Edit the brain_code.m file of the corresponding dataset for testing configuration and run the following command to test.
python test.py options/brats.yaml
Citation
If you find this code useful in your research, please consider citing:


@article{cao2025 DEMO-BARN,
  title={ DEMO-BARN: DWARF MONGOOSE OPTIMIZATION ALGORITHM FOR BRAIN STROKE CLASSIFICATION USING DUAL IMAGES},
  author={ Parimala Nallamotu, Muneeswari G },
  journal={International Journal of Computer Vision},
  pages={1--20},
  year={2025},
  publisher={Springer}
}
