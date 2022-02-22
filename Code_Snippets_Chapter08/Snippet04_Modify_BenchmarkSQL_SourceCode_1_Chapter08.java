if (iDB.equals("firebird"))
        dbType = DB_FIREBIRD;
    else if (iDB.equals("oracle"))
        dbType = DB_ORACLE;
    else if (iDB.equals("postgres"))
        dbType = DB_POSTGRES;
    else if (iDB.equals("mysql"))
        dbType = DB_UNKNOWN;
    else
    {
        log.error("unknown database type '" + iDB + "'");
        return;
    }
