Redmine::Plugin.register :redmine_after_save do
  name 'Redmine After Save plugin'
  author 'Y.Imanishi'
  description 'This is a plugin for Redmine'
  version '0.0.1'
  url 'https://github.com/yimanishi/redmine_after_save'
  author_url 'https://github.com/yimanishi/redmine_after_save'

  settings :default => {'empty' => true}, :partial => 'settings/after_save_settings'

  require 'after_save_issue_hooks'
end
