$ ->
  $('#memos')
    .on 'click', '.edit, .cancel', (event) ->
      # 表示を切り替え
      toggleEditor $(this).closest('.memo')

# 表示モードと編集モードを切り替える。
toggleEditor = ($container) ->
  # 表示、非表示を切り替え
  $container.find('.viewer, .editor').toggle()

  # 編集モードなら、値を戻す
  $bodyField = $container.find('.editor .body')
  if $bodyField.is(':visible')
    $bodyField
      .val($container.find('.viewer .body').text())
      .select()
