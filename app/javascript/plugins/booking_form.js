const updateValidationClass = (elem, isValid) => {
  if (isValid) {
    elem.classList.remove("is-invalid");
    elem.classList.add("is-valid");
  } else {
    elem.classList.remove("is-valid");
    elem.classList.add("is-invalid");
  }
};

const updateCost = () => {
  const bookingForm = document.getElementById('booking-form-content');

  if (bookingForm) { 
    let costElement = document.getElementById('booking_form_cost');
    const startDateElem = document.getElementById('booking_start_date');
    const endDateElem = document.getElementById('booking_end_date');

    const updateText = () => {
      let start = Date.parse(startDateElem.value);
      let end = Date.parse(endDateElem.value);
      
      console.log("keypress!", start, end)

      if (isNaN(start)) {
        costElement.innerText = "Your start date is an invalid date";
        updateValidationClass(startDateElem, false);
      } else if (isNaN(end)) {
        costElement.innerText = "Your end date is an invalid date";
        updateValidationClass(endDateElem, false);
      } else {
        let diff = end - start;
        let days = Math.ceil(diff / (1000 * 3600 * 24)) + 1;
        if (days <= 0) {
          costElement.innerText = "The end date cannot be before your start date";
          updateValidationClass(endDateElem, false);
          updateValidationClass(startDateElem, false);
        } else {
          updateValidationClass(endDateElem, true);
          updateValidationClass(startDateElem, true);

          let daysString = "";
          let costPerDay = Number.parseInt(costElement.dataset.cost, 10);
          
          if (days === 1) {
            daysString = "(1 day)"
          } else {
            daysString = `(${days} days)`
          }
          costElement.innerText = `Total cost: ${Math.abs(costPerDay / 100) * days}€ ${daysString}`;
        }  
      }
    }
    updateText();

    startDateElem.addEventListener("click", updateText);
    endDateElem.addEventListener("click", updateText);
    startDateElem.addEventListener("keyup", updateText);
    endDateElem.addEventListener("keyup", updateText);
  }
};

export { updateCost };