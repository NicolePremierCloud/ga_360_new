# Created by: Connor Sparkman 2020-06-20
# Last Updated: June 2020
# Point of Contact: Connor Sparkman

view: first_touch_attribution {
  extension: required

########### DIMENSIONS ###########

  dimension: is_first_touch {
    view_label: "Attribution Models"
    group_label: "Type"
    description: "Flags first web visit based on Full Visitor ID."
    type: yesno
    sql: ${TABLE}.is_first_touch;;
  }

########### MEASURES ###########

  measure: first_touch {
    label: "First Touch Visitors"
    view_label: "Attribution Models"
    description: "Counts unique first touch visitors."
    type: count_distinct
    sql: ${full_visitor_id};;

    filters: {
      field: is_first_touch
      value: "yes"
    }
  }

  measure: first_touch_sessions {
    label: "First Touch Sessions"
    view_label: "Attribution Models"
    description: "Counts unique first touch sessions."
    type: count_distinct
    sql: ${visit_id};;

    filters: {
      field: is_first_touch
      value: "yes"
    }
  }
}
