#include "Database.h"
#include <QCryptographicHash> // Provides hashing functions like SHA-256
#include <QSettings>

// Constructor - initializes the database on object creation
Database::Database(QObject *parent)
    : QObject(parent), m_settings("CBPM", "LoginSettings")
{
    initDatabase(); // Attempt to initialize the database connection
}

// Destructor - ensures the database connection is properly closed
Database::~Database()
{
    if (m_database.isOpen())
    {
        m_database.close(); // Close the DB connection if it's still open
    }
}

// Initializes the SQLite database connection and creates the required tables
bool Database::initDatabase()
{
    // Specify the database driver (QSQLITE for SQLite)
    m_database = QSqlDatabase::addDatabase("QSQLITE");

    // Set the name of the database file
    m_database.setDatabaseName("users.db");

    // Attempt to open the database
    if (!m_database.open())
    {
        qDebug() << "Error: Failed to connect to database." << m_database.lastError();
        return false;
    }

    // Proceed to create tables (if not already existing)
    return createTables();
}

// Creates the users table if it doesn't already exist
bool Database::createTables()
{
    QSqlQuery query;

    // SQL query to create a table for storing users
    QString createTableQuery =
        "CREATE TABLE IF NOT EXISTS users ("
        "id INTEGER PRIMARY KEY AUTOINCREMENT,"          // Auto-increment user ID
        "email TEXT UNIQUE NOT NULL,"                    // Email must be unique and not null
        "password TEXT NOT NULL,"                        // Hashed password
        "created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP" // Auto-filled timestamp
        ")";

    // Execute the SQL query
    if (!query.exec(createTableQuery))
    {
        qDebug() << "Error: Failed to create tables." << query.lastError();
        return false;
    }

    return true;
}

// Hashes a plain-text password using SHA-256
QString Database::hashPassword(const QString &password)
{
    QByteArray passwordBytes = password.toUtf8();                                                    // Convert to UTF-8 byte array
    QByteArray hashedPassword = QCryptographicHash::hash(passwordBytes, QCryptographicHash::Sha256); // Apply SHA-256 hash
    return QString(hashedPassword.toHex());                                                          // Convert hashed bytes to hex string
}

// Registers a new user in the database
bool Database::registerUser(const QString &email, const QString &password)
{
    // Check if the email is already registered
    if (isUserRegistered(email))
    {
        qDebug() << "Error: Email already registered.";
        return false;
    }

    QSqlQuery query;
    query.prepare("INSERT INTO users (email, password) VALUES (:email, :password)");
    query.bindValue(":email", email);                     // Bind email to placeholder
    query.bindValue(":password", hashPassword(password)); // Hash password before storing

    // Execute the insert query
    if (!query.exec())
    {
        qDebug() << "Error: Failed to register user." << query.lastError();
        return false;
    }

    return true; // Registration successful
}

// Attempts to authenticate a user with email and password
bool Database::loginUser(const QString &email, const QString &password)
{
    QSqlQuery query;
    query.prepare("SELECT password FROM users WHERE email = :email");
    query.bindValue(":email", email); // Bind the provided email

    // Execute the query
    if (!query.exec())
    {
        qDebug() << "Error: Failed to query user." << query.lastError();
        return false;
    }

    // If the user exists, compare the stored hash with the input hash
    if (query.next())
    {
        QString storedPassword = query.value(0).toString();   // Retrieved stored hashed password
        QString hashedInputPassword = hashPassword(password); // Hash input password

        return (storedPassword == hashedInputPassword); // Return match result
    }

    return false; // User not found
}

// Checks if a user is already registered based on the email
bool Database::isUserRegistered(const QString &email)
{
    QSqlQuery query;
    query.prepare("SELECT COUNT(*) FROM users WHERE email = :email");
    query.bindValue(":email", email); // Bind the email

    // Execute the query
    if (!query.exec())
    {
        qDebug() << "Error: Failed to check user existence." << query.lastError();
        return false;
    }

    // If the result exists, check if count > 0
    if (query.next())
    {
        return query.value(0).toInt() > 0;
    }

    return false;
}

// New methods for Remember Me functionality
void Database::saveCredentials(const QString &email, const QString &password)
{
    m_settings.setValue("savedEmail", email);
    m_settings.setValue("savedPassword", encryptPassword(password));
    m_settings.setValue("hasCredentials", true);
    m_settings.sync();
}

void Database::clearSavedCredentials()
{
    m_settings.remove("savedEmail");
    m_settings.remove("savedPassword");
    m_settings.remove("hasCredentials");
    m_settings.sync();
}

QString Database::getSavedEmail()
{
    return m_settings.value("savedEmail").toString();
}

QString Database::getSavedPassword()
{
    QString encrypted = m_settings.value("savedPassword").toString();
    return decryptPassword(encrypted);
}

bool Database::hasSavedCredentials()
{
    return m_settings.value("hasCredentials", false).toBool();
}

// Simple encryption/decryption for stored password
// Note: This is a basic implementation. In a production environment,
// you should use more secure methods or a dedicated encryption library
QString Database::encryptPassword(const QString &password)
{
    // Simple XOR encryption with a fixed key
    QByteArray key = "CBPM_KEY_2024";
    QByteArray input = password.toUtf8();
    QByteArray result;

    for (int i = 0; i < input.length(); i++)
    {
        result.append(input[i] ^ key[i % key.length()]);
    }

    return QString::fromLatin1(result.toBase64());
}

QString Database::decryptPassword(const QString &encrypted)
{
    if (encrypted.isEmpty())
        return QString();

    // Reverse the encryption process
    QByteArray key = "CBPM_KEY_2024";
    QByteArray input = QByteArray::fromBase64(encrypted.toLatin1());
    QByteArray result;

    for (int i = 0; i < input.length(); i++)
    {
        result.append(input[i] ^ key[i % key.length()]);
    }

    return QString::fromUtf8(result);
}
