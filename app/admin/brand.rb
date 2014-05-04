ActiveAdmin.register Brand do

  permit_params :name
  menu label: proc{ I18n.t(:brands)}, priority: 2, parent: "Content"

end
