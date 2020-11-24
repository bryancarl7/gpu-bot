import csv
import pandas
import pymongo


def main():
    print("hello")
    client = pymongo.MongoClient("mongodb://localhost:27017/")
    print("db")
    database = client["mydatabase"]
    print(database)
    dblist = client.list_database_names()
    print(dblist)


if __name__ == "__main__":
    main()