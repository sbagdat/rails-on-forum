module ApplicationHelper
  def show_error_message(message = 'Geçerli bir değer giriniz.')
    ['<small class="error">', message, '</small>'].join.html_safe
  end
end
