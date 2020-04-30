for key, resource in pairs(data.raw.resource) do
    log("making " .. key .. " infinite")
    -- make infinite
    resource.infinite = true
    -- set minimum to at least 100
    if not resource.minimum or resource.minimum < 100 then
        resource.minimum = 100
    end
    -- set normal to at least minimum
    if not resource.normal or resource.normal < resource.minimum then
        resource.normal = resource.minimum
    end
    -- change sprite to always show biggest value
    if resource.stage_counts then
        for i = 1, #resource.stage_counts do
            resource.stage_counts[i] = 0
        end
    end
    -- don't deplete
    resource.infinite_depletion_amount = 0
end
