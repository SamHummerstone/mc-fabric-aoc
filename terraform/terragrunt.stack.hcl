unit "mods_bucket" {
  source = "./stacks/"
  path   = "s3_bucket_basic"
  values = {
    bucket_name = "sjhummerstone-aoc-mods"
  }
}

unit "world_bucket" {
  source = "./stacks"
  path   = "s3_bucket_basic"
  values = {
    environment = "sjhummerstone-aoc-world"
  }
}