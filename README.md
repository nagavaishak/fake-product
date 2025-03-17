## Fake Product Identification Using Blockchain

# Overview

This project is a blockchain-based solution for detecting counterfeit products. It provides a transparent and tamper-proof system where manufacturers, distributors, and consumers can verify the authenticity of products using blockchain technology.

# Features

Blockchain Integration: Secure and immutable ledger for product authenticity.

Unique Product Identification: Each product is assigned a unique hash on the blockchain.

Tamper-Proof Verification: Ensures that product data cannot be altered or faked.

Smart Contracts: Automates the verification process for authenticity.

User-Friendly Interface: Consumers can scan QR codes or enter product IDs to verify authenticity.

# Technologies Used

Frontend: HTML, CSS, JavaScript (JSP for dynamic content)

Backend: Java (JSP & Servlets)

Database: MySQL

Blockchain: Ethereum / Hyperledger (depending on implementation)

Smart Contracts: Solidity (for Ethereum-based implementation)

Server: Apache Tomcat

# Installation & Setup

Prerequisites

Java 8 or higher

Apache Tomcat Server

MySQL Database

Node.js (if interacting with Ethereum blockchain)

Metamask (for blockchain interaction)

Set up the Database

Import the db.sql file into MySQL.

Update database credentials in the application.

Deploy on Tomcat

Place the project folder in the Tomcat webapps directory.

Start the Tomcat server.

Run the Application

Access the application via http://localhost:8080/fake-product/.

Use the web interface to verify products.

# How Blockchain is Used

Every product entry is stored as a transaction on the blockchain.

Each product has a unique hash, preventing duplication or forgery.

Consumers can retrieve product history and authenticity data from the blockchain.

Contribution

Feel free to contribute by creating a pull request or raising an issue for improvements.

License

This project is open-source and available under the MIT License.
