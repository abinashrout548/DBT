{% macro DayType(x) %}
Case 
when Dayname(TO_Timestamp({{x}})) in ('Sat','Sun') 
THEN 'Weekend'
Else 'BusinessDay'
End

{% endmacro %}