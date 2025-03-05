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
      filter_params = @query_params.except(:keyword, :page, :limit)
      permitted_params = filter_params.permit!  # Permits all keys
      @queryset = @queryset.where(permitted_params.to_h) if permitted_params.present?
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
  