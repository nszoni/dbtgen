view: dim_customers {
  sql_table_name: `dbtgen`.`jaffle_shop`.`dim_customers` ;;

  dimension_group: first_order {
    type: time
    sql: ${TABLE}.first_order ;;
    description: "The date a customer made their very first purchase. Like a customer's join date."
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

  dimension_group: most_recent_order {
    type: time
    sql: ${TABLE}.most_recent_order ;;
    description: "The date a customer made their most recent purchase. Like a customer's last seen date."
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

  dimension: customer_id {
    type: number
    sql: ${TABLE}.customer_id ;;
    description: "A unique number that identifies each customer. Like a customer's personal ID number."
  }

  dimension: first_name {
    type: string
    sql: ${TABLE}.first_name ;;
    description: "The customer's given name or names. For example, \"John\" or \"Mary Jane\"."
  }

  dimension: last_name {
    type: string
    sql: ${TABLE}.last_name ;;
    description: "The customer's family name or surname. For example, \"Smith\" or \"Doe\"."
  }

  dimension: number_of_orders {
    type: number
    sql: ${TABLE}.number_of_orders ;;
    description: "The total number of orders a customer has placed over their lifetime. Like a customer's lifetime order count."
  }

  dimension: customer_lifetime_value {
    type: number
    sql: ${TABLE}.customer_lifetime_value ;;
    description: "The total amount of money a customer has spent over their lifetime of purchases. Similar to a customer's lifetime spending score."
  }
}