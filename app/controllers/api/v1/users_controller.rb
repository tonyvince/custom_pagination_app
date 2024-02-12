class Api::V1::UsersController < Api::V1::ApiController
  before_action :authenticate_user!

  def index
    @pagy, @users = pagy_cursor(
      User.all,
      order: {id: :asc},
      after: params[:after],
      items: params[:items] || User::PER_PAGE
    )

    render json: {
      users: UserSerializer.new(@users).serializable_hash,
      pagination: pagy_metadata(@pagy)
    }
  end

  private

  def pagy_metadata(pagy)
    {
      items: pagy.items,
      position: pagy.position,
      has_more: pagy.has_more?
    }
  end
end
