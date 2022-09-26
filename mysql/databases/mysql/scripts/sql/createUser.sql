-- Switch to using the 'snippetbox' database.
USE snippetbox;

Create user 'web'@'%';
GRANT SELECT, INSERT, UPDATE ON snippetbox.* TO 'web'@'%';
ALTER USER 'web'@'%' IDENTIFIED BY 'pass';
