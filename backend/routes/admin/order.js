const express = require('express');
const db = require('../../db');
const router = express.Router();

router.get('/', (req, res) => {
  db.query('SELECT * FROM order', (error, results, fields) => {
    if (error) {
      console.error('Error fetching orders:', error);
      return res.status(500).json({ error: 'Lỗi máy chủ' });
    }
    console.log('Data to send:', results); // Kiểm tra dữ liệu
    res.json(results);
  });
});

module.exports = router;
