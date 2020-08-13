function fix_resources_for_surface(surface, area)
    resources = surface.find_entities_filtered{
        area = area,
        type = 'resource',
    }
    for _, resource in pairs(resources) do
        -- set all new resources to exactly their normal amount
        resource.amount = resource.prototype.normal_resource_amount
    end
end

script.on_configuration_changed(function()
    for _, surface in pairs(game.surfaces) do
        fix_resources_for_surface(surface)
    end
end)

script.on_event(defines.events.on_chunk_generated, function(event)
    fix_resources_for_surface(event.surface, event.area)
end)
