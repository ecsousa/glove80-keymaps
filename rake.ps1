
$IMAGE=(Get-Item .).Name

if(-not(docker images -qf reference="${IMAGE}:latest")) {
    docker build . -t $IMAGE
}

docker run -it --rm -v "$(Convert-Path .):/opt" $IMAGE rake $args


