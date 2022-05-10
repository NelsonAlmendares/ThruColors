const openModal = document.querySelector('.add-btn');
const modal = document.querySelector('.modal');

openModal.addEventListener('click', (e)=>{
    e.preventDefault;
    modal.classList.add('modal--show');
});
