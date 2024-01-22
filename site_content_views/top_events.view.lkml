view: top_events {
  sql_table_name: `eb-seo.google_analytics_custom.top_events` ;;

  dimension: _fivetran_id {
    type: string
    sql: ${TABLE}._fivetran_id ;;
  }
  dimension_group: _fivetran_synced {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}._fivetran_synced ;;
  }
  measure: avg_event_value {
    type: time
    sql: ${TABLE}.avg_event_value ;;
  }
  dimension: avg_session_duration {
    type: number
    sql: ${TABLE}.avg_session_duration ;;
  }
  dimension_group: date {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.date ;;
  }
  dimension: event_action {
    type: string
    sql: ${TABLE}.event_action ;;
  }
  dimension: event_category {
    type: string
    sql: ${TABLE}.event_category ;;
    drill_fields: [category_drill*]
  }

  set: category_drill {
    fields: [event_label, event_action]
  }

  dimension: event_label {
    type: string
    sql: ${TABLE}.event_label ;;
  }
  dimension: event_value {
    type: number
    sql: ${TABLE}.event_value ;;
  }
  dimension: percent_new_sessions {
    type: number
    sql: ${TABLE}.percent_new_sessions ;;
  }
  dimension: profile {
    type: string
    sql: ${TABLE}.profile ;;
  }
  dimension: segment {
    type: string
    sql: ${TABLE}.segment ;;
  }
  dimension: sessions {
    type: number
    sql: ${TABLE}.sessions ;;
  }
  dimension: total_events {
    type: number
    sql: ${TABLE}.total_events ;;
  }
  dimension: unique_events {
    type: number
    sql: ${TABLE}.unique_events ;;
  }
  measure: count {
    type: count
  }
}
