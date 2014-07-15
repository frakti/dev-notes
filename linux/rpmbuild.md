# RPM build

To disable generation of debuginfo RPM package globally add to `~/.rpmmacros`:
```
%debug_package %{nil}
```
