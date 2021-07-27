if podman stop ploigos-dev 2> /dev/null ; then
    podman rm ploigos-dev
else
    podman rm ploigos-dev
fi
