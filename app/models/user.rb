class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  acts_as_voter
  has_many :photos, dependent: :destroy
  after_save :mailchimp_status

  def mailchimp_status
    @mailchimp_list_id = ENV["MC_ID"]
    @gb = Gibbon::API.new
      if self.mailchimp == true
        @gb.lists.subscribe({
        :id => @mailchimp_list_id,
        :email => {:email => self.email},
        :merge_vars => {
          :FNAME => self.name,
          :LNAME => self.name
        },
        :double_optin => false,
        :send_welcome => false
      })
      elsif self.mailchimp == false
        @gb.lists.unsubscribe({
        :id => @mailchimp_list_id,
        :email => {:email => self.email},
        :delete_member => true,
        :send_goodbye => true,
        :send_notify => false
      })
      end
  end

end
