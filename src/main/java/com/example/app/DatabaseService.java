package com.example.app;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseService {
    public static Connection connect(String url, String username, String password) throws SQLException {
        return DriverManager.getConnection(url, username, password);
    }
}

