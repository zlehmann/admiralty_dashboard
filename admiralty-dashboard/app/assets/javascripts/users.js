$(document).ready(function() {
    let userId = getUserId()
    let user = $.get(`/users/${userId}.json`);

    function getUserId() {
        let url = window.location.href
        let id = url[url.length -1];
        return id;
    }

    
})