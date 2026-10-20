{% macro Function1(x) %}

Case when To_Timestamp({{x}}) < CURRENT_DATE Then 'Past'
Else 'Future' End

{% endmacro %}