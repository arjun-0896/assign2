### Tour Management System using Ruby on Rails

This system allows you to book tours and perform other related operations with it. <br/>
You can login as either `customer`, `agent` or `admin`. <br/>
<br/>
#### Admin
1. Username : admin@ncsu.edu<br/>
   Password : team (Quite confidential :p) <br/><br/>
   Once you login, you shall be able to see various options such as `creating agent account`, `creating customer account`, etc.<br/><br/>
   
#### Customer
1. You can create a new customer through `customer sign up`.
   Also, you can login from login console. 
   One demo customer has already been created with following credentials.<br/><br/>
   username : customer1@ncsu.edu<br/>
   password : 12345678<br/>
   <br/>
 #### Agent 
 1. You can create a new customer through `Agent sign up`.
    Also, you can login from login console. 
    One demo agent has already been created with following credentials.<br/><br/>
    username : agent1@ncsu.edu<br/>
    password : agent@123<br/>
    
 #### Options
 Options corresponding to each user is given in respective pages which displays after respective login
 
 #### Features implemented
 1) Login<br/>
 2) Signup<br/>
 3) Profile<br/>
 3) Tours all functions<br/>
 4) Booking all functions<br/>
 
 In the bookings part, it will show error if u book seats more than available. So, you have to check availability in tours page and provide the seats. Additional seats required must be provided in the waitlist field. A weird design, but yeah :p Will try to improve in the next submission
 
 ** Overall flow is done
 
 #### Yet to be done
 1) Reviews<br/>
 2) Bookmarks<br/>
 3) Pictures for tours <br/>
 3) Search by itinerary<br/>
 4) Testing<br/>
 
 #### Flaws identified as of now
 
 1) In the bookings part, it will show error if u book seats more than available. So, you have to check availability in tours page and provide the seats. Additional seats required must be provided in the waitlist field. A weird design, but yeah :p Will try to improve in the next submission <br/>
 2) Admin has no link in the user interface to reach the options page of customers and agents, though he can perform those options when he hits the url of the respective controllers. Will provide in the next submission

App Link: [App](https://sleepy-brushlands-90006.herokuapp.com)<br/>

Contributors:

Arjun 
Harsha
Shraddha
