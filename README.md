# file_generator

## Description

Every time we need to generate text files for our applications, we are 
writing code for every format we need to generate.

FileGenerator tries to minimize the ammount of code needed to perform
this task.

# How does it work?

FileGenerator takes the header, body, and footer file formats as input
and additionally a hash with the data we want to export.

The format is expressed as string as follows:

0 => nombre
1 => longitud
2 => valor
3 => relleno
4 => alineado


as for instance:

body format "id:3:0:0:D,name:30:: :I,region_id:3:0:0:D"


and the data we want to export is:

[{"id"=>1, "region_id"=>7, "name"=>"les Escaldes"},{"id"=>2, "region_id"=>7, "name"=>"Lima"}]

FileGenerator will try to match the attribute names with the format
names, if they dont match, it will assign the value to the line of the
file to export, otherwise it will take the default value defined in the
format.

It also has names for the format which stablishes a special field as for
instance:

time: puts the current date with the format "·$"·$"·

nreg : put the ammount of records in the file in the body

## Usage

