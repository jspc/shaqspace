if (document.getElementById('active') == null) {
    // Host is not 'active' yet
    setTimeout( function(){ location.reload(true) }, 10000 );
}
