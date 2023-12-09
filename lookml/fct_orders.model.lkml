connection: "dbtgen"
include: "/views/*"

explore: fct_orders {
  description: "The dbt model fct_orders is a tool that organizes and analyzes customer payment data. It breaks down payments by method, such as credit card, coupon, bank transfer, and gift card, for each order. This model can be used to understand customer payment preferences and track the usage of different payment methods over time. It can also help identify trends, such as an increase in gift card usage during the holiday season, or a correlation between high-value orders and a specific payment method. This information can be used to inform business strategies, such as promotional campaigns or customer loyalty programs."
}