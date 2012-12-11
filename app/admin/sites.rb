ActiveAdmin.register Site do
  filter :src_sitename, :as => :select, :collection => Sites.all
  form :partial => "sites/form"
end
