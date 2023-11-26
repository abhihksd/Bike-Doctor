# Bike-Doctor
BIKE DOCTOR

The purpose of this project is to develop an online bike servicing portal. 

We intended to create a portal where customers can create an account, log in and book an appointment to get their motorcycle serviced. 

The service centers can create their account and log in to accept bookings from customers. 

The customers can view the bill and pay through the portal. 

The service centers can use this portal to expand their customer base by providing good services and receiving better ratings. 

The admin can monitor the entire system and generate reports. 

The admin can also cease the services of any user/service center involved in malpractices.   
               
The project uses MySQL for the backend and React for the User Interface, i.e.  Frontend. 

The middleware of the project is a combination of Java and ASP.Net We have tried to implement concepts of Spring boot REST API and .Net MVC in our project. 

These technologies contribute their advantages in functionalities of the portal.
 
BIKE DOCTOR
Tables required:
1.	Customer
a.	Create account
b.	Book appointment
c.	View bill
d.	Pay for bill
e.	Give rating
2.	Service centres
a.	Create account
b.	Login and accept booking
3.	Admin
4.	Transactions 
5.	Ratings
6.	Bike
7.	Service
8.	Appointment 

	
attributes of tables

1.	Customer: Name,cust_id,mobile no,email,password,bike,service id
2.	Service centre: servicecentre_id, name,location,number of mechanics 
3.	Admin: name,id
4.	Transactions: transid,cust_id,service centre_id,amount
5.	Ratings: service center id,service  id,userid,rating( 1 to 5)
6.	Bike: bikeid(given by us),model,type, servicing_id
7.	Service: service_id,trans_id,cust_id,centre_id
8.	Appointment: time,cust_id,service_id
9.	
