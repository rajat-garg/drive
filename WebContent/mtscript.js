function validateRegistrationForm() {
	// e.preventDefault();

	var emailRegex = /^[A-Za-z0-9._]*\@[A-Za-z]*\.[A-Za-z]{2,5}$/;
	var fname = document.registrationform.firstname.value, lname = document.registrationform.lastname.value, femail = document.registrationform.email.value,

	fpassword = document.registrationform.password.value, fconfirmpassword = document.registrationform.confirmpassword.value, fmonth = document.registrationform.month.value, fday = document.registrationform.day.value, fyear = document.registrationform.year.value;

	if (fname == "") {
		document.registrationform.firstname.focus();
		document.getElementById("errorBox").innerHTML = "enter the first name";
		return false;
	}
	if (lname == "") {
		document.registrationform.lastName.focus();
		document.getElementById("errorBox").innerHTML = "enter the last name";
		return false;
	}

	if (femail == "") {
		document.registrationform.email.focus();
		document.getElementById("errorBox").innerHTML = "enter the email";
		return false;
	} else if (!emailRegex.test(femail)) {
		document.registrationform.email.focus();
		document.getElementById("errorBox").innerHTML = "enter the valid email";
		return false;
	}

	if (fpassword == "") {
		document.registrationform.password.focus();
		document.getElementById("errorBox").innerHTML = "enter the password";
		return false;
	}
	if (fconfirmpassword == "") {
		document.registrationform.confirmpassword.focus();
		document.getElementById("errorBox").innerHTML = "enter the password";
		return false;
	}
	if (fpassword != fconfirmpassword) {
		document.registrationform.confirmpassword.focus();
		document.getElementById("errorBox").innerHTML = "password do not match";
		return false;
	}

	if (fmonth == "") {
		document.registrationform.month.focus();
		document.getElementById("errorBox").innerHTML = "select the birthday month";
		return false;
	}
	if (fday == "") {
		document.registrationform.day.focus();
		document.getElementById("errorBox").innerHTML = "select the birthday day";
		return false;
	}
	if (fyear == "") {
		document.registrationform.year.focus();
		document.getElementById("errorBox").innerHTML = "select the birthday year";
		return false;
	}

	if (!isValidDate(fmonth + "/" + fday + "/" + fyear)) {
		document.registrationform.year.focus();
		document.getElementById("errorBox").innerHTML = "invalid date";
		return false;
	}
	if (document.registrationform.gender[0].checked == false
			&& document.registrationform.gender[1].checked == false) {
		document.getElementById("errorBox").innerHTML = "select your gender";
		return false;
	}
	if (fname != '' && lname != '' && femail != '' && fpassword != ''
			&& fmonth != '' && fday != '' && fyear != '') {
		document.getElementById("errorBox").innerHTML = "form submitted successfully";

	}

}

function validateLoginForm(e) {
	// e.preventDefault();
	var emailRegex = /^[A-Za-z0-9._]*\@[A-Za-z]*\.[A-Za-z]{2,5}$/;

	var femail = document.loginform.email.value, fpassword = document.loginform.pass.value;

	if (femail == "") {
		document.loginform.email.focus();
		document.getElementById("errorBox").innerHTML = "enter the email";
		return false;
	} else if (!emailRegex.test(femail)) {
		document.loginform.email.focus();
		document.getElementById("errorBox").innerHTML = "enter the valid email";
		return false;
	}

	if (fpassword == "") {
		document.loginform.pass.focus();
		document.getElementById("errorBox").innerHTML = "enter the password";
		return false;
	}

}

function isValidDate(dateString) {
	// First check for the pattern
	if (!/^\d{1,2}\/\d{1,2}\/\d{4}$/.test(dateString))
		return false;

	// Parse the date parts to integers
	var parts = dateString.split("/");
	var day = parseInt(parts[1], 10);
	var month = parseInt(parts[0], 10);
	var year = parseInt(parts[2], 10);

	// Check the ranges of month and year
	if (year < 1000 || year > 3000 || month == 0 || month > 12)
		return false;

	var monthLength = [ 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 ];

	// Adjust for leap years
	if (year % 400 == 0 || (year % 100 != 0 && year % 4 == 0))
		monthLength[1] = 29;

	// Check the range of the day
	return day > 0 && day <= monthLength[month - 1];
};