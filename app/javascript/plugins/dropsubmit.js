const dropdownSubmit = () => {
  const forms = document.querySelectorAll('.dropdown-form');
  console.log(forms);
  forms.forEach((form) => {
    const dropdown = form.querySelector('select');
    dropdown.addEventListener('change', (event) => {
      form.querySelector('.display-none').click()
    })
  })
}

export { dropdownSubmit };

