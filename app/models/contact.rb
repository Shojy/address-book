class Contact < ActiveRecord::Base
  has_many :details


  accepts_nested_attributes_for :details, reject_if: proc { |attributes| attributes['value'].blank? }, allow_destroy: true

  def gravatar_url
    hash = Digest::MD5.hexdigest(email.downcase.strip)
    "https://gravatar.com/avatar/#{hash}.png?d=mm&s=32"
  end
end
