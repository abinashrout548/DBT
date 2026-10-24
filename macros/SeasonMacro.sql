{% macro Season(x) %}
Case 
    When Month(TO_Timestamp({{x}})) in (11,12,1,2) 
    THEN 'Winter'
    When Month(TO_Timestamp({{x}})) in (3,4,5,6)   
    THEN 'Summer'
    When Month(TO_Timestamp({{x}})) in (7,8,9,10)  
    THEN 'Rain'
Else 'Please Check The Month'
End
{% endmacro %}