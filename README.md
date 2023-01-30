# terraform init
El comando terraform init se usa para inicializar un directorio de trabajo que contiene archivos de configuración de Terraform. Este es el primer comando que debe ejecutarse después de escribir una nueva configuración de Terraform o clonar una existente desde el repositorio. Es seguro ejecutar este comando varias veces.


# terraform plan
El mencionado comando se utiliza para crear un plan de ejecución. Terraform determina qué acciones son necesarias para lograr el estado deseado especificado en los archivos de configuración.
Este comando es una forma conveniente de verificar si el plan de ejecución para un conjunto de cambios coincide con sus expectativas sin realizar ningún cambio en los recursos reales o en el estado. 
Se puede usar la flag -target para delimitar la salida en un subconjunto de recursos.


# terraform apply
El comando terraform apply se utiliza para aplicar los cambios necesarios para alcanzar el estado deseado de la configuración, o el conjunto predeterminado de acciones generadas por un plan de ejecución del plan terraform.
Terraform apply creará un nuevo plan automáticamente y luego solicitará la aprobación para aplicarlo. Si el plan creado no incluye ningún cambio en los recursos o en los valores de salida del módulo raíz, terraform apply se cerrará inmediatamente, sin preguntar.
También se puede utilizar la flag -target

--------------------------------------------------------------------------