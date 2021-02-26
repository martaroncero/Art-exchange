

const updateCost = () => {
  const bookingForm = document.getElementById('booking-form-content');

  if (bookingForm) { 
    let costElement = document.getElementById('booking_form_cost');
    const startDateElem = document.getElementById('booking_start_date');
    const endDateElem = document.getElementById('booking_end_date');

    const updateText = () => {
      let start = Date.parse(startDateElem.value);
      let end = Date.parse(endDateElem.value);
      
      if (isNaN(start)) {
        costElement.innerText = "Your start date is an invalid date";
        startDateElem.classList.remove("is-valid");
        startDateElem.classList.add("is-invalid");
      } else if (isNaN(end)) {
        costElement.innerText = "Your end date is an invalid date";
        endDateElem.classList.remove("is-valid");
        endDateElem.classList.add("is-invalid");
      } else {
        let diff = end - start;
        if (diff < 0) {
          costElement.innerText = "The end date cannot be before your start date";
          endDateElem.classList.remove("is-valid");
          endDateElem.classList.add("is-invalid");
          startDateElem.classList.remove("is-valid");
          startDateElem.classList.add("is-invalid");
        } else {
          startDateElem.classList.remove("is-invalid");
          endDateElem.classList.remove("is-invalid");
          startDateElem.classList.add("is-valid");
          endDateElem.classList.add("is-valid");
          let days = Math.ceil(diff / (1000 * 3600 * 24)) + 1;
          costElement.innerText = `Total cost: ${days}`;
        }  
      }
    }

    updateText();

    startDateElem.addEventListener("click", updateText);
    endDateElem.addEventListener("click", updateText);
    startDateElem.addEventListener("keydown", updateText);
    endDateElem.addEventListener("keydown", updateText);
  }
};

export { updateCost };