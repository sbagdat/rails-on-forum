module ApplicationHelper
  def show_error_message(message = 'Geçerli bir değer giriniz.')
    ['<small class="error">', message, '</small>'].join.html_safe
  end

  def flash_class(type)
    { notice: 'success',
      alert:  'info',
      error:  'warning' }[type]
  end
end
