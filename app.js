if ('serviceWorker' in navigator) {
  navigator.serviceWorker
    .register('/sw-test/sw.js', { scope: '/sw-test/' })
    .then(function(reg) {
      // suivre l'état de l'enregistrement du Service Worker : `installing`, `waiting`, `active`
    });
}
