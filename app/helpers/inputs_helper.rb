module InputsHelper

  def text_input(name:, value:, label: nil, disabled: false, help: nil, error_message: nil)
    render Input::TextInputComponent.new(label: input_label(label, name), name: name, value: value,
                                         error_message: error_message || input_error_message(name),
                                         disabled: disabled,
                                         helper_text: help)
  end

  def select_input(name:, values:, id: nil, label: nil, selected: nil, multiple: false, help: nil, open_to_add: false, required: false,  data: {})
    render Input::SelectComponent.new(label: input_label(label, name), id: id || name, name: name, value: values,
                                      selected: selected,
                                      multiple: multiple,
                                      helper_text: help,
                                      open_to_add_values: open_to_add,
                                      required: required,
                                      data: data)
  end

  def check_input(id:, name:, value:, label: '', checked: false, &block)
    render ChipsComponent.new(name: name, id: id, label: label, value: value, checked: checked) do |c|
      if block_given?
        capture(c, &block)
      end
    end
  end

  def switch_input(id:, name:, label:, checked: false, value: '', boolean_switch: false, style: nil)
    render SwitchInputComponent.new(id: id, name: name, label: label, checked: checked, value: value, boolean_switch: boolean_switch, style: style)
  end

  def url_input(name:, value:, label: nil, help: nil)
    render Input::UrlComponent.new(label: input_label(label, name), name: name, value: value,
                                   error_message: input_error_message(name),
                                   helper_text:  help)
  end

  def text_area_input(name:, value:, label: nil, help: nil)
    render Input::TextAreaComponent.new(label: input_label(label, name), name: name, value: value,
                                        error_message: input_error_message(name),
                                        helper_text: help)
  end

  def date_input(name:, value:, label: nil, help: nil, max_date: nil)
    render Input::DateComponent.new(label: input_label(label, name), name: name, value: value,
                                    error_message: input_error_message(name),
                                    helper_text: help,
                                    max_date: max_date)
  end

  private

  def method_name(name)
    match = /.*\[(.*?)\]/.match(name)
    match.nil? ? name : match[1]
  end

  def input_label(label, name)
    label || method_name(name).humanize
  end

  def attribute_error(attr)
    return '' if @errors&.is_a?(String)
    return '' unless @errors && @errors[attr.to_sym]

    errors = @errors[attr.to_sym]

    errors.values.join(', ')
  end

  def input_error_message(name)
    attribute_error(method_name(name))
  end

  def table_content(t)
    headers = 5.times.map { |i| "header #{i}" }
    rows = 6.times.map { |row| 5.times.map { |i| "line #{row} :#{i} " } }

    t.header do |h|
      headers.each do |header|
        h.th { header }
      end
      h.th { 'Action' }
    end

    rows.each do |row|
      t.row do |r|
        row.each do |col|
          r.td { col }
        end

        r.td do
          link_to('Edit', '', class: 'mr-3') + link_to('Delete', '')
        end
      end
    end

  end
end