# frozen_string_literal: false

class TreeLinkComponent < ViewComponent::Base
  include MultiLanguagesHelper

  def initialize(child:, ontology_acronym:, active_style: '', node: nil, concept_schemes: nil, language:)
    @child = child
    @acronym = ontology_acronym
    @active_style = active_style
    @node = node

    @language = language

    #@icons = child.relation_icon(node)
    @muted_style = child.isInActiveScheme&.empty? ? 'text-muted' : ''
    @href = ontology_acronym.blank? ? '#' : "/ontologies/#{child.explore.ontology.acronym}/concepts/?id=#{CGI.escape(child.id)}&language=#{language}"

    @concept_schemes = concept_schemes&.map { |x| CGI.escape(x) }&.join(',') rescue binding.pry

    if @child.prefLabel.nil?
      @pref_label_html = child.id.split('/').last
    else
      pref_label_lang, @pref_label_html = select_language_label(@child.prefLabel)
      pref_label_lang = pref_label_lang.to_s.upcase
      @tooltip = pref_label_lang.eql?("@NONE") ? "" : pref_label_lang
    end

  end


  # This gives a very hacky short code to use to uniquely represent a class
  # based on its parent in a tree. Used for unique ids in HTML for the tree view
  def short_uuid
    rand(36 ** 8).to_s(36)
  end

  # TDOD check where used
  def child_id
    @child.id.to_s.split('/').last
  end

  def open?
    @child.expanded? ? 'open' : ''
  end

  def border_left
    !@child.hasChildren && 'pl-3 tree-border-left'
  end

  def li_id
    @child.id.eql?('bp_fake_root') ? 'bp_fake_root' : short_uuid
  end

  def children_link(child, concept_schemes, language)
    "/ajax_concepts/#{child.explore.ontology.acronym}/?conceptid=#{CGI.escape(child.id)}&concept_schemes=#{concept_schemes}&callback=children&language=#{language}"
  end

  def open_children_link
    return unless @child.hasChildren

    link_to children_link(@child, @concept_schemes, @language),
            data: { turbo: true, turbo_frame: "#{child_id + '_childs'}" } do
      content_tag(:i, nil, class: "fas #{@child.expanded? ? 'fa-chevron-down' : 'fa-chevron-right'}")
    end
  end

end
