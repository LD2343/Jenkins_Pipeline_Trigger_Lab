resource "aws_s3_bucket" "Jenkins_Bucket" {
  bucket_prefix = "jenkins-bucket-"
  force_destroy = true


  tags = {
    Name = "Jenkins Bucket"
  }
}

resource "aws_s3_object" "Armageddon_Evidence" {
  for_each = fileset("${path.module}/armageddon_evidence_files", "**")

  bucket = aws_s3_bucket.Jenkins_Bucket.id
  key    = "armageddon_evidence_files/${each.value}"
  source = "${path.module}/armageddon_evidence_files/${each.value}"
}

resource "aws_s3_object" "Lab_Evidence" {
  for_each = fileset("${path.module}/lab_evidence", "**")

  bucket = aws_s3_bucket.Jenkins_Bucket.id
  key    = "lab_evidence/${each.value}"
  source = "${path.module}/lab_evidence/${each.value}"
}
