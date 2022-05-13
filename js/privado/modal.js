const openModal = document.querySelector('.add-btn');
const modal = document.querySelector('.modal');
const closeModal = document.querySelector('#closeMoal');

openModal.addEventListener('click', (e)=>{
    e.preventDefault;
    modal.classList.add('modal--show');
});

closeModal.addEventListener('click'), (e)=>{
    e.preventDefault;
    modal.classList("hide");
}

