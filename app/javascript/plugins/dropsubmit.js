const dropdownSubmit = () => {
  const forms = document.querySelectorAll('.dropdown-form');
  forms.forEach((form) => {
    const dropdown = form.querySelector('select');
    dropdown.addEventListener('change', (event) => {
      form.querySelector('.display-none').click()
    })
  })
}

export { dropdownSubmit };
