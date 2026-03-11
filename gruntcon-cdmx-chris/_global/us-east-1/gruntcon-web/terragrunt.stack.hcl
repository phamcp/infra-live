unit "gruntcon-web" {
  source = "git::github.com/gruntwork-test/cdmx-web.git//units/team-website"
  path   = "gruntcon-web"

  values = {
    team_name  = "Los Aguilas"  # Change to your team name
    image_path = "aguilas.png"  # Path relative to repo root
  }
}
