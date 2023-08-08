import pandas as pd
from dotenv import load_dotenv
from os import getenv
import psycopg2

load_dotenv()

class titenic:
    
    __user = getenv('USER')
    __password = getenv('PASSWORD')
    __server = getenv('SERVER')
    
    __pg_con = psycopg2.connect(
        dbname = __user,
        user = __user,
        password = __password,
        host = __server
    )
    
    __cur = __pg_con.cursor()
    
    def __init__(self, filepath:str =r'https://raw.githubusercontent.com/lucchesia7/coding-temple-da-sql-day-1/main/day_1/data/titanic.csv'):
        self.path = filepath
    
    def jontron(self):
        df = pd.read_csv(self.path)
        df.columns = df.columns.str.lower().str.replace(' ', '_')
        df['age'] = df['age'].astype(int)
        df['fare'] = round(df['fare'],2)
        df.rename(columns={'siblings/spouses_aboard':'siblings_spouses_aboard'},inplace=True)
        df.rename(columns={'parents/children_aboard':'parents_children_aboard'},inplace=True)
        self.df = df
        return self.df
    
    def create_tables(self, sql_filepath:str):
        start = self.create_file(sql_filepath)
        tables = start.split(';')
        for table in tables:
            try:
                print(table)
                self.__cur.execute(table)
                self.__pg_con.commit()
            except psycopg2.ProgrammingError as msg:
                print(f'Command Skipped: {msg}')
    # Had to bridge two online solutions to get this to finally work. Its 2am and I haven't even written the selections...
    def insert(self):
        sql = "INSERT INTO titanic(survived,pclass,name,sex,age,siblings_spouses_aboard,parents_children_aboard) values(%s,%s,%s,%s,%s,%s,%s)"
        for index, row in self.df.iterrows():
            self.__cur.execute(sql, (row.survived,row.pclass,row.name,row.sex,row.age,row.siblings_spouses_aboard,row.parents_children_aboard))
            self.__pg_con.commit()
    
    def selections(self,sql_filepath:str):
        start = self.create_file(sql_filepath)
        selections = start.split(';')
        for select in selections:
            try:
                self.__cur.execute(select)
                results = self.__cur.fetchall()
                for result in results:
                    print(f'The answer is {result}')
            except psycopg2.ProgrammingError as msg:
                print(f'Command Skipped: {msg}')
    
    @staticmethod
    def create_file(filepath:str):
        '''Opens a file by the filepath and apply it to a SQL Server'''
        with open(filepath, 'r') as f:
            sql_file = f.read()
        return sql_file
if __name__ == '__main__':
    C = titenic()
    C.jontron()
    # C.create_tables(r'C:\Users\Owner\Documents\Coding Temple\week_5\day_1\titenic_createtable.sql')
    # C.insert()
    C.selections(r'C:\Users\Owner\Documents\Coding Temple\week_5\day_1\titenic_selections.sql')