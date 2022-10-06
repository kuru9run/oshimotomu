crumb :root do
  link "Home", root_path
end

crumb :requests do
  link t('breadcrumbs.requests'), requests_path
  parent :root
end

crumb :request_new do
  link t('breadcrumbs.new'), new_request_path
  parent :requests
end

crumb :request_show do |request|
  link request.title, request_path(request)
  parent :requests
end

crumb :promotions do
  link t('breadcrumbs.promotions'), promotions_path
  parent :root
end

crumb :promotion_new do
  link t('breadcrumbs.new'), new_promotion_path
  parent :promotions
end

crumb :promotion_show do |promotion|
  link "#{promotion.name}さん", promotion_path(promotion)
  parent :promotions
end

# crumb :projects do
#   link "Projects", projects_path
# end

# crumb :project do |project|
#   link project.name, project_path(project)
#   parent :projects
# end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).