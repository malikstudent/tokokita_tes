from flask import Flask, jsonify, request, render_template
import psycopg2
import os

app = Flask(__name__)


def get_db_connection():
    return psycopg2.connect(
        host=os.getenv("DB_HOST"),
        database=os.getenv("DB_NAME"),
        user=os.getenv("DB_USER"),
        password=os.getenv("DB_PASS")
    )


@app.route('/')
def home():
    return render_template('index.html')


@app.route('/products', methods=['GET'])
def get_products():
    conn = get_db_connection()
    cur = conn.cursor()

    cur.execute('SELECT id, name, price FROM products ORDER BY id;')
    rows = cur.fetchall()

    cur.close()
    conn.close()

    return jsonify([
        {
            "id": row[0],
            "name": row[1],
            "price": row[2]
        }
        for row in rows
    ])


@app.route('/products', methods=['POST'])
def add_product():
    data = request.get_json()

    if not data or 'name' not in data or 'price' not in data:
        return jsonify({
            "status": "error",
            "message": "name dan price wajib diisi"
        }), 400

    conn = get_db_connection()
    cur = conn.cursor()

    cur.execute(
        'INSERT INTO products (name, price) VALUES (%s, %s)',
        (data['name'], data['price'])
    )

    conn.commit()

    cur.close()
    conn.close()

    return jsonify({"status": "success"}), 201


if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
