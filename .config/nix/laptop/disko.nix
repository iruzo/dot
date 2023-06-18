# simple efi
{ disks ? [ "/dev/vdb" ], ... }: {
  disko.devices = {
    disk = {
      vdb = {
        device = builtins.elemAt disks 0;
        type = "disk";
        content = {
          type = "table";
          format = "gpt";
          partitions = [
            {
              type = "partition";
              name = "ESP";
              start = "1MiB";
              end = "100MiB";
              bootable = true;
              content = {
                type = "filesystem";
                format = "vfat";
                mountpoint = "/boot/efi";
              };
            }
            {
              name = "root";
              type = "partition";
              start = "100MiB";
              end = "100%";
              part-type = "primary";
              bootable = true;
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

# encrypted
# { disks ? [ "/dev/vda" ], ... }: {
#   disk = {
#     vdb = {
#       type = "disk";
#       device = builtins.elemAt disks 0;
#       # device = "/dev/vda";
#       content = {
#         type = "table";
#         format = "gpt";
#         partitions = [
#           {
#             type = "partition";
#             name = "ESP";
#             start = "1MiB";
#             end = "100MiB";
#             bootable = true;
#             content = {
#               type = "filesystem";
#               format = "vfat";
#               mountpoint = "/boot/efi";
#               # mountOptions = [
#               #   "defaults"
#               # ];
#             };
#           }
#           {
#             type = "partition";
#             name = "luks";
#             start = "100MiB";
#             end = "100%";
#             content = {
#               type = "luks";
#               name = "crypted";
#               content = {
#                 type = "lvm_pv";
#                 vg = "pool";
#               };
#             };
#           }
#         ];
#       };
#     };
#   };
#   lvm_vg = {
#     pool = {
#       type = "lvm_vg";
#       lvs = {
#         root = {
#           type = "lvm_lv";
#           # size = "100M";
#           content = {
#             type = "filesystem";
#             format = "ext4";
#             mountpoint = "/";
#             mountOptions = [
#               "defaults"
#             ];
#           };
#         };
#         # home = {
#         #   type = "lvm_lv";
#         #   size = "10M";
#         #   content = {
#         #     type = "filesystem";
#         #     format = "ext4";
#         #     mountpoint = "/home";
#         #   };
#         # };
#         # raw = {
#         #   type = "lvm_lv";
#         #   size = "10M";
#         # };
#       };
#     };
#   };
# }
