--#region Recipe Definitions

local loader_recipes = {}
local recipe_multiplier = settings.startup["raai-recipe-multiplier"].value

-- Define loader recipes with multipliers
loader_recipes["aai-loader"] = {
    {type = "item", name = "iron-plate", amount = 2 * recipe_multiplier},
    {type = "item", name = "electronic-circuit", amount = 1 * recipe_multiplier},
    {type = "item", name = "transport-belt", amount = 1 * recipe_multiplier},
}

loader_recipes["aai-fast-loader"] = {
    {type = "item", name = "iron-gear-wheel", amount = 8 * recipe_multiplier},
    {type = "item", name = "electronic-circuit", amount = 2 * recipe_multiplier},
    {type = "item", name = "aai-loader", amount = 1},
}

loader_recipes["aai-express-loader"] = {
    {type = "item", name = "iron-gear-wheel", amount = 8 * recipe_multiplier},
    {type = "item", name = "advanced-circuit", amount = 2 * recipe_multiplier},
    {type = "item", name = "aai-fast-loader", amount = 1},
    {type = "fluid", name = "lubricant", amount = 8 * recipe_multiplier},
}

-- Add turbo-loader recipe if the "space-age" mod is present
if mods["space-age"] then
    loader_recipes["aai-turbo-loader"] = {
        {type = "item", name = "tungsten-plate", amount = 4 * recipe_multiplier},
        {type = "item", name = "processing-unit", amount = 1 * recipe_multiplier},
        {type = "item", name = "aai-express-loader", amount = 1},
        {type = "fluid", name = "lubricant", amount = 8 * recipe_multiplier},
    }
end

-- Apply defined recipes to existing game data
for name, recipe in pairs(loader_recipes) do
    if data.raw.recipe[name] then
        data.raw.recipe[name].ingredients = recipe
    end
end

--#endregion

--#region Power Consumption

local power_multiplier = settings.startup["raai-power-cost"].value

-- Adjust power consumption for loaders if power multiplier is enabled
if power_multiplier > 0 then
    for _, entity in pairs(data.raw["loader-1x1"] or {}) do
        -- Ensure entity is valid and update power properties
        if entity.name:sub(1,3) == "aai" and entity and entity.speed then
            entity.energy_per_item = (power_multiplier * 100) .. "J"
            entity.energy_source = {
                type = "electric",
                usage_priority = "secondary-input",
                drain = (entity.speed * 240 * power_multiplier) .. "W",
            }
        end
    end
end

--#endregion