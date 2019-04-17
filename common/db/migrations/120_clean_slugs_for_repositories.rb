require_relative 'utils'
require '../backend/app/lib/slugs/slug_helpers_generate'

Sequel.migration do
  up do
    $stderr.puts("Cleaning slugs for repositories")

    self[:repository].all.each do |r|
      slug = clean_slug(r[:repo_code])
      self[:repository].where(:id => r[:id]).update(:slug => slug)
    end
  end
end
