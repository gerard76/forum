Factory.define :forem_post, class: Forem::Post do |f|
  f.text "post body"
  f.user { Factory( :user) }
end