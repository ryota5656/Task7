class ReservationsController < ApplicationController
  before_action :authenticate_user!
   
  def reservation
    @user = current_user.id
    @reservations = Reservation.where(user_id: @user)
    @reservations_roomid = Reservation.select(:room_id).where(user_id: @user)
    @rooms = Room.where(id: @reservations_roomid)
  end
  
  def index
    @reservation = Reservation.new
    @room = Room.find(params[:room_id])
  end
  
  def new
    @reservation = Reservation.new
  end
  
  def create
  @user = current_user.id
  @room = Room.find(params[:room_id]) #これがないと再度レンダー時にエラーになる（@roomを再定義させる）
  
  @reservation = Reservation.new(params.require(:reservation).permit(:start_data,:end_data,:people,:room_id,:user_id))
    if @reservation.save
      flash[:notice]="スケジュールを登録しました"
      redirect_to :rooms
    else
      render "index"
    end
    
  end

  def show
   
  end
  
end
