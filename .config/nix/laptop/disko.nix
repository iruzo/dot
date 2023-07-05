{ disks ? [ "/dev/nvme0n1" ], ... }: {
  disk = {
    vdb = {
      type = "disk";
      device = builtins.elemAt disks 0;
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
            name = "luks";
            start = "100MiB";
            end = "100%";
            content = {
              type = "luks";
              name = "crypted";
              extraOpenArgs = [ "--allow-discards" ];
              keyFile = "/tmp/secret.key";
              content = {
                type = "lvm_pv";
                vg = "pool";
              };
            };
          }
        ];
      };
    };
  };
  lvm_vg = {
    pool = {
      type = "lvm_vg";
      lvs = {
        root = {
          size = "950G";
          content = {
            type = "filesystem";
            format = "ext4";
            mountpoint = "/";
            mountOptions = [
              "defaults"
            ];
          };
        };
        # home = {
        #   type = "lvm_lv";
        #   size = "10M";
        #   content = {
        #     type = "filesystem";
        #     format = "ext4";
        #     mountpoint = "/home";
        #   };
        # };
        # raw = {
        #   type = "lvm_lv";
        #   size = "10M";
        # };
      };
    };
  };
}
