function hideItem() {
  const hideButton = document.querySelector('#hide-button');
  hideButton.addEventListener("click", () => {
  const hideItems = document.querySelector('#hide-items')
  hideItems.style.display = hideItems.style.display === "none" ? '' : 'none';
});}

export { hideItem };
