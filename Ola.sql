create database ola;

use ola;

select * from bookings;

#1.Retrive all successful booking

create view success_booking as select * from bookings where Booking_Status = 'Success';

select * from success_booking;

select count(Time) from success_booking;

#2.Find the average ride distance for each vehicle type:

create view Average_Ride_Distance as select Vehicle_Type,avg(Ride_Distance) 
from bookings group by Vehicle_Type;

select * from Average_Ride_Distance;

#3. Get the total number of canceled rides by customers:

create view cancel_rides as select * from bookings where Booking_Status = 'Canceled by Customer';

select count(*) from cancel_rides;

#4. List the top 5 customers who booked the highest number of rides

create view highest_rides as select customer_ID,count(Booking_ID) as total_rides from bookings group by 
customer_ID order by total_rides desc limit 5;

select * from highest_rides;

#5. Get the number of rides canceled by drivers due to personal and car-related issue

create view driver_cancel_rides as select * from bookings where Booking_Status = 'Canceled by Driver' and Canceled_Rides_by_Driver = 'Personal & Car related issue';

select * from driver_cancel_rides;

#6. Find the maximum and minimum driver ratings for prime Sedan bookings:

create view maximum_and_minimum_driver_ratings as select max(Driver_Ratings) as maximum_Driver_Ratings, min(Driver_Ratings) as minimum_Driver_Ratings
 from bookings where Vehicle_Type = 'Prime Sedan';
 
select * from maximum_and_minimum_driver_ratings;

#7. Retrive all rides where payment was made using upi

create view UPI_Payment as select * from bookings where Payment_Method = 'UPI';

select * from UPI_Payment;

#8. Find the average customer rating per vehicle type:

create view Average_customer_ratings as
select  Vehicle_Type,avg(Customer_Rating) as Average_customer_ratings from bookings group by Vehicle_Type;

select * from Average_customer_ratings;

#9. Calculate the total booking value of rides completed successfully

create view Total_Success_bookins as
select sum(Booking_Value) as total_booking_value from bookings where Booking_Status = 'Success';

select * from Total_Success_bookins;

#10. List all incomplete rides along with the reason:

create view Incomplete_Rides_Reason as
select Booking_ID,Incomplete_Rides_Reason from bookings where Incomplete_Rides = 'Yes';

select * from Incomplete_Rides_Reason;