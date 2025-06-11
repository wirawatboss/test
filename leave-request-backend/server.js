const express = require('express');
const cors = require('cors');
const mysql = require('mysql2');

const app = express();
app.use(cors());
app.use(express.json());

const db = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: '',  // ใส่รหัสผ่าน MySQL ของคุณ
  database: 'leave_request_db',
});

db.connect((err) => {
  if (err) {
    console.error('ไม่สามารถเชื่อมต่อฐานข้อมูลได้:', err);
  } else {
    console.log('เชื่อมต่อฐานข้อมูลสำเร็จ');
  }
});

// API เพิ่มข้อมูลใบลา
app.post("/api/leave-requests", (req, res) => {
  const {
    id,
    fullName,
    departmentPosition,
    email,
    phoneNumber,
    leaveType,
    reason,
    leaveFrom,
    leaveTo,
    createdAt,
    status,
  } = req.body;

  // แปลง createdAt '2025-06-11T16:18' เป็น '2025-06-11 16:18:00'
  const formattedCreatedAt = createdAt.replace('T', ' ') + ':00';

  const sql = `
    INSERT INTO leave_requests 
      (id, fullName, departmentPosition, email, phoneNumber, leaveType, reason, leaveFrom, leaveTo, createdAt, status)
    VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
  `;

  db.query(sql, [
    id, fullName, departmentPosition, email, phoneNumber, leaveType, reason, leaveFrom, leaveTo, formattedCreatedAt, status
  ], (err, result) => {
    if (err) {
      console.error("เกิดข้อผิดพลาดในการบันทึกข้อมูล:", err);
      return res.status(500).json({ error: "ไม่สามารถบันทึกข้อมูลใบลาได้" });
    }
    res.status(201).json({ message: "บันทึกใบลาสำเร็จ" });
  });
});

// API ดึงข้อมูลใบลาพร้อมค้นหา
app.get('/api/leave-requests', (req, res) => {
  const { fullName, searchDate } = req.query;

  let sql = 'SELECT * FROM leave_requests WHERE 1=1';
  const params = [];

  if (fullName) {
    sql += ' AND fullName LIKE ?';
    params.push(`%${fullName}%`);
  }

  if (searchDate) {
    sql += ' AND leaveFrom <= ? AND leaveTo >= ?';
    params.push(searchDate, searchDate);
  }

  sql += ' ORDER BY createdAt DESC';

  db.query(sql, params, (err, results) => {
    if (err) {
      console.error(err);
      return res.status(500).json({ error: 'เกิดข้อผิดพลาดในการดึงข้อมูล' });
    }
    res.json(results);
  });
});

app.listen(5000, () => {
  console.log('Server running on port 5000');
});
