#!/usr/bin/env python
# coding: utf-8

# In[3]:



from __future__ import print_function

hostname = 'localhost'
username = 'root'
password = ''
database = 'carsales'

# Simple routine to run a query on a database and print the results:
def doQuery( conn ) :
    cur = conn.cursor()

    cur.execute( "SELECT * FROM cars" )

    for name in cur.fetchall() :
        print( name )
        
print( "Connected successfully:" )
import mysql.connector
myConnection = mysql.connector.connect( host=hostname, user=username, passwd=password, db=database )
doQuery( myConnection )
myConnection.close()


# In[ ]:




