<%-- 
    Document   : ManagerAccount
    Created on : Jul 8, 2024, 10:24:44 AM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Bootstrap User Management Data Table</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
        <style>
            body {
                color: #566787;
                background: #f5f5f5;
                font-family: 'Varela Round', sans-serif;
                font-size: 13px;
            }
            .table-responsive {
                margin: 30px 0;
            }
            .table-wrapper {
                min-width: 1000px;
                background: #fff;
                padding: 20px 25px;
                border-radius: 3px;
                box-shadow: 0 1px 1px rgba(0,0,0,.05);
            }
            .table-title {
                padding-bottom: 15px;
                background: #299be4;
                color: #fff;
                padding: 16px 30px;
                margin: -20px -25px 10px;
                border-radius: 3px 3px 0 0;
            }
            .table-title h2 {
                margin: 5px 0 0;
                font-size: 24px;
            }
            .table-title .btn {
                color: #566787;
                float: right;
                font-size: 13px;
                background: #fff;
                border: none;
                min-width: 50px;
                border-radius: 2px;
                border: none;
                outline: none !important;
                margin-left: 10px;
            }
            .table-title .btn:hover, .table-title .btn:focus {
                color: #566787;
                background: #f2f2f2;
            }
            .table-title .btn i {
                float: left;
                font-size: 21px;
                margin-right: 5px;
            }
            .table-title .btn span {
                float: left;
                margin-top: 2px;
            }
            table.table tr th, table.table tr td {
                border-color: #e9e9e9;
                padding: 12px 15px;
                vertical-align: middle;
            }
            table.table tr th:first-child {
                width: 60px;
            }
            table.table tr th:last-child {
                width: 100px;
            }
            table.table-striped tbody tr:nth-of-type(odd) {
                background-color: #fcfcfc;
            }
            table.table-striped.table-hover tbody tr:hover {
                background: #f5f5f5;
            }
            table.table th i {
                font-size: 13px;
                margin: 0 5px;
                cursor: pointer;
            }
            table.table td:last-child i {
                opacity: 0.9;
                font-size: 22px;
                margin: 0 5px;
            }
            table.table td a {
                font-weight: bold;
                color: #566787;
                display: inline-block;
                text-decoration: none;
            }
            table.table td a:hover {
                color: #2196F3;
            }
            table.table td a.settings {
                color: #2196F3;
            }
            table.table td a.delete {
                color: #F44336;
            }
            table.table td i {
                font-size: 19px;
            }
            table.table .avatar {
                border-radius: 50%;
                vertical-align: middle;
                margin-right: 10px;
            }
            .status {
                font-size: 30px;
                margin: 2px 2px 0 0;
                display: inline-block;
                vertical-align: middle;
                line-height: 10px;
            }
            .text-success {
                color: #10c469;
            }
            .text-info {
                color: #62c9e8;
            }
            .text-warning {
                color: #FFC107;
            }
            .text-danger {
                color: #ff5b5b;
            }
            .pagination {
                float: right;
                margin: 0 0 5px;
            }
            .pagination li a {
                border: none;
                font-size: 13px;
                min-width: 30px;
                min-height: 30px;
                color: #999;
                margin: 0 2px;
                line-height: 30px;
                border-radius: 2px !important;
                text-align: center;
                padding: 0 6px;
            }
            .pagination li a:hover {
                color: #666;
            }
            .pagination li.active a, .pagination li.active a.page-link {
                background: #03A9F4;
            }
            .pagination li.active a:hover {
                background: #0397d6;
            }
            .pagination li.disabled i {
                color: #ccc;
            }
            .pagination li i {
                font-size: 16px;
                padding-top: 6px
            }
            .hint-text {
                float: left;
                margin-top: 10px;
                font-size: 13px;
            }
        </style>
        <script>
            $(document).ready(function () {
                $('[data-toggle="tooltip"]').tooltip();
            });
        </script>
    </head>
    <body>
        <c:if test="${sessionScope.acc.isSell == 1 || sessionScope.acc.roleID == 1}">
            <div class="container-xl">
                <div class="table-responsive">
                    <div class="table-wrapper">
                        <div class="table-title">
                            <div class="row">
                                <div class="col-sm-5">
                                    <h2>View <b>Cinema Calendar</b></h2>
                                    <hr>
                                    <h4 style="color: #fcfcfc">Choose an option to filter:</h4>
                                    <select onchange="filter(this)">
                                        <option value="0">All Cinema</option>
                                        <c:forEach items="${listc}" var="p">
                                            <option value="${p.cinemaid}"${chooseDep==p.cinemaid?"selected":""}>${p.cinemaname}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="col-sm-7">
                                </div>
                            </div>
                        </div>
                        <table class="table table-striped table-hover">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Cinema Name</th>						
                                    <th>Product Name</th>						
                                    <th>Movie Date</th>                       
                                    <th>Slot 1</th>
                                    <th>Slot 2</th>
                                    <th>Slot 3</th>
                                    <th>Slot 4</th>
                                    <th>Slot 5</th>
                                    <th>Room ID</th>
                                    <th>Status</th>
                                        <c:if test="${sessionScope.acc.roleID == 1}">
                                        <th>Action</th>
                                        </c:if>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${list}" var="c">
                                    <tr>
                                        <td>${c.calendarId}</td>
                                        <c:if test="${c.cinemaId == 1}">
                                            <td>ALV Thanh Xuân</td>
                                        </c:if>
                                        <c:if test="${c.cinemaId == 2}">
                                            <td>ALV Mỹ Đình</td>
                                        </c:if>
                                        <c:if test="${c.cinemaId == 3}">
                                            <td>ALV Long Biên</td>
                                        </c:if>
                                        <c:if test="${c.cinemaId == 4}">
                                            <td>ALV Hòa Lạc</td>
                                        </c:if>

                                        <td>${c.productName}</td>                     
                                        <td>${c.movieDate}</td>                        
                                        <td>${c.slot1}</td>                        
                                        <td>${c.slot2}</td>                        
                                        <td>${c.slot3}</td>                        
                                        <td>${c.slot4}</td>                        
                                        <td>${c.slot5}</td>                        
                                        <td>${c.roomId}</td>   
                                        <td>${c.status}</td>   
                                        <c:if test="${sessionScope.acc.roleID == 1}">
                                            <td>
                                                <a href="editcalendar?cid=${c.calendarId}" class="edit"><i class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i></a>
                                            </td>                        
                                        </c:if>

                                       
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                        <hr>
                        <div class="clearfix">
                            <div class="hint-text" ><a href="home">Return home</a></div>

                        </div>
                    </div>
                </div>
            </div>     
            <script>
                function filter(param) {
                    window.location = "filtercalendar?cinemaid=" + param.value;
                }
            </script>
        </c:if>
    </body>
</html>