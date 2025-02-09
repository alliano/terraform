# melihat semua state
``` tf
terraform state list
```

# melihat detail dari states
``` tf
terraform state {nama state nya}
```

# menghapus state
``` tf
terraform state rm {nama state nya}
```


# menghapus spesifik resource
``` tf
terraform destroy --target <type>.<nama resource>
```

# menghapus semua resource
``` tf
terraform destroy
```

# melakukan plan pada sepsifik resource
``` tf
terraform plan --target <type>.<name>
```

# melakukan apply spesifik resource
```tf
terraform applay --target <type>.<name>
```