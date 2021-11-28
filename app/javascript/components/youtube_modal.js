document.addEventListener('turbolinks:load', function() {
  var bootstrap = require('bootstrap')
  var popoverTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="popover"]'))
  var popoverList = popoverTriggerList.map(function (popoverTriggerEl) {
    return new bootstrap.Popover(popoverTriggerEl)
  })

  var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
  var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
    return new bootstrap.Tooltip(tooltipTriggerEl)
  })

  var toastTrigger = document.getElementById('liveToastBtn')
  var toastLiveExample = document.getElementById('liveToast')
  var toastTrigger2 = document.getElementById('liveToastBtn2')
  var toastLiveExample2 = document.getElementById('liveToast2')
  if (toastTrigger) {
    toastTrigger.addEventListener('click', function () {
      var toast = new bootstrap.Toast(toastLiveExample)

      toast.show()
    })
  }

  if (toastTrigger2) {
    toastTrigger2.addEventListener('click', function () {
      var toast2 = new bootstrap.Toast(toastLiveExample2)

      toast2.show()
    })
  }

  var exampleModalYoutube = document.getElementById('exampleModalYoutube')
  exampleModalYoutube.addEventListener('hidden.bs.modal', function (event) {
    var url = 'https://www.youtube.com/embed/elWJFxWn4qs'
    var iframe = exampleModalYoutube.querySelector('iframe')
    iframe.setAttribute('src', url)
  })

  exampleModalYoutube.addEventListener('shown.bs.modal', function (event) {
    var url = 'https://www.youtube.com/embed/elWJFxWn4qs'
    var iframe = exampleModalYoutube.querySelector('iframe')
    iframe.setAttribute('src', url)
  })
});
