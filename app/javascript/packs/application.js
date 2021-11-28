// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

Rails.start()
Turbolinks.start()
ActiveStorage.start()

window.I18n = require("../../../public/javascripts/i18n")
require("../../../public/javascripts/translations")

// import 'commond/locale_switcher'

require("trix")
require("@rails/actiontext")
import bootstrap from 'bootstrap'
const images = require.context('../images', true)
import 'components/bootstrap_form_validate'
import 'components/modal_vary_content'
import 'components/youtube_modal'
