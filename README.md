# Bash-command-line-shuffler
Bash script to shuffle a list of elements passed in the input file

Say we have an input file

`$  cat input_file.txt`
```
Tokyo
Berlin
Moscow
Denver
```

`$ ./shuffle input_file.txt`
```
Moscow
Denver
Tokyo
Berlin
```

## Execute the curl command in the terminal to shuffle local input_file.txt
`curl https://raw.githubusercontent.com/PraveenMathew92/bash-command-line-shuffler/master/shuffle.sh | bash -s input_file.txt`

## To install the script locally
Run the below command
```
$ curl https://raw.githubusercontent.com/PraveenMathew92/bash-command-line-shuffler/master/shuffle.sh > file-shuffler
$ chmod +x file-shuffler
$ mv file-shuffler /usr/local/bin
```

Now the command file-shuffler may be run on the input file

`file-shuffler input_file.txt`

### Language: bash
