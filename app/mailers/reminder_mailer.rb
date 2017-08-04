class ReminderMailer < ApplicationMailer

	 default from: 'bookclubbr@gmail.com'
 
  def welcome_email(user)
    @user = user
    @url  = 'http://bookclbbr.com/login'
    mail(to: @user.email, subject: 'Welcome to Your Book Club Manager')
  end

  def reminder_email(user, meeting, group)
    @user = user
    @meeting = meeting
    @group = group
    @url  = 'http://bookclubr.com/login'
    mail(to: @user.email, subject: 'Your book club meeting is coming up!')
  end



end
