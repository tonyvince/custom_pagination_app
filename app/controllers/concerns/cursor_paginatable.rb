module CursorPaginatable
  require "ostruct"

  def paginate_with_cursor(relation, items: ::User::PER_PAGE, after: nil, by: :id, direction: :asc)

    # Filter by cursor start value, if one is provided. If missing, we know we're on the first page.
    relation = relation.where(by => after..) if after.present?

    # Order the relation by the cursor field, and limit it to `items + 1` records.
    # This is because we want to know if there are more records to load,
    # and we need to know that before we actually load them.
    relation = relation.order(by => direction).limit(items + 1).to_a

    # If we don't have more records, we can just return the relation as is.
    # If we do, we remove the last record because we only need its cursor value
    # so we can use it to load the next page.
    cursor = relation.pop.public_send(by) if relation.size > items
    metadata = OpenStruct.new(items: items, position: after, next_cursor: cursor, has_more?: !cursor.nil?)
    # Return the current results and the next cursor value.
    [metadata, relation]
  end
end
