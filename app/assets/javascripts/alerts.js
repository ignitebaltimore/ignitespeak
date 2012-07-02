function makeAlertDismissable() {
  $('.alert').css({ cursor: "pointer" }).click(function(evt) { $(evt.target).hide(); });
}
