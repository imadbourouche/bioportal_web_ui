# frozen_string_literal: true

class TreeViewComponent < ViewComponent::Base
   include ApplicationHelper
   include ActionView::Helpers::TagHelper
    
    def initialize(tree_data, ontology, conceptid, concept_schemes, language, params, data: )
      @tree_data = tree_data
      @conceptid = conceptid
      @concept_schemes = concept_schemes
      @language = language
      @data = data
      @params = params.merge({conceptid: @conceptid, concept_schemes: @concept_schemes })

      @ontology = ontology 
      get_class(params)
    end
end
  