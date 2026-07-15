**Vectorized Expectation-Maximization (EM) Algorithm for Gaussian Mixture Models (GMM)**





**👩‍💻 Project Details**

•	Author: **Lakshiya S S**

•	Course: Bachelor of Computer Applications (BCA)

•	Project: Week 1 – Gaussian Mixture Model using Expectation-Maximization Algorithm

•	Programming Language: Base R




**🎯 Project Objective**

This project implements the Gaussian Mixture Model (GMM) using the Expectation-Maximization (EM) Algorithm from scratch in Base R. The implementation does not use any machine learning or clustering libraries. The algorithm estimates the parameters of Gaussian distributions iteratively until convergence.


**🛠️ Software Used**

•	RStudio

•	Base R

•	Git

•	GitHub
________________________________________
**
📁 Project Structure**

**GMM-EM-Algorithm-Week1/**

│── README.md

│── Week1_Report.pdf

│── synthetic_data.csv

│── gmm_em_algorithm.R

├── Output/

│   ├── dataset.png

│   ├── cluster1.png

│   ├── cluster2.png

│   ├── final_clusters.png

│   └── log_likelihood.png

________________________________________

**📌 Project Tasks**

**🔹 Task 1 – Generate Dataset**

•	Generated a synthetic dataset with two Gaussian clusters

•	Total observations: 2,000,000 (20 lakh)

•	Saved the dataset as synthetic_data.csv

•	Plotted the generated dataset
________________________________________

**🔹 Task 2 – Initialize GMM Parameters**
•	Number of clusters (K = 2)

•	Mixing coefficients

•	Mean vectors

•	Covariance matrices

________________________________________**
🔹** Task 3 – Gaussian Density Function****

•	Implemented Multivariate Gaussian PDF using Base R

•	Computed probability density values

________________________________________
**🔹 Task 4 – Expectation Step (E-Step)**

•	Calculated responsibility matrix

•	Ensured each row sums to 1

________________________________________
**🔹 Task 5 – Maximization Step (M-Step)**

Updated:

•	Mixing coefficients

•	Mean vectors

•	Covariance matrices

________________________________________
**🔹 Task 6 – EM Algorithm**

•	Repeated E-Step and M-Step

•	Computed Log-Likelihood

•	Stopped after convergence or 20 iterations
________________________________________

**🔹 Task 7 – Visualization**

Generated:

•	Dataset plot

•	Final clusters

•	Log-likelihood graph
________________________________________

**▶️ How to Run**

1.	Open gmm_em_algorithm.R in RStudio

2.	Run the entire script

3.	Dataset and outputs will be generated automatically
________________________________________
**📊 Output Screenshots**
🔵 Cluster 1



<img width="555" height="449" alt="image" src="https://github.com/user-attachments/assets/55c91c4b-5c4b-41f7-b026-9f9c59a3ab83" />





 
🔴 Cluster 2


<img width="519" height="429" alt="image" src="https://github.com/user-attachments/assets/f0c85b3b-cbcf-43b5-b637-7e922933b906" />





 
🎯 Final Clusters



<img width="555" height="424" alt="image" src="https://github.com/user-attachments/assets/8c9c645f-9f31-4f0d-a5f7-1f64d2250651" />





 
📈 Log Likelihood


<img width="560" height="450" alt="image" src="https://github.com/user-attachments/assets/3e2b6117-33b2-45da-9601-fbaff8b8e065" />




 
________________________________________
**🎓 Learning Outcomes**


•	Understood Gaussian Mixture Models (GMM)

•	Learned Expectation-Maximization (EM) Algorithm

•	Implemented clustering from scratch

•	Computed probabilities and likelihood

•	Visualized clustering effectively

•	Gained hands-on GitHub project experience

________________________________________

