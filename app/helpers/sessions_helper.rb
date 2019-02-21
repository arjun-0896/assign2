module SessionsHelper
  def log_in(member)
    session[:member_id] = member.id
    session[:email]=member.email
  end

  def log_out
    session.delete(:member_id)
    @current_user = nil
    reset_session
  end

end
