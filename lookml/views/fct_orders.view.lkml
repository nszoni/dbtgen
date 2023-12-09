view: fct_orders {
  sql_table_name: `dbtgen`.`jaffle_shop`.`fct_orders` ;;

  dimension_group: order_date {
    type: time
    sql: ${TABLE}.order_date ;;
    description: "The calendar date on which the order was placed by the customer."
    datatype: date
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year,
    ]
  }

  dimension: order_id {
    type: number
    sql: ${TABLE}.order_id ;;
    description: "The ID of the associated order that the payment transaction is for. This links each payment to the specific order it was made against."
  }

  dimension: customer_id {
    type: number
    sql: ${TABLE}.customer_id ;;
    description: "A unique ID number that identifies the customer who placed the order."
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
    description: "The current state of the order in the fulfillment process, such as 'pending', 'complete' or 'cancelled'."
  }

  dimension: credit_card_amount {
    type: number
    sql: ${TABLE}.credit_card_amount ;;
    description: "The total dollar amount paid for the order using credit card payments."
  }

  dimension: coupon_amount {
    type: number
    sql: ${TABLE}.coupon_amount ;;
    description: "The total dollar amount deducted from the order total using coupon discounts."
  }

  dimension: bank_transfer_amount {
    type: number
    sql: ${TABLE}.bank_transfer_amount ;;
    description: "The total dollar amount paid for the order using bank transfer payments."
  }

  dimension: gift_card_amount {
    type: number
    sql: ${TABLE}.gift_card_amount ;;
    description: "The total dollar amount paid for the order using gift card payments."
  }

  dimension: amount {
    type: number
    sql: ${TABLE}.amount ;;
    description: "The total monetary amount in cents for an individual payment transaction. For example, $1.99 would be represented as 199."
  }
}