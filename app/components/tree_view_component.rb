# frozen_string_literal: false

class TreeViewComponent < ViewComponent::Base
   include ApplicationHelper
include ActionView::Helpers::TagHelper
    
    def initialize( ontology, concept_schemes, language, params, root, concept)
      @conceptid =  concept.id
      @concept_schemes = concept_schemes
      @language = language
      @ontology = ontology 
      @root = root
      @concept = concept
    end

    private

    def draw_tree(root, id = nil, concept_schemes = [])
      id = root.children.first.id if id.nil?
  
      # TODO: handle tree view for obsolete classes, e.g. 'http://purl.obolibrary.org/obo/GO_0030400'
      raw build_tree(root, '', id, concept_schemes: concept_schemes)
    end

    def build_tree(node, string, id, concept_schemes: [])

      return string if node.children.nil? || node.children.empty?
  
      node.children.sort! { |a, b| (a.prefLabel || a.id).downcase <=> (b.prefLabel || b.id).downcase }
      node.children.each do |child|
        active_style = child.id.eql?(id) ? "active" : ''
  
        # This fake root will be present at the root of "flat" ontologies, we need to keep the id intact
  
        if child.id.eql?('bp_fake_root')
          string << tree_link_to_concept(child: child, ontology_acronym: '',
                                         active_style: active_style, 
                                         node: node, concept_schemes: concept_schemes)
        else
          string << tree_link_to_concept(child: child, ontology_acronym: child.explore.ontology.acronym,
                                         active_style: active_style, 
                                         node: node,
                                         concept_schemes: concept_schemes)
  
          if child.hasChildren && !child.expanded?
            string << render(TurboFrameComponent.new(id:"#{child_id(child)}_childs"))
          elsif child.expanded?
            string << '<ul>'
            build_tree(child, string, id, concept_schemes: concept_schemes)
            string << '</ul>'
          end
          string << '</li>'
        end
      end
      string
    end
end
  