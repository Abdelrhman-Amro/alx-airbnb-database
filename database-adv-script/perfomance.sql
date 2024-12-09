-- performance.sql
SELECT 
    Booking.booking_id,
    Booking.start_date,
    Booking.end_date,
    Booking.total_price,
    Booking.status,
    User.user_id,
    User.first_name,
    User.last_name,
    User.email,
    Property.property_id,
    Property.name AS property_name,
    Property.location,
    Property.pricepernight,
    Payment.payment_id,
    Payment.amount,
    Payment.payment_method,
    Payment.payment_date
FROM 
    Booking
INNER JOIN 
    User 
ON 
    Booking.user_id = User.user_id
INNER JOIN 
    Property 
ON 
    Booking.property_id = Property.property_id
LEFT JOIN 
    Payment 
ON 
    Booking.booking_id = Payment.booking_id;

EXPLAIN SELECT 
    Booking.booking_id,
    Booking.start_date,
    Booking.end_date,
    Booking.total_price,
    Booking.status,
    User.user_id,
    User.first_name,
    User.last_name,
    User.email,
    Property.property_id,
    Property.name AS property_name,
    Property.location,
    Property.pricepernight,
    Payment.payment_id,
    Payment.amount,
    Payment.payment_method,
    Payment.payment_date
FROM 
    Booking
INNER JOIN 
    User 
ON 
    Booking.user_id = User.user_id
INNER JOIN 
    Property 
ON 
    Booking.property_id = Property.property_id
LEFT JOIN 
    Payment 
ON 
    Booking.booking_id = Payment.booking_id;

CREATE INDEX idx_booking_user_id ON Booking(user_id);
CREATE INDEX idx_booking_property_id ON Booking(property_id);
CREATE INDEX idx_payment_booking_id ON Payment(booking_id);

SELECT 
    Booking.booking_id,
    Booking.start_date,
    Booking.end_date,
    Booking.total_price,
    Booking.status,
    User.first_name,
    User.last_name,
    Property.name AS property_name,
    Payment.amount,
    Payment.payment_method
FROM 
    Booking
INNER JOIN 
    User 
ON 
    Booking.user_id = User.user_id
INNER JOIN 
    Property 
ON 
    Booking.property_id = Property.property_id
LEFT JOIN 
    Payment 
ON 
    Booking.booking_id = Payment.booking_id
WHERE 
    Booking.status = 'confirmed'; -- Apply filtering if possible

EXPLAIN SELECT 
    Booking.booking_id,
    Booking.start_date,
    Booking.end_date,
    Booking.total_price,
    Booking.status,
    User.first_name,
    User.last_name,
    Property.name AS property_name,
    Payment.amount,
    Payment.payment_method
FROM 
    Booking
INNER JOIN 
    User 
ON 
    Booking.user_id = User.user_id
INNER JOIN 
    Property 
ON 
    Booking.property_id = Property.property_id
LEFT JOIN 
    Payment 
ON 
    Booking.booking_id = Payment.booking_id
WHERE 
    Booking.status = 'confirmed';
