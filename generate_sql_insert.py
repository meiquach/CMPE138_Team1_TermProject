import os
import csv
import sys

def generate_sql(table):
    input_file = f'raw_data/{table}.csv'
    output_file = 'NBAteam-tbl.sql'

    print(f"Generating INSERT statements for raw_data/{table}.csv")

    # Open input and output files
    with open(input_file, 'r') as csv_file, open(output_file, 'a') as sql_file:
        csv_reader = csv.reader(csv_file)

        # Get the data types for each column
        dtypes = next(csv_reader)
        header = next(csv_reader)
        num_cols = len(header)

        sql_file.write(f"\n\n-- {table}: {header}\n")

        sql_template = "INSERT INTO {} VALUES ({});\n".format(
            table,
            '{}'
        )

        for row in csv_reader:
            values = list(row)

            values_str = ""
            for i in range(num_cols):
                dtype = dtypes[i]
                val = values[i]
                if dtype == 'str':
                    values_str += f"\'{val}\', "
                else:
                    values_str += f"{eval(dtype)(val)}, "

            sql_statement = sql_template.format(' '.join(values_str.split())[:-1])

            sql_file.write(sql_statement)

if __name__ == '__main__':
    data_dir = 'raw_data'
    tables = [
        'Head_Coach',
        'Assistant_Coach',
        'Team',
        'Player',
        'Match',
        'Statistic'
    ]

    for table in tables:
        generate_sql(table)