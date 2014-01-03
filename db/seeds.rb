forums = ['Ruby ve Ailesi', 'Programlama Genel', 'Genel Konular', 'Otomobil Kulübü', 'Tasarım Genel', 'HTML&CSS']

forums.each do |forum|
  Forum.find_or_create_by_name(forum)
  puts "- #{forum} forumu oluşturuldu."
end
