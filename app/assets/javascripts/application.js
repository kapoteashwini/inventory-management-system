// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
// app/javascript/packs/application.js
import 'bootstrap/dist/css/bootstrap.min.css';
import Rails from "@rails/ujs"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import "popper"

import "bootstrap"
import '../stylesheets/application'

// Other existing imports


Rails.start()
ActiveStorage.start()
