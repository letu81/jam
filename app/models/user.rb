class User < ActiveRecord::Base

  has_one :profile, dependent: :destroy
  attr_accessor :name, :avatar, :gender, :signature, :identity, :birthday, :address, :target, :skill, :often, :interest, :interests, :contact, :service
  alias_attribute :hobby, :interests
  attr_accessor :new

 
  class<<self


  def token
    Digest::MD5.hexdigest("#{id}")
  end

  def summary_json
    regular = /^1[3|4|5|7|8][0-9]\d{4,8}$/
    if regular.match(mobile).blank?
      login_info = profile.summary_json.merge(mobile: '', token: token)
    else
      login_info = profile.summary_json.merge(mobile: mobile[0, 3]+'****'+ mobile[7, 4], token: token)
    end
    login_info.merge(new: new.present? ? 1 : 0)
  end

  def as_json
    case profile.identity
      when 0
        profile.as_json.merge(likes: likes.count)
      when 1
        profile.as_json.merge(likes: likes.count, mobile: mobile)
      when 2
        profile.as_json.merge(likes: likes.count, mobile: profile.mobile)
    end
  end
  end
end
