# IPL Batting Performance Analysis

This repository contains the code, datasets, and visualizations for the project "Analyzing Factors Influencing Batting Strike Rate and Impact of Batting Style". The project explores key metrics related to batting performance and provides actionable insights using data analysis and visualization.

## Project Overview

The project focuses on two core research questions:

1. What factors (e.g., runs, boundaries, balls faced, batting average, and batting style) are most predictive of a batsman's strike rate?
2. Does a batsman's batting style (left-hand bat vs. right-hand bat) influence their batting average and boundary-hitting ability?

The analysis identifies relationships between performance metrics (e.g., strike rate, boundaries percentage, batting average) and uncovers the influence of batting style on boundary-hitting ability. The insights derived are particularly relevant for evaluating player performance in modern cricket formats like T20.

## Repository Content

### Code 

data_cleaning.r
- Performs data wrangling, cleaning, and merging of the primary and secondary datasets.
- Generates the final dataset (Cleaned_Merged_Player_Data.csv) for analysis.
  
data_analysis_tables.r
- Generates summary tables, including:
  1. Summary statistics for key batting metrics.
  2. Comparison of batting performance by batting style.

data_visualizations.r

- Creates key visualizations, including:
  1. Correlation heatmap of batting metrics.
  2. Scatter plots showcasing relationships between strike rate and key variables.
  3. Box plots and bar charts for comparisons between batting styles.
  4. Histogram showcasing distribution of players by batting strike rate. 

### Data

IPL Player Stat.csv (Primary Dataset)

- Contains detailed batting and bowling statistics for IPL players (16 columns, 604 rows).

2024_players_details.csv (Secondary Dataset)

- Includes player details such as batting style, bowling style, and roles (13 columns, 262 rows).

Cleaned_Merged_Player_Data.csv (Final Dataset)

- Resulting dataset after merging, cleaning, and filtering the primary and secondary datasets.
- Contains key variables used in the analysis.

## How to Use

1. Clone the repository using the following CMD prompt:-
    ```r
    git clone https://github.com/Stat184-Fall2024/Sec1_FP_Rohan_Pratham.git
    ```
2. Install R and RStudio. Ensure the following R packages are installed:

- dplyr: For data wrangling and cleaning
- knitr: For creating polished tables
- kableExtra: For enhanced table formatting
- ggplot2: For data visualization
- reshape2: For reshaping data (e.g., for heatmaps)
   
3. Run Code Files

- Open the R scripts (data_cleaning.r, data_analysis_tables.r, data_visualizations.r) in RStudio.
- Execute the scripts in order to clean the data, generate tables, and create visualizations.
  
4. Explore Outputs

- Tables and visualizations will be generated and displayed in your R environment.
- Refer to the data folder for input datasets and the final cleaned dataset.

## Key Insights

1. Factors Influencing Batting Strike Rate:

- Boundaries Percentage has the strongest positive correlation with Batting Strike Rate.
- Batting Average also contributes moderately, highlighting consistency's role in scoring efficiency.
![correlation_heatmap](https://github.com/user-attachments/assets/f72e312c-3412-433a-a757-7a5b76d10181)


2. Impact of Batting Style on Performance:

- Right-handed batsmen outperform left-handed batsmen in total boundaries.
![boundaries_by_style_2](https://github.com/user-attachments/assets/8c22400e-cb60-4d92-b8e3-51228c796003)

- Batting average remains consistent across both batting styles, showing minimal influence.

## Acknowledgements 

- The primary dataset was sourced from Kaggle (IPL Player Stats).
- The secondary dataset was sourced from GitHub (Player Details).
- This project was completed as part of the STAT 184 Final Project by:
  - Rohan Dalal
  - Pratham Patel

## Contact

Rohan Dalal - rxd5491@psu.edu

Pratham Patel - pap5520@psu.edu


