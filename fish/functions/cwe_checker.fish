function cwe_checker
docker run --rm -v $argv[1]:/input ghcr.io/fkie-cad/cwe_checker:stable /input
end
