# PharmaNext

PharmaNext is a pharmacy management system designed to streamline prescription processing, inventory tracking, and patient management through user-friendly interfaces.

## Features

**Inventory Management**
- Real-time tracking and adjustments as prescriptions are filled.
  
**Patient Profiles**
- Comprehensive profiles with prescription history and contact details.

**Prescription Interfaces**
- **Rx Pending Interface (QT):** Displays incoming electronic prescriptions for entry.
- **Rx Production Interface (QP):** Displays instructions to fill prescriptions.
- **Rx Verification Interface (QV):** Used by authorized pharmacists to verify filled prescriptions.

**Prescription Lifecycle**
- QT ➜ QP ➜ QV

**Efficient Workflow**
- Seamless task transitions with minimal keystrokes.

**User-Friendly Design**
- Interfaces tailored to pharmacy staff for smooth navigation.

## Technologies Used

- **Architecture:** Model-View-Controller (MVC)
- **Frontend:** HTML, CSS, JavaScript
- **Backend:** Django
- **Database:** MySQL
- **Security:** Django’s authentication and authorization system

## Project Setup Instructions

Clone the repository:
   ```bash
   git clone https://github.com/kyurban/pharmanext.git
```
Setup Virtual Environment:
  ```
  python -m venv env
  MacOS: source env/bin/activate | Windows: env\Scripts\activate
```
Install Dependencies:
  ```
  pip install -r requirements.txt
```
## Database Setup Instructions

1. **Install MySQL**

    MacOS: ```brew install mysql```
   
    Windows: https://dev.mysql.com/downloads/installer/

3. **Create the Database**
   
   ```bash
   mysql -u root -p  # Log in to MySQL
   CREATE DATABASE pharmanext;  # Create the database
   exit;  # Exit MySQL

4. Generate Secret Key

   ```
   python -c 'from django.core.management.utils import get_random_secret_key; print(get_random_secret_key())'
   ```

4. **Create a `.env` file for MySQL credentials**
   ```
    DB_NAME=pharmanext
    DB_USER=root
    DB_PASSWORD=your_password
    DB_HOST=localhost
    DB_PORT=3306
    SECRET_KEY=your_secret_key
   ```
5. **Import Sample Data**
   ```
   mysql -u root -p pharmanext < pharmanext.sql
   ```
6. **Run Migrations**
   ```
   python manage.py makemigrations
   python manage.py migrate
   ```
7. **Start the Server**
   ```
   python manage.py runserver
   ```
## Login Information

**Pharmacist view**

- Username: pharmacist

- Password: pharmanext1

**Technician View**

- Username: technician

- Password: pharmanext2


   
