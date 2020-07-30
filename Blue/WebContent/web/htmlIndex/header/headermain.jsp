<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="model.Tools,java.util.Arrays" %>
<head>
    
<link href=<%=request.getContextPath()+ "/web/styles/search.css"%> rel="stylesheet">
</head>
<!-- Header Main -->

<div class="header_main">
	<div class="container">
		<div class="row">

			<!-- Logo -->
			<div class="col-lg-2 col-sm-3 col-3 order-1">
				<div class="logo_container">
					<div class="logo"><a href=<%=request.getContextPath()%>>B l u e</a></div>
				</div>
			</div>

			<!-- Search -->
			<div class="col-lg-6 col-12 order-lg-2 order-3 text-lg-left text-right">
				<div class="header_search">
					<div class="header_search_content">
						<div class="header_search_form_container autocomplete">
							<form action=<%=request.getContextPath()+ "/search"%> method="POST" class="header_search_form clearfix">
								<div class="row">
									<div class="col-lg-10 col-sm-10">
										<input id="myInput" type="search" required="required"
											class="header_search_input input-search "
											placeholder="Tìm Sản Phẩm..." name="search" autocomplete="off">
										<div class="custom_dropdown">
											<div class="custom_dropdown_list">
												<span class="custom_dropdown_placeholder clc">All
													Categories</span>
												<i class="fas fa-chevron-down"></i>
												<ul class="custom_list clc">
												</ul>
											</div>
										</div>
									</div>
									<div class="col-lg-2 col-sm-2"><button type="button" id="searchBtn"
											class="btn btn-primary btn-search"><span><i
													class="fas fa-search"></i></span></button></div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>

			<!-- Wishlist -->
			<div class="col-lg-4 col-9 order-lg-3 order-2 text-lg-left text-right">
							<div class="wishlist_cart d-flex flex-row align-items-center justify-content-end">
								<div class="wishlist d-flex flex-row align-items-center justify-content-end">
									<div class="wishlist_icon"><img src="<%=request.getContextPath()+ "/web/images/heart.png"%>" alt=""></div>
									<div class="wishlist_content">
										<div class="wishlist_text"><a href="#">Yêu Thích</a></div>
										<div class="wishlist_count">115</div>
									</div>
								</div>
								<!-- Cart -->
								<div class="cart">
									<div class="cart_container d-flex flex-row align-items-center justify-content-end">
										<div class="cart_icon">
											<img src="<%=request.getContextPath()+ "/web/images/cart.png"%>" alt="">
											<div class="cart_count"><span>10</span></div>
										</div>
										<div class="cart_content">
											<div class="cart_text"><a href="#">Giỏ Hàng</a></div>
											<div class="cart_price">8,500,000 đ</div>
										</div>
									</div>
								</div>
							</div>
						</div>
		</div>
	</div>
