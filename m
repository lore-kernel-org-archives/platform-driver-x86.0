From: Jiri Slaby <jslaby@suse.cz>
Subject: NULL pointer dereference in call_fext_func [fujitsu_laptop]
Date: Tue, 19 Sep 2017 09:56:47 +0200
Message-ID: <541b9a7a-2224-9b81-aef3-3f06491f91e3@suse.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-GB
Sender: linux-kernel-owner@vger.kernel.org
To: kernel@kempniu.pl, jwoithe@just42.net, dvhart@infradead.org, andy@infradead.org, platform-driver-x86@vger.kernel.org, Linux kernel mailing list <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

Hi,

we have this report from 4.13.1:
BUG: unable to handle kernel NULL pointer dereference at 00000004
IP: call_fext_func.isra.3+0x82/0xf0 [fujitsu_laptop]
*pdpt = 0000000035e79001 *pde = 0000000000000000

Oops: 0000 [#1] PREEMPT SMP
Modules linked in: ppdev ipw2200(+) libipw lib80211 cfg80211 smsc_ircc2
iTCO_wdt irda iTCO_vendor_support soundcore ptp rfkill ac97_bus pps_core
lpc_ich apanel input_polldev fujitsu_laptop parport_pc i2c_i801 parport
joydev shpchp floppy(+) sparse_keymap pcspkr tpm_infineon video tpm
button acpi_cpufreq ac battery dm_crypt algif_skcipher af_alg
hid_generic usbhid sr_mod cdrom ata_generic pcmcia radeon serio_raw
ata_piix i2c_algo_bit firewire_ohci firewire_core crc_itu_t
drm_kms_helper syscopyarea sysfillrect sysimgblt fb_sys_fops
yenta_socket pcmcia_rsrc pcmcia_core uhci_hcd ehci_pci ehci_hcd usbcore
ttm drm dm_mirror dm_region_hash dm_log dm_mod sg
CPU: 0 PID: 850 Comm: systemd-backlig Not tainted 4.13.1-1-pae #1
Hardware name: FUJITSU SIEMENS CELSIUS H230/FJNB192, BIOS Version 1.14
08/30/2005
task: f39e05c0 task.stack: f39b0000
EIP: call_fext_func.isra.3+0x82/0xf0 [fujitsu_laptop]
EFLAGS: 00010256 CPU: 0
EAX: f39b1df8 EBX: 00000004 ECX: f39b1df0 EDX: f7ff03cf
ESI: 00000001 EDI: f39b1e50 EBP: f39b1e5c ESP: f39b1de8
 DS: 007b ES: 007b FS: 00d8 GS: 00e0 SS: 0068
CR0: 80050033 CR2: 00000004 CR3: 33964e40 CR4: 000006f0
Call Trace:
 ? bl_update_status+0x33/0x50 [fujitsu_laptop]
 ? backlight_device_set_brightness+0x4b/0xb0
 ? brightness_store+0x29/0x40
 ? backlight_device_set_brightness+0xb0/0xb0
 ? dev_attr_store+0x18/0x30
 ? sysfs_kf_write+0x2e/0x50
 ? sysfs_kf_bin_read+0xc0/0xc0
 ? kernfs_fop_write+0xea/0x170
 ? kernfs_vma_page_mkwrite+0x70/0x70
 ? __vfs_write+0x22/0x150
 ? common_file_perm+0x4d/0x120
 ? __alloc_fd+0x9d/0x160
 ? security_file_permission+0x31/0xb0
 ? vfs_write+0x94/0x1a0
 ? SyS_write+0x3c/0x90
 ? do_fast_syscall_32+0x71/0x150
 ? entry_SYSENTER_32+0x4e/0x7c
Code: d0 c1 f8 1f c7 45 e0 01 00 00 00 89 45 d4 8b 45 0c c7 45 94 04 00
00 00 89 45 e4 c1 f8 1f 89 45 e8 8d 45 a4 89 45 98 8d 45 9c 50 <8b> 03
e8 e7 f4 e3 cd 85 c0 5a 75 3e f6 05 c2 23 ff f7 04 8b 45
EIP: call_fext_func.isra.3+0x82/0xf0 [fujitsu_laptop] SS:ESP: 0068:f39b1de8
CR2: 0000000000000004
---[ end trace c655aaa8d9ba8d30 ]---

It looks like fext is NULL, but bl_update_status passes it down to
call_fext_func which obviously blows up.

This was originally reported here:
https://bugzilla.suse.com/show_bug.cgi?id=1058814

Any ideas?

thanks,
-- 
js
suse labs
