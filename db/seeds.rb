require 'mail'

mail_path = '/Users/rodrigo/Mail/codegestalt/sent/cur/*'

mails = Dir.glob(mail_path)

@new_emails = []

mails.each do |file|
  mail = Mail.read(file)
  guid = File.basename(file).split('_')[0]

  email = Email.find_or_initialize_by(guid: guid)

  next unless email.new_record?

  email.assign_attributes(guid: guid, from: mail.from, to: mail.to,
                          subject: mail.subject, date: mail.date)

  next if email.subject.include?('Wichtig / Important') rescue nil

  @new_emails << email
end

Email.transaction do
  @new_emails.each(&:save!)
end

puts "Added #{@new_emails.count} new Emails"