</div>
<script>
function autocomplete(inp, arr) {
  /*the autocomplete function takes two arguments,
  the text field element and an array of possible autocompleted values:*/
  var currentFocus;
  /*execute a function when someone writes in the text field:*/
  inp.addEventListener("input", function (e) {
	var a, b, i, val = this.value;
	/*close any already open lists of autocompleted values*/
	closeAllLists();
	if (!val) { return false; }
	currentFocus = -1;
	/*create a DIV element that will contain the items (values):*/
	a = document.createElement("DIV");
	a.setAttribute("id", this.id + "autocomplete-list");
	a.setAttribute("class", "autocomplete-items");
	/*append the DIV element as a child of the autocomplete container:*/
	this.parentNode.appendChild(a);
	/*for each item in the array...*/
	for (i = 0; i < arr.length; i++) {
	var stringTmp= arr[i];
	
	do{
		stringTmp=stringTmp.trim();
		/*check if the item starts with the same letters as the text field value:*/
		if (stringTmp.substr(0, val.length).toUpperCase() == val.toUpperCase()) {
		/*create a DIV element for each matching element:*/
		b = document.createElement("DIV");
		/*make the matching letters bold:*/
		b.innerHTML = arr[i].substr(0,arr[i].indexOf(stringTmp));
		b.innerHTML += "<strong>" + arr[i].substr(arr[i].indexOf(stringTmp), val.length) + "</strong>";
		b.innerHTML += arr[i].substr(arr[i].indexOf(stringTmp)+val.length);
		/*insert a input field that will hold the current array item's value:*/
		b.innerHTML += "<input type='hidden' value='" + arr[i] + "'>";
		/*execute a function when someone clicks on the item value (DIV element):*/
		b.addEventListener("click", function (e) {
		  /*insert the value for the autocomplete text field:*/
		  inp.value = this.getElementsByTagName("input")[0].value;
		  /*close the list of autocompleted values,
		  (or any other open lists of autocompleted values:*/
		  closeAllLists();
		});
		a.appendChild(b);
	  }
	  stringTmp= stringTmp.substr(stringTmp.indexOf(" "));
	} while(stringTmp.indexOf(" ")!=-1)
		
	  
	

	} 
  });
  /*execute a function presses a key on the keyboard:*/
  inp.addEventListener("keydown", function (e) {
	var x = document.getElementById(this.id + "autocomplete-list");
	if (x) x = x.getElementsByTagName("div");
	if (e.keyCode == 40) {
	  /*If the arrow DOWN key is pressed,
	  increase the currentFocus variable:*/
	  currentFocus++;
	  /*and and make the current item more visible:*/
	  addActive(x);
	} else if (e.keyCode == 38) { //up
	  /*If the arrow UP key is pressed,
	  decrease the currentFocus variable:*/
	  currentFocus--;
	  /*and and make the current item more visible:*/
	  addActive(x);
	} else if (e.keyCode == 13) {
	  /*If the ENTER key is pressed, prevent the form from being submitted,*/
	  e.preventDefault();
	  if (currentFocus > -1) {
		/*and simulate a click on the "active" item:*/
		if (x) x[currentFocus].click();
	  }
	}
  });
  function addActive(x) {
	/*a function to classify an item as "active":*/
	if (!x) return false;
	/*start by removing the "active" class on all items:*/
	removeActive(x);
	if (currentFocus >= x.length) currentFocus = 0;
	if (currentFocus < 0) currentFocus = (x.length - 1);
	/*add class "autocomplete-active":*/
	x[currentFocus].classList.add("autocomplete-active");
  }
  function removeActive(x) {
	/*a function to remove the "active" class from all autocomplete items:*/
	for (var i = 0; i < x.length; i++) {
	  x[i].classList.remove("autocomplete-active");
	}
  }
  function closeAllLists(elmnt) {
	/*close all autocomplete lists in the document,
	except the one passed as an argument:*/
	var x = document.getElementsByClassName("autocomplete-items");
	for (var i = 0; i < x.length; i++) {
	  if (elmnt != x[i] && elmnt != inp) {
		x[i].parentNode.removeChild(x[i]);
	  }
	}
  }
  /*execute a function when someone clicks in the document:*/
  document.addEventListener("click", function (e) {
	closeAllLists(e.target);
  });
}

/*An array containing all the country names in the world:*/
var countries = <%=Arrays.toString(Tools.getNameProducts())%>

/*initiate the autocomplete function on the "myInput" element, and pass along the countries array as possible autocomplete values:*/
autocomplete(document.getElementById("myInput"), countries);



 </script>
 <script>
 $('document').ready(function() {
		$('#searchBtn').click(function(e){
			linksearch='<%=request.getContextPath()+"/search?search=" %>'+$('#myInput').val();
			console.log(linksearch); 
			$(location).attr('href',linksearch); 
					
		});	
		<% if( request.getAttribute("mess")!=null&&((String)request.getAttribute("mess")).equals("Log in.") ){  %>
		$('#myModal').modal('show');
	<% } %>
		
	});
 </script>