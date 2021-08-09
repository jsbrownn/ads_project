var removedImages = new Array;
var selectedImages = new Array;

const addPreviewImages = function () {
    document.getElementById("form_img").addEventListener("change", function () {
        const fileList = this.files
        const files = Array.from(fileList)
        files.forEach(function (file) {
            var image = document.createElement("img")
            image.setAttribute("class", "preview_image")
            document.querySelector('.images__wrap').append(image);
            image.dataset.name = file.name
            image.src = URL.createObjectURL(file)
            selectedImages.push(file)
        })
        setActiveImage();
    })
}

const setActiveImage = function () {
    const images = document.querySelectorAll(".preview_image");
    images.forEach(function (image) {
        const handleOver = function () {
            image.classList.add("active_image")
        }
        const handleOut = function () {
            image.classList.remove('active_image')
        }
        const removeActiveImage = function () {
            removedImages.push(image)
            image.parentNode.removeChild(image)
            removeImagesForInput(image)
        }
        image.addEventListener("mouseover", handleOver)
        image.addEventListener("mouseout", handleOut)
        image.addEventListener("click", removeActiveImage)
    });
}

const removeImagesForInput = function () {
    var updatedImages = selectedImages.filter(f => !removedImages.some(item => item.dataset.name === f.name))
    const dt = new DataTransfer()
    updatedImages.forEach(item => dt.items.add(item))
    const input = document.getElementById("form_img")
    input.files = dt.files
}

const removePreviewFromPage = function () {
    document.getElementById('form_img').onclick = () => {
        const images = document.querySelectorAll(".preview_image");
        images.forEach(image => image.parentNode.removeChild(image))
        selectedImages = []
        removedImages = []
    }
}

const currentURL = window.location.href
if (!currentURL.includes("/edit")) {
    removePreviewFromPage()
}


addPreviewImages()
setActiveImage();


