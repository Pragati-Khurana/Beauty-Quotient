<%@page import="com.ikonique.bean.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Payment Page</title>
<link type="text/css"
	href="neuro/vendor/@fortawesome/fontawesome-free/css/all.min.css"
	rel="stylesheet">
<!-- Pixel CSS -->
<link type="text/css" href="neuro/css/neumorphism.css" rel="stylesheet">
<%
HttpSession httpSession1 = request.getSession(false);
User user = null;
if (null != httpSession1) {
	user = (User) httpSession1.getAttribute("loginBean");
}
%>
</head>
<body>

                    <div class="modal-dialog modal-dialog-centered" role="document">
                        <div class="modal-content bg-primary">
                            <div class="modal-header">
                                <p class="modal-title" id="modal-title-notification">A new experience, personalized for you.</p>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                              
                                </button>
                            </div>
                            <div class="modal-body">
                                <div class="py-3 text-center">
                                    <span class="modal-icon display-1-lg"><span class="fas fa-check"></span></span>
                                    <h2 class="h4 my-3">Important message!</h2>
                                    <p>Do you know that you can assign status and relation to a company right in the visit list?.</p>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-sm btn-primary">Go to Inbox</button>
                            </div>
                        </div>
                    </div>
                    
                     <div class="modal-dialog modal-dialog-centered" role="document">
                        <div class="modal-content bg-primary">
                            <div class="modal-header">
                                <p class="modal-title" id="modal-title-notification">A new experience, personalized for you.</p>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                              
                                </button>
                            </div>
                            <div class="modal-body">
                                <div class="py-3 text-center">
                                    <span class="modal-icon display-1-lg"><span class="far fa-times-circle"></span></span>
                                    <h2 class="h4 my-3">Important message!</h2>
                                    <p>Do you know that you can assign status and relation to a company right in the visit list?.</p>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-sm btn-primary">Go to Inbox</button>
                            </div>
                        </div>
                    </div>
              
</body>
<script src="neuro/vendor/jquery/dist/jquery.min.js"></script>
<script src="neuro/vendor/popper.js/dist/umd/popper.min.js"></script>
<script src="neuro/vendor/bootstrap/dist/js/bootstrap.min.js"></script>
<script src="neuro/vendor/headroom.js/dist/headroom.min.js"></script>

<!-- Vendor JS -->
<script src="neuro/vendor/onscreen/dist/on-screen.umd.min.js"></script>
<script src="neuro/vendor/nouislider/distribute/nouislider.min.js"></script>
<script
	src="neuro/vendor/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"></script>
<script src="neuro/vendor/waypoints/lib/jquery.waypoints.min.js"></script>
<script src="neuro/vendor/jarallax/dist/jarallax.min.js"></script>
<script src="neuro/vendor/jquery.counterup/jquery.counterup.min.js"></script>
<script src="neuro/vendor/jquery-countdown/dist/jquery.countdown.min.js"></script>
<script
	src="neuro/vendor/smooth-scroll/dist/smooth-scroll.polyfills.min.js"></script>
<script src="neuro/vendor/prismjs/prism.js"></script>
<script src="neuro/assets/js/neumorphism.js"></script>
<script src="vendor/bootstrap-4.1/popper.min.js"></script>
    <script src="vendor/bootstrap-4.1/bootstrap.min.js"></script>
 <!-- Vendor JS       -->
    <script src="vendor/slick/slick.min.js">
    </script>
    <script src="vendor/wow/wow.min.js"></script>
    <script src="vendor/animsition/animsition.min.js"></script>
    <script src="vendor/bootstrap-progressbar/bootstrap-progressbar.min.js">
    </script>
    <script src="vendor/counter-up/jquery.waypoints.min.js"></script>
    <script src="vendor/counter-up/jquery.counterup.min.js">
    </script>
    <script src="vendor/circle-progress/circle-progress.min.js"></script>
    <script src="vendor/perfect-scrollbar/perfect-scrollbar.js"></script>
    <script src="vendor/chartjs/Chart.bundle.min.js"></script>
    <script src="vendor/select2/select2.min.js">
    </script>
    <!-- Main JS-->
    <script type="module" src="js/main.js"></script>
</html>