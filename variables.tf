variable "environment_name" {
  description = "O nome do ambiente do Elastic Beanstalk."
  type        = string
}

variable "application_name" {
  description = "O nome da aplicação do Elastic Beanstalk."
  type        = string
}

variable "application_description" {
  description = "O descrição da aplicação do Elastic Beanstalk."
  type        = string
}

variable "solution_stack_name" {
  description = "O nome do stack de solução a ser usado."
  type        = string
}

variable "cname_prefix" {
  description = "O prefixo usado para o CNAME do ambiente."
  type        = string
}

variable "description" {
  description = "Uma descrição para o ambiente do Elastic Beanstalk."
  type        = string
}

variable "instance_profile" {
  description = "O nome ou ARN do perfil de instância a ser usado."
  type        = string
}

variable "environment_type" {
  description = "O tipo de ambiente a ser criado."
  type        = string
  default     = "LoadBalanced"
}

variable "subnets" {
  description = "Uma lista de IDs de subrede VPC para usar no ambiente."
  type        = list(string)
}

variable "security_group_ids" {
  description = "Uma lista de IDs de grupos de segurança para usar no ambiente."
  type        = list(string)
}

variable "elb_subnets" {
  description = "Uma lista de IDs de subrede VPC para usar no balanceador de carga do ambiente."
  type        = list(string)
}

variable "elb_security_groups" {
  description = "Uma lista de IDs de grupos de segurança para usar no balanceador de carga do ambiente."
  type        = list(string)
}

variable "wsgi_path" {
  description = "O caminho para a aplicação WSGI no pacote de origem da aplicação."
  type        = string
}

variable "num_processes" {
  description = "O número de processos da aplicação a serem executados."
  type        = number
  default     = 1
}

variable "num_threads" {
  description = "O número de threads por processo da aplicação a serem executados."
  type        = number
  default     = 15
}
