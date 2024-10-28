<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>POS Home</title>
        <!-- Font Awesome CDN -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
        <!-- Iconify CDN -->
        <script src="https://code.iconify.design/3/3.1.0/iconify.min.js"></script>
        <!-- Select2 CSS CDN -->
        <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
        <!-- jQuery CDN -->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <!-- Select2 JS CDN -->
        <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
        <!-- Google Fonts -->
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link rel="stylesheet" href="assets/css/POS/style.css">
    </head>
    <body>
        <div class="wrapper">
            <!-- Header -->
            <div class="top_header_part">
                <!-- Left Header Menu -->
                <div class="left_item">
                    <div class="header_part_middle">
                        <ul class="icon__menu">
                            <li class="has__children main_menu">
                                <a href="javascript:void(0)" class="header_menu_icon" data-tippy-content="Main Menu">
                                    <span class="iconify" data-icon="solar:user-check-broken" data-width="22"></span>
                                </a>
                            </li>
                            <li>
                                <a href="home.jsp" class="header_menu_icon" data-tippy-content="Dashboard">
                                    <span class="iconify" data-icon="solar:chart-2-broken" data-width="22"></span>
                                </a>
                            </li>
                            <li class="fullscreen-btn">
                                <a href="javascript:void(0)" class="header_menu_icon" data-tippy-content="Fullscreen">
                                    <span class="iconify" data-icon="majesticons:open-line" data-width="22"></span>
                                </a>
                            </li>
                            <li>
                                <a href="javascript:void(0)" class="time__date">
                                    <span class="iconify" data-icon="solar:clock-circle-broken" data-width="22"></span>
                                    <span id="current_time"></span>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>

                <!-- Right Header Menu -->
                <div class="header_part_right">
                    <ul class="btn__menu">
                        <li><a href="javascript:void(0)" class="bg__blue">All</a></li>
                        <li><a href="javascript:void(0)" class="bg__blue">Brand</a></li>
                        <li><a href="javascript:void(0)" class="bg__blue">Most Selling</a></li>
                        <li><a href="javascript:void(0)" class="bg__blue">Promo</a></li>
                    </ul>
                </div>
            </div>

            <div class="main_content">
                <!-- Left Side - Cart Area -->
                <div class="main_middle">
                    <!-- Select Area -->
                    <div class="select_area">
                        <div style="flex: 1;">
                            <select class="select2" id="select_employee">
                                <option value="">Select Employee</option>
                                <option value="1">Employee 1</option>
                                <option value="2">Employee 2</option>
                            </select>
                        </div>

                        <div style="flex: 1;">
                            <select class="select2" id="select_customer">
                                <option value="">Walk-in Customer</option>
                                <option value="1">Customer 1</option>
                                <option value="2">Customer 2</option>
                            </select>
                        </div>

                        <button class="customer_action_btn">
                            <i class="material-icons">edit</i>
                        </button>

                        <button class="customer_action_btn">
                            <i class="material-icons">add</i>
                        </button>
                    </div>

                    <!--                    <div class="order_table_header_row">
                                            <div>Item</div>
                                            <div>Price</div>
                                            <div>Qty</div>
                                            <div>Total</div>
                                        </div>-->

                    <div class="cart-container">
                        <div class="cart-header">
                            <div class="cart-row">
                                <div class="col-item">Item</div>
                                <div class="col-price">Price</div>
                                <div class="col-qty">Qty</div>
                                <div class="col-total">Total</div>
                                <div class="col-action">Action</div>
                            </div>
                        </div>
                        <div class="cart-body">
                            <c:if test="${sessionScope.cart != null && not empty sessionScope.cart.items}">
                                <c:forEach items="${sessionScope.cart.items}" var="cartItem">
                                    <div class="cart-row">
                                        <div class="col-item">${cartItem.storeStock.inventory.product.name}</div>
                                        <div class="col-price">
                                            <fmt:formatNumber value="${cartItem.price}" pattern="#,##0đ"/>
                                        </div>
                                        <div class="col-qty">
                                            <div class="quantity-control">
                                                <button onclick="updateQuantity(${cartItem.storeStock.storeStockId}, 'decrease')">-</button>
                                                <input type="number" value="${cartItem.quantity}" 
                                                       onchange="updateQuantity(${cartItem.storeStock.storeStockId}, 'input', this.value)"
                                                       min="1" max="${cartItem.storeStock.stock}">
                                                <button onclick="updateQuantity(${cartItem.storeStock.storeStockId}, 'increase')">+</button>
                                            </div>
                                        </div>
                                        <div class="col-total">
                                            <fmt:formatNumber value="${cartItem.quantity * cartItem.price}" pattern="#,##0đ"/>
                                        </div>
                                        <div class="col-action">
                                            <button onclick="removeFromCart('${cartItem.storeStock.storeStockId}')" class="btn-remove">
                                                <i class="fas fa-trash"></i>
                                            </button>
                                        </div>


                                    </div>
                                </c:forEach>
                            </c:if>
                        </div>
                        <div class="cart-footer">
                            <div class="cart-total">
                                Total: <fmt:formatNumber value="${sessionScope.cart.getTotalMoney()}" pattern="#,##0đ"/>

                            </div>
                        </div>
                    </div>


                    <div id="bottom_absolute">
                        <div class="button_group">
                            <button class="bg__red">
                                <i class="material-icons">close</i>
                                Cancel
                            </button>
                            <button class="bg_hold">
                                <i class="material-icons">pause</i>
                                Hold
                            </button>
                            <button class="bg__green">
                                <i class="material-icons">payment</i>
                                Payment
                            </button>
                        </div>
                    </div>
                </div>

                <!-- Right Side - Products Area -->
                <div class="main_right">
                    <div class="right_side_search_add_item">
                        <div class="search_filter_row">
                            <div class="search_input_group">
                                <input type="text" placeholder="Search by name, code, category">
                                <i class="material-icons">search</i>
                            </div>
                            <div class="search_input_group">
                                <input type="text" placeholder="Scan barcode">
                                <i class="material-icons">qr_code_scanner</i>
                            </div>
                        </div>
                    </div>

                    <div class="products-container">
                        <div class="products-grid">
                            <c:forEach items="${store}" var="s">
                                <div class="product-card" onclick="addToCart(${s.getStoreStockId()})">
                                    <div class="product-image">
                                        <img src="assets/images/product/${s.getInventory().getProduct().getImage()}" 
                                             alt="${s.getInventory().getProduct().getName()}"
                                             class="product-img">
                                    </div>
                                    <div class="product-info">
                                        <h3 class="product-name">${s.getInventory().getProduct().getName()}</h3>
                                        <p class="product-price">
                                            Giá: 
                                            <span class="price-value">
                                                <c:choose>
                                                    <c:when test="${s.getDiscount()== null}">
                                                        ${s.getInventory().getProduct().getPrice()}
                                                    </c:when>
                                                    <c:otherwise>
                                                        ${s.getDiscount().getPriceSell()}
                                                    </c:otherwise>
                                                </c:choose>
                                            </span>
                                        </p>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>

            </div>
        </div>

        <script>
            $(document).ready(function () {
                // Initialize Select2
                $('.select2').select2({
                    theme: "classic",
                    minimumResultsForSearch: Infinity,
                    width: '100%',
                    dropdownCssClass: 'select2-dropdown-clean'
                });

                // Update current time
                function updateTime() {
                    const now = new Date();
                    const options = {
                        weekday: 'long',
                        year: 'numeric',
                        month: 'long',
                        day: 'numeric',
                        hour: '2-digit',
                        minute: '2-digit',
                        second: '2-digit'
                    };
                    const dateTimeString = now.toLocaleDateString('en-US', options);
                    document.getElementById('current_time').textContent = dateTimeString;
                }

                setInterval(updateTime, 1000);
                updateTime();

                // Initialize Select2 with custom theme
                $('.select2').select2({
                    theme: "classic",
                    placeholder: "Select an option",
                    minimumResultsForSearch: Infinity, // Ẩn ô tìm kiếm trong dropdown
                    width: '100%'
                });

                //Full Screne Button
                $('.fullscreen-btn').click(function () {
                    if (!document.fullscreenElement) {
                        document.documentElement.requestFullscreen();
                        $(this).find('.material-icons').text('fullscreen_exit');
                    } else {
                        document.exitFullscreen();
                        $(this).find('.material-icons').text('fullscreen');
                    }
                });
            });
        </script>
        <script>
            function addToCart(storeStockId) {
                window.location.href = 'add-to-cart?storeStockId=' + storeStockId;
            }
            function updateQuantity(storeStockId, action, value = null) {
                let data = new URLSearchParams();
                data.append('storeStockId', storeStockId);
                data.append('action', action);

                if (value !== null) {
                    data.append('quantity', value);
                }

                fetch('update-cart', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/x-www-form-urlencoded',
                    },
                    body: data.toString()
                })
                        .then(response => {
                            if (!response.ok) {
                                throw new Error('Network response was not ok');
                            }
                            return response.json();
                        })
                        .then(data => {
                            if (data.success) {
                                window.location.href = 'PoSHome';
                            } else {
                                alert(data.error || 'Error updating cart');
                            }
                        })
                        .catch(error => {
                            console.error('Error:', error);
                            alert('Error updating cart');
                        });
            }

            function removeFromCart(storeStockId) {
                console.log("Removing item with ID:", storeStockId); // Debug log
                if (confirm('Are you sure you want to remove this item?')) {
                    // Convert storeStockId to number if it's passed as string
                    const id = parseInt(storeStockId);
                    if (isNaN(id)) {
                        alert('Invalid item ID');
                        return;
                    }

                    fetch('remove-from-cart?storeStockId=' + id)
                            .then(response => {
                                if (response.ok) {
                                    window.location.href = 'PoSHome';
                                } else {
                                    alert('Error removing item from cart');
                                }
                            })
                            .catch(error => {
                                console.error('Error:', error);
                                alert('Error removing item from cart');
                            });
                }
            }


            function initBarcodeScanner() {
                const barcodeInput = document.querySelector('input[placeholder="Scan barcode"]');
                let barcode = '';

                document.addEventListener('keydown', function (e) {
                    if (barcodeInput === document.activeElement) {
                        if (e.key === 'Enter') {
                            searchProductByBarcode(barcode);
                            barcode = '';
                        } else {
                            barcode += e.key;
                        }
                    }
                });
            }

            function searchProductByBarcode(barcode) {
                fetch(`search-product?barcode=${barcode}`)
                        .then(response => response.json())
                        .then(data => {
                            if (data.storeStockId) {
                                addToCart(data.storeStockId);
                            } else {
                                alert('Product not found');
                            }
                        });
            }
            document.addEventListener('DOMContentLoaded', initBarcodeScanner);
            // Tìm kiếm sản phẩm
            document.querySelector('input[placeholder="Search by name, code, category"]').addEventListener('input', function (e) {
                const searchText = e.target.value.toLowerCase();
                const products = document.querySelectorAll('.product-card');

                products.forEach(product => {
                    const name = product.querySelector('.product-name').textContent.toLowerCase();
                    const shouldShow = name.includes(searchText);
                    product.style.display = shouldShow ? '' : 'none';
                });
            });
        </script>
    </body>
</html>
