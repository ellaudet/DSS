# DSS: Datasets and Code for *Data Analysis for Social Science*

## 👉 Download the DSS folder here:

[![Download DSS.zip](https://img.shields.io/badge/Download-DSS.zip-2ea44f?style=for-the-badge)](https://github.com/ellaudet/DSS/releases/latest/download/DSS.zip)

> [!IMPORTANT]
> **You only need the file above.** You do not need a GitHub account, and you can ignore everything else on this page.

### Then follow these steps:

1. **Find** the file DSS.zip on your computer (usually in your Downloads folder).
2. **Unzip** it:
   - on a Mac, double-click the file;
   - on Windows, right-click the file and select *Extract All*.
3. **Move** the resulting DSS folder *directly* onto your Desktop.
4. **Check** that:
   - the folder is named exactly **DSS** (all capital letters, no spaces, no numbers; e.g., not "DSS 2" or "DSS (1)"), and
   - it is stored locally on your computer, not only in the cloud (e.g., iCloud or OneDrive).

The code provided in the book assumes that the DSS folder is (1) named exactly DSS and (2) saved directly on your Desktop. If you save it elsewhere, see subsection 1.7.1 of the book for how to change the code.

---

<details>
<summary><b>What is in the DSS folder?</b> (click to expand)</summary>

The DSS folder contains the R scripts (.R files) and datasets (.csv files) used in [Elena Llaudet and Kosuke Imai. _Data Analysis for Social Science, A Friendly and Practical Introduction_ (Princeton University Press, 2022)](https://press.princeton.edu/books/paperback/9780691199436/data-analysis-for-social-science), DSS for short.

* Chapter 1: Introduction
  * Goal: Lay Groundwork for Forthcoming Analyses
  * R Script: Introduction.R
  * Dataset: STAR.csv

  ... (the rest of your chapter list, unchanged) ...

</details>

## DSS: Datasets and Code for Data Analysis for Social Science

**To download the DSS folder, click here: [DSS.zip](https://github.com/ellaudet/DSS/releases/latest/download/DSS.zip).**

Then, find the file on your computer (usually in your Downloads folder) and unzip it (on a Mac, double-click the file; on Windows, right-click the file and select *Extract All*). Move the resulting DSS folder *directly* onto your Desktop, and make sure that:

- it is named exactly DSS (all capital letters, no spaces, no numbers), and
- it is stored locally on your computer, not only in the cloud.

The code provided in the book assumes that the folder with all the datasets is (1) named exactly DSS and (2) saved directly on your Desktop. If you choose to save the folder elsewhere, the book provides instructions for making the necessary changes to the code.

This repository (and the DSS folder) contain the R scripts (.R files) and datasets (.csv files) used in [Elena Llaudet and Kosuke Imai. _Data Analysis for Social Science, A Friendly and Practical Introduction_ (Princeton University Press, 2022)](https://press.princeton.edu/books/paperback/9780691199436/data-analysis-for-social-science), DSS for short.

Here is an overview:

* Chapter 1: Introduction
  * Goal: Lay Groundwork for Forthcoming Analyses  
  * R Script: Introduction.R
  * Dataset: STAR.csv
  
* Chapter 2: Estimating Causal Effects with Randomized Experiments 
  * Research Question: Do Small Classes Improve Student Performance?
  * Based on: Frederick Mosteller, "The Tennessee Study of Class Size in the Early School Grades," Future of Children 5, no. 2 (1995): 113-27.
  * R Script: Experimental.R
  * Dataset: STAR.csv
  
* Chapter 3: Inferring Population Characteristics via Survey Research 
  * Research Question: Who Supported Brexit?
  * Based on: Sara B. Hobolt, "The Brexit Vote: A Divided Nation, a Divided Continent," Journal of European Public Policy 23, no. 9 (2016): 1259-77, and Sascha O. Becker, Thiemo Fetzer, and Dennis Novy, "Who Voted for Brexit? A Comprehensive District-Level Analysis," Economic Policy 32, no. 92 (2017): 601–50.
  * R Script: Population.R
  * Datasets: BES.csv, UK_districts.csv
  
* Chapter 4: Predicting Outcome Using Linear Regression
  * Goal: Predict GDP Growth Based on Night-Time Light Emissions
  * Based on: J. Vernon Henderson, Adam Storeygard, and David N. Weil, "Measuring Economic Growth from Outer Space," American Economic Review 102, no. 2 (2012): 994–1028.
  * R Script: Prediction.R
  * Dataset: countries.csv
  
* Chapter 5: Estimating Causal Effects with Observational Data
  * Research Question: What Was the Effect of Russian TV Propaganda on Ukrainians' 2014 Voting Behavior?
  * Based on: Leonid Peisakhin and Arturas Rozenas, "Electoral Effects of Biased Media: Russian Television in Ukraine," American Journal of Political Science 62, no. 3 (2018): 535–50.
  * R Script: Observational.R
  * Datasets: UA_survey.csv, UA_precincts.csv
  
* Chapter 6: Probability
  * Goal: Learn Basic Probability
  * R Script: Probability.R
  * Dataset: STAR.csv
  
* Chapter 7: Quantifying Uncertainty
  * Goal: Complete Some of the Analyses from Chapters 2 through 5 by Quantifying the Uncertainty in the Empirical Findings
  * R Script: Uncertainty.R
  * Datasets: BES.csv, STAR.csv, countries.csv, UA_survey.csv
