resource "aws_s3_bucket" "Jenkins_Bucket" {
  bucket_prefix = "jenkins-bucket-"
  force_destroy = true


  tags = {
    Name = "Jenkins Bucket"
  }
}

resource "aws_s3_object" "Armageddon_Approval" {
  bucket = aws_s3_bucket.Jenkins_Bucket.id
  key    = "armageddon_evidence_files/Theo_Armageddon_Approval.png"
  source = "${path.module}/armageddon_evidence_files/Theo_Armageddon_Approval.png"
}

resource "aws_s3_object" "Armageddon_Repo_Link" {
  bucket = aws_s3_bucket.Jenkins_Bucket.id
  key    = "armageddon_evidence_files/Armageddon_Group_Link.txt"
  source = "${path.module}/armageddon_evidence_files/Armageddon_Group_Link.txt"
}