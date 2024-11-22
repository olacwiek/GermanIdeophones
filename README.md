# German Ideophone Database

This repository contains an analysis of the German ideophone dataset collected between February and August 2018 at the Helene-Nathan-Bibliothek in Berlin. The dataset and analysis focus on ideophones found in German children's books, with detailed metadata and statistical analyses. Below, you will find a description of the project, the dataset, and how to use the resources in this repository.

---

## Table of Contents

1. [Overview](#overview)
2. [Dataset Description](#dataset-description)
3. [Analysis Highlights](#analysis-highlights)
4. [Installation and Usage](#installation-and-usage)
5. [Project Structure](#project-structure)
6. [Visualizations](#visualizations)
7. [Contributing](#contributing)
8. [License](#license)

---

## Overview

This project analyzes the diversity and usage of ideophones in German children's literature. Key questions addressed include:
- How many unique ideophones and base forms are there?
- How do these numbers vary across age groups?
- How does the percentage of ideophones relate to the total word count and number of pages?
- Are there correlations between these features and the metadata of the books?

The analysis leverages Bayesian statistics, descriptive statistics, and data visualization to provide meaningful insights.

---

## Dataset Description

The dataset comprises detailed metadata and linguistic information for ideophones found in German children's books. Below is a description of the dataset columns:

- **ID**: A unique identifier for each entry in the dataset.
- **Ideophone**: The ideophone as it appears in the book, including its full original form.
- **BaseForm**: A standardized version of the ideophone for easier comparison.
- **BookTitle**: The title of the book in which the ideophone was found.
- **Author**: The author(s) of the book.
- **AgeRating**: The recommended age range for the book.
- **AgeGroup**: A simplified age grouping (e.g., 1 = 0-6 years, 2 = 7-9 years).
- **OriginalLanguage**: The language in which the book was originally written.
- **Year**: The year the book was published.
- **Context**: The sentence or passage in which the ideophone appears.
- **MeaningInContext**: A subjective interpretation of the ideophone's meaning in context.
- **Source**: A reference to where the book was cataloged.
- **WordType**: The grammatical category of the ideophone (if determined).
- **WordCount**: The number of words on the page where the ideophone appears.
- **PageCount**: The total number of pages in the book.

---

## Analysis Highlights

Key analyses include:

1. **Ideophone Diversity**:
   - Total number of unique ideophones and base forms.
   - Normalization by the number of books and pages.
2. **Age Group Comparisons**:
   - Ideophones and base forms per book by age group.
   - Differences in the percentage of ideophones relative to total word counts.
3. **Correlations**:
   - Relationship between the number of pages, word count, and ideophone frequency.
   - Bayesian Factor analysis to test hypotheses about these relationships.
4. **Visualizations**:
   - Violin plots and boxplots comparing ideophone distributions.
   - Density plots illustrating the variability of ideophone usage.

---

## Installation and Usage

### Prerequisites

- R (version 4.0 or higher)
- RStudio (recommended)
- Required R packages:
  - `tidyverse`
  - `ggplot2`
  - `BayesFactor`
  - `here`

### Getting Started

1. Clone the repository:
   ```bash
   git clone https://github.com/<your-username>/german-ideophone-database.git
   ```
2. Navigate to the project directory:
   ```bash
   cd german-ideophone-database
   ```
3. Open the R Markdown file (`german_ideophone_analysis.Rmd`) in RStudio.
4. Run the code chunks to reproduce the analyses and visualizations.

---

## Project Structure

- `data/`: Contains the raw dataset `Korpus_Ideophone.csv` and the cleaned dataset `german_ideophone_dataset.csv`.
- `scripts/`: Contains any preprocessing scripts used for data cleaning and transformation.
- `plots/`: Stores all generated visualizations.
- `german_ideophone_analysis.Rmd`: The main analysis file.
- `README.md`: This file.

---

## Visualizations

### Examples of Key Plots

1. **Top 30 Most Frequent Base Forms**
   - Visualizes the frequency of base forms across the dataset.
2. **Base Forms Per Book by Language**
   - Normalized counts of base forms per book grouped by the original language.
3. **Number of Ideophones Per Book by Age Group**
   - Violin and boxplots showing distributions.
4. **Correlation Between Total Words and Ideophones**
   - Scatterplot with linear regression line.

All plots are saved in the `plots/` directory in PDF, JPG, and TIFF formats.

---

## Contributing

Contributions are welcome! If you wish to contribute:
- Fork the repository.
- Create a new branch for your feature/bug fix.
- Submit a pull request with a clear description of the changes.

---

## License

This project is licensed under the MIT License. See the LICENSE file for details.

---

For questions or further information, please contact [Aleksandra Ćwiek](mailto:cwiekaleksandra@gmail.com).
