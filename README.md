# Books to Scrape — Web Scraping & SQL Analysis

## Project Overview

This project demonstrates a complete data workflow starting from web scraping and ending with SQL-based data analysis.

The project uses the **Books to Scrape** website to collect book information from the first five pages, clean and transform the extracted data using Python and Pandas, store the cleaned dataset in SQLite, and answer business questions using SQL queries.

## Objectives

* Scrape book information from multiple web pages.
* Extract book details such as title, category, rating, price, availability, and URL.
* Clean and transform the scraped data using Pandas.
* Convert text-based ratings and prices into suitable numeric data types.
* Extract stock status from the availability field.
* Store the cleaned dataset in a SQLite database.
* Perform SQL analysis to answer the required questions.
* Save the SQL queries separately in `queries.sql`.

## Technologies Used

* Python
* Requests
* BeautifulSoup
* Pandas
* SQLite

## Data Collected

The following information was collected for each book:

* **Title**
* **Rating**
* **Price**
* **Book URL**
* **In Stock Status**

The final dataset contains **100 books** scraped from the first five pages.

## Project Workflow

```text
Books to Scrape Website
        ↓
Web Scraping
        ↓
Data Extraction
        ↓
Data Cleaning & Transformation
        ↓
Pandas DataFrame
        ↓
books.csv
        ↓
SQLite Database
        ↓
SQL Queries
        ↓
Analysis Results
```

## Data Cleaning

Several preprocessing steps were applied to the scraped data:

1. Converted relative book URLs into complete URLs using `urljoin`.
2. Removed the `£` symbol from prices and converted them to numeric values.
3. Converted ratings from text values (`One`, `Two`, etc.) into numbers from 1 to 5.
4. Extracted the stock status into a separate `in_stock` column.
5. Removed the original `Category` and `Availability` columns when they were no longer required.
6. Saved the final cleaned dataset as `books.csv`.

## SQL Analysis

Three SQL queries were created to answer the following questions:

### 1. Average Price for Each Rating

Calculates the average book price for each rating.

### 2. Five Most Expensive Books Rated 4 or 5

Finds the five most expensive books that have a rating of 4 or 5.

### 3. Out-of-Stock Books per Rating

Counts the number of out-of-stock books for each rating.

The complete SQL queries are available in [`queries.sql`](queries.sql).

## Repository Structure

```text
books-to-scrape-sql/
│
├── README.md
├── books_scraped_cleaned.csv
├── books_scraped.csv
├── books_toscrape.ipynb
├── books.db
└── queries.sql 
```

## Reflection
# Five lines

The main challenge was handling the book URLs correctly because I initially did not use `urljoin`, which caused problems with the extracted links.

Using `urljoin` solved the issue by converting the relative URLs into correct full URLs.

I also faced several problems when trying to load the CSV into SQL Server Management Studio, mainly related to UTF-8 encoding and incorrect column data types.

If the site started blocking requests after 50 requests, I would reduce the request rate by adding delays and avoiding unnecessary requests.

I would also use retries with exponential backoff if the server returned rate-limit errors.

## Files

* [`books_scraper.ipynb`](books_scraper.ipynb) — Complete scraping, cleaning, SQLite, and analysis workflow.
* [`books_scraped_cleaned.csv`](books_scraped_cleaned.csv) — Final cleaned dataset.
* [`books_scraped.csv`](books_scraped.csv) — Scraped data before cleaning.
* [`books.db`](books.db) — Database created while makeing queries.
* [`queries.sql`](queries.sql) — SQL queries used for the analysis.


## Source

Data was collected from [Books to Scrape](https://books.toscrape.com/).
