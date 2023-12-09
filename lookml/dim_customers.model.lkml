connection: "dbtgen"
include: "/views/*"

explore: dim_customers {
  description: "The dim_customers model is a tool that provides a comprehensive view of customer behavior. It tracks key details such as the total value a customer has brought (customer_lifetime_value), the date of their first and most recent orders, and the total number of orders they've made. This information can be used to identify loyal customers, understand purchasing patterns, and develop targeted marketing strategies. For example, customers with high lifetime values and frequent orders may be ideal targets for loyalty programs."
}