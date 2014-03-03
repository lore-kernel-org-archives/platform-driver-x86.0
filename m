From: Valerio Passini <valerio.passini@unicam.it>
Subject: PROBLEM: boot takes more time with hp_accel driver
Date: Mon, 03 Mar 2014 22:32:29 +0100
Message-ID: <3474055.60QkjLD89x@asterix>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ea0-f180.google.com ([209.85.215.180]:36947 "EHLO
	mail-ea0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753590AbaCCVcc (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 3 Mar 2014 16:32:32 -0500
Received: by mail-ea0-f180.google.com with SMTP id m10so4851714eaj.11
        for <platform-driver-x86@vger.kernel.org>; Mon, 03 Mar 2014 13:32:31 -0800 (PST)
Received: from asterix.localnet (net-93-147-13-222.cust.dsl.teletu.it. [93.147.13.222])
        by mx.google.com with ESMTPSA id x3sm54968521eep.17.2014.03.03.13.32.30
        for <platform-driver-x86@vger.kernel.org>
        (version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
        Mon, 03 Mar 2014 13:32:30 -0800 (PST)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org

Hello,

I have met this problem a long ago (about at 3.8 kernel release) and never had 
the time to dig it. The problem is that at boot time the system seems to hang 
for a while (ranging from 20 to 50 seconds) and then it completes the boot 
process.
bootchart2 points out that udev was taking a lot of time at boot
during the loading of hp_accel. Putting this driver and lis3lv02d from which 
it depends into a blacklist turns the boot process back to normal (around 40 
seconds). I don't need so much this driver, since I don't move around my 
laptop while it's on, but I would like to help improving it because a fast 
boot time is considered to be important for a good user experience. What do 
you to solve this rather small problem? Bye

Valerio



If some fields are empty or look unusual you may have an old version.
Compare to the current minimal requirements in Documentation/Changes.
 
Linux Asterix 3.13.5 #1 SMP PREEMPT Mon Feb 24 15:56:00 CET 2014 x86_64 
GNU/Linux
 
Gnu C                  4.8
Gnu make               3.81
binutils               2.24
util-linux             2.20.1
mount                  support
module-init-tools      16
e2fsprogs              1.42.9
jfsutils               1.1.15
reiserfsprogs          3.6.24
xfsprogs               3.1.9
pcmciautils            018
PPP                    2.4.5
Linux C Library        2.18
Dynamic linker (ldd)   2.18
Procps                 3.3.9
Net-tools              1.60
Kbd                    [opzione...]
Console-tools          0.2.3
Sh-utils               8.21
wireless-tools         30
Modules Loaded         hp_accel lis3lv02d input_polldev ctr ccm promethean 
ip6table_filter ip6_tables iptable_filter ip_tables x_tables rfcomm bnep 
bluetooth cpufreq_userspace cpufreq_stats cpufreq_powersave 
cpufreq_conservative pci_stub vboxpci vboxnetadp vboxnetflt vboxdrv binfmt_misc 
uinput nfsd auth_rpcgss oid_registry nfs_acl nfs lockd fscache sunrpc ext3 jbd 
fuse loop parport_pc ppdev lp parport snd_hda_codec_hdmi snd_hda_codec_idt 
fglrx x86_pkg_temp_thermal coretemp uvcvideo videobuf2_vmalloc 
videobuf2_memops videobuf2_core videodev media kvm_intel kvm snd_hda_intel 
snd_hda_codec snd_hwdep snd_pcm_oss i915 snd_mixer_oss joydev 
ghash_clmulni_intel snd_pcm snd_page_alloc radeon snd_seq_midi arc4 
snd_seq_midi_event aesni_intel intel_agp fbcon snd_rawmidi brcmsmac cordic 
brcmutil snd_seq ttm mac80211 aes_x86_64 bitblit fbcon_rotate fbcon_ccw 
fbcon_ud fbcon_cw softcursor font intel_gtt hp_wmi drm_kms_helper drm 
snd_timer snd_seq_device snd psmouse sparse_keymap cfg80211 rfkill iTCO_wdt 
evdev iTCO_vendor_support microcode serio_raw i2c_i801 pcspkr battery 
rtsx_pci_ms wmi bcma i2c_algo_bit mei_me memstick processor ac button video 
lpc_ich soundcore ext4 crc16 jbd2 mbcache hid_generic usbhid hid sg sd_mod 
sr_mod crc_t10dif cdrom crct10dif_common rtsx_pci_sdmmc mmc_core rtsx_pci 
mfd_core r8169 mii ahci libahci ehci_pci ehci_hcd usbcore usb_common thermal 
thermal_sys
