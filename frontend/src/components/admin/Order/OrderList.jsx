import React, { useState, useEffect } from 'react';

const OrderList = () => {
    const [orders, setOrders] = useState([]);
    const [loading, setLoading] = useState(true);
    const [error, setError] = useState(null); // Lưu trữ thông tin lỗi

    useEffect(() => {
        const fetchOrders = async () => {
            try { const response = await fetch('http://localhost:5000/api/admin/order'); 
                if (!response.ok) { 
                    throw new Error('Không tìm thấy dữ liệu đơn hàng'); } 
                    const data = await response.json(); 
                    console.log(data); // Kiểm tra dữ liệu trả về 
                    } catch (error) { console.error('Error fetching orders:', error.message); } };

        fetchOrders();
    }, []);

    if (loading) {
        return <div>Đang tải...</div>; // Hiển thị thông báo "Đang tải"
        console.error();
    }

    if (error) {
        return (
            <div>
                <h2>Lỗi khi tải dữ liệu đơn hàng</h2>
                <p>Thông báo lỗi: {error}</p>
                {/* Có thể thêm nút "Thử lại" ở đây nếu cần */}
            </div>
        );
    }

    return (
        <table>
            <thead>
                <tr>
                    <th>Order ID</th>
                    <th>Địa chỉ</th>
                    <th>Số điện thoại</th>
                    <th>Tổng tiền</th>
                    <th>Trạng thái thanh toán</th>
                    <th>ID tài khoản</th>
                    <th>Tên đầy đủ</th>
                </tr>
            </thead>
            <tbody>
                {orders.map(order => (
                    <tr key={order.order_id}>
                        <td>{order.order_id}</td>
                        <td>{order.address}</td>
                        <td>{order.phone_number}</td>
                        <td>{order.total}</td>
                        <td>{order.pay_status}</td>
                        <td>{order.acc_id}</td>
                        <td>{order.full_name}</td>
                    </tr>
                ))}
            </tbody>
        </table>
    );
};

export default OrderList;