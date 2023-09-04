# frozen_string_literal: true

class TreeViewComponent < ViewComponent::Base
   include ApplicationHelper
include ActionView::Helpers::TagHelper
    
    def initialize( ontology, conceptid, concept_schemes, language, params)
      @conceptid = conceptid
      @concept_schemes = concept_schemes
      @language = language
      @ontology = ontology 
      get_class(params.merge({conceptid: @conceptid, concept_schemes: @concept_schemes }) )
    end
end
  