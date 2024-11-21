data:extend{
    {
        type = "int-setting",
        name = "raai-recipe-multiplier",
        localised_name = "Recipe Multiplier",
        localised_description = "Sets the recipe cost multiplier. For example, a value of 10 makes recipes cost roughly as much as two splitters of the same belt tier. (Default: 10)",
        setting_type = "startup",
        default_value = 10,
        minimum_value = 1,
    },
    {
        type = "int-setting",
        name = "raai-power-cost",
        localised_name = "Power Cost",
        localised_description = "Defines energy usage in Joules per item processed, with idle energy drain at half the belt speed in Watts. Set to 0 to disable power cost. (Default: 100)",
        setting_type = "startup",
        default_value = 100,
        minimum_value = 0,
    }
}
