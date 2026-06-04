/*
=============================================================
Create Database and Schemas (MySQL Version)
=============================================================
Script Purpose:
    Creates a new database named 'DataWarehouse'.
    If the database already exists, it is dropped and recreated.

WARNING:
    Running this script will delete the existing
    DataWarehouse database and all its contents.
=============================================================
*/

-- Drop database if it exists
DROP DATABASE IF EXISTS DataWarehouse;

-- Create database
CREATE DATABASE DataWarehouse;

-- Use database
USE DataWarehouse;

-- Create schemas (schemas = databases in MySQL)
CREATE DATABASE IF NOT EXISTS bronze;
CREATE DATABASE IF NOT EXISTS silver;
CREATE DATABASE IF NOT EXISTS gold;

-- Verify creation
SHOW DATABASES;
