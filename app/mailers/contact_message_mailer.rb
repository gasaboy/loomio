class ContactMessageMailer < BaseMailer
  
  DESTINATIONS = [
    ['General Inquiries',                             'contact@loomio.org'],
    ['Tech support / Bug reports / Feature requests', 'tech@loomio.org'],
    ['Media inquiries and leads',                     'press@loomio.org'],
    ['High touch and Loomio Plus sales leads',        'sales@loomio.org'],
    ['Translation inquiries',                         'translations@loomio.org']
  ]
  
  default :to => "contact@loomio.org"
  def contact_message_email(contact_message)
    @email = contact_message.email
    @name = contact_message.name
    @message = contact_message.message
    @user_id = contact_message.user_id
    @destination = contact_message.destination + '@' + ENV.fetch('CANONICAL_HOST', 'loomio.org')
    mail(from: "#{@name} <#{@email}>", to: @destination, subject: "Enquiry - #{@name}")
  end
end
