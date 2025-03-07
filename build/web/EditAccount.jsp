
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Edit Movies</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link href="css/manager.css" rel="stylesheet" type="text/css"/>
        <style>
            img{
                width: 200px;
                height: 120px;
            }
        </style>
    <body>
        <div class="container">

            <div id="editEmployeeModal" 
                 <div class="modal-dialog">
                <div class="modal-content">
                    <form action="editaffterset" method="post">
                        <c:forEach items="${detail}" var="detail">
                        <div class="modal-header">						
                            <h4 class="modal-title">Edit User</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">
                            <div class="form-group">
                                <label>ID</label>
                                <input value="${detail.ID}" name="id" type="text" class="form-control" readonly required>
                            </div>					
                            <div class="form-group">
                                <label>Name</label>
                                <input value="${detail.user}" name="user" type="text" class="form-control"  readonly required>
                            </div>
                            <div class="form-group">
                                <label>Password</label>
                                <input value="${detail.pass}" name="pass" type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Set Admin (Admin == 1)</label>
                                <input value="${detail.roleID}" name="roleID" type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Set Staff (staff == 1)</label>
                                <input value="${detail.isSell}" name="isSell" type="text" class="form-control" required>
                            </div>


                            </c:forEach>

                        </div>
                        <div class="modal-footer">
                            <button class="btn btn-default" data-dismiss="modal" value="Cancel"><a href="manageraccount">Cancel</a></button>
                            <input type="submit" class="btn btn-info" value="Save">
                        </div>
                    </form>
                </div>
            </div>
        </div>

    </div>


    <script src="js/manager.js" type="text/javascript"></script>
</body>
</html>

