# file_generator

## Description

Every time we need to export information from your application as text files, we are
writing code for every format we need to generate.

FileGenerator tries to minimize the ammount of code needed to perform this task.

## How does it work?

FileGenerator takes the header, body, and footer file formats as input
and additionally a hash with the data we want to export.

The format is expressed as string as follows:

each column has the next attributes

* Name: this name would match with the key in the hash
* Length: size of the column
* Value: dafult value in case that name doesn't match with any hash key
* Fill: for completing the space of length
* Align: align to Left or Right

as for instance:

<pre>
"id:3:0:0:D,name:30:: :I,region_id:3:0:0:D"
</pre>

and the data we want to export is:

<pre>
[{"id"=>1, "region_id"=>7, "name"=>"les Escaldes"},{"id"=>2, "region_id"=>7, "name"=>"Lima"}]
</pre>

FileGenerator will try to match the attribute names with the format
names, if they dont match, it will assign the value to the line of the
file to export, otherwise it will take the default value defined in the
format.

It also has names for the format which stablishes a special field as for
instance:

time: puts the current date with the format "YYYYMMDD"·

nreg : put the sum of records in the file in the body

## Usage

For example if you have a Ruby on Rails application and you need to export
diferents models like City, Region, Localities, Contacts, etc... you could define a controller Exports and for each model a method to export. Like the next example:

Add file_generator to your Gemfile.

<pre>
  gem 'file_generation'
</pre>

Create the method in the Exports controller for generate the file

<pre>
class ExportsController
  def cities
    headerformat = "treg:2:CC::I,csuc:3:193::I,time:8:0::I"
    bodyformat = "id:3:0:0:D,name:30:: :I,region_id:3:0:0:D"
    footerformat = "pie:2:CC::I,csuc:3:193::I,nreg:10:0:0:D"
    cities = [{"id"=>1, "region_id"=>7, "name"=>"les Escaldes"},{"id"=>2, "region_id"=>7, "name"=>"Lima"}]
    content = FileGenerator::Base.generate_file(cities, headerformat, bodyformat, footerformat)
    send_data content, :filename => "cities.txt"
  end

  def contacts
    ...
  end

end
</pre>

Add the routes in config/routes.rb

<pre>
resources :exports do
  get 'cities', :on => :collection
end
</pre>

and put the link in the view

<pre>
link_to("Export Cities", cities_exports_path)
</pre>

with this example you would get a file like this

<pre>
CC19320120206
001les Escaldes                  007
002Lima                          007
CC1930000000002
</pre>


# what next ?

* Make header and footer optional
* Add .csv format like a option
* Add more pre defined columns like "nreg" or "time"
* Add more format for the pre defined column "time"
