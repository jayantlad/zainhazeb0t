$(function () {
    let url = '', formattedUrl = '';
    
    $.ajaxSetup({
        headers:{
           'x-functions-key': 'zBhhYlovgZNUQpRy39aQ1PQU0qw1ZYVsUC8OhH/s7g0s0NGTekS7iQ=='
        }
     });

    if (window.location.hostname.includes('172.23.251.79') ||
        window.location.hostname.includes('127.0.0.1') || 
        window.location.hostname.includes('localhost')) {
        url = 'http://localhost:7071/api/#';
    } else {
        url = 'https://zan-haze-bot.azurewebsites.net/api/#';
    }

    $('#modal').on('show.bs.modal', function (event) {
        var button = $(event.relatedTarget) // Button that triggered the modal
        var partitionKey = button.data('partitionkeytitle') // Extract info from data-* attributes
        // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
        // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
        var modal = $(this)
        modal.find('.modal-title').text('Add ' + partitionKey)
        $('#partitionKey').val(partitionKey);
      });

    $('#saveLink').on("click", function(){
        let data = {
            "partitionKey":$('#partitionKey').val(),
            "name":$('#gameName').val(),
            "url":$('#url').val(),
        }
        formattedUrl = url.replace('#', 'PostNewGame');

        $.post(formattedUrl, JSON.stringify(data))
            .done(function(result) {
                let item = buildLinkItem(result.microBitUrl);
                urlContainer.append(item);
          });
    });

    formattedUrl = url.replace('#', 'GetUrls');
    let microbitContainer = $('#microbitContainer');
    let arcadeContainer = $('#arcadeContainer');
    $.get(formattedUrl, function (data) {
        console.info(data);
        let microBitUrls = data.urls.filter(u => u.partitionKey === 'microbit');
        microBitUrls.forEach(function(proj){
            let li = buildLinkItem(proj);
            microbitContainer.append(li);
        });

        let arcadeUrls = data.urls.filter(u => u.partitionKey === 'microbitUrls');
        arcadeUrls.forEach(function(proj){
            let li = buildLinkItem(proj);
            arcadeContainer.append(li);
        });
    }, "json");

    const { buildLink } = (proj) => {
        let listItem = $('<li class="list-group-item">');
        let anchor = $('<a>');
        anchor.attr("href", proj.url);
        anchor.attr("target", proj.url);
        anchor.text(proj.name);
        listItem.append(anchor);
    
        return listItem;
    }
});