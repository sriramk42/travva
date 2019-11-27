import Rails from "@rails/ujs";
import Sortable from 'sortablejs';

const postingOrder = (url, oldOrder, newOrder) => {
  Rails.ajax({
    url: url,
    type: "PATCH",
    data: `new=${newOrder}&old=${oldOrder}`,
    success: function(data) {
      console.log(data);
    }
  });
};

const initSortable = () => {
  const list = document.querySelector('.draggable-items');
  Sortable.create(list, {
    onEnd: (event) => {
      const newOrderNumber = (event.newIndex - event.oldIndex) + Number.parseInt(event.item.dataset.order, 10);
      console.log(newOrderNumber);
      const url = list.dataset.tripsItemUpdatePath;
      postingOrder(url, Number.parseInt(event.item.dataset.order, 10), newOrderNumber);
      // alert(`${event.oldIndex} moved to ${event.newIndex}`);
    }
  });
};

export { initSortable };
