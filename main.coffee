$ ->

  master = (title) ->
    $.ajax
      url: "http://www.omdbapi.com/?s=#{title}"
    .done (data) ->
      # console.log data
      movies = $.parseJSON(data)['Search']
      console.log movies

      for movie in movies
        # console.log movie.Title
        $('#movies').append "<li data-imdb=#{movie.imdbID}>#{movie.Title}</li>"

    .fail (j, t, e) ->
      console.log j, t, e

  master("Harry")


  detail = (imdbID) ->
    $.ajax
      url: "http://www.omdbapi.com/?i=#{imdbID}&tomatoes=true&plot=full"
    .done (data) ->
      movie = $.parseJSON(data)
      $('#detail').html '<span>' + movie.Plot + '</span>'
    .fail (j, t, e) ->
      console.log j, t, e

  $('body').delegate 'li', 'click', (e) ->
    console.log e.target
    imdbID = $(e.target).data('imdb')
    detail(imdbID)









