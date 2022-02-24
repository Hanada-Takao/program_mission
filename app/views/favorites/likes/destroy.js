//投稿一覧いいね差し替え
$("#index_favorite_<%= @blog.id %>").html("<%= j(render partial: 'favorites/favorite', locals: { blog: @blog}) %>");
//投稿詳細いいね差し替え
$("#show/favorite_<%= @blog.id %>").html("<%= j(render partial: 'favorites/favorite', locals: { blog: @blog}) %>");