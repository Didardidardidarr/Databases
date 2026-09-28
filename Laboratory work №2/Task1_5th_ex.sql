
CREATE TABLE Passengers (
    passport_number VARCHAR(20) PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL
);

CREATE TABLE Airports (
    airport_code VARCHAR(10) PRIMARY KEY,
    airport_name VARCHAR(100) NOT NULL,
    city VARCHAR(50) NOT NULL
);

CREATE TABLE Airlines (
    airline_id INT PRIMARY KEY,
    airline_name VARCHAR(100) NOT NULL
);

CREATE TABLE Flights (
    flight_number VARCHAR(10) PRIMARY KEY,
    airline_id INT NOT NULL,
    dep_airport_code VARCHAR(10) NOT NULL,
    arr_airport_code VARCHAR(10) NOT NULL,
    FOREIGN KEY (airline_id) REFERENCES Airlines(airline_id),
    FOREIGN KEY (dep_airport_code) REFERENCES Airports(airport_code),
    FOREIGN KEY (arr_airport_code) REFERENCES Airports(airport_code)
);

CREATE TABLE Bookings (
    booking_id INT PRIMARY KEY,
    passport_number VARCHAR(20) NOT NULL,
    flight_number VARCHAR(10) NOT NULL,
    ticket_price DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (passport_number) REFERENCES Passengers(passport_number),
    FOREIGN KEY (flight_number) REFERENCES Flights(flight_number)
);

CREATE TABLE Booking_Seats (
    booking_id INT NOT NULL,
    seat_number VARCHAR(5) NOT NULL,
    PRIMARY KEY (booking_id, seat_number),
    FOREIGN KEY (booking_id) REFERENCES Bookings(booking_id)
);


INSERTING INFO

INSERT INTO Passengers (passport_number, full_name) VALUES
('N12345678', 'John Doe'),
('N87654321', 'Anna Smith'),
('N55544332', 'Mike Johnson'),
('N11223344', 'Elena Petrova'),
('N99887766', 'David Brown');

INSERT INTO Airports (airport_code, airport_name, city) VALUES
('JFK', 'John F. Kennedy International', 'New York'),
('LHR', 'Heathrow Airport', 'London'),
('SVO', 'Sheremetyevo International', 'Moscow'),
('DXB', 'Dubai International', 'Dubai');

INSERT INTO Airlines (airline_id, airline_name) VALUES
(1, 'Delta Air Lines'),
(2, 'British Airways'),
(3, 'Emirates');

INSERT INTO Flights (flight_number, airline_id, dep_airport_code, arr_airport_code) VALUES
('DL101', 1, 'JFK', 'LHR'),
('BA202', 2, 'LHR', 'SVO'),
('EK303', 3, 'DXB', 'JFK');

INSERT INTO Bookings (booking_id, passport_number, flight_number, ticket_price) VALUES
(101, 'N12345678', 'DL101', 450.00),
(102, 'N87654321', 'DL101', 900.00),
(103, 'N55544332', 'BA202', 380.00),
(104, 'N11223344', 'EK303', 720.00),
(105, 'N99887766', 'EK303', 1440.00);

INSERT INTO Booking_Seats (booking_id, seat_number) VALUES
(101, '12A'),
(102, '14B'),
(102, '14C'),
(103, '08F'),
(104, '21A'),
(105, '03A'),
(105, '03B');
