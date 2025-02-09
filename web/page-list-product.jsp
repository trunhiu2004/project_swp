<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">

    
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>POS Admin</title>

        <script type="text/javascript">
            function doDelete(id) {
                if (confirm("Bạn có muốn xóa sản phẩm có mã là " + id + " không ?")) {
                    window.location = "deleteProduct?product_id=" + id;
                }
            }
        </script>

        <!-- Favicon -->
        <jsp:include page="components/favicon.jsp"></jsp:include>  </head>
        <body class="  ">
            <!-- loader Start -->
            <div id="loading">
                <div id="loading-center">
                </div>
            </div>
            <!-- loader END -->
            <!-- Wrapper Start -->
            <div class="wrapper">

            <jsp:include page="components/sidebar.jsp"></jsp:include>     
            <jsp:include page="components/topnavbar.jsp"></jsp:include>
                <div class="modal fade" id="new-order" tabindex="-1" role="dialog" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered" role="document">
                        <div class="modal-content">
                            <div class="modal-body">
                                <div class="popup text-left">
                                    <h4 class="mb-3">New Order</h4>
                                    <div class="content create-workform bg-body">
                                        <div class="pb-3">
                                            <label class="mb-2">Email</label>
                                            <input type="text" class="form-control" placeholder="Enter Name or Email">
                                        </div>
                                        <div class="col-lg-12 mt-4">
                                            <div class="d-flex flex-wrap align-items-ceter justify-content-center">
                                                <div class="btn btn-primary mr-4" data-dismiss="modal">Cancel</div>
                                                <div class="btn btn-outline-primary" data-dismiss="modal">Create</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>      <div class="content-page">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="d-flex flex-wrap flex-wrap align-items-center justify-content-between mb-4">
                                    <div>
                                        <h4 class="mb-3">Danh sách sản phẩm</h4>
                                        <p class="mb-0">Danh sách này có thể bao gồm nhiều yếu tố như tên, hình ảnh, mô tả, giá cả, <br>và thông tin liên quan đến từng sản phẩm.</p>
                                    </div>
                                    <a href="addProduct" class="btn btn-primary add-list"><i class="las la-plus mr-3"></i>Thêm sản phẩm</a>
                                </div>
                            </div>
                            <div class="col-lg-12">
                                <div class="table-responsive rounded mb-3">
                                    <form action="findProduct" method="get" data-toggle="validator">
                                        <div class="mb-3 d-flex justify-content-end">                             
                                            <input type="text" class="form-control" name="namePro" placeholder="Tìm kiếm sản phẩm theo tên" style="max-width: 300px;" />
                                            <button type="submit" class="btn btn-primary mr-2">Tìm kiếm</button>
                                            <a href="listProduct" class="btn btn-primary add-list"><i class="ri-eye-line"></i>Xem toàn bộ sản phẩm</a>
                                        <c:if test="${not empty message}">
                                                <div class="alert alert-danger">
                                                    ${message}
                                                </div>
                                            </c:if>
                                        </div>
                                    </form>
                                    <table class="table mb-0 tbl-server-info">
                                        <thead class="bg-white text-uppercase">
                                            <tr class="ligth ligth-data">
                                                <th>Mã vạch</th>
                                                <th>Sản phẩm</th>
                                                <th>Tên sản phẩm</th>
                                                <th>Loại sản phẩm</th>
                                                <th>Giá</th>
                                                <th>Nhãn hàng</th>
                                                <th>Đơn vị</th>
                                                <th>Ngày sản xuất</th>
                                                <th>Ngày hết hạn</th>
                                                <th>Lô</th>
                                                <th>Chức năng khác</th>
                                            </tr>
                                        </thead>
                                        <tbody class="ligth-body">
                                            <c:if test="${empty pro}">
                                                <tr>
                                                    <td colspan="10" style="text-align: center;">Không tìm thấy sản phẩm.</td>
                                                </tr>
                                            </c:if>
                                        <c:forEach items="${pro}" var="p">
                                            <tr>
                                                <td>${p.getBarcode()}</td>
                                                <td><img src="assets/images/product/${p.getImage()}" width="80px" height="80px"/></td>
                                                <td>${p.getName()}</td>
                                                <td>${p.productCategories.getName()}</td>
                                                <td>${p.getPrice()}</td>
                                                <td>${p.suppliers.getName()}</td>
                                                <td>${p.weightUnit.getName()}</td>
                                                <td>${p.getManufactureDate()}</td>
                                                <td>${p.getExpirationDate()}</td>
                                                <td>${p.getBatch()}</td>
                                                <td>
                                                    <div class="d-flex align-items-center list-action">
                                                        <a class="badge badge-info mr-2" data-toggle="tooltip" data-placement="top" title="" data-original-title="Lịch sử giá"
                                                           href="listPrice?product_id=${p.getId()}"><i class="ri-eye-line mr-0"></i></a>
                                                        <a class="badge bg-success mr-2" data-toggle="tooltip" data-placement="top" title="" data-original-title="Chỉnh sửa giá"
                                                           href="updatePrice?product_id=${p.getId()}"><i class="ri-pencil-line mr-0"></i></a>
                                                        <a class="badge bg-success mr-2" data-toggle="tooltip" data-placement="top" title="" data-original-title="Chỉnh sửa thông tin"
                                                           href="updateProduct?product_id=${p.getId()}"><i class="ri-pencil-line mr-0"></i></a>
                                                        <a class="badge bg-warning mr-2" data-toggle="tooltip" data-placement="top" title="" data-original-title="Xóa sản phẩm"
                                                           href="#" onclick="doDelete(${p.getId()})"><i class="ri-delete-bin-line mr-0"></i></a>
                                                    </div>
                                                </td>
                                                
                                            </tr>
                                        </c:forEach>                                  
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <!-- Page end  -->
                </div>
                <!-- Modal Edit -->
                <div class="modal fade" id="edit-note" tabindex="-1" role="dialog" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered" role="document">
                        <div class="modal-content">
                            <div class="modal-body">
                                <div class="popup text-left">
                                    <div class="media align-items-top justify-content-between">                            
                                        <h3 class="mb-3">Product</h3>
                                        <div class="btn-cancel p-0" data-dismiss="modal"><i class="las la-times"></i></div>
                                    </div>
                                    <div class="content edit-notes">
                                        <div class="card card-transparent card-block card-stretch event-note mb-0">
                                            <div class="card-body px-0 bukmark">
                                                <div class="d-flex align-items-center justify-content-between pb-2 mb-3 border-bottom">                                                    
                                                    <div class="quill-tool">
                                                    </div>
                                                </div>
                                                <div id="quill-toolbar1">
                                                    <p>Virtual Digital Marketing Course every week on Monday, Wednesday and Saturday.Virtual Digital Marketing Course every week on Monday</p>
                                                </div>
                                            </div>
                                            <div class="card-footer border-0">
                                                <div class="d-flex flex-wrap align-items-ceter justify-content-end">
                                                    <div class="btn btn-primary mr-3" data-dismiss="modal">Cancel</div>
                                                    <div class="btn btn-outline-primary" data-dismiss="modal">Save</div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Wrapper End-->
        <footer class="iq-footer">
            <div class="container-fluid">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col-lg-6">
                                <ul class="list-inline mb-0">
                                    <li class="list-inline-item"><a href="privacy-policy.html">Privacy Policy</a></li>
                                    <li class="list-inline-item"><a href="terms-of-service.html">Terms of Use</a></li>
                                </ul>
                            </div>
                            <div class="col-lg-6 text-right">
                                <span class="mr-1"><script>document.write(new Date().getFullYear())</script>©</span> <a href="#" class="">POS Admin</a>.
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </footer>
        <!-- Backend Bundle JavaScript -->
        <script src="assets/js/backend-bundle.min.js"></script>

        <!-- Table Treeview JavaScript -->
        <script src="assets/js/table-treeview.js"></script>

        <!-- Chart Custom JavaScript -->
        <script src="assets/js/customizer.js"></script>

        <!-- Chart Custom JavaScript -->
        <script async src="assets/js/chart-custom.js"></script>

        <!-- app JavaScript -->
        <script src="assets/js/app.js"></script>
    </body>

    
</html>