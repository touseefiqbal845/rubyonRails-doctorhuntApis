class SearchFeatures
  def initialize(queryset, query_params)
    @queryset = queryset
    @query_params = query_params
  end

  def search
    keyword = @query_params[:keyword]
    if keyword.present?
      @queryset = @queryset.where(
        "name ILIKE ? OR career ILIKE ? OR speciality ILIKE ?", 
        "%#{keyword}%", "%#{keyword}%", "%#{keyword}%"
      )
    end
    self
  end

  def filter
    allowed_columns = Doctor.column_names 
    raw_filter_params = @query_params.except(:keyword, :page, :limit)
    safe_filter_params = raw_filter_params.to_unsafe_h.select do |key, _|
      allowed_columns.include?(key.to_s)
    end
    @queryset = @queryset.where(safe_filter_params) if safe_filter_params.present?
    self
  end

  def pagination(result_per_page)
    page = @query_params[:page].to_i.positive? ? @query_params[:page].to_i : 1
    @queryset = @queryset.limit(result_per_page).offset((page - 1) * result_per_page)
    self
  end

  def get_queryset
    @queryset
  end
end
