class Contact < ActiveRecord::Base
     self.per_page = 10
    validates :avatar,attachment_presence: true
     has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: ""
     validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
       validates :firstname, presence: true, length: { maximum: 50 }
         validates :lastname, presence: true, length: { maximum: 50 }
         before_save { self.email = email.downcase }
         VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
     validates :phone, presence: true, length: {minimum:6, maximum: 20}
     validates :address, presence: true
     



end
