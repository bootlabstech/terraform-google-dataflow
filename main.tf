resource "google_dataflow_job" "pubsub_stream" {
    name = var.name
    template_gcs_path = var.template_gcs_path
    temp_gcs_location = var.temp_gcs_location
    enable_streaming_engine = var.enable_streaming_engine
    parameters = {
      inputFilePattern = "${google_storage_bucket.bucket1.url}/*.json"
      outputTopic    = google_pubsub_topic.topic.id
    }
    transform_name_mapping = {
        name = "test_job"
        env = "test"
    }
    on_delete = "cancel"
}