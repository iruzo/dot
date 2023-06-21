{ disks ? [ "/dev/vda" ], ... }: {
  disko.devices = {
    disk = {
      main = {
        type = "disk";
        device = builtins.elemAt disks 0;
        content = {
          type = "table";
          format = "gpt";
          partitions = [
            {
              name = "boot";
              start = "0";
              end = "1M";
              flags = [ "bios_grub" ];
            }
            {
              name = "ESP";
              start = "1M";
              end = "512M";
              bootable = true;
              content = {
                type = "filesystem";
                format = "vfat";
                mountpoint = "/boot";
              };
            }
            {
              name = "root";
              start = "512M";
              end = "100%";
              content = {
                type = "filesystem";
                format = "ext4";
                mountpoint = "/";
              };
            }
          ];
        };
      };
    };
  };
}

# { disks ? [ "/dev/vda" ], ... }: {
#   disko.devices = {
#     disk = {
#       vdb = {
#         type = "disk";
#         device = builtins.elemAt disks 0;
#         content = {
#           type = "table";
#           format = "gpt";
#           partitions = [
#             {
#               name = "ESP";
#               start = "1MiB";
#               end = "100MiB";
#               bootable = true;
#               content = {
#                 type = "filesystem";
#                 format = "vfat";
#                 mountpoint = "/boot";
#                 mountOptions = [
#                   "defaults"
#                 ];
#               };
#             }
#             {
#               name = "luks";
#               start = "100MiB";
#               end = "100%";
#               content = {
#                 type = "luks";
#                 name = "crypted";
#                 extraOpenArgs = [ "--allow-discards" ];
#                 # if you want to use the key for interactive login be sure there is no trailing newline
#                 # for example use `echo -n "password" > /tmp/secret.key`
#                 keyFile = "/tmp/secret.key";
#                 content = {
#                   type = "lvm_pv";
#                   vg = "pool";
#                 };
#               };
#             }
#           ];
#         };
#       };
#     };
#     # lvm_vg = {
#     #   pool = {
#     #     type = "lvm_vg";
#     #     lvs = {
#     #       root = {
#     #         start = "1MiB";
#     #         end = "100%";
#     #         content = {
#     #           type = "filesystem";
#     #           format = "ext4";
#     #           mountpoint = "/";
#     #           mountOptions = [
#     #             "defaults"
#     #           ];
#     #         };
#     #       };
#     #       # home = {
#     #       #   size = "10M";
#     #       #   content = {
#     #       #     type = "filesystem";
#     #       #     format = "ext4";
#     #       #     mountpoint = "/home";
#     #       #   };
#     #       # };
#     #       raw = {
#     #         size = "10M";
#     #       };
#     #     };
#     #   };
#     # };
#   };
# }
