From: Tobias Stegmann <stegmannt@gmail.com>
Subject: [PROBLEM][PATCH] thinkpad_acpi: propagate acpi event for hardware
 radio switch (Thinkpad X220)
Date: Mon, 9 Jun 2014 02:20:00 +0200
Message-ID: <CAGC361CVCLMxc-0vNG-WqWK0zH6fG+wi3W7=swPKs2-FC_q2xg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary=bcaec5299be33eafab04fb5c2d84
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ig0-f181.google.com ([209.85.213.181]:63814 "EHLO
	mail-ig0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753604AbaFIAUW (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 8 Jun 2014 20:20:22 -0400
Received: by mail-ig0-f181.google.com with SMTP id h3so3265587igd.2
        for <platform-driver-x86@vger.kernel.org>; Sun, 08 Jun 2014 17:20:21 -0700 (PDT)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org

--bcaec5299be33eafab04fb5c2d84
Content-Type: text/plain; charset=UTF-8

Dear ACPI developers,

[1.] One line summary of the problem:
After upgrading the kernel toggling the hardware radio switch doesn't
generate an acpi event anylonger.

[2.] Full description of the problem/report:
I use a customized acpi event script to disable bluetooth on my
Thinkpad x220, if I toggle the hardware wifi switch (not Fn+F5 but a
physical switch). This used to work fine with v3.11, however it
stopped working with 3.12+. More precisely the switch doesnt generate
an acpi event anymore.

Bisecting the kernel showed [0] and [1] as the commits, which
introduced the issue, which is still present in the latest kernel
version.

[0] https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=1696d9dc57e062ce5200f6a42a6aaada15b434bb
[1] https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=8b5301c5ff2568236c6e3b3d0c93a3e4194ec3f5

Looking at the commits it seems this behaviour is somehow intentional,
even if it breaks existing scripts. Except I am missing something I
cant think of any reason to not generate an acpi event for the radio
switch.

Fortunately it's a one liner to reenable the acpi event (see the
attached patch and section [8] at the very bottom of this mail).

[3.] Keywords (i.e., modules, networking, kernel):
[4.] Kernel version (from /proc/version):
Linux version 3.15.0-rc8-custom

[6.] A small shell script or example program which triggers the
     problem (if possible)

acpi_listen -t 10 # and toggle the switch within 10 seconds

Expected output after toggling the switch:
$ acpi_listen -t 10
ibm/hotkey LEN0068:00 00000080 00007000

Actual output is empty.

[7.] Environment
$ lsb_release -rd
Description:    Ubuntu 14.04 LTS
Release:        14.04

[7.1.] Software (add the output of the ver_linux script here)
/usr/src/linux-headers-3.15.0-rc8-custom/scripts$ sh ver_linux
If some fields are empty or look unusual you may have an old version.
Compare to the current minimal requirements in Documentation/Changes.

Linux tobias-ThinkPad-X220 3.15.0-rc8-custom #1 SMP Sun Jun 8 18:57:44
CEST 2014 x86_64 x86_64 x86_64 GNU/Linux

Gnu C                  4.8
Gnu make               3.81
binutils               2.24
util-linux             2.20.1
mount                  support
module-init-tools      15
e2fsprogs              1.42.9
pcmciautils            018
PPP                    2.4.5
Linux C Library        2.19
Dynamic linker (ldd)   2.19
Procps                 3.3.9
Net-tools              1.60
Kbd                    1.15.5
Sh-utils               8.21
wireless-tools         30
Modules Loaded         ip6table_filter ip6_tables iptable_filter
ip_tables x_tables pci_stub vboxpci vboxnetadp vboxnetflt vboxdrv
snd_hda_codec_hdmi intel_rapl x86_pkg_temp_thermal intel_powerclamp
snd_hda_codec_conexant coretemp snd_hda_codec_generic kvm_intel kvm
snd_hda_intel dm_multipath snd_hda_controller snd_hda_codec scsi_dh
snd_pcm bnep crct10dif_pclmul rfcomm thinkpad_acpi crc32_pclmul
bluetooth nvram snd_hwdep ghash_clmulni_intel snd_seq_midi
snd_seq_midi_event snd_rawmidi uvcvideo videobuf2_vmalloc
videobuf2_memops videobuf2_core videodev aesni_intel aes_x86_64
glue_helper arc4 lrw snd_seq gf128mul ablk_helper cryptd iwldvm
mac80211 nfsd auth_rpcgss nfs_acl iwlwifi nfs binfmt_misc snd_timer
lockd snd_seq_device sunrpc joydev fscache cfg80211 snd mei_me
serio_raw mei lpc_ich soundcore wmi parport_pc ppdev mac_hid lp
parport i915 e1000e i2c_algo_bit drm_kms_helper ptp drm pps_core
psmouse ahci sdhci_pci libahci sdhci video
[7.2.] Processor information (from /proc/cpuinfo):
$ cat /proc/cpuinfo
processor       : 0
vendor_id       : GenuineIntel
cpu family      : 6
model           : 42
model name      : Intel(R) Core(TM) i5-2520M CPU @ 2.50GHz
stepping        : 7
microcode       : 0x29
cpu MHz         : 2251.562
cache size      : 3072 KB
physical id     : 0
siblings        : 4
core id         : 0
cpu cores       : 2
apicid          : 0
initial apicid  : 0
fpu             : yes
fpu_exception   : yes
cpuid level     : 13
wp              : yes
flags           : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge
mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe
syscall nx rdtscp lm constant_tsc arch_perfmon pebs bts nopl xtopology
nonstop_tsc aperfmperf eagerfpu pni pclmulqdq dtes64 monitor ds_cpl
vmx smx est tm2 ssse3 cx16 xtpr pdcm pcid sse4_1 sse4_2 x2apic popcnt
tsc_deadline_timer aes xsave avx lahf_lm ida arat epb xsaveopt pln pts
dtherm tpr_shadow vnmi flexpriority ept vpid
bogomips        : 4984.29
clflush size    : 64
cache_alignment : 64
address sizes   : 36 bits physical, 48 bits virtual
power management:

processor       : 1
vendor_id       : GenuineIntel
cpu family      : 6
model           : 42
model name      : Intel(R) Core(TM) i5-2520M CPU @ 2.50GHz
stepping        : 7
microcode       : 0x29
cpu MHz         : 1860.937
cache size      : 3072 KB
physical id     : 0
siblings        : 4
core id         : 0
cpu cores       : 2
apicid          : 1
initial apicid  : 1
fpu             : yes
fpu_exception   : yes
cpuid level     : 13
wp              : yes
flags           : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge
mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe
syscall nx rdtscp lm constant_tsc arch_perfmon pebs bts nopl xtopology
nonstop_tsc aperfmperf eagerfpu pni pclmulqdq dtes64 monitor ds_cpl
vmx smx est tm2 ssse3 cx16 xtpr pdcm pcid sse4_1 sse4_2 x2apic popcnt
tsc_deadline_timer aes xsave avx lahf_lm ida arat epb xsaveopt pln pts
dtherm tpr_shadow vnmi flexpriority ept vpid
bogomips        : 4984.29
clflush size    : 64
cache_alignment : 64
address sizes   : 36 bits physical, 48 bits virtual
power management:

processor       : 2
vendor_id       : GenuineIntel
cpu family      : 6
model           : 42
model name      : Intel(R) Core(TM) i5-2520M CPU @ 2.50GHz
stepping        : 7
microcode       : 0x29
cpu MHz         : 1626.562
cache size      : 3072 KB
physical id     : 0
siblings        : 4
core id         : 1
cpu cores       : 2
apicid          : 2
initial apicid  : 2
fpu             : yes
fpu_exception   : yes
cpuid level     : 13
wp              : yes
flags           : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge
mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe
syscall nx rdtscp lm constant_tsc arch_perfmon pebs bts nopl xtopology
nonstop_tsc aperfmperf eagerfpu pni pclmulqdq dtes64 monitor ds_cpl
vmx smx est tm2 ssse3 cx16 xtpr pdcm pcid sse4_1 sse4_2 x2apic popcnt
tsc_deadline_timer aes xsave avx lahf_lm ida arat epb xsaveopt pln pts
dtherm tpr_shadow vnmi flexpriority ept vpid
bogomips        : 4984.29
clflush size    : 64
cache_alignment : 64
address sizes   : 36 bits physical, 48 bits virtual
power management:

processor       : 3
vendor_id       : GenuineIntel
cpu family      : 6
model           : 42
model name      : Intel(R) Core(TM) i5-2520M CPU @ 2.50GHz
stepping        : 7
microcode       : 0x29
cpu MHz         : 1821.875
cache size      : 3072 KB
physical id     : 0
siblings        : 4
core id         : 1
cpu cores       : 2
apicid          : 3
initial apicid  : 3
fpu             : yes
fpu_exception   : yes
cpuid level     : 13
wp              : yes
flags           : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge
mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe
syscall nx rdtscp lm constant_tsc arch_perfmon pebs bts nopl xtopology
nonstop_tsc aperfmperf eagerfpu pni pclmulqdq dtes64 monitor ds_cpl
vmx smx est tm2 ssse3 cx16 xtpr pdcm pcid sse4_1 sse4_2 x2apic popcnt
tsc_deadline_timer aes xsave avx lahf_lm ida arat epb xsaveopt pln pts
dtherm tpr_shadow vnmi flexpriority ept vpid
bogomips        : 4984.29
clflush size    : 64
cache_alignment : 64
address sizes   : 36 bits physical, 48 bits virtual
power management:

[7.3.] Module information (from /proc/modules):
$ cat /proc/modules
ip6table_filter 12815 0 - Live 0x0000000000000000
ip6_tables 26954 1 ip6table_filter, Live 0x0000000000000000
iptable_filter 12810 0 - Live 0x0000000000000000
ip_tables 27168 1 iptable_filter, Live 0x0000000000000000
x_tables 34059 4 ip6table_filter,ip6_tables,iptable_filter,ip_tables,
Live 0x0000000000000000
pci_stub 12622 1 - Live 0x0000000000000000
vboxpci 23194 0 - Live 0x0000000000000000 (OE)
vboxnetadp 25670 0 - Live 0x0000000000000000 (OE)
vboxnetflt 23517 0 - Live 0x0000000000000000 (OE)
vboxdrv 339502 3 vboxpci,vboxnetadp,vboxnetflt, Live 0x0000000000000000 (OE)
snd_hda_codec_hdmi 47534 1 - Live 0x0000000000000000
intel_rapl 18783 0 - Live 0x0000000000000000
x86_pkg_temp_thermal 14205 0 - Live 0x0000000000000000
intel_powerclamp 18823 0 - Live 0x0000000000000000
snd_hda_codec_conexant 22962 1 - Live 0x0000000000000000
coretemp 13441 0 - Live 0x0000000000000000
snd_hda_codec_generic 68937 1 snd_hda_codec_conexant, Live 0x0000000000000000
kvm_intel 143255 0 - Live 0x0000000000000000
kvm 446918 1 kvm_intel, Live 0x0000000000000000
snd_hda_intel 30353 6 - Live 0x0000000000000000
dm_multipath 22843 0 - Live 0x0000000000000000
snd_hda_controller 30750 1 snd_hda_intel, Live 0x0000000000000000
snd_hda_codec 139464 5
snd_hda_codec_hdmi,snd_hda_codec_conexant,snd_hda_codec_generic,snd_hda_intel,snd_hda_controller,
Live 0x0000000000000000
scsi_dh 14882 1 dm_multipath, Live 0x0000000000000000
snd_pcm 108688 4
snd_hda_codec_hdmi,snd_hda_intel,snd_hda_controller,snd_hda_codec,
Live 0x0000000000000000
bnep 19624 2 - Live 0x0000000000000000
crct10dif_pclmul 14307 0 - Live 0x0000000000000000
rfcomm 69391 0 - Live 0x0000000000000000
thinkpad_acpi 81027 1 - Live 0x0000000000000000
crc32_pclmul 13133 0 - Live 0x0000000000000000
bluetooth 427319 10 bnep,rfcomm, Live 0x0000000000000000
nvram 14411 1 thinkpad_acpi, Live 0x0000000000000000
snd_hwdep 13602 1 snd_hda_codec, Live 0x0000000000000000
ghash_clmulni_intel 13230 0 - Live 0x0000000000000000
snd_seq_midi 13564 0 - Live 0x0000000000000000
snd_seq_midi_event 14899 1 snd_seq_midi, Live 0x0000000000000000
snd_rawmidi 30544 1 snd_seq_midi, Live 0x0000000000000000
uvcvideo 80886 0 - Live 0x0000000000000000
videobuf2_vmalloc 13216 1 uvcvideo, Live 0x0000000000000000
videobuf2_memops 13362 1 videobuf2_vmalloc, Live 0x0000000000000000
videobuf2_core 45109 1 uvcvideo, Live 0x0000000000000000
videodev 148416 2 uvcvideo,videobuf2_core, Live 0x0000000000000000
aesni_intel 152513 0 - Live 0x0000000000000000
aes_x86_64 17131 1 aesni_intel, Live 0x0000000000000000
glue_helper 13990 1 aesni_intel, Live 0x0000000000000000
arc4 12608 2 - Live 0x0000000000000000
lrw 13286 1 aesni_intel, Live 0x0000000000000000
snd_seq 63074 2 snd_seq_midi,snd_seq_midi_event, Live 0x0000000000000000
gf128mul 14951 1 lrw, Live 0x0000000000000000
ablk_helper 13597 1 aesni_intel, Live 0x0000000000000000
cryptd 20359 3 ghash_clmulni_intel,aesni_intel,ablk_helper, Live
0x0000000000000000
iwldvm 232156 0 - Live 0x0000000000000000
mac80211 624427 1 iwldvm, Live 0x0000000000000000
nfsd 278970 2 - Live 0x0000000000000000
auth_rpcgss 59301 1 nfsd, Live 0x0000000000000000
nfs_acl 12837 1 nfsd, Live 0x0000000000000000
iwlwifi 169854 1 iwldvm, Live 0x0000000000000000
nfs 218260 0 - Live 0x0000000000000000
binfmt_misc 17431 1 - Live 0x0000000000000000
snd_timer 29507 2 snd_pcm,snd_seq, Live 0x0000000000000000
lockd 93977 2 nfsd,nfs, Live 0x0000000000000000
snd_seq_device 14497 3 snd_seq_midi,snd_rawmidi,snd_seq, Live 0x0000000000000000
sunrpc 279994 6 nfsd,auth_rpcgss,nfs_acl,nfs,lockd, Live 0x0000000000000000
joydev 17393 0 - Live 0x0000000000000000
fscache 63988 1 nfs, Live 0x0000000000000000
cfg80211 482973 3 iwldvm,mac80211,iwlwifi, Live 0x0000000000000000
snd 73731 24 snd_hda_codec_hdmi,snd_hda_codec_conexant,snd_hda_codec_generic,snd_hda_intel,snd_hda_codec,snd_pcm,thinkpad_acpi,snd_hwdep,snd_rawmidi,snd_seq,snd_timer,snd_seq_device,
Live 0x0000000000000000
mei_me 18515 0 - Live 0x0000000000000000
serio_raw 13483 0 - Live 0x0000000000000000
mei 82669 1 mei_me, Live 0x0000000000000000
lpc_ich 21093 0 - Live 0x0000000000000000
soundcore 12680 2 snd_hda_codec,snd, Live 0x0000000000000000
wmi 19193 0 - Live 0x0000000000000000
parport_pc 32741 0 - Live 0x0000000000000000
ppdev 17635 0 - Live 0x0000000000000000
mac_hid 13227 0 - Live 0x0000000000000000
lp 17759 0 - Live 0x0000000000000000
parport 42313 3 parport_pc,ppdev,lp, Live 0x0000000000000000
i915 829967 2 - Live 0x0000000000000000
e1000e 258985 0 - Live 0x0000000000000000
i2c_algo_bit 13413 1 i915, Live 0x0000000000000000
drm_kms_helper 55228 1 i915, Live 0x0000000000000000
ptp 19395 1 e1000e, Live 0x0000000000000000
drm 300741 4 i915,drm_kms_helper, Live 0x0000000000000000
pps_core 19382 1 ptp, Live 0x0000000000000000
psmouse 106478 0 - Live 0x0000000000000000
ahci 29966 2 - Live 0x0000000000000000
sdhci_pci 23256 0 - Live 0x0000000000000000
libahci 32082 1 ahci, Live 0x0000000000000000
sdhci 43015 1 sdhci_pci, Live 0x0000000000000000
video 19443 1 i915, Live 0x0000000000000000

[7.4.] Loaded driver and hardware information (/proc/ioports, /proc/iomem)
$ cat /proc/ioports
0000-0cf7 : PCI Bus 0000:00
  0000-001f : dma1
  0020-0021 : pic1
  0040-0043 : timer0
  0050-0053 : timer1
  0060-0060 : keyboard
  0062-0062 : EC data
  0064-0064 : keyboard
  0066-0066 : EC cmd
  0070-0071 : rtc0
  0080-008f : dma page reg
  00a0-00a1 : pic2
  00c0-00df : dma2
  00f0-00ff : fpu
  03c0-03df : vesafb
  0400-0403 : ACPI PM1a_EVT_BLK
  0404-0405 : ACPI PM1a_CNT_BLK
  0408-040b : ACPI PM_TMR
  0410-0415 : ACPI CPU throttle
  0420-042f : ACPI GPE0_BLK
  0430-0433 : iTCO_wdt
  0450-0450 : ACPI PM2_CNT_BLK
  0460-047f : iTCO_wdt
  0500-057f : pnp 00:01
  0800-080f : pnp 00:01
0cf8-0cff : PCI conf1
0d00-ffff : PCI Bus 0000:00
  15e0-15ef : pnp 00:01
  1600-167f : pnp 00:01
  2000-2fff : PCI Bus 0000:02
  3000-3fff : PCI Bus 0000:0d
  4000-4fff : PCI Bus 0000:05
  5000-503f : 0000:00:02.0
  5060-507f : 0000:00:1f.2
    5060-507f : ahci
  5080-509f : 0000:00:19.0
  50a0-50a7 : 0000:00:1f.2
    50a0-50a7 : ahci
  50a8-50af : 0000:00:1f.2
    50a8-50af : ahci
  50b0-50b7 : 0000:00:16.3
    50b0-50b7 : serial
  50b8-50bb : 0000:00:1f.2
    50b8-50bb : ahci
  50bc-50bf : 0000:00:1f.2
    50bc-50bf : ahci
  efa0-efbf : 0000:00:1f.3

$ cat /proc/iomem
00000000-00000fff : reserved
00001000-0009d7ff : System RAM
0009d800-0009ffff : reserved
000a0000-000bffff : PCI Bus 0000:00
000c0000-000c7fff : Video ROM
000c8000-000cbfff : pnp 00:00
000cc000-000cffff : pnp 00:00
000d0000-000d3fff : pnp 00:00
000d4000-000d7fff : pnp 00:00
000d8000-000dbfff : pnp 00:00
000dc000-000dffff : pnp 00:00
000e0000-000fffff : reserved
  000f0000-000fffff : System ROM
00100000-1fffffff : System RAM
  01000000-01717ab1 : Kernel code
  01717ab2-01d1f27f : Kernel data
  01e75000-01fdbfff : Kernel bss
20000000-201fffff : reserved
20200000-3fffffff : System RAM
40000000-401fffff : reserved
40200000-da99efff : System RAM
da99f000-dae9efff : reserved
dae9f000-daf9efff : ACPI Non-volatile Storage
daf9f000-daffefff : ACPI Tables
dafff000-daffffff : System RAM
db000000-df9fffff : reserved
  dba00000-df9fffff : Graphics Stolen Memory
dfa00000-febfffff : PCI Bus 0000:00
  dfa00000-dfbfffff : PCI Bus 0000:02
  dfc00000-dfdfffff : PCI Bus 0000:02
  e0000000-efffffff : 0000:00:02.0
  f0000000-f03fffff : 0000:00:02.0
  f0400000-f0bfffff : PCI Bus 0000:05
  f0c00000-f13fffff : PCI Bus 0000:0d
  f1400000-f1bfffff : PCI Bus 0000:0d
    f1400000-f14000ff : 0000:0d:00.0
      f1400000-f14000ff : mmc0
  f1c00000-f23fffff : PCI Bus 0000:05
  f2400000-f24fffff : PCI Bus 0000:03
    f2400000-f2401fff : 0000:03:00.0
      f2400000-f2401fff : iwlwifi
  f2500000-f251ffff : 0000:00:19.0
    f2500000-f251ffff : e1000e
  f2520000-f2523fff : 0000:00:1b.0
    f2520000-f2523fff : ICH HD audio
  f2524000-f25240ff : 0000:00:1f.3
  f2525000-f252500f : 0000:00:16.0
    f2525000-f252500f : mei_me
  f2528000-f25287ff : 0000:00:1f.2
    f2528000-f25287ff : ahci
  f2529000-f25293ff : 0000:00:1d.0
    f2529000-f25293ff : ehci_hcd
  f252a000-f252a3ff : 0000:00:1a.0
    f252a000-f252a3ff : ehci_hcd
  f252b000-f252bfff : 0000:00:19.0
    f252b000-f252bfff : e1000e
  f252c000-f252cfff : 0000:00:16.3
  f8000000-fbffffff : PCI MMCONFIG 0000 [bus 00-3f]
    f8000000-fbffffff : reserved
      f8000000-fbffffff : pnp 00:01
fec00000-fec00fff : reserved
  fec00000-fec003ff : IOAPIC 0
fed00000-fed003ff : HPET 0
fed08000-fed08fff : reserved
fed10000-fed19fff : reserved
  fed10000-fed13fff : pnp 00:01
  fed18000-fed18fff : pnp 00:01
  fed19000-fed19fff : pnp 00:01
fed1c000-fed1ffff : reserved
  fed1c000-fed1ffff : pnp 00:01
    fed1f410-fed1f414 : iTCO_wdt
fed40000-fed4bfff : PCI Bus 0000:00
  fed45000-fed4bfff : pnp 00:01
fed90000-fed90fff : dmar0
fed91000-fed91fff : dmar1
fee00000-fee00fff : Local APIC
  fee00000-fee00fff : reserved
ffd20000-ffffffff : reserved
100000000-21e5fffff : System RAM
21e600000-21e7fffff : reserved
21e800000-21fffffff : RAM buffer

[7.5.] PCI information ('lspci -vvv' as root)
$ sudo lspci -vvv
[sudo] password for tobias:
00:00.0 Host bridge: Intel Corporation 2nd Generation Core Processor
Family DRAM Controller (rev 09)
        Subsystem: Lenovo Device 21da
        Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop-
ParErr- Stepping- SERR- FastB2B- DisINTx-
        Status: Cap+ 66MHz- UDF- FastB2B+ ParErr- DEVSEL=fast >TAbort-
<TAbort- <MAbort+ >SERR- <PERR- INTx-
        Latency: 0
        Capabilities: [e0] Vendor Specific Information: Len=0c <?>

00:02.0 VGA compatible controller: Intel Corporation 2nd Generation
Core Processor Family Integrated Graphics Controller (rev 09) (prog-if
00 [VGA controller])
        Subsystem: Lenovo Device 21da
        Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop-
ParErr- Stepping- SERR- FastB2B- DisINTx+
        Status: Cap+ 66MHz- UDF- FastB2B+ ParErr- DEVSEL=fast >TAbort-
<TAbort- <MAbort- >SERR- <PERR- INTx-
        Latency: 0
        Interrupt: pin A routed to IRQ 44
        Region 0: Memory at f0000000 (64-bit, non-prefetchable) [size=4M]
        Region 2: Memory at e0000000 (64-bit, prefetchable) [size=256M]
        Region 4: I/O ports at 5000 [size=64]
        Expansion ROM at <unassigned> [disabled]
        Capabilities: [90] MSI: Enable+ Count=1/1 Maskable- 64bit-
                Address: fee00018  Data: 0000
        Capabilities: [d0] Power Management version 2
                Flags: PMEClk- DSI+ D1- D2- AuxCurrent=0mA
PME(D0-,D1-,D2-,D3hot-,D3cold-)
                Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-
        Capabilities: [a4] PCI Advanced Features
                AFCap: TP+ FLR+
                AFCtrl: FLR-
                AFStatus: TP-
        Kernel driver in use: i915

00:16.0 Communication controller: Intel Corporation 6 Series/C200
Series Chipset Family MEI Controller #1 (rev 04)
        Subsystem: Lenovo Device 21da
        Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop-
ParErr- Stepping- SERR- FastB2B- DisINTx+
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort-
<TAbort- <MAbort- >SERR- <PERR- INTx-
        Latency: 0
        Interrupt: pin A routed to IRQ 45
        Region 0: Memory at f2525000 (64-bit, non-prefetchable) [size=16]
        Capabilities: [50] Power Management version 3
                Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA
PME(D0+,D1-,D2-,D3hot+,D3cold+)
                Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
        Capabilities: [8c] MSI: Enable+ Count=1/1 Maskable- 64bit+
                Address: 00000000fee00358  Data: 0000
        Kernel driver in use: mei_me

00:16.3 Serial controller: Intel Corporation 6 Series/C200 Series
Chipset Family KT Controller (rev 04) (prog-if 02 [16550])
        Subsystem: Lenovo Device 21da
        Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop-
ParErr- Stepping- SERR- FastB2B- DisINTx-
        Status: Cap+ 66MHz+ UDF- FastB2B+ ParErr- DEVSEL=fast >TAbort-
<TAbort- <MAbort- >SERR- <PERR- INTx-
        Latency: 0
        Interrupt: pin B routed to IRQ 19
        Region 0: I/O ports at 50b0 [size=8]
        Region 1: Memory at f252c000 (32-bit, non-prefetchable) [size=4K]
        Capabilities: [c8] Power Management version 3
                Flags: PMEClk- DSI+ D1- D2- AuxCurrent=0mA
PME(D0-,D1-,D2-,D3hot-,D3cold-)
                Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
        Capabilities: [d0] MSI: Enable- Count=1/1 Maskable- 64bit+
                Address: 0000000000000000  Data: 0000
        Kernel driver in use: serial

00:19.0 Ethernet controller: Intel Corporation 82579LM Gigabit Network
Connection (rev 04)
        Subsystem: Lenovo Device 21ce
        Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop-
ParErr- Stepping- SERR- FastB2B- DisINTx+
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort-
<TAbort- <MAbort- >SERR- <PERR- INTx-
        Latency: 0
        Interrupt: pin A routed to IRQ 43
        Region 0: Memory at f2500000 (32-bit, non-prefetchable) [size=128K]
        Region 1: Memory at f252b000 (32-bit, non-prefetchable) [size=4K]
        Region 2: I/O ports at 5080 [size=32]
        Capabilities: [c8] Power Management version 2
                Flags: PMEClk- DSI+ D1- D2- AuxCurrent=0mA
PME(D0+,D1-,D2-,D3hot+,D3cold+)
                Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=1 PME-
        Capabilities: [d0] MSI: Enable+ Count=1/1 Maskable- 64bit+
                Address: 00000000fee00338  Data: 0000
        Capabilities: [e0] PCI Advanced Features
                AFCap: TP+ FLR+
                AFCtrl: FLR-
                AFStatus: TP-
        Kernel driver in use: e1000e

00:1a.0 USB controller: Intel Corporation 6 Series/C200 Series Chipset
Family USB Enhanced Host Controller #2 (rev 04) (prog-if 20 [EHCI])
        Subsystem: Lenovo Device 21da
        Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop-
ParErr- Stepping- SERR- FastB2B- DisINTx-
        Status: Cap+ 66MHz- UDF- FastB2B+ ParErr- DEVSEL=medium
>TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
        Latency: 0
        Interrupt: pin A routed to IRQ 16
        Region 0: Memory at f252a000 (32-bit, non-prefetchable) [size=1K]
        Capabilities: [50] Power Management version 2
                Flags: PMEClk- DSI- D1- D2- AuxCurrent=375mA
PME(D0+,D1-,D2-,D3hot+,D3cold+)
                Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-
        Capabilities: [58] Debug port: BAR=1 offset=00a0
        Capabilities: [98] PCI Advanced Features
                AFCap: TP+ FLR+
                AFCtrl: FLR-
                AFStatus: TP-
        Kernel driver in use: ehci-pci

00:1b.0 Audio device: Intel Corporation 6 Series/C200 Series Chipset
Family High Definition Audio Controller (rev 04)
        Subsystem: Lenovo Device 21da
        Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop-
ParErr- Stepping- SERR- FastB2B- DisINTx+
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort-
<TAbort- <MAbort- >SERR- <PERR- INTx-
        Latency: 0, Cache Line Size: 64 bytes
        Interrupt: pin A routed to IRQ 47
        Region 0: Memory at f2520000 (64-bit, non-prefetchable) [size=16K]
        Capabilities: [50] Power Management version 2
                Flags: PMEClk- DSI- D1- D2- AuxCurrent=55mA
PME(D0+,D1-,D2-,D3hot+,D3cold+)
                Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-
        Capabilities: [60] MSI: Enable+ Count=1/1 Maskable- 64bit+
                Address: 00000000fee003b8  Data: 0000
        Capabilities: [70] Express (v1) Root Complex Integrated Endpoint, MSI 00
                DevCap: MaxPayload 128 bytes, PhantFunc 0
                        ExtTag- RBE-
                DevCtl: Report errors: Correctable- Non-Fatal- Fatal-
Unsupported-
                        RlxdOrd- ExtTag- PhantFunc- AuxPwr- NoSnoop-
                        MaxPayload 128 bytes, MaxReadReq 128 bytes
                DevSta: CorrErr- UncorrErr- FatalErr- UnsuppReq-
AuxPwr+ TransPend-
        Capabilities: [100 v1] Virtual Channel
                Caps:   LPEVC=0 RefClk=100ns PATEntryBits=1
                Arb:    Fixed- WRR32- WRR64- WRR128-
                Ctrl:   ArbSelect=Fixed
                Status: InProgress-
                VC0:    Caps:   PATOffset=00 MaxTimeSlots=1 RejSnoopTrans-
                        Arb:    Fixed- WRR32- WRR64- WRR128- TWRR128- WRR256-
                        Ctrl:   Enable+ ID=0 ArbSelect=Fixed TC/VC=01
                        Status: NegoPending- InProgress-
                VC1:    Caps:   PATOffset=00 MaxTimeSlots=1 RejSnoopTrans-
                        Arb:    Fixed- WRR32- WRR64- WRR128- TWRR128- WRR256-
                        Ctrl:   Enable+ ID=1 ArbSelect=Fixed TC/VC=22
                        Status: NegoPending- InProgress-
        Capabilities: [130 v1] Root Complex Link
                Desc:   PortNumber=0f ComponentID=00 EltType=Config
                Link0:  Desc:   TargetPort=00 TargetComponent=00
AssocRCRB- LinkType=MemMapped LinkValid+
                        Addr:   00000000fed1c000
        Kernel driver in use: snd_hda_intel

00:1c.0 PCI bridge: Intel Corporation 6 Series/C200 Series Chipset
Family PCI Express Root Port 1 (rev b4) (prog-if 00 [Normal decode])
        Control: I/O+ Mem+ BusMaster- SpecCycle- MemWINV- VGASnoop-
ParErr- Stepping- SERR- FastB2B- DisINTx-
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort-
<TAbort- <MAbort- >SERR- <PERR- INTx-
        Bus: primary=00, secondary=02, subordinate=02, sec-latency=0
        I/O behind bridge: 00002000-00002fff
        Memory behind bridge: dfa00000-dfbfffff
        Prefetchable memory behind bridge: 00000000dfc00000-00000000dfdfffff
        Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=fast >TAbort-
<TAbort- <MAbort+ <SERR- <PERR-
        BridgeCtl: Parity- SERR- NoISA- VGA- MAbort- >Reset- FastB2B-
                PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-
        Capabilities: [40] Express (v2) Root Port (Slot+), MSI 00
                DevCap: MaxPayload 128 bytes, PhantFunc 0
                        ExtTag- RBE+
                DevCtl: Report errors: Correctable- Non-Fatal- Fatal-
Unsupported-
                        RlxdOrd- ExtTag- PhantFunc- AuxPwr- NoSnoop-
                        MaxPayload 128 bytes, MaxReadReq 128 bytes
                DevSta: CorrErr- UncorrErr- FatalErr- UnsuppReq-
AuxPwr+ TransPend-
                LnkCap: Port #1, Speed 5GT/s, Width x1, ASPM L0s L1,
Exit Latency L0s <1us, L1 <4us
                        ClockPM- Surprise- LLActRep+ BwNot-
                LnkCtl: ASPM L0s L1 Enabled; RCB 64 bytes Disabled- CommClk-
                        ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
                LnkSta: Speed 2.5GT/s, Width x0, TrErr- Train-
SlotClk+ DLActive- BWMgmt- ABWMgmt-
                SltCap: AttnBtn- PwrCtrl- MRL- AttnInd- PwrInd-
HotPlug+ Surprise+
                        Slot #0, PowerLimit 0.000W; Interlock- NoCompl+
                SltCtl: Enable: AttnBtn- PwrFlt- MRL- PresDet-
CmdCplt- HPIrq- LinkChg-
                        Control: AttnInd Unknown, PwrInd Unknown,
Power- Interlock-
                SltSta: Status: AttnBtn- PowerFlt- MRL- CmdCplt-
PresDet- Interlock-
                        Changed: MRL- PresDet- LinkState-
                RootCtl: ErrCorrectable- ErrNon-Fatal- ErrFatal-
PMEIntEna- CRSVisible-
                RootCap: CRSVisible-
                RootSta: PME ReqID 0000, PMEStatus- PMEPending-
                DevCap2: Completion Timeout: Range BC, TimeoutDis+,
LTR-, OBFF Not Supported ARIFwd-
                DevCtl2: Completion Timeout: 50us to 50ms,
TimeoutDis-, LTR-, OBFF Disabled ARIFwd-
                LnkCtl2: Target Link Speed: 5GT/s, EnterCompliance- SpeedDis-
                         Transmit Margin: Normal Operating Range,
EnterModifiedCompliance- ComplianceSOS-
                         Compliance De-emphasis: -6dB
                LnkSta2: Current De-emphasis Level: -3.5dB,
EqualizationComplete-, EqualizationPhase1-
                         EqualizationPhase2-, EqualizationPhase3-,
LinkEqualizationRequest-
        Capabilities: [80] MSI: Enable- Count=1/1 Maskable- 64bit-
                Address: 00000000  Data: 0000
        Capabilities: [90] Subsystem: Lenovo Device 21da
        Capabilities: [a0] Power Management version 2
                Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA
PME(D0+,D1-,D2-,D3hot+,D3cold+)
                Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-
        Kernel driver in use: pcieport

00:1c.1 PCI bridge: Intel Corporation 6 Series/C200 Series Chipset
Family PCI Express Root Port 2 (rev b4) (prog-if 00 [Normal decode])
        Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop-
ParErr- Stepping- SERR- FastB2B- DisINTx-
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort-
<TAbort- <MAbort- >SERR- <PERR- INTx-
        Latency: 0, Cache Line Size: 64 bytes
        Bus: primary=00, secondary=03, subordinate=03, sec-latency=0
        I/O behind bridge: 0000f000-00000fff
        Memory behind bridge: f2400000-f24fffff
        Prefetchable memory behind bridge: 00000000fff00000-00000000000fffff
        Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=fast >TAbort-
<TAbort- <MAbort+ <SERR- <PERR-
        BridgeCtl: Parity- SERR- NoISA- VGA- MAbort- >Reset- FastB2B-
                PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-
        Capabilities: [40] Express (v2) Root Port (Slot+), MSI 00
                DevCap: MaxPayload 128 bytes, PhantFunc 0
                        ExtTag- RBE+
                DevCtl: Report errors: Correctable- Non-Fatal- Fatal-
Unsupported-
                        RlxdOrd- ExtTag- PhantFunc- AuxPwr- NoSnoop-
                        MaxPayload 128 bytes, MaxReadReq 128 bytes
                DevSta: CorrErr- UncorrErr- FatalErr- UnsuppReq-
AuxPwr+ TransPend-
                LnkCap: Port #2, Speed 5GT/s, Width x1, ASPM L0s L1,
Exit Latency L0s <512ns, L1 <16us
                        ClockPM- Surprise- LLActRep+ BwNot-
                LnkCtl: ASPM L1 Enabled; RCB 64 bytes Disabled- CommClk+
                        ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
                LnkSta: Speed 2.5GT/s, Width x1, TrErr- Train-
SlotClk+ DLActive+ BWMgmt+ ABWMgmt-
                SltCap: AttnBtn- PwrCtrl- MRL- AttnInd- PwrInd-
HotPlug- Surprise-
                        Slot #1, PowerLimit 10.000W; Interlock- NoCompl+
                SltCtl: Enable: AttnBtn- PwrFlt- MRL- PresDet-
CmdCplt- HPIrq- LinkChg-
                        Control: AttnInd Unknown, PwrInd Unknown,
Power- Interlock-
                SltSta: Status: AttnBtn- PowerFlt- MRL- CmdCplt-
PresDet+ Interlock-
                        Changed: MRL- PresDet- LinkState+
                RootCtl: ErrCorrectable- ErrNon-Fatal- ErrFatal-
PMEIntEna- CRSVisible-
                RootCap: CRSVisible-
                RootSta: PME ReqID 0000, PMEStatus- PMEPending-
                DevCap2: Completion Timeout: Range BC, TimeoutDis+,
LTR-, OBFF Not Supported ARIFwd-
                DevCtl2: Completion Timeout: 50us to 50ms,
TimeoutDis-, LTR-, OBFF Disabled ARIFwd-
                LnkCtl2: Target Link Speed: 5GT/s, EnterCompliance- SpeedDis-
                         Transmit Margin: Normal Operating Range,
EnterModifiedCompliance- ComplianceSOS-
                         Compliance De-emphasis: -6dB
                LnkSta2: Current De-emphasis Level: -3.5dB,
EqualizationComplete-, EqualizationPhase1-
                         EqualizationPhase2-, EqualizationPhase3-,
LinkEqualizationRequest-
        Capabilities: [80] MSI: Enable- Count=1/1 Maskable- 64bit-
                Address: 00000000  Data: 0000
        Capabilities: [90] Subsystem: Lenovo Device 21da
        Capabilities: [a0] Power Management version 2
                Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA
PME(D0+,D1-,D2-,D3hot+,D3cold+)
                Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-
        Kernel driver in use: pcieport

00:1c.3 PCI bridge: Intel Corporation 6 Series/C200 Series Chipset
Family PCI Express Root Port 4 (rev b4) (prog-if 00 [Normal decode])
        Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop-
ParErr- Stepping- SERR- FastB2B- DisINTx-
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort-
<TAbort- <MAbort- >SERR- <PERR- INTx-
        Latency: 0, Cache Line Size: 64 bytes
        Bus: primary=00, secondary=05, subordinate=0c, sec-latency=0
        I/O behind bridge: 00004000-00004fff
        Memory behind bridge: f1c00000-f23fffff
        Prefetchable memory behind bridge: 00000000f0400000-00000000f0bfffff
        Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=fast >TAbort-
<TAbort- <MAbort+ <SERR- <PERR-
        BridgeCtl: Parity- SERR- NoISA- VGA- MAbort- >Reset- FastB2B-
                PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-
        Capabilities: [40] Express (v2) Root Port (Slot+), MSI 00
                DevCap: MaxPayload 128 bytes, PhantFunc 0
                        ExtTag- RBE+
                DevCtl: Report errors: Correctable- Non-Fatal- Fatal-
Unsupported-
                        RlxdOrd- ExtTag- PhantFunc- AuxPwr- NoSnoop-
                        MaxPayload 128 bytes, MaxReadReq 128 bytes
                DevSta: CorrErr- UncorrErr- FatalErr- UnsuppReq-
AuxPwr+ TransPend-
                LnkCap: Port #4, Speed 5GT/s, Width x1, ASPM L0s L1,
Exit Latency L0s <1us, L1 <16us
                        ClockPM- Surprise- LLActRep+ BwNot-
                LnkCtl: ASPM L0s L1 Enabled; RCB 64 bytes Disabled- CommClk-
                        ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
                LnkSta: Speed 2.5GT/s, Width x0, TrErr- Train-
SlotClk+ DLActive- BWMgmt- ABWMgmt-
                SltCap: AttnBtn- PwrCtrl- MRL- AttnInd- PwrInd-
HotPlug+ Surprise+
                        Slot #3, PowerLimit 10.000W; Interlock- NoCompl+
                SltCtl: Enable: AttnBtn- PwrFlt- MRL- PresDet+
CmdCplt- HPIrq- LinkChg-
                        Control: AttnInd Unknown, PwrInd Unknown,
Power- Interlock-
                SltSta: Status: AttnBtn- PowerFlt- MRL- CmdCplt-
PresDet- Interlock-
                        Changed: MRL- PresDet- LinkState-
                RootCtl: ErrCorrectable- ErrNon-Fatal- ErrFatal-
PMEIntEna- CRSVisible-
                RootCap: CRSVisible-
                RootSta: PME ReqID 0000, PMEStatus- PMEPending-
                DevCap2: Completion Timeout: Range BC, TimeoutDis+,
LTR-, OBFF Not Supported ARIFwd-
                DevCtl2: Completion Timeout: 50us to 50ms,
TimeoutDis-, LTR-, OBFF Disabled ARIFwd-
                LnkCtl2: Target Link Speed: 5GT/s, EnterCompliance- SpeedDis-
                         Transmit Margin: Normal Operating Range,
EnterModifiedCompliance- ComplianceSOS-
                         Compliance De-emphasis: -6dB
                LnkSta2: Current De-emphasis Level: -3.5dB,
EqualizationComplete-, EqualizationPhase1-
                         EqualizationPhase2-, EqualizationPhase3-,
LinkEqualizationRequest-
        Capabilities: [80] MSI: Enable- Count=1/1 Maskable- 64bit-
                Address: 00000000  Data: 0000
        Capabilities: [90] Subsystem: Lenovo Device 21da
        Capabilities: [a0] Power Management version 2
                Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA
PME(D0+,D1-,D2-,D3hot+,D3cold+)
                Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-
        Kernel driver in use: pcieport

00:1c.4 PCI bridge: Intel Corporation 6 Series/C200 Series Chipset
Family PCI Express Root Port 5 (rev b4) (prog-if 00 [Normal decode])
        Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop-
ParErr- Stepping- SERR- FastB2B- DisINTx-
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort-
<TAbort- <MAbort- >SERR- <PERR- INTx-
        Latency: 0, Cache Line Size: 64 bytes
        Bus: primary=00, secondary=0d, subordinate=0d, sec-latency=0
        I/O behind bridge: 00003000-00003fff
        Memory behind bridge: f1400000-f1bfffff
        Prefetchable memory behind bridge: 00000000f0c00000-00000000f13fffff
        Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=fast >TAbort-
<TAbort- <MAbort+ <SERR- <PERR-
        BridgeCtl: Parity- SERR- NoISA- VGA- MAbort- >Reset- FastB2B-
                PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-
        Capabilities: [40] Express (v2) Root Port (Slot+), MSI 00
                DevCap: MaxPayload 128 bytes, PhantFunc 0
                        ExtTag- RBE+
                DevCtl: Report errors: Correctable- Non-Fatal- Fatal-
Unsupported-
                        RlxdOrd- ExtTag- PhantFunc- AuxPwr- NoSnoop-
                        MaxPayload 128 bytes, MaxReadReq 128 bytes
                DevSta: CorrErr- UncorrErr- FatalErr- UnsuppReq-
AuxPwr+ TransPend-
                LnkCap: Port #5, Speed 5GT/s, Width x1, ASPM L0s L1,
Exit Latency L0s <512ns, L1 <16us
                        ClockPM- Surprise- LLActRep+ BwNot-
                LnkCtl: ASPM L1 Enabled; RCB 64 bytes Disabled- CommClk+
                        ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
                LnkSta: Speed 2.5GT/s, Width x1, TrErr- Train-
SlotClk+ DLActive+ BWMgmt+ ABWMgmt-
                SltCap: AttnBtn- PwrCtrl- MRL- AttnInd- PwrInd-
HotPlug+ Surprise+
                        Slot #4, PowerLimit 10.000W; Interlock- NoCompl+
                SltCtl: Enable: AttnBtn- PwrFlt- MRL- PresDet+
CmdCplt- HPIrq- LinkChg-
                        Control: AttnInd Unknown, PwrInd Unknown,
Power- Interlock-
                SltSta: Status: AttnBtn- PowerFlt- MRL- CmdCplt-
PresDet+ Interlock-
                        Changed: MRL- PresDet- LinkState-
                RootCtl: ErrCorrectable- ErrNon-Fatal- ErrFatal-
PMEIntEna- CRSVisible-
                RootCap: CRSVisible-
                RootSta: PME ReqID 0000, PMEStatus- PMEPending-
                DevCap2: Completion Timeout: Range BC, TimeoutDis+,
LTR-, OBFF Not Supported ARIFwd-
                DevCtl2: Completion Timeout: 50us to 50ms,
TimeoutDis-, LTR-, OBFF Disabled ARIFwd-
                LnkCtl2: Target Link Speed: 5GT/s, EnterCompliance- SpeedDis-
                         Transmit Margin: Normal Operating Range,
EnterModifiedCompliance- ComplianceSOS-
                         Compliance De-emphasis: -6dB
                LnkSta2: Current De-emphasis Level: -3.5dB,
EqualizationComplete-, EqualizationPhase1-
                         EqualizationPhase2-, EqualizationPhase3-,
LinkEqualizationRequest-
        Capabilities: [80] MSI: Enable- Count=1/1 Maskable- 64bit-
                Address: 00000000  Data: 0000
        Capabilities: [90] Subsystem: Lenovo Device 21da
        Capabilities: [a0] Power Management version 2
                Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA
PME(D0+,D1-,D2-,D3hot+,D3cold+)
                Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-
        Kernel driver in use: pcieport

00:1d.0 USB controller: Intel Corporation 6 Series/C200 Series Chipset
Family USB Enhanced Host Controller #1 (rev 04) (prog-if 20 [EHCI])
        Subsystem: Lenovo Device 21da
        Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop-
ParErr- Stepping- SERR- FastB2B- DisINTx-
        Status: Cap+ 66MHz- UDF- FastB2B+ ParErr- DEVSEL=medium
>TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
        Latency: 0
        Interrupt: pin A routed to IRQ 23
        Region 0: Memory at f2529000 (32-bit, non-prefetchable) [size=1K]
        Capabilities: [50] Power Management version 2
                Flags: PMEClk- DSI- D1- D2- AuxCurrent=375mA
PME(D0+,D1-,D2-,D3hot+,D3cold+)
                Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-
        Capabilities: [58] Debug port: BAR=1 offset=00a0
        Capabilities: [98] PCI Advanced Features
                AFCap: TP+ FLR+
                AFCtrl: FLR-
                AFStatus: TP-
        Kernel driver in use: ehci-pci

00:1f.0 ISA bridge: Intel Corporation QM67 Express Chipset Family LPC
Controller (rev 04)
        Subsystem: Lenovo Device 21da
        Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop-
ParErr- Stepping- SERR- FastB2B- DisINTx-
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=medium
>TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
        Latency: 0
        Capabilities: [e0] Vendor Specific Information: Len=0c <?>
        Kernel driver in use: lpc_ich

00:1f.2 SATA controller: Intel Corporation 6 Series/C200 Series
Chipset Family 6 port SATA AHCI Controller (rev 04) (prog-if 01 [AHCI
1.0])
        Subsystem: Lenovo Device 21da
        Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop-
ParErr- Stepping- SERR- FastB2B- DisINTx+
        Status: Cap+ 66MHz+ UDF- FastB2B+ ParErr- DEVSEL=medium
>TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
        Latency: 0
        Interrupt: pin B routed to IRQ 42
        Region 0: I/O ports at 50a8 [size=8]
        Region 1: I/O ports at 50bc [size=4]
        Region 2: I/O ports at 50a0 [size=8]
        Region 3: I/O ports at 50b8 [size=4]
        Region 4: I/O ports at 5060 [size=32]
        Region 5: Memory at f2528000 (32-bit, non-prefetchable) [size=2K]
        Capabilities: [80] MSI: Enable+ Count=1/1 Maskable- 64bit-
                Address: fee002f8  Data: 0000
        Capabilities: [70] Power Management version 3
                Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA
PME(D0-,D1-,D2-,D3hot+,D3cold-)
                Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
        Capabilities: [a8] SATA HBA v1.0 BAR4 Offset=00000004
        Capabilities: [b0] PCI Advanced Features
                AFCap: TP+ FLR+
                AFCtrl: FLR-
                AFStatus: TP-
        Kernel driver in use: ahci

00:1f.3 SMBus: Intel Corporation 6 Series/C200 Series Chipset Family
SMBus Controller (rev 04)
        Subsystem: Lenovo Device 21da
        Control: I/O+ Mem+ BusMaster- SpecCycle- MemWINV- VGASnoop-
ParErr- Stepping- SERR- FastB2B- DisINTx-
        Status: Cap- 66MHz- UDF- FastB2B+ ParErr- DEVSEL=medium
>TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
        Interrupt: pin C routed to IRQ 11
        Region 0: Memory at f2524000 (64-bit, non-prefetchable) [size=256]
        Region 4: I/O ports at efa0 [size=32]

03:00.0 Network controller: Intel Corporation Centrino Advanced-N 6205
[Taylor Peak] (rev 34)
        Subsystem: Intel Corporation Centrino Advanced-N 6205 AGN
        Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop-
ParErr- Stepping- SERR- FastB2B- DisINTx+
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort-
<TAbort- <MAbort- >SERR- <PERR- INTx-
        Latency: 0, Cache Line Size: 64 bytes
        Interrupt: pin A routed to IRQ 46
        Region 0: Memory at f2400000 (64-bit, non-prefetchable) [size=8K]
        Capabilities: [c8] Power Management version 3
                Flags: PMEClk- DSI+ D1- D2- AuxCurrent=0mA
PME(D0+,D1-,D2-,D3hot+,D3cold+)
                Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-
        Capabilities: [d0] MSI: Enable+ Count=1/1 Maskable- 64bit+
                Address: 00000000fee00378  Data: 0000
        Capabilities: [e0] Express (v1) Endpoint, MSI 00
                DevCap: MaxPayload 128 bytes, PhantFunc 0, Latency L0s
<512ns, L1 unlimited
                        ExtTag- AttnBtn- AttnInd- PwrInd- RBE+ FLReset+
                DevCtl: Report errors: Correctable- Non-Fatal- Fatal-
Unsupported-
                        RlxdOrd+ ExtTag- PhantFunc- AuxPwr- NoSnoop+ FLReset-
                        MaxPayload 128 bytes, MaxReadReq 128 bytes
                DevSta: CorrErr+ UncorrErr- FatalErr- UnsuppReq+
AuxPwr+ TransPend-
                LnkCap: Port #0, Speed 2.5GT/s, Width x1, ASPM L0s L1,
Exit Latency L0s <4us, L1 <32us
                        ClockPM+ Surprise- LLActRep- BwNot-
                LnkCtl: ASPM L1 Enabled; RCB 64 bytes Disabled- CommClk+
                        ExtSynch- ClockPM+ AutWidDis- BWInt- AutBWInt-
                LnkSta: Speed 2.5GT/s, Width x1, TrErr- Train-
SlotClk+ DLActive- BWMgmt- ABWMgmt-
        Capabilities: [100 v1] Advanced Error Reporting
                UESta:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt-
UnxCmplt- RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-
                UEMsk:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt-
UnxCmplt- RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-
                UESvrt: DLP+ SDES- TLP- FCP+ CmpltTO- CmpltAbrt-
UnxCmplt- RxOF+ MalfTLP+ ECRC- UnsupReq- ACSViol-
                CESta:  RxErr- BadTLP- BadDLLP- Rollover- Timeout- NonFatalErr+
                CEMsk:  RxErr- BadTLP- BadDLLP- Rollover- Timeout- NonFatalErr+
                AERCap: First Error Pointer: 00, GenCap- CGenEn- ChkCap- ChkEn-
        Capabilities: [140 v1] Device Serial Number 08-11-96-ff-ff-df-e9-f8
        Kernel driver in use: iwlwifi

0d:00.0 System peripheral: Ricoh Co Ltd MMC/SD Host Controller (rev
07) (prog-if 01)
        Subsystem: Lenovo Device 21da
        Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop-
ParErr- Stepping- SERR- FastB2B- DisINTx-
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort-
<TAbort- <MAbort- >SERR- <PERR- INTx-
        Latency: 0, Cache Line Size: 64 bytes
        Interrupt: pin A routed to IRQ 16
        Region 0: Memory at f1400000 (32-bit, non-prefetchable) [size=256]
        Capabilities: [50] MSI: Enable- Count=1/1 Maskable- 64bit+
                Address: 0000000000000000  Data: 0000
        Capabilities: [78] Power Management version 3
                Flags: PMEClk- DSI- D1+ D2+ AuxCurrent=0mA
PME(D0+,D1+,D2+,D3hot+,D3cold+)
                Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=2 PME-
        Capabilities: [80] Express (v1) Endpoint, MSI 00
                DevCap: MaxPayload 128 bytes, PhantFunc 0, Latency L0s
unlimited, L1 unlimited
                        ExtTag- AttnBtn+ AttnInd+ PwrInd+ RBE+ FLReset-
                DevCtl: Report errors: Correctable- Non-Fatal- Fatal-
Unsupported-
                        RlxdOrd+ ExtTag- PhantFunc- AuxPwr- NoSnoop+
                        MaxPayload 128 bytes, MaxReadReq 512 bytes
                DevSta: CorrErr+ UncorrErr- FatalErr- UnsuppReq+
AuxPwr- TransPend-
                LnkCap: Port #1, Speed 2.5GT/s, Width x1, ASPM L0s L1,
Exit Latency L0s <4us, L1 unlimited
                        ClockPM+ Surprise- LLActRep- BwNot-
                LnkCtl: ASPM L1 Enabled; RCB 64 bytes Disabled- CommClk+
                        ExtSynch- ClockPM+ AutWidDis- BWInt- AutBWInt-
                LnkSta: Speed 2.5GT/s, Width x1, TrErr- Train-
SlotClk+ DLActive- BWMgmt- ABWMgmt-
        Capabilities: [100 v1] Virtual Channel
                Caps:   LPEVC=0 RefClk=100ns PATEntryBits=1
                Arb:    Fixed- WRR32- WRR64- WRR128-
                Ctrl:   ArbSelect=Fixed
                Status: InProgress-
                VC0:    Caps:   PATOffset=00 MaxTimeSlots=1 RejSnoopTrans-
                        Arb:    Fixed- WRR32- WRR64- WRR128- TWRR128- WRR256-
                        Ctrl:   Enable+ ID=0 ArbSelect=Fixed TC/VC=ff
                        Status: NegoPending- InProgress-
        Capabilities: [800 v1] Advanced Error Reporting
                UESta:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt-
UnxCmplt- RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-
                UEMsk:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt-
UnxCmplt- RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-
                UESvrt: DLP+ SDES+ TLP- FCP+ CmpltTO- CmpltAbrt-
UnxCmplt- RxOF+ MalfTLP+ ECRC- UnsupReq- ACSViol-
                CESta:  RxErr- BadTLP- BadDLLP- Rollover- Timeout- NonFatalErr+
                CEMsk:  RxErr- BadTLP- BadDLLP- Rollover- Timeout- NonFatalErr+
                AERCap: First Error Pointer: 00, GenCap+ CGenEn- ChkCap+ ChkEn-
        Kernel driver in use: sdhci-pci

[7.6.] SCSI information (from /proc/scsi/scsi)
$ cat /proc/scsi/scsi
Attached devices:
Host: scsi0 Channel: 00 Id: 00 Lun: 00
  Vendor: ATA      Model: SAMSUNG SSD 830  Rev: CXM0
  Type:   Direct-Access                    ANSI  SCSI revision: 05

[7.7.] Other information that might be relevant to the problem
       (please look in /proc and include all information that you
       think to be relevant):

[8.] Other notes, patches, fixes, workarounds:
The workaround/fix is to allow propagation of the
TP_HKEY_EV_RFKILL_CHANGED event by removing send_acpi_ev = 0 in the
corresponding case-statement.

Thanks for considering this problem report.

Best regards,
Tobias Stegmann

--bcaec5299be33eafab04fb5c2d84
Content-Type: text/x-patch; charset=US-ASCII;
	name="0001-propagate-hw-wireless-switch-acpi-event.patch"
Content-Disposition: attachment;
	filename="0001-propagate-hw-wireless-switch-acpi-event.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_hw717wuv0

RnJvbSA5ODE2MzU1YmFlYWNiZWM1OTBiMmVmMmQ4MjA2MWE0YTMxMWZjZTI3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBUb2JpYXMgU3RlZ21hbm4gPHN0ZWdtYW5udEBnbWFpbC5jb20+
CkRhdGU6IFN1biwgOCBKdW4gMjAxNCAxNzowNToxOSArMDIwMApTdWJqZWN0OiBbUEFUQ0hdIHBy
b3BhZ2F0ZSBodyB3aXJlbGVzcyBzd2l0Y2ggYWNwaSBldmVudAoKU2lnbmVkLW9mZi1ieTogVG9i
aWFzIFN0ZWdtYW5uIDxzdGVnbWFubnRAZ21haWwuY29tPgotLS0KIGRyaXZlcnMvcGxhdGZvcm0v
eDg2L3RoaW5rcGFkX2FjcGkuYyB8IDEgLQogMSBmaWxlIGNoYW5nZWQsIDEgZGVsZXRpb24oLSkK
CmRpZmYgLS1naXQgYS9kcml2ZXJzL3BsYXRmb3JtL3g4Ni90aGlua3BhZF9hY3BpLmMgYi9kcml2
ZXJzL3BsYXRmb3JtL3g4Ni90aGlua3BhZF9hY3BpLmMKaW5kZXggMTVlNjFjMS4uMmZkNzEzMyAx
MDA2NDQKLS0tIGEvZHJpdmVycy9wbGF0Zm9ybS94ODYvdGhpbmtwYWRfYWNwaS5jCisrKyBiL2Ry
aXZlcnMvcGxhdGZvcm0veDg2L3RoaW5rcGFkX2FjcGkuYwpAQCAtMzgwOCw3ICszODA4LDYgQEAg
c3RhdGljIHZvaWQgaG90a2V5X25vdGlmeShzdHJ1Y3QgaWJtX3N0cnVjdCAqaWJtLCB1MzIgZXZl
bnQpCiAJCQlpZiAodHBfZmVhdHVyZXMuaG90a2V5X3dsc3cgJiYKIAkJCQkJaGtleSA9PSBUUF9I
S0VZX0VWX1JGS0lMTF9DSEFOR0VEKSB7CiAJCQkJdHBhY3BpX3NlbmRfcmFkaW9zd191cGRhdGUo
KTsKLQkJCQlzZW5kX2FjcGlfZXYgPSAwOwogCQkJCWtub3duX2V2ID0gdHJ1ZTsKIAkJCQlicmVh
azsKIAkJCX0KLS0gCjEuOS4xCgo=
--bcaec5299be33eafab04fb5c2d84--
