module ApplicationHelper
  def show_error_message(message = 'Geçerli bir değer giriniz.')
    ['<small class="error">', message, '</small>'].join.html_safe
  end

  def flash_class(type)
    { notice: 'success',
      alert:  'info',
      error:  'warning' }[type]
  end

  def form_params(parent, child)
    child.new_record? ? [parent, child] : child
  end

  def topic_info(topic)
    info = ["<small class='details'>"]
    info << badge_for(topic.forum) unless params[:controller] == 'forums' &&
                                          params[:action]     == 'show'
    info << info_for(topic.user)   unless params[:controller] == 'users'
    info << time_for(topic) << '</small>'
    info.join.html_safe
  end

  def comment_info(comment)
    info = ["<small class='details'>"]
    info << badge_for(comment.topic) unless params[:controller] == 'topics'
    info << info_for(comment.user)   unless params[:controller] == 'users'
    info << time_for(comment)
    info << owner_buttons_for(comment) if current_user == comment.user
    info << '</small>'
    info.join.html_safe
  end

  def badge_for(object)
    link_text = object.try(:title) || object.name
    link_to(link_text, object, class: 'badge')
  end

  def info_for(user)
      link_text = image_tag(user.avatar_url(20), class:'user-thumb') + ' ' + user.username
      link_to(link_text, profile_path(user)) + ' tarafından '
  end

  def time_for(object)
    time_ago_in_words(object.created_at) + ' önce gönderildi. '
  end

  def owner_buttons_for(comment)
    link_to('Düzenle', edit_comment_path(comment)) + ' | ' +
    link_to('Sil', comment, method: :delete)
  end

  def markdown(text, options= {links: true})
    render_options = {
      filter_html:     true,
      hard_wrap:       true,
      no_links:        !options[:links],
      highlight: true
    }
    renderer = Redcarpet::Render::HTML.new(render_options)

    extensions = {
      autolink:           true,
      fenced_code_blocks: true,
      lax_spacing:        true,
      no_intra_emphasis:  true,
      strikethrough:      true,
      superscript:        true,
      highlight:          true
    }
    Redcarpet::Markdown.new(renderer, extensions).render(text).html_safe
  end
end
