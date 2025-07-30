locals {
  sufix = "${var.virginia_tags.project}-${var.virginia_tags.env}-${var.virginia_tags.region}" # recurso - proyecto - entorno - region

}

resource "random_string" "sufijo-s3" {
    length = 12
    special = false
    upper = false
}

locals {
  s3-sufix = "${var.virginia_tags.project}-${random_string.sufijo-s3.id}"
}