USE airbnb;

-- Insert sample data into User table
INSERT INTO User (user_id, first_name, last_name, email, password_hash, phone_number, role)
VALUES
    (UUID(), 'John', 'Doe', 'john.doe@example.com', 'hash1', '1234567890', 'guest'),
    (UUID(), 'Jane', 'Smith', 'jane.smith@example.com', 'hash2', '0987654321', 'host'),
    (UUID(), 'Alice', 'Johnson', 'alice.johnson@example.com', 'hash3', '5678901234', 'admin');

-- Insert sample data into Property table
INSERT INTO Property (property_id, host_id, name, description, location, pricepernight)
VALUES
    (UUID(), 
        (SELECT user_id FROM User WHERE email = 'jane.smith@example.com'), 
        'Cozy Apartment', 
        'A cozy apartment in downtown', 
        'Downtown City', 
        120.00),
    (UUID(), 
        (SELECT user_id FROM User WHERE email = 'jane.smith@example.com'), 
        'Beach House', 
        'A beautiful house by the beach', 
        'Beachside', 
        250.00);

-- Insert sample data into Booking table
INSERT INTO Booking (booking_id, property_id, user_id, start_date, end_date, total_price, status)
VALUES
    (UUID(), 
        (SELECT property_id FROM Property WHERE name = 'Cozy Apartment'), 
        (SELECT user_id FROM User WHERE email = 'john.doe@example.com'), 
        '2024-01-01', '2024-01-07', 720.00, 'confirmed'),
    (UUID(), 
        (SELECT property_id FROM Property WHERE name = 'Beach House'), 
        (SELECT user_id FROM User WHERE email = 'john.doe@example.com'), 
        '2024-02-01', '2024-02-05', 1000.00, 'pending');

-- Insert sample data into Payment table
INSERT INTO Payment (payment_id, booking_id, amount, payment_method)
VALUES
    (UUID(), 
        (SELECT booking_id FROM Booking WHERE total_price = 720.00), 
        720.00, 'credit_card'),
    (UUID(), 
        (SELECT booking_id FROM Booking WHERE total_price = 1000.00), 
        1000.00, 'paypal');

-- Insert sample data into Review table
INSERT INTO Review (review_id, property_id, user_id, rating, comment)
VALUES
    (UUID(), 
        (SELECT property_id FROM Property WHERE name = 'Cozy Apartment'), 
        (SELECT user_id FROM User WHERE email = 'john.doe@example.com'), 
        5, 'Amazing place to stay!'),
    (UUID(), 
        (SELECT property_id FROM Property WHERE name = 'Beach House'), 
        (SELECT user_id FROM User WHERE email = 'john.doe@example.com'), 
        4, 'Great location, but a bit pricey.');

-- Insert sample data into Message table
INSERT INTO Message (message_id, sender_id, recipient_id, message_body)
VALUES
    (UUID(), 
        (SELECT user_id FROM User WHERE email = 'john.doe@example.com'), 
        (SELECT user_id FROM User WHERE email = 'jane.smith@example.com'), 
        'Hi Jane, I’m interested in booking the Beach House.'),
    (UUID(), 
        (SELECT user_id FROM User WHERE email = 'jane.smith@example.com'), 
        (SELECT user_id FROM User WHERE email = 'john.doe@example.com'), 
        'Hi John, sure! Let me know your preferred dates.');
