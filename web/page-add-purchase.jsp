
<!doctype html>
<html lang="en">

    
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>POS Admin</title>

        <!-- Favicon -->
        <jsp:include page="components/favicon.jsp"></jsp:include></head>
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
                <div class="container-fluid add-form-list">
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="card">
                                <div class="card-header d-flex justify-content-between">
                                    <div class="header-title">
                                        <h4 class="card-title">Add Purchase</h4>
                                    </div>
                                </div>
                                <div class="card-body">
                                    <form action="https://templates.iqonic.design/posdash/html/backend/page-list-purchase.html" data-toggle="validator">
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label for="dob">Date *</label>
                                                    <input type="date" class="form-control" id="dob" name="dob" />
                                                </div>
                                            </div>  
                                            <div class="col-md-6">                      
                                                <div class="form-group">
                                                    <label>Purchase No *</label>
                                                    <input type="text" class="form-control" placeholder="Purchase No" required>
                                                    <div class="help-block with-errors"></div>
                                                </div>
                                            </div>    
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label>Supplier</label>
                                                    <select name="type" class="selectpicker form-control" data-style="py-0">
                                                        <option>Select Supplier</option>
                                                        <option>Test Supplier</option>
                                                    </select>
                                                </div>
                                            </div> 
                                            <div class="col-md-6"> 
                                                <div class="form-group">
                                                    <label>Received</label>
                                                    <select name="type" class="selectpicker form-control" data-style="py-0">
                                                        <option>Received</option>
                                                        <option>Not received yet</option>
                                                    </select>
                                                </div>
                                            </div> 
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label>Order Tax</label>
                                                    <select name="type" class="selectpicker form-control" data-style="py-0">
                                                        <option>No Text</option>
                                                        <option>GST @5%</option>
                                                        <option>VAT @20%</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label>Discount</label>
                                                    <input type="text" class="form-control" placeholder="Discount">
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label>Shipping</label>
                                                    <input type="text" class="form-control" placeholder="Shipping">
                                                </div>
                                            </div>
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label>Payment *</label>
                                                    <input type="text" class="form-control" placeholder="Payment" required>
                                                    <div class="help-block with-errors"></div>
                                                </div>
                                            </div>
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label>Note *</label>
                                                    <div id="quill-tool">
                                                        <button class="ql-bold" data-toggle="tooltip" data-placement="bottom" title="Bold"></button>
                                                        <button class="ql-underline" data-toggle="tooltip" data-placement="bottom" title="Underline"></button>
                                                        <button class="ql-italic" data-toggle="tooltip" data-placement="bottom" title="Add italic text <cmd+i>"></button>
                                                        <button class="ql-image" data-toggle="tooltip" data-placement="bottom" title="Upload image"></button>
                                                        <button class="ql-code-block" data-toggle="tooltip" data-placement="bottom" title="Show code"></button>
                                                    </div>
                                                    <div id="quill-toolbar">
                                                    </div>
                                                </div>
                                            </div>                                
                                        </div>                            
                                        <button type="submit" class="btn btn-primary mr-2">Add Purchase</button>
                                        <button type="reset" class="btn btn-danger">Reset</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Page end  -->
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
                                <span class="mr-1"><script>document.write(new Date().getFullYear())</script>�</span> <a href="#" class="">POS Admin</a>.
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