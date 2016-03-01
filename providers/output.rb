use_inline_resources

action :display_output do
  ruby_block new_resource.name do
    block do
      ChefCore::Output.header2(new_resource.name)

      new_resource.reports.each do |results|
        # TODO: Change to debug?
        ChefCore::Output.message(results)
      end

      ChefCore::Output.footer2(new_resource.name)
    end
    action :run
  end

  # Notify Observers
  new_resource.updated_by_last_action(true)
end

action :action do
  ruby_block new_resource.name do
    block do
      ChefCore::Output.action(new_resource.name)
    end
    action :run
  end

  # Notify Observers
  new_resource.updated_by_last_action(true)
end
