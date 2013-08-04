From: =?ISO-8859-15?Q?Marco_Kr=FCger?= <krgsch@gmail.com>
Subject: sony-laptop crash (Sony VPC SE 1V9E) for 3.8.0+
Date: Sun, 04 Aug 2013 12:38:49 +0200
Message-ID: <51FE2F39.4080504@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-bk0-f41.google.com ([209.85.214.41]:34646 "EHLO
	mail-bk0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750886Ab3HDKg4 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 4 Aug 2013 06:36:56 -0400
Received: by mail-bk0-f41.google.com with SMTP id jc10so661898bkc.28
        for <platform-driver-x86@vger.kernel.org>; Sun, 04 Aug 2013 03:36:55 -0700 (PDT)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: malattia@linux.it
Cc: platform-driver-x86@vger.kernel.org

Hey Mattia,

since the kernel 3.8.0 (commit: 
23caaeea271cfe3176f0e27374d2016bd7583ea8) the sony-laptop module 
chrashes for me.
Initially reported to the Arch Linux Bugtracker [1]. Link [2] lists full 
module output with enabled debug parameter.

Thanks!

[  171.492147] ------------[ cut here ]------------
[  171.492151] WARNING: at fs/sysfs/dir.c:530 sysfs_add_one+0xa5/0xd0()
[  171.492153] sysfs: cannot create duplicate filename '/devices/platform/sony-laptop/kbd_backlight'
[  171.492154] Modules linked in: sony_laptop(+) tun fuse joydev nf_conntrack_ipv4 nf_defrag_ipv4 xt_conntrack nf_conntrack iptable_filter ip_tables x_tables tpm_infineon arc4 intel_powerclamp coretemp iwldvm crc32_pclmul iTCO_wdt crc32c_intel iTCO_vendor_support ghash_clmulni_intel mac80211 aesni_intel aes_x86_64 lrw gf128mul glue_helper ablk_helper cryptd iwlwifi microcode rtsx_pci_ms snd_hda_codec_hdmi memstick cfg80211 rfkill snd_hda_codec_realtek thermal i915 snd_hda_intel button battery intel_agp snd_hda_codec intel_gtt mperf drm_kms_helper snd_hwdep psmouse snd_pcm tpm_tis drm tpm snd_page_alloc snd_timer tpm_bios i2c_i801 snd i2c_algo_bit ac mei_me video serio_raw soundcore evdev lpc_ich mei i2c_core processor pcspkr ext4 crc16 mbcache jbd2 sd_mod rtsx_pci_sdmmc mmc_core ahci libah
 ci libata
[  171.492192]  ehci_pci xhci_hcd ehci_hcd scsi_mod rtsx_pci usbcore usb_common
[  171.492197] CPU: 0 PID: 643 Comm: modprobe Not tainted 3.10.3-1-ARCH #1
[  171.492198] Hardware name: Sony Corporation VPCSE1V9E/VAIO, BIOS R2087H4 06/15/2012
[  171.492200]  0000000000000009 ffff88022cefda20 ffffffff814bd2df ffff88022cefda58
[  171.492202]  ffffffff81055881 00000000ffffffef ffff88022cea52a0 ffff88022cefdb00
[  171.492204]  ffff88022cf50000 00000000000001a4 ffff88022cefdab8 ffffffff810558ec
[  171.492205] Call Trace:
[  171.492210]  [<ffffffff814bd2df>] dump_stack+0x19/0x1b
[  171.492213]  [<ffffffff81055881>] warn_slowpath_common+0x61/0x80
[  171.492214]  [<ffffffff810558ec>] warn_slowpath_fmt+0x4c/0x50
[  171.492216]  [<ffffffff811fc925>] sysfs_add_one+0xa5/0xd0
[  171.492219]  [<ffffffff811fbaf7>] sysfs_add_file_mode+0x97/0xe0
[  171.492221]  [<ffffffff811fbb6a>] sysfs_create_file+0x2a/0x30
[  171.492223]  [<ffffffff8134ea0d>] device_create_file+0x3d/0xa0
[  171.492228]  [<ffffffffa06c4ea4>] sony_nc_add+0xd54/0x10fc [sony_laptop]
[  171.492230]  [<ffffffff811fd2dc>] ? sysfs_do_create_link_sd+0xcc/0x220
[  171.492234]  [<ffffffff812d6449>] acpi_device_probe+0x4e/0xfe
[  171.492237]  [<ffffffff813535f7>] driver_probe_device+0x87/0x3a0
[  171.492238]  [<ffffffff813539e3>] __driver_attach+0x93/0xa0
[  171.492240]  [<ffffffff81353950>] ? __device_attach+0x40/0x40
[  171.492242]  [<ffffffff813515b3>] bus_for_each_dev+0x63/0xa0
[  171.492245]  [<ffffffff8135306e>] driver_attach+0x1e/0x20
[  171.492247]  [<ffffffff81352c08>] bus_add_driver+0x1e8/0x2a0
[  171.492249]  [<ffffffffa04c3000>] ? 0xffffffffa04c2fff
[  171.492251]  [<ffffffff81354071>] driver_register+0x71/0x150
[  171.492253]  [<ffffffffa04c3000>] ? 0xffffffffa04c2fff
[  171.492255]  [<ffffffff812d69b3>] acpi_bus_register_driver+0x3b/0x43
[  171.492258]  [<ffffffffa04c3059>] sony_laptop_init+0x59/0x8e [sony_laptop]
[  171.492261]  [<ffffffff810020e2>] do_one_initcall+0xe2/0x190
[  171.492263]  [<ffffffff810bc38d>] load_module+0x1b6d/0x2610
[  171.492265]  [<ffffffff8128aeb0>] ? ddebug_proc_write+0xf0/0xf0
[  171.492268]  [<ffffffff81158af2>] ? vmap_page_range_noflush+0x262/0x370
[  171.492271]  [<ffffffff810bced2>] SyS_init_module+0xa2/0xf0
[  171.492273]  [<ffffffff814ca75d>] system_call_fastpath+0x1a/0x1f
[  171.492274] ---[ end trace 508654f1445b738e ]---

[1] https://bugs.archlinux.org/task/35184
[2] https://bugs.archlinux.org/task/35184?getfile=10828
