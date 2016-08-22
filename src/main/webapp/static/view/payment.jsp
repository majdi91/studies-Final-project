<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<table id="product-table" border="0" width="100%" cellpadding="0" cellspacing="0">
<thead>
                          <tr>
                              <th class="table-header-repeat line-left minwidth-1"><a href="">Amount</a></th>
                              <th class="table-header-repeat line-left minwidth-1"><a href="">User</a></th>
                              <th class="table-header-repeat line-left minwidth-1"><a href="">Date</a></th>
								<th class="table-header-repeat line-left minwidth-1"><a href="">State</a></th>
								<th class="table-header-options line-left"><a href="">Options</a></th>
                          </tr>
                      </thead>
                      <tbody>
                          <tr ng-repeat="p in vm.details  track by $index">
                              <td><span ng-bind="p.montant" ></span></td>
                              <td><span ng-bind="p.user" ></span></td>
                              <td><span ng-bind="p.date"></span></td>
                              <td><span ng-bind="p.etat"></span></td>
                              <td class="options-width">
					
					<a href=""><button class="btn btn-danger btn-xs" ng-click="vm.currentpayment(p.date)" ng-disabled="!p.disable " >Payer</button></a>
				<a href="#/invoice" >	<button class="btn btn-danger btn-xs" ng-click="vm.currentpayment(p.date)" ng-disabled="p.disable || !valide" >Facture</button></a>
					</td>
                          </tr>
                      </tbody>
                  </table>