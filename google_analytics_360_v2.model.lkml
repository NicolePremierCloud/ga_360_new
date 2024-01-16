connection: "@{CONNECTION_NAME}"

# include: "/datagroups.lkml"
include: "/*/*.view.lkml"
include: "/Google_Analytics/*.view.lkml"
include: "/Google_Analytics/Sessions/*.view.lkml"
include: "/Google_Analytics/Custom_Views/*.view.lkml"
include: "/Dashboards/*.dashboard"
include: "/explores/*.explore.lkml"
include: "/site_content_views/all_pages.view.lkml"
include: "/site_content_views/landing_pages.view.lkml"
include: "/site_content_views/top_events.view.lkml"


datagroup: bqml_datagroup {
  #retrain model every month
  sql_trigger: SELECT EXTRACT(month from CURRENT_DATE()) ;;
}

named_value_format: hour_format {
  value_format: "[h]:mm:ss"
}

named_value_format: formatted_number {
  #value_format:"[<1000]0;[<1000000]0.0,\"K\";0.0,,\"M\""
  value_format:"0"
}

explore: all_pages {}
explore: landing_pages {}
explore: top_events {}
