unit "gruntcon-web" {
  source = "git::github.com/gruntwork-test/cdmx-web.git//units/team-website"
  path   = "gruntcon-web"

  values = {
    team_name  = "My Awesome Team"  # Change to your team name
    image_path = "gruntcon-cdmx-chris/global/us-east-1/gruntcon-web/aguilas.png"  # Path relative to repo root
  }
}
