class NotificationsController < ApplicationController

  def show
    notification = current_user.notifications.find(params[:id])
    notification.update(is_read: true)
    redirect_to restaurant_url(notification.notifiable.commentable)
  end

  def index 
    @notifications = Notification.all.order(created_at: :asc)
    @users = User.all
    @restaurants = Restaurant.all
  end
end