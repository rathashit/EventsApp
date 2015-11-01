# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Event.create([
	{
		:name => "Delhi Comic Con", 
		:location => "New Delhi", 
		:desc => "Delhi Comic Con is back in its 5th edition and this time is going to be bigger and better than ever. With over 200 exhibitors international guests and exclusive programming content that includes, sessions, launches, screenings and much more. Featuring content from leading international pop culture brands in gaming, TV shows and movies, Delhi Comic Con is all set to blow your minds.",
		:start_doe => DateTime.strptime("12/20/2015 10:00", "%m/%d/%Y %H:%M"),
		:end_doe => DateTime.strptime("12/23/2015 17:00", "%m/%d/%Y %H:%M"),
		:fee => 100
	},
	{
		:name => "India Cold Chain Show", 
		:location => "Bombay Exhibition Centre, Mumbai", 
		:desc => "The India Cold Chain Show is an exhibition which is being organized in order to support and upliftment of Indian Cold Chain Industry. The exhibition aims to showcase solutions from Indian & internationals. It features some of the technologies and solutions from Cold chain and related sectors." ,
		:start_doe => DateTime.strptime("01/10/2015 10:00", "%m/%d/%Y %H:%M"),
		:end_doe => DateTime.strptime("01/12/2015 15:00", "%m/%d/%Y %H:%M"),
		:fee => 0
	},
	{
		:name => "Mtvi Xtreme Slash", 
		:location => "Supernova Arena and Convention Centre, Bengaluru", 
		:desc => "India gets its adrenalin pumping, heartbeats soaring and eyes wide open with MTVI Xtreme - India`s Biggest rock music and adventure sports festival!" ,
		:start_doe => DateTime.strptime("10/14/2015 16:00", "%m/%d/%Y %H:%M"),
		:end_doe => DateTime.strptime("10/14/2015 22:00", "%m/%d/%Y %H:%M"),
		:fee => 2500
	},
	{
		:name => "Carnival Run 2015", 
		:location => "Decathlon Sarjapur, Bengaluru", 
		:desc => "You must have been part of several marathons but you might not have seen this kind of marathon which will be full of fun and entertainment. Wait for it people Sportzify along with Decathlon brings to you the Carnival Run 2015." ,
		:start_doe => DateTime.strptime("11/07/2015 05:30", "%m/%d/%Y %H:%M"),
		:end_doe => DateTime.strptime("11/07/2015 06:30", "%m/%d/%Y %H:%M"),
		:fee => 200
	}
	])


