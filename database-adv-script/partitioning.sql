
-- Step 1: Create a partitioned table for Booking
CREATE TABLE Booking_Partitioned (
    booking_id CHAR(36) NOT NULL,
    property_id CHAR(36) NOT NULL,
    user_id CHAR(36) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price DECIMAL(10, 2) NOT NULL,
    status ENUM('pending', 'confirmed', 'canceled') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (booking_id, start_date)
)
PARTITION BY RANGE (YEAR(start_date)) (
    PARTITION p2020 VALUES LESS THAN (2021),
    PARTITION p2021 VALUES LESS THAN (2022),
    PARTITION p2022 VALUES LESS THAN (2023),
    PARTITION p2023 VALUES LESS THAN (2024),
    PARTITION p_future VALUES LESS THAN MAXVALUE
);

INSERT INTO Booking_Partitioned
SELECT * FROM Booking;

-- Fetch bookings between January 1, 2022, and December 31, 2022
SELECT 
    booking_id, 
    property_id, 
    user_id, 
    start_date, 
    end_date, 
    total_price, 
    status
FROM 
    Booking_Partitioned
WHERE 
    start_date BETWEEN '2022-01-01' AND '2022-12-31';
