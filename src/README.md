## Instalações
- [Terraform](https://developer.hashicorp.com/terraform/downloads)
- [AWS CLI](https://aws.amazon.com/pt/cli/)
- [Terraform - Providers](https://registry.terraform.io/browse/providers)
    - [AWS](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)
    - [Data Sources - aws_eks_cluster](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/eks_cluster)
    - [Data Sources - aws_eks_cluster_auth](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/eks_cluster_auth)
- [Terraform - Modules](https://registry.terraform.io/browse/modules)
    - [EKS](https://registry.terraform.io/modules/terraform-aws-modules/eks/aws/latest)

> **Nota:** O ECS é uma solução desenvolvida pela AWS para ser simples de configurar e acelerar o processo de lançar aplicações Docker na nuvem. Além disso, se integra facilmente a outros serviços como os Application Load Balancer (ALB) e os autoscaling groups.
O EKS por sua vez é uma ferramenta open source (código aberto), que nos fornece maior flexibilidade, com APIs e uma grande comunidade de pessoas que desenvolvem, o que torna erros mais fáceis de serem corrigidos.
Em termos de custos, ambos ECS e EKS são pagos, porém o ECS cobra apenas o preço das máquinas criadas. Já o EKS cobra pelas máquinas e pelo cluster. Para aplicações pequenas ou poucas aplicações, o ECS acaba saindo um pouco mais barato, mas se precisarmos de mais máquinas, o EKS leva a vantagem pelo fato do Kubernetes ter uma melhor escalabilidade, o que reduz os seus custos.
Outro ponto importante é a questão do ECS usar tecnologias proprietárias, o que impossibilita portar sua infraestrutura de forma rápida para outro provedor. No EKS isso não ocorre por ser uma tecnologia aberta e implementada por vários provedores.

## Deploy
- `terraform init` iniciar/configurar diretório
- `terraform plan` visualizar o que será criado
- `terraform apply` aplicar as mudanças
- `terraform destroy` destruir o que foi criado