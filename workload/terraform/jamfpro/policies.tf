resource "jamfpro_policy" "jamfpro_policy_demo" {
  name                          = "tf-demo-policy-script-lma"
  enabled                       = false
  trigger_checkin               = false
  trigger_enrollment_complete   = false
  trigger_login                 = false
  trigger_network_state_changed = false
  trigger_startup               = false
  trigger_other                 = "EVENT" // "USER_INITIATED" for self service trigger , "EVENT" for an event trigger
  frequency                     = "Once per computer"
  retry_event                   = "none"
  retry_attempts                = -1
  notify_on_each_failed_retry   = false
  target_drive                  = "/"
  offline                       = false
  category_id                   = -1 
  site_id                       = -1

  network_limitations {
    minimum_network_connection = "No Minimum"
    any_ip_address             = false
  }

  scope {
    all_computers = false
    all_jss_users = false
    building_ids  = [jamfpro_building.building["jamf_london"].id]

  }

  self_service {
    use_for_self_service            = true
    self_service_display_name       = ""
    install_button_text             = "Install"
    self_service_description        = ""
    force_users_to_view_description = false

    feature_on_main_page = false
  }

  payloads {
    scripts {
      id          = jamfpro_script.jamfpro_script_2.id
      priority    = "After"
      parameter4  = ""
      parameter5  = ""
      parameter6  = ""
      parameter7  = ""
      parameter8  = ""
      parameter9  = ""
      parameter10 = ""
      parameter11 = ""

    }
  }
}