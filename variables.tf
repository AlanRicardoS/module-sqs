variable "name" {
  type = number
}

variable "delay_seconds" {
  type = number
}

variable "max_message_size" {
  type = number
}

variable "message_retention_seconds" {
  type = number
}

variable "receive_wait_time_seconds" {
  type = number
}

variable "Environment" {
  type = string
}

variable "maxReceiveCount" {
  type = number
}

variable "name-queue" {
  type = string
}

variable "redrivePermission" {
  type = string
}
