## Import packages
using CSV
using DataFrames
using Plots


### Set working directory
cd("/home/deneckes/Dropbox/Shane/Hobbies/julia-ss-analysis/")


#### Import utils.jl
include("utils.jl")
using .utils ### . is key


### Read life expectancy csv 
### source = http://www.equality-of-opportunity.org/data/
life_exp = CSV.File("input_data/health_ineq_online_table_2.csv", delim=',') |> DataFrame

### Filter data frame for only year 2014
#recent_female = life_exp[(life_exp.year.==2014) .& (life_exp.gnd.=="F"),:] 
recent_female = life_exp |>
    x -> filter(row -> row.year ==2014, x) |>
    x -> filter(row -> row.gnd =="F", x)


## Select only relevant columns and rename
recent_female = select!(recent_female, ["pctile", "le_agg"])
rename!(recent_female, [:Percentile, :Life_Expectancy])


#### Plot life expectacy versus income
p = plot(
    recent_female.Percentile, recent_female.Life_Expectancy,
    xlims=(0,100),
    ylims=(70, 95),
    label=false,
    tickfontsize=14,
    xlabel = "Percentile",
    ylabel = "Years",
    title = "Life Expectancy versus Income",
    lw = 2  # Line width
)

savefig(p, "./outputs/figures/Life_Expectancy.png") 

