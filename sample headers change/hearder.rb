require 'chilkat'

#  This example program loads a file (sample.csv)
#  that contains this content:
#
#  year,color,country,food
#  2001,red,France,cheese
#  2005,blue,"United States",hamburger
#  2008,green,Italy,pasta
#  1998,orange,Japan,sushi
#
#  The first row contains the column names.
#  This file is available at:
#  http://www.chilkatsoft.com/testData/sample.csv

csv = Chilkat::CkCsv.new()

#  Prior to loading the CSV file, indicate that the 1st row
#  should be treated as column names:
csv.put_HasColumnNames(true)

#  Load the CSV records from the file:

success = csv.LoadFile("sample.csv")
if (success != true)
    print csv.lastErrorText() + "\n";
    exit
end

#  Change "cheese" to "baguette"
#  ("cheese" is at row=0, column=3
success = csv.SetCell(0,3,"baguette")

#  Change "blue" to "magenta"
success = csv.SetCell(1,1,"magenta")

#  Write the updated CSV to a string and display:

csvDoc = csv.saveToString()
print csvDoc + "\n";

#  Save the CSV to a file:
success = csv.SaveFile("out.csv")
if (success != true)
    print csv.lastErrorText() + "\n";
end
