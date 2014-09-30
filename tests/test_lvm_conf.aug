module Test_lvm_conf =
   let sample_lvm_conf = "# This is an example configuration file for the LVM2 system.
# It contains the default settings that would be used if there was no
# /etc/lvm/lvm.conf file.
#
# Refer to 'man lvm.conf' for further information including the file layout.
#
# To put this file in a different directory and override /etc/lvm set
# the environment variable LVM_SYSTEM_DIR before running the tools.
#
# N.B. Take care that each setting only appears once if uncommenting
# example settings in this file.

# This section allows you to set the way the configuration settings are handled.
config {

    # If enabled, any LVM2 configuration mismatch is reported.
    # This implies checking that the configuration key is understood
    # by LVM2 and that the value of the key is of a proper type.
    # If disabled, any configuration mismatch is ignored and default
    # value is used instead without any warning (a message about the
    # configuration key not being found is issued in verbose mode only).
    checks = 1

    # If enabled, any configuration mismatch aborts the LVM2 process.
    abort_on_errors = 0

    # Directory where LVM looks for configuration profiles.
    profile_dir = \"/etc/lvm/profile\"
}

# This section allows you to configure which block devices should
# be used by the LVM system.
devices {

    # Where do you want your volume groups to appear ?
    dir = \"/dev\"
    stuff = \"\"

    # An array of directories that contain the device nodes you wish
    # to use with LVM2.
    scan = [ \"/dev\",\n \"hello\" ]

    negative_int = -1
    negative_float = -1.4

    # If set, the cache of block device nodes with all associated symlinks
}"
  test Lvm_conf.lns get sample_lvm_conf = ?

  test Lvm_conf.lns put sample_lvm_conf after set "/config/foo" "\"loltest\"" = ?
(*
*)
