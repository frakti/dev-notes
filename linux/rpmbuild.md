# RPM build

To disable generation of debuginfo RPM package globally add to `~/.rpmmacros`:
```
%debug_package %{nil}
```

If there is no core dump but an error saying "Package is not signed with proper key" it is because package was not signed by RedHat key. Solution:
To allow dumps for even unsigned/unknown/untrusted software, try use
the following options in file "/etc/abrt/abrt.conf" 
```
  OpenGPGCheck = no
  ProcessUnpackaged = yes
```