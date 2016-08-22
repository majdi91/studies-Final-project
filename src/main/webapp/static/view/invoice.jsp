<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<section class="invoice" id="printable">
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
                <strong>{{current.firstName}} {{current.lastName}}</strong><br>
               
                {{bill_c.address}}<br>
                Phone:  {{bill_c.phone}}<br>
                Email: {{current.email}}
              </address>
            </div><!-- /.col -->
            <div class="col-sm-4 invoice-col">
              <b>Invoice : {{bill_c.invoice}}</b><br>
              <br>
              <b>Order ID:</b>  {{bill_c.id}}<br>
              <b>Payment Due:</b> {{current_p.date}}<br>
             
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
                    <th>Serial </th>
                    <th>Description</th>
                    <th>Subtotal</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <td>1</td>
                    <td>Call of Duty</td>
                    <td>#Bill -{{bill_c.invoice}}-</td>
                    <td>Payed</td>
                    <td>{{bill_c.montant}} DT</td>
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
              <p class="lead">Amount Due {{bill_c.date}}</p>
              <div class="table-responsive">
                <table class="table">
                 
                    <th>Total:</th>
                    <td>{{bill_c.montant}}DT</td>
                  </tr>
                </table>
              </div>
            </div><!-- /.col -->
          </div><!-- /.row -->

          <!-- this row will not appear when printing -->
          <div class="row no-print">
            <div class="col-xs-12">
              <a  target="_blank" ><button class="btn btn-default" ng-click="printDiv('printable');"><i class="fa fa-print"></i>Print</button> </a>
              
            </div>
          </div>
        </section><!-- /.content -->
</body>
</html>