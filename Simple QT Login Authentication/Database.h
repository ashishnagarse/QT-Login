#ifndef DATABASE_H
#define DATABASE_H

// Include the Qt object system and SQL handling modules
#include <QObject>
#include <QtSql>
#include <QSqlDatabase>
#include <QDebug>
#include <QSettings>

// Database class inherits from QObject to support Qt's meta-object features (signals/slots)
class Database : public QObject
{
    Q_OBJECT

public:
    // Constructor with optional parent pointer
    explicit Database(QObject *parent = nullptr);

    // Destructor to handle cleanup
    ~Database();

    // Initializes the database connection and creates tables if needed
    Q_INVOKABLE bool initDatabase();

    // Registers a new user with email and password (hashed before storing)
    Q_INVOKABLE bool registerUser(const QString &email, const QString &password);

    // Authenticates user login using email and password (checks hashed password)
    Q_INVOKABLE bool loginUser(const QString &email, const QString &password);

    // Checks whether a user with the given email is already registered
    Q_INVOKABLE bool isUserRegistered(const QString &email);

    // New methods for Remember Me functionality
    Q_INVOKABLE void saveCredentials(const QString &email, const QString &password);
    Q_INVOKABLE void clearSavedCredentials();
    Q_INVOKABLE QString getSavedEmail();
    Q_INVOKABLE QString getSavedPassword();
    Q_INVOKABLE bool hasSavedCredentials();

private:
    // Holds the database connection instance
    QSqlDatabase m_database;
    QSettings m_settings;

    // Creates the necessary tables in the database (e.g., users table)
    bool createTables();

    // Hashes the password using a hashing algorithm for secure storage
    QString hashPassword(const QString &password);

    QString encryptPassword(const QString &password);  // For storing remembered password
    QString decryptPassword(const QString &encrypted); // For retrieving remembered password
};

#endif // DATABASE_H
