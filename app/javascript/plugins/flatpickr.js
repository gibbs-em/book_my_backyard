import flatpickr from "flatpickr";

const initFlatpickr = () => {
  const datePicker = document.querySelector(".datepicker")
  if (datePicker) {
    // console.log(datePicker.dataset)
    // console.log(JSON.parse(datePicker.dataset.dates))
    flatpickr(".datepicker", {"disable": JSON.parse(datePicker.dataset.dates), minDate: "today"}
    );
  }
}



export { initFlatpickr };
