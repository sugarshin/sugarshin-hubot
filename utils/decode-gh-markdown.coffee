atob = require 'atob'

module.exports = (value) -> decodeURIComponent escape atob value.replace /\s/g, ''
