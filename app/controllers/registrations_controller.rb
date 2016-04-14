class RegistrationsController < Devise::RegistrationsController
  respond_to :json

  def create
    super do |user|
      if user.save
        render json: user, status: 201 and return
      else
        render422 user.errors and return
      end
    end
  end
end
