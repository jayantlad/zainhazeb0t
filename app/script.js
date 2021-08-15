var loadData = function loadData(key) {
  let url = '', formattedUrl = '';

  $.ajaxSetup({
    headers: {
      'x-functions-key': 'zBhhYlovgZNUQpRy39aQ1PQU0qw1ZYVsUC8OhH/s7g0s0NGTekS7iQ=='
    }
  });

  if (window.location.hostname.includes('172.23.251.79') ||
    window.location.hostname.includes('127.0.0.1') ||
    window.location.hostname.includes('192.168.36.126') ||
    window.location.hostname.includes('localhost')) {
    url = 'http://localhost:7071/api/#';
  } else {
    url = 'https://zan-haze-bot.azurewebsites.net/api/#';
  }

  formattedUrl = url.replace('#', 'GetUrls');
  let container = $(key);

  $.get(formattedUrl, function (data) {

    let urls = data.urls.filter(u => u.partitionKey === key);
    urls.forEach(function (proj) {
      let li = buildLink(proj);
      container.append(li);
    });

  }, "json");

  function buildLink(proj) {
    let listItem = $('<li class="list-group-item">');
    let anchor = $('<a>');
    anchor.attr("href", proj.url);
    anchor.attr("target", proj.url);
    anchor.text(proj.name);
    listItem.append(anchor);

    return listItem;
  }
}

var microbit = new Vue({
  el: '#microbit',
  data: {
    message: 'Hello from Microbit Container!',
    url: [],
    created: loadData(this.el)
  }
});

var arcade = new Vue({
  el: '#arcade',
  data: {
    message: 'Hello from Arcade Container!',
    url: [],
    created: loadData(this.el)
  }
});

