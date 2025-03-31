create Database scholarship;
show databases;
use scholarship;
CREATE TABLE User (
    id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    category ENUM('General', 'OBC', 'SC', 'ST', 'Other') NOT NULL,
    annual_income ENUM('less than 1 lakh', '1 lakh - 3 lakh', '5 lakh - 7 lakh', '7 lakh and above') NOT NULL,
    gender ENUM('Male', 'Female', 'Prefer not to say') NOT NULL,
    high_school_percentage varchar(10) DEFAULT NULL,
    higher_secondary_percentage varchar(10) DEFAULT NULL,
    current_year ENUM('1st Year', '2nd Year', '3rd Year', '4th Year', 'Post Graduate') DEFAULT NULL,
    cgpa DECIMAL(3,2) DEFAULT NULL,
    date_of_birth DATE NOT NULL,
    country VARCHAR(50) NOT NULL,
    state VARCHAR(50) NOT NULL,
    phone_no VARCHAR(15) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL
);


CREATE TABLE ScholarshipData (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    provider VARCHAR(255) NOT NULL,
    category ENUM('School Level', 'College Level', 'Government', 'International', 'For Girls') NOT NULL,
    last_date varchar(200) NULL,  -- Can be NULL if not announced
    amount varchar(200) NOT NULL,
	age varchar(50) DEFAULT NULL,
	annual_income varchar(50) DEFAULT NULL,
    caste varchar(20) DEFAULT NULL,
    eligibility LONGTEXT NOT NULL,  -- Changed to store large paragraphs
    documents_required LONGTEXT NOT NULL,  -- Changed to store large paragraphs
    official_link VARCHAR(500) NOT NULL
);

select * from scholarshipdata;














/* use scholarship;
ALTER TABLE User 
MODIFY COLUMN gender ENUM('Male', 'Female', 'Prefer not to say') NOT NULL,
ADD COLUMN high_school_percentage DECIMAL(5,2) DEFAULT NULL AFTER gender,
ADD COLUMN higher_secondary_percentage DECIMAL(5,2) DEFAULT NULL AFTER high_school_percentage,
ADD COLUMN current_year ENUM('1st Year', '2nd Year', '3rd Year', '4th Year', 'Post Graduate') DEFAULT NULL AFTER higher_secondary_percentage,
ADD COLUMN cgpa DECIMAL(3,2) DEFAULT NULL AFTER current_year;

use scholarship;
ALTER TABLE user
MODIFY COLUMN high_school_percentage varchar(10);
ALTER TABLE user
MODIFY COLUMN higher_secondary_percentage varchar(10);
ALTER TABLE scholarshipdata
ADD COLUMN age varchar(50) DEFAULT NULL AFTER amount,
ADD COLUMN annual_income varchar(50) DEFAULT NULL AFTER age,
ADD COLUMN caste varchar(20) DEFAULT NULL AFTER annual_income;

LOAD DATA INFILE 'E:/java/work/Scholarships_cleaned.csv' 
-- Provide the path of scholarship_cleaned.csv in above LOAD FILE Command
INTO TABLE scholarshipdata
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;
*/



