class ConfirmationsController < Devise::ConfirmationsController
  respond_to :json

  def show
    super do |user|
      if user.errors.empty?
        render json: user, status: 200 and return
      else
        render422 user.errors and return
      end
    end
  end
end