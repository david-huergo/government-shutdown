# Check that the database file is there.
if (!(file.exists('treasury_data.db'))) {
  print('You need to download the database; run this.')
  print('  wget http://api.treasury.io/cc7znvq/47d80ae900e04f2/http/treasury_data.db')
  quit()
}

# Load dependencies
library(ggplot2)
library(sqldf)

# Run this if the "library" commands fail.
# install.packages(c('ggplot2','sqldf'))




# Querying
t3a_head <- sqldf('SELECT * FROM t3a LIMIT 100;', dbname = 'treasury_data.db')

# Note: sqldf queries both from the SQLite3 database
# and from the current R session.

print(sqldf('SELECt sum(today) FROM t3a_head'), dbname = 'treasury_data.db')

# Note well: DO NOT CREATE VARIABLES WITH THE NAMES OF ANY OF THE TABLES.
# If you do that, sqldf will query the table from the R session rather than
# from the SQLite3 database.




# Plotting
#
# There are a lot of syntaxes you can use with ggplot.
# This one is probably the most verbose format you can get,
# but it makes the different components quite clear.
# ggplot(
