dataSource {
    pooled = true
    driverClassName = "org.hsqldb.jdbcDriver"
    username = "sa"
    password = ""
}
hibernate {
    cache.use_second_level_cache = true
    cache.use_query_cache = true
    cache.provider_class = 'net.sf.ehcache.hibernate.EhCacheProvider'
}
// environment specific settings
environments {
    development {
        dataSource {
           dbCreate = "create-drop" // one of 'create', 'create-drop','update'
//            url = "jdbc:hsqldb:file:devDB;shutdown=true"
//            dbCreate = "update"
            driverClassName = "com.mysql.jdbc.Driver"
            url ="jdbc:mysql://localhost:3306/grizzzly_vobzcms"
            username = "root"
            password = "beatIt"
        }
    }
    test {
        dataSource {
            dbCreate = "create-drop"
            url = "jdbc:hsqldb:mem:testDb"
        }
    }
    production {
        dataSource {
            dbCreate = "update"
            driverClassName = "com.mysql.jdbc.Driver"
            url ="jdbc:mysql://localhost:3306/grizzzly_vobzcms"
            username = "root"
            password = "musti"
        }
    }
}
