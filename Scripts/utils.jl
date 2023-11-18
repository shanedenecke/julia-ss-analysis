module utils

export tax_paid
export benefit_gotten



## 480 months in a working lifetime
function tax_paid(monthly_gross)
    if monthly_gross<10453.20 ### 168600 * 6.2%
        tax = monthly_gross * .062 * 480
        return tax
    else
        tax = 10453.20 * .062 * 480
        return tax
    end
end

function benefit_gotten(monthly_gross)
    if monthly_gross<960
        ben = monthly_gross * 0.8
        return ben
    elseif (monthly_gross>960) && (monthly_gross<5500)
        ben1 = 960 * 0.8
        ben2 = (monthly_gross - 960) * 0.32
        return ben1 + ben2
    elseif monthly_gross<10453.20 
        ben1 = 960 * 0.8
        ben2 = (5500 - 960) * 0.32
        ben3 = (monthly_gross - 5500) * 0.15
        return ben1 + ben2 + ben3
    else
        ben1 = 960 * 0.8
        ben2 = (5500 - 960) * 0.32
        ben3 = (10453.20  - 5500) * 0.15
        return ben1 + ben2 + ben3
    end
end

end ### Module end