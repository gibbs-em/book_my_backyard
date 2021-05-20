import flatpickr from "flatpickr";

const initFlatpickr = () => {
  const datePicker = document.querySelector(".datepicker")
  console.log(datePicker.dataset)
  console.log(JSON.parse(datePicker.dataset.dates))
  if (datePicker) {
    flatpickr(".datepicker", {"disable": JSON.parse(datePicker.dataset.dates), minDate: "today"}
    );
  }
}



export { initFlatpickr };
