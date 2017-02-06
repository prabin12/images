#This programs imports  Exercise images file  to database
#Ruby version 2.3.1
#install pg gem file

require 'pg'
begin
 basedir = '.'
Integer id = 1

g = 'M' #Initilize gender M or female

puts "gender:"+ g

location_id = 2 #initilize location id

 

 path = "/home/prabin/Desktop/image/" # change as required
  files = Dir.glob(path + "*.jpg")
   conn=PGconn.connect( :hostaddr => "ec2-54-225-83-198.compute-1.amazonaws.com", :port=>5432, :dbname =>"dubf6suc9gskl",
                         :user=>"bzgzosfwpyleze", :password=>'LseNyL9l-qv1hdK6pQNTHGiBxJ') # change the value as required

 #conn=PGconn.connect( :hostaddr => "127.0.0.1", :port=>5432, :dbname =>"foto", :user=>"prabin", :password=>'123456')
files.each do |file_name|

       a = file_name
       d = a.slice! path #"/home/prabin/Desktop/image/"
       
     
       f = d + a
        puts "\n\nImage_url:-" + f

   # gives order id for  exercise_images

         k = a.scan(/\d/).join('')
        puts "Order_id:-" + k;
         
      
 j = (a.scan(/\d+|[A-Za-z]+/))
 
  j.pop
   j.pop
 nam = j.join(' ')

puts "exercise_name:- "+ nam

   
  
    
    res = conn.exec("SELECT id FROM exercises where name = '#{nam}' ")
puts "Exercise_id:"
puts  res.getvalue 0, 0
  
 final = conn.exec("insert into input_images values (#{id},#{k},'#{f}','#{res.getvalue 0, 0}','#{g}','#{location_id}') ")

      puts "Data inserted of ID:----"
    puts  id
id = id+1     

end
conn.disconnect
     
end
