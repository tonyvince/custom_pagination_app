class Api::V1::UsersController < Api::V1::ApiController
  before_action :authenticate_user!
  include CursorPaginatable

  def index
    # @pagy, @users = pagy_cursor(
    #   User.all,
    #   order: {id: :asc},
    #   after: params[:after],
    #   items: params[:items] || User::PER_PAGE
    # )
    @pagination, @users = paginate_with_cursor(
      User.all,
      by: :id,
      direction: :asc,
      after: params[:after],
      items: params[:items] || User::PER_PAGE
    )

    render json: {
      users: UserSerializer.new(@users).serializable_hash,
      pagination: pagy_metadata(@pagination)
    }
  end

  private

  def pagy_metadata(pagination)
    {
      items: pagination.items,
      position: pagination.position,
      has_more: pagination.has_more?
    }
  end
end
