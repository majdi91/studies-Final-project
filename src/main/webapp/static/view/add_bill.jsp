<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<section class="invoice">
          <!-- title row -->
          <div class="row">
            <div class="col-xs-12">
              <h2 class="page-header">
                <i class="fa fa-globe"></i> TunSyndic, Inc.
                <small class="pull-right">Date: {{currentdate}}</small>
              </h2>
            </div><!-- /.col -->
          </div>
          <!-- info row -->
          <div class="row invoice-info">
            <div class="col-sm-4 invoice-col">
              From
              <address>
                <strong>Syndic, Inc.</strong><br>
                 Avenue de l'indépendance, Suite 2036<br>
                Ariana, 2036<br>
                Phone: (71) 999999<br>
                Email: info@gmail.com
              </address>
            </div><!-- /.col -->
            <div class="col-sm-4 invoice-col">
              To
              <address>
               <input type="text" class="form-control" placeholder="Enter ..." ng-model="vm.fact.firstName"><br>
                <input type="text" class="form-control" placeholder="Enter ..." ng-model="vm.fact.lastName"><br>
                Adress: <input type="text" class="form-control" placeholder="Enter ..." ng-model="vm.fact.address"><br>
                Phone: <input type="text" class="form-control" placeholder="Enter ..." ng-model="vm.fact.phone"><br>
                Email: <input type="text" class="form-control" placeholder="Enter ..." ng-model="vm.fact.email">
              </address>
            </div><!-- /.col -->
            <div class="col-sm-4 invoice-col">
              <b>Invoice:{{invoice+1}}</b><br>
              <br>
              <b>Order ID:Order </b> {{id+1}}<br>
              <b>Payment Due:</b> <input type="text" class="form-control" placeholder="Enter ..." ng-model="vm.fact.date"><br>
             
            </div><!-- /.col -->
          </div><!-- /.row -->

          <!-- Table row -->
          <div class="row">
            <div class="col-xs-12 table-responsive">
              <table class="table table-striped">
                <thead>
                  <tr>
                    <th>Qty</th>
                    <th>Apartment</th>
                    <th>Serial #</th>
                    <th>Description</th>
                    <th>Subtotal</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <td>1</td>
                    <td>Call of Duty</td>
                    <td>455-981-221</td>
                    <td>Payed</td>
                    <td><input type="text" class="form-control" placeholder="Enter ..." ng-model="vm.fact.montant"></td>
                  </tr>
                </tbody>
              </table>
            </div><!-- /.col -->
          </div><!-- /.row -->

          <div class="row">
            <!-- accepted payments column -->
            <div class="col-xs-6">
              <p class="lead">Payment Methods:</p>
              <img src="static/dist/img/credit/visa.png" alt="Visa">
              <img src="static/dist/img/credit/mastercard.png" alt="Mastercard">
              <img src="static/dist/img/credit/american-express.png" alt="American Express">
              <img src="static/dist/img/credit/paypal2.png" alt="Paypal">
              <p class="text-muted well well-sm no-shadow" style="margin-top: 10px;">
                Etsy doostang zoodles disqus groupon greplin oooj voxy zoodles, weebly ning heekya handango imeem plugg dopplr jibjab, movity jajah plickers sifteo edmodo ifttt zimbra.
              </p>
            </div><!-- /.col -->
            <div class="col-xs-6">
              <p class="lead">Amount Due: {{vm.fact.date}}</p>
              <div class="table-responsive">
                <table class="table">
                 
                 
                  <tr>
                    <th>Total:{{vm.fact.montant}} DT</th>
                    <td></td>
                  </tr>
                </table>
              </div>
            </div><!-- /.col -->
          </div><!-- /.row -->

          <!-- this row will not appear when printing -->
          <div class="row no-print">
            <div class="col-xs-12">
              <a href="invoice-print.html" target="_blank" class="btn btn-default"><i class="fa fa-print"></i> Print</a>
              <button class="btn btn-success pull-right" ng-click="vm.add(vm.fact)"><i class="fa fa-credit-card"></i> Submit Bill</button>
              <button class="btn btn-primary pull-right" style="margin-right: 5px;"><i class="fa fa-download"></i> Generate PDF</button>
            </div>
          </div>
        </section><!-- /.content -->
</body>
</html>