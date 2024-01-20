<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sales Form</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-2.2.4.js"
	integrity="sha256-iT6Q9iMJYuQiMWNd9lDyBUStIq/8PuOW33aOqmvFpqI="
	crossorigin="anonymous"></script>

</head>


<body>

	<div class="container mt-5">

		<div class="h2 text-center display-4">Crop Insurance</div>

		<c:if test="${msg ne null}">
			<div class="alert alert-primary" role="alert" id="msgAlert">${msg}</div>
		</c:if>

		<div class="card">
			<div class="card-header bg-light h3">Crop
				Insurance Form</div>

			<div class="card-body">
				<div class="container">
					<form action="./saveInsurance" method="POST"
						enctype="multipart/form-data" onsubmit="return validateForm();">
						<div class="row">
							<div class="col-3">
								<label for="sId" class="font-weight-bold">Season Name</label> <select
									name="season" id="sId" class="form-control"
									onchange="getCropsBySeasonId(this.value)">
									<option value="0">-select-</option>
									<c:forEach items="${seasons}" var="s">
										<option value="${s.seasonId}"
											<c:if test="">selected="selected"</c:if>>${s.seasonName}</option>
									</c:forEach>
								</select>
							</div>
							<div class="col-3">
								<label for="cId" class="font-weight-bold">Crop Name</label> <select
									name="crop" id="cId" class="form-control">
								</select>
							</div>

							<div class="col-3">
								<label for="fNameId" class="font-weight-bold">Farmer
									Name </label> <input type="text" class="form-control" name="farmerName"
									id="fNameId">
							</div>

							<div class="col-3">
								<label for="aId" class="font-weight-bold">Aadhaar Number
								</label> <input type="text" class="form-control" name="aadharNo"
									id="aId">
							</div>

						</div>

						<div class="row mt-2">

							<div class="col-3">
								<label for="frNameId" class="font-weight-bold">Father
									Name </label> <input type="text" class="form-control" name="fatherName"
									id="frNameId">
							</div>

							<div class="col-3">
								<label for="addressId" class="font-weight-bold">Address
								</label> <input type="text" class="form-control" name="address"
									id="addressId">
							</div>

							<div class="col-3">
								<label class="font-weight-bold">Farmer Category</label><br>

								<div class="form-check form-check-inline">
									<input class="form-check-input" type="radio"
										name="farmerCategory" value="Small" id="smallRadio"> <label
										class="form-check-label" for="smallRadio">Small</label>
								</div>

								<div class="form-check form-check-inline">
									<input class="form-check-input" type="radio"
										name="farmerCategory" value="Medium" id="mediumRadio">
									<label class="form-check-label" for="mediumRadio">Medium</label>
								</div>

								<div class="form-check form-check-inline">
									<input class="form-check-input" type="radio"
										name="farmerCategory" value="Large" id="largeRadio"> <label
										class="form-check-label" for="largeRadio">Large</label>
								</div>
							</div>


						</div>
						<div class="mt-2 text-center">

							<input type="submit" class="btn btn-success" value="Submit">
							<input type="reset" class="btn btn-warning" value="Clear">
						</div>
					</form>
				</div>
			</div>
		</div>

		<div class="mt-2">
			<div class="h3">All Insurance Data</div>

			<table class="table table-bordered table-striped mt-2">
				<thead>
					<tr>
						<th>Sl.#</th>
						<th>Season Name</th>
						<th>Crop Name</th>
						<th>Farmer Name</th>
						<th>Aadhar No</th>
						<th>Father Name</th>
						<th>Address</th>
						<th>Farmer Category</th>
						<th>Actions</th>
					</tr>

				</thead>

				<tbody>
					<c:forEach items="${insurances}" var="i" varStatus="counter">
						<tr>
							<td>${counter.count}</td>
							<td>${i.crop.season.seasonName}</td>
							<td>${i.crop.cropName}</td>
							<td>${i.farmerName}</td>
							<td>${i.aadharNo}</td>
							<td>${i.fatherName}</td>
							<td>${i.address}</td>
							<td>${i.farmerCategory}</td>
							<td><a class="btn btn-sm btn-warning"
								href="./updateInsurance?insuranceId=${i.insuranceId}">Update</a>
								<a class="btn btn-sm btn-danger"
								href="./deleteInsurance?insuranceId=${i.insuranceId}">Delete</a></td>
						</tr>
					</c:forEach>

				</tbody>

			</table>

		</div>
	</div>
	<script type="text/javascript">
		function validateForm() {
			var submitted = true;
			var seasonId = $("#sId").val();
			var cropId = $("#cId").val();
			var farmerName = $("#fNameId").val();
			var aadharId = $("#aId").val()
			var fatherNameId = $("#frNameId").val()
			var addressId = $("#addressId").val()

			if (seasonId == 0) {
				alert("Please select a season");
				submitted = false;
			}

			if (cropId == 0) {
				alert("Please select a crop");
				submitted = false;
			}

			if (farmerName == "") {
				alert("Please provide farmer name");
				submitted = false;
			}


			if (aadharId.trim() === "") {
			    alert("Please provide Aadhar number");
			    submitted = false;
			} else if (aadharId.length > 12) {
			    alert("Max of 12 characters only.");
			    submitted = false;
			} else if (!/^\d+$/.test(aadharId)) {
			    alert("Enter a valid Aadhar number (numeric characters only)");
			    submitted = false;
			}
			
			
			if (fatherNameId == "") {
				alert("Please provide father name");
				submitted = false;
			}

			if (addressId == "") {
				alert("Please provide address");
				submitted = false;
			}

			var selectedCategory = $("input[name='farmerCategory']:checked")
					.val();

			if (!selectedCategory) {
				alert("Please select a Farmer Category.");
				submitted = false;
			}

			return submitted;
		}

		function removeAlert() {
			$("#msgAlert").remove();
		}

		setTimeout(removeAlert, 2000);

		function getCropsBySeasonId(sId) {
			$.ajax({
				type : 'GET',
				url : 'getCropsBySeasonId',
				data : {
					seasonId : sId
				},
				success : function(resp) {

					$('#cId').html(resp);
				}
			});

		}
	</script>
</body>

</html>