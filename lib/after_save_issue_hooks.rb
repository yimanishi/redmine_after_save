class IssueHook < Redmine::Hook::Listener
  def controller_issues_new_after_save(context = {})
    Rails.logger.info "controller_issues_new_after_save"
    issue = context[:issue]
    unless issue.blank?
      update_custom_field(issue)
    end
  end

  def controller_issues_edit_after_save(context = {})
    Rails.logger.info "controller_issues_edit_after_save"
    issue = context[:issue]
    unless issue.blank?
      update_custom_field(issue)
    end
  end

  def controller_issues_bulk_edit_before_save(context = {})
    Rails.logger.info "controller_issues_bulk_edit_before_save"
    issue = context[:issue]
    unless issue.blank?
      update_custom_field(issue)
    end
  end

  private
  def update_custom_field(issue)
    cv = issue.custom_field_values.detect {|c| c.custom_field.name == Setting.plugin_redmine_after_save['after_save_custom_field']}
    unless cv.blank?
      cv.value = "tracker:" + issue.tracker.name.to_s
      issue.save_custom_field_values
    end
  end

end
