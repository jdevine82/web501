class Contact < ActiveRecord::Base
     self.per_page = 10
     has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: ""
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
end
