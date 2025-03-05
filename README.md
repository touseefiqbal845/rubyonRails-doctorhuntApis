# Doctor Hunt Project - RUBY ON RAILS

## Project Overview

This project includes:

- **Patient Appointment Management**: Patients can book appointments with doctors.
- **Medical Records Management**: Store and manage patient medical records for ongoing and historical reference.
- **Doctor Diagnosis Offers**: Doctors can create and manage diagnostic tests offered to patients.
- **User Authentication**: Secure login and registration for both patients and doctors.
- **Spring Boot Backend**: RESTful APIs using Spring Boot framework to handle business logic and database interaction.
- **PostgreSQL Database**: Reliable relational database to store patient, doctor, appointment, and medical record data.
- **Groovy Scripting**: Groovy is used to dynamically script and enhance functionality, allowing quick changes or new features to be implemented easily.

## Features

- **User Authentication**: Patients and doctors can register, log in, and authenticate via JWT (JSON Web Tokens).
- **Appointment Booking**: Patients can view available doctors and book appointments based on time slots.
- **Medical Records**: Patients' medical records are stored securely, allowing doctors to add or view historical information.
- **Diagnosis Test Offers**: Doctors can add available diagnostic tests to their profiles for patients to select.
- **Spring Boot & PostgreSQL**: The project uses Spring Boot to create robust backend APIs and PostgreSQL for data persistence.
- **DTO (Data Transfer Objects)**: DTOs are used to transfer data between layers efficiently, ensuring proper structuring of API responses.



## Installation

# Ruby on Rails Project

This is a Ruby on Rails application running on Ruby version 3.3.7.

## Ruby Version
- ruby-3.3.7

## System Dependencies

Ensure you have the following installed:
- Ruby 3.3.7
- Node.js (for JavaScript runtime)
- Yarn (for managing JavaScript packages)
- PostgreSQL (or your preferred database system)

### Installing Ruby

git clone https://github.com/touseefiqbal3681/rubyonRails-doctorhuntApis
cd your-repository

You can install Ruby using a version manager like RVM or rbenv. If you use `rbenv`, run the following commands:

```bash
# Install rbenv
brew install rbenv

# Install Ruby 3.3.7
rbenv install 3.3.7
rbenv global 3.3.7
bundle install
 ## Database Setup
Create the database:
rails db:create
Run the migrations:
rails db:migrate
##  Running the Application
To start the Rails server, run the following command:
rails server



## Project Structure

```
DOCTORHUNT-RUBYONRAILS:.
├───.github
│   └───workflows
├───.kamal
│   └───hooks
├───app
│   ├───assets
│   │   ├───builds
│   │   ├───images
│   │   ├───stylesheets
│   │   └───tailwind
│   ├───controllers
│   │   └───concerns
│   ├───helpers
│   ├───javascript
│   │   └───controllers
│   ├───jobs
│   ├───mailers
│   ├───models
│   │   └───concerns
│   ├───services
│   └───views
│       ├───appointments
│       ├───diagnosis_offers
│       ├───doctors
│       ├───layouts
│       ├───medical_records
│       ├───patients
│       ├───pwa
│       ├───users
│       └───user_mailer
├───bin
├───config
│   ├───environments
│   ├───initializers
│   └───locales
├───db
│   └───migrate
├───lib
│   └───tasks
├───log
├───public
├───script
├───storage
├───test
│   ├───controllers
│   ├───fixtures
│   │   └───files
│   ├───helpers
│   ├───integration
│   ├───mailers
│   ├───models
│   └───system
├───tmp
│   ├───cache
│   │   └───bootsnap
```

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.


