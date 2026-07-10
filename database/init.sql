CREATE TABLE IF NOT EXISTS sabores (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    precio NUMERIC(10, 2) NOT NULL CHECK (precio >= 0),
    stock INTEGER NOT NULL DEFAULT 0 CHECK (stock >= 0),
    descripcion TEXT,
    creado_en TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO sabores (nombre, precio, stock, descripcion)
VALUES
    ('Chocolate', 2.50, 20, 'Helado cremoso sabor chocolate'),
    ('Vainilla', 2.00, 15, 'Helado clásico sabor vainilla'),
    ('Fresa', 2.25, 18, 'Helado elaborado con sabor a fresa');