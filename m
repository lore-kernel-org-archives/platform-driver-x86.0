From: Dalton Fury <daltonfury42@gmail.com>
Subject: sony_laptop bug - Can't change usb_charge attribute
Date: Wed, 10 Jun 2015 03:30:32 +0530
Message-ID: <CALH0XhkxrWw7dps6=+KSfiJ6NQtf=1Hu_NqtGydK3amjvUHG5g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-vn0-f42.google.com ([209.85.216.42]:41167 "EHLO
	mail-vn0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753153AbbFIWAg (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 9 Jun 2015 18:00:36 -0400
Received: by vnbg190 with SMTP id g190so4955922vnb.8
        for <platform-driver-x86@vger.kernel.org>; Tue, 09 Jun 2015 15:00:35 -0700 (PDT)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org

[1.] [Sony VAIO SVF14212SNB] Can't change usb_charge attribute in
/sys/devices/platform/sony-laptop

[2.] I am on a Sony VAIO svf43142sn. My laptop has the ability to
leave a USB port powered on even after shutdown to charge other
devices. The value of /sys/devices/platform/sony-laptop/usb_charge is
1, but the USB port is not powered on. Also when I tried toggling it
to 0 it resets back to 1 when I check again using cat.

In short I can't toggle usb_charge feature on or off from Linux, and
it's value is 1 regardless of weather it is actually on or off. I've
checked this by successfully toggling the value from Windows, which
works(through VAIO Tools Utility). I have tested and found that the
issue persists in both my linux OSes(Arch and Ubuntu 14.04 LTS).

[4.] Linux version 4.1.0-040100rc7-generic (kernel@gomeisa) (gcc
version 4.6.3 (Ubuntu/Linaro 4.6.3-1ubuntu5) ) #201506080035 SMP Mon
Jun 8 04:36:20 UTC 2015

[5.] Not Applicable

[6.] Not Applicable

[7.]
Description: Ubuntu 14.04.2 LTS
Release: 14.04

[7.1]
If some fields are empty or look unusual you may have an old version.
Compare to the current minimal requirements in Documentation/Changes.

Linux dalton-SVF14212SNW 4.1.0-040100rc7-generic #201506080035 SMP Mon
Jun 8 04:36:20 UTC 2015 x86_64 x86_64 x86_64 GNU/Linux

Gnu C                  4.8
Gnu make               3.81
binutils               2.24
util-linux             2.20.1
mount                  support
module-init-tools      15
e2fsprogs              1.42.9
pcmciautils            018
PPP                    2.4.5
Linux C Library        Dynamic linker (ldd)   2.19
Procps                 3.3.9
Net-tools              1.60
Kbd                    1.15.5
Sh-utils               8.21
wireless-tools         30
Modules Loaded         sony_laptop rfcomm bnep bluetooth binfmt_misc
snd_hda_codec_hdmi snd_hda_codec_realtek snd_hda_codec_generic
snd_hda_intel snd_hda_controller microread_mei snd_hda_codec microread
mei_phy crc_ccitt snd_hda_core hci snd_hwdep nfc snd_pcm intel_rapl
iosf_mbi snd_seq_midi x86_pkg_temp_thermal snd_seq_midi_event
intel_powerclamp snd_rawmidi coretemp snd_seq kvm crct10dif_pclmul
snd_seq_device crc32_pclmul snd_timer uvcvideo ghash_clmulni_intel
cryptd videobuf2_vmalloc videobuf2_memops videobuf2_core v4l2_common
snd videodev media joydev serio_raw rtsx_pci_ms memstick soundcore
i915 shpchp lpc_ich mei_me video parport_pc mei drm_kms_helper ppdev
drm mac_hid i2c_algo_bit lp parport rtsx_pci_sdmmc psmouse ahci r8169
libahci rtsx_pci mii

[7.2]
processor : 0
vendor_id : GenuineIntel
cpu family : 6
model : 58
model name : Intel(R) Core(TM) i3-3217U CPU @ 1.80GHz
stepping : 9
microcode : 0x15
cpu MHz : 1228.500
cache size : 3072 KB
physical id : 0
siblings : 4
core id : 0
cpu cores : 2
apicid : 0
initial apicid : 0
fpu : yes
fpu_exception : yes
cpuid level : 13
wp : yes
flags : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov
pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall nx
rdtscp lm constant_tsc arch_perfmon pebs bts rep_good nopl xtopology
nonstop_tsc aperfmperf eagerfpu pni pclmulqdq dtes64 monitor ds_cpl
vmx est tm2 ssse3 cx16 xtpr pdcm pcid sse4_1 sse4_2 x2apic popcnt
tsc_deadline_timer xsave avx f16c lahf_lm ida arat epb pln pts dtherm
tpr_shadow vnmi flexpriority ept vpid fsgsbase smep erms xsaveopt
bugs :
bogomips : 3591.90
clflush size : 64
cache_alignment : 64
address sizes : 36 bits physical, 48 bits virtual
power management:

processor : 1
vendor_id : GenuineIntel
cpu family : 6
model : 58
model name : Intel(R) Core(TM) i3-3217U CPU @ 1.80GHz
stepping : 9
microcode : 0x15
cpu MHz : 955.687
cache size : 3072 KB
physical id : 0
siblings : 4
core id : 0
cpu cores : 2
apicid : 1
initial apicid : 1
fpu : yes
fpu_exception : yes
cpuid level : 13
wp : yes
flags : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov
pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall nx
rdtscp lm constant_tsc arch_perfmon pebs bts rep_good nopl xtopology
nonstop_tsc aperfmperf eagerfpu pni pclmulqdq dtes64 monitor ds_cpl
vmx est tm2 ssse3 cx16 xtpr pdcm pcid sse4_1 sse4_2 x2apic popcnt
tsc_deadline_timer xsave avx f16c lahf_lm ida arat epb pln pts dtherm
tpr_shadow vnmi flexpriority ept vpid fsgsbase smep erms xsaveopt
bugs :
bogomips : 3591.90
clflush size : 64
cache_alignment : 64
address sizes : 36 bits physical, 48 bits virtual
power management:

processor : 2
vendor_id : GenuineIntel
cpu family : 6
model : 58
model name : Intel(R) Core(TM) i3-3217U CPU @ 1.80GHz
stepping : 9
microcode : 0x15
cpu MHz : 1247.695
cache size : 3072 KB
physical id : 0
siblings : 4
core id : 1
cpu cores : 2
apicid : 2
initial apicid : 2
fpu : yes
fpu_exception : yes
cpuid level : 13
wp : yes
flags : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov
pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall nx
rdtscp lm constant_tsc arch_perfmon pebs bts rep_good nopl xtopology
nonstop_tsc aperfmperf eagerfpu pni pclmulqdq dtes64 monitor ds_cpl
vmx est tm2 ssse3 cx16 xtpr pdcm pcid sse4_1 sse4_2 x2apic popcnt
tsc_deadline_timer xsave avx f16c lahf_lm ida arat epb pln pts dtherm
tpr_shadow vnmi flexpriority ept vpid fsgsbase smep erms xsaveopt
bugs :
bogomips : 3591.90
clflush size : 64
cache_alignment : 64
address sizes : 36 bits physical, 48 bits virtual
power management:

processor : 3
vendor_id : GenuineIntel
cpu family : 6
model : 58
model name : Intel(R) Core(TM) i3-3217U CPU @ 1.80GHz
stepping : 9
microcode : 0x15
cpu MHz : 918.281
cache size : 3072 KB
physical id : 0
siblings : 4
core id : 1
cpu cores : 2
apicid : 3
initial apicid : 3
fpu : yes
fpu_exception : yes
cpuid level : 13
wp : yes
flags : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov
pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall nx
rdtscp lm constant_tsc arch_perfmon pebs bts rep_good nopl xtopology
nonstop_tsc aperfmperf eagerfpu pni pclmulqdq dtes64 monitor ds_cpl
vmx est tm2 ssse3 cx16 xtpr pdcm pcid sse4_1 sse4_2 x2apic popcnt
tsc_deadline_timer xsave avx f16c lahf_lm ida arat epb pln pts dtherm
tpr_shadow vnmi flexpriority ept vpid fsgsbase smep erms xsaveopt
bugs :
bogomips : 3591.90
clflush size : 64
cache_alignment : 64
address sizes : 36 bits physical, 48 bits virtual
power management:

[7.3]
sony_laptop 61440 0 - Live 0x0000000000000000
rfcomm 77824 0 - Live 0x0000000000000000
bnep 24576 2 - Live 0x0000000000000000
bluetooth 540672 10 rfcomm,bnep, Live 0x0000000000000000
binfmt_misc 20480 1 - Live 0x0000000000000000
snd_hda_codec_hdmi 53248 1 - Live 0x0000000000000000
snd_hda_codec_realtek 86016 1 - Live 0x0000000000000000
snd_hda_codec_generic 77824 1 snd_hda_codec_realtek, Live 0x0000000000000000
snd_hda_intel 32768 3 - Live 0x0000000000000000
snd_hda_controller 36864 1 snd_hda_intel, Live 0x0000000000000000
microread_mei 16384 0 - Live 0x0000000000000000
snd_hda_codec 122880 5
snd_hda_codec_hdmi,snd_hda_codec_realtek,snd_hda_codec_generic,snd_hda_intel,snd_hda_controller,
Live 0x0000000000000000
microread 16384 1 microread_mei, Live 0x0000000000000000
mei_phy 16384 1 microread_mei, Live 0x0000000000000000
crc_ccitt 16384 1 microread, Live 0x0000000000000000
snd_hda_core 36864 5
snd_hda_codec_hdmi,snd_hda_codec_realtek,snd_hda_codec_generic,snd_hda_controller,snd_hda_codec,
Live 0x0000000000000000
hci 45056 2 microread,mei_phy, Live 0x0000000000000000
snd_hwdep 16384 1 snd_hda_codec, Live 0x0000000000000000
nfc 102400 2 microread,hci, Live 0x0000000000000000
snd_pcm 110592 4
snd_hda_codec_hdmi,snd_hda_intel,snd_hda_controller,snd_hda_codec,
Live 0x0000000000000000
intel_rapl 20480 0 - Live 0x0000000000000000
iosf_mbi 16384 1 intel_rapl, Live 0x0000000000000000
snd_seq_midi 16384 0 - Live 0x0000000000000000
x86_pkg_temp_thermal 16384 0 - Live 0x0000000000000000
snd_seq_midi_event 16384 1 snd_seq_midi, Live 0x0000000000000000
intel_powerclamp 16384 0 - Live 0x0000000000000000
snd_rawmidi 32768 1 snd_seq_midi, Live 0x0000000000000000
coretemp 16384 0 - Live 0x0000000000000000
snd_seq 69632 2 snd_seq_midi,snd_seq_midi_event, Live 0x0000000000000000
kvm 507904 0 - Live 0x0000000000000000
crct10dif_pclmul 16384 0 - Live 0x0000000000000000
snd_seq_device 16384 3 snd_seq_midi,snd_rawmidi,snd_seq, Live 0x0000000000000000
crc32_pclmul 16384 0 - Live 0x0000000000000000
snd_timer 32768 2 snd_pcm,snd_seq, Live 0x0000000000000000
uvcvideo 94208 0 - Live 0x0000000000000000
ghash_clmulni_intel 16384 0 - Live 0x0000000000000000
cryptd 24576 1 ghash_clmulni_intel, Live 0x0000000000000000
videobuf2_vmalloc 16384 1 uvcvideo, Live 0x0000000000000000
videobuf2_memops 16384 1 videobuf2_vmalloc, Live 0x0000000000000000
videobuf2_core 53248 1 uvcvideo, Live 0x0000000000000000
v4l2_common 16384 1 videobuf2_core, Live 0x0000000000000000
snd 86016 17 snd_hda_codec_hdmi,snd_hda_codec_realtek,snd_hda_codec_generic,snd_hda_intel,snd_hda_codec,snd_hwdep,snd_pcm,snd_rawmidi,snd_seq,snd_seq_device,snd_timer,
Live 0x0000000000000000
videodev 172032 3 uvcvideo,videobuf2_core,v4l2_common, Live 0x0000000000000000
media 24576 2 uvcvideo,videodev, Live 0x0000000000000000
joydev 20480 0 - Live 0x0000000000000000
serio_raw 16384 0 - Live 0x0000000000000000
rtsx_pci_ms 20480 0 - Live 0x0000000000000000
memstick 20480 1 rtsx_pci_ms, Live 0x0000000000000000
soundcore 16384 1 snd, Live 0x0000000000000000
i915 1146880 4 - Live 0x0000000000000000
shpchp 40960 0 - Live 0x0000000000000000
lpc_ich 24576 0 - Live 0x0000000000000000
mei_me 24576 0 - Live 0x0000000000000000
video 28672 1 i915, Live 0x0000000000000000
parport_pc 36864 0 - Live 0x0000000000000000
mei 94208 3 microread_mei,mei_phy,mei_me, Live 0x0000000000000000
drm_kms_helper 126976 1 i915, Live 0x0000000000000000
ppdev 20480 0 - Live 0x0000000000000000
drm 352256 6 i915,drm_kms_helper, Live 0x0000000000000000
mac_hid 16384 0 - Live 0x0000000000000000
i2c_algo_bit 16384 1 i915, Live 0x0000000000000000
lp 20480 0 - Live 0x0000000000000000
parport 45056 3 parport_pc,ppdev,lp, Live 0x0000000000000000
rtsx_pci_sdmmc 24576 0 - Live 0x0000000000000000
psmouse 135168 0 - Live 0x0000000000000000
ahci 36864 2 - Live 0x0000000000000000
r8169 90112 0 - Live 0x0000000000000000
libahci 32768 1 ahci, Live 0x0000000000000000
rtsx_pci 53248 2 rtsx_pci_ms,rtsx_pci_sdmmc, Live 0x0000000000000000
mii 16384 1 r8169, Live 0x0000000000000000

[7.4.]
cat /proc/ioports
0000-0cf7 : PCI Bus 0000:00
  0000-001f : dma1
  0020-0021 : pic1
  0040-0043 : timer0
  0050-0053 : timer1
  0060-0060 : keyboard
  0062-0062 : PNP0C09:00
    0062-0062 : EC data
  0064-0064 : keyboard
  0066-0066 : PNP0C09:00
    0066-0066 : EC cmd
  0070-0077 : rtc0
  0080-008f : dma page reg
  00a0-00a1 : pic2
  00c0-00df : dma2
  00f0-00ff : fpu
    00f0-00f0 : PNP0C04:00
  03c0-03df : vga+
  0400-0403 : ACPI PM1a_EVT_BLK
  0404-0405 : ACPI PM1a_CNT_BLK
  0408-040b : ACPI PM_TMR
  0410-0415 : ACPI CPU throttle
  0420-042f : ACPI GPE0_BLK
  0430-0433 : iTCO_wdt
  0450-0450 : ACPI PM2_CNT_BLK
  0454-0457 : pnp 00:02
  0458-047f : pnp 00:00
    0460-047f : iTCO_wdt
  0500-057f : pnp 00:00
  0680-069f : pnp 00:00
0cf8-0cff : PCI conf1
0d00-ffff : PCI Bus 0000:00
  1000-100f : pnp 00:00
  164e-164f : pnp 00:00
  2000-2fff : PCI Bus 0000:0e
    2000-20ff : 0000:0e:00.0
      2000-20ff : r8169
  3000-303f : 0000:00:02.0
  3040-305f : 0000:00:1f.3
  3060-307f : 0000:00:1f.2
    3060-307f : ahci
  3080-3087 : 0000:00:1f.2
    3080-3087 : ahci
  3088-308f : 0000:00:1f.2
    3088-308f : ahci
  3090-3093 : 0000:00:1f.2
    3090-3093 : ahci
  3094-3097 : 0000:00:1f.2
    3094-3097 : ahci
  ffff-ffff : pnp 00:00
    ffff-ffff : pnp 00:00


cat /proc/iomem
00000000-00000fff : reserved
00001000-0009d3ff : System RAM
0009d400-0009ffff : reserved
000a0000-000bffff : PCI Bus 0000:00
000c0000-000cedff : Video ROM
000e0000-000fffff : reserved
  000f0000-000fffff : System ROM
00100000-1fffffff : System RAM
  01000000-01811edc : Kernel code
  01811edd-01f34eff : Kernel data
  020a6000-021e8fff : Kernel bss
20000000-201fffff : reserved
  20000000-201fffff : pnp 00:06
20200000-40003fff : System RAM
40004000-40004fff : reserved
  40004000-40004fff : pnp 00:06
40005000-a4d36fff : System RAM
a4d37000-a61affff : reserved
a61b0000-aaabefff : System RAM
aaabf000-aaebefff : reserved
aaebf000-aafbefff : ACPI Non-volatile Storage
aafbf000-aaffefff : ACPI Tables
aafff000-aaffffff : System RAM
ab000000-af9fffff : reserved
  aba00000-af9fffff : Graphics Stolen Memory
afa00000-feafffff : PCI Bus 0000:00
  afa00000-afa00fff : pnp 00:05
  b0000000-bfffffff : 0000:00:02.0
  c0000000-c03fffff : 0000:00:02.0
  c0400000-c04fffff : PCI Bus 0000:0e
    c0400000-c0403fff : 0000:0e:00.0
      c0400000-c0403fff : r8169
  c0500000-c05fffff : PCI Bus 0000:0e
    c0500000-c0500fff : 0000:0e:00.0
      c0500000-c0500fff : r8169
  c0600000-c06fffff : PCI Bus 0000:08
    c0600000-c0600fff : 0000:08:00.0
      c0600000-c0600fff : rtsx_pci
  c0700000-c07fffff : PCI Bus 0000:07
    c0700000-c0707fff : 0000:07:00.0
  c0800000-c080ffff : 0000:00:14.0
    c0800000-c080ffff : xhci-hcd
  c0810000-c0813fff : 0000:00:1b.0
    c0810000-c0813fff : ICH HD audio
  c0814000-c081400f : 0000:00:16.0
    c0814000-c081400f : mei_me
  c0815000-c08150ff : 0000:00:1f.3
  c0817000-c08177ff : 0000:00:1f.2
    c0817000-c08177ff : ahci
  c0818000-c08183ff : 0000:00:1d.0
    c0818000-c08183ff : ehci_hcd
  c0819000-c08193ff : 0000:00:1a.0
    c0819000-c08193ff : ehci_hcd
  f0000000-f3ffffff : PCI MMCONFIG 0000 [bus 00-3f]
    f0000000-f3ffffff : reserved
      f0000000-f3ffffff : pnp 00:05
feb00000-feb03fff : reserved
fec00000-fec00fff : reserved
  fec00000-fec003ff : IOAPIC 0
fed00000-fed003ff : HPET 0
  fed00000-fed003ff : PNP0103:00
fed10000-fed19fff : reserved
  fed10000-fed17fff : pnp 00:05
  fed18000-fed18fff : pnp 00:05
  fed19000-fed19fff : pnp 00:05
fed1c000-fed1ffff : reserved
  fed1c000-fed1ffff : pnp 00:05
    fed1f410-fed1f414 : iTCO_wdt
fed20000-fed3ffff : pnp 00:05
fed90000-fed93fff : pnp 00:05
fee00000-fee00fff : Local APIC
  fee00000-fee00fff : reserved
ff000000-ffffffff : INT0800:00
  ffd00000-ffffffff : reserved
100000000-1cf5fffff : System RAM
1cf600000-1cfffffff : RAM buffer

[7.5.]
sudo lspci -vvv
00:00.0 Host bridge: Intel Corporation 3rd Gen Core processor DRAM
Controller (rev 09)
Subsystem: Sony Corporation Device 90b8
Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR- FastB2B- DisINTx-
Status: Cap+ 66MHz- UDF- FastB2B+ ParErr- DEVSEL=fast >TAbort-
<TAbort- <MAbort+ >SERR- <PERR- INTx-
Latency: 0
Capabilities: [e0] Vendor Specific Information: Len=0c <?>
Kernel driver in use: ivb_uncore

00:02.0 VGA compatible controller: Intel Corporation 3rd Gen Core
processor Graphics Controller (rev 09) (prog-if 00 [VGA controller])
Subsystem: Sony Corporation Device 90b8
Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR- FastB2B- DisINTx+
Status: Cap+ 66MHz- UDF- FastB2B+ ParErr- DEVSEL=fast >TAbort-
<TAbort- <MAbort- >SERR- <PERR- INTx-
Latency: 0
Interrupt: pin A routed to IRQ 29
Region 0: Memory at c0000000 (64-bit, non-prefetchable) [size=4M]
Region 2: Memory at b0000000 (64-bit, prefetchable) [size=256M]
Region 4: I/O ports at 3000 [size=64]
Expansion ROM at <unassigned> [disabled]
Capabilities: [90] MSI: Enable+ Count=1/1 Maskable- 64bit-
Address: fee0f00c  Data: 4162
Capabilities: [d0] Power Management version 2
Flags: PMEClk- DSI+ D1- D2- AuxCurrent=0mA PME(D0-,D1-,D2-,D3hot-,D3cold-)
Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-
Capabilities: [a4] PCI Advanced Features
AFCap: TP+ FLR+
AFCtrl: FLR-
AFStatus: TP-
Kernel driver in use: i915

00:14.0 USB controller: Intel Corporation 7 Series/C210 Series Chipset
Family USB xHCI Host Controller (rev 04) (prog-if 30 [XHCI])
Subsystem: Sony Corporation Device 90b8
Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR- FastB2B- DisINTx+
Status: Cap+ 66MHz- UDF- FastB2B+ ParErr- DEVSEL=medium >TAbort-
<TAbort- <MAbort- >SERR- <PERR- INTx-
Latency: 0
Interrupt: pin A routed to IRQ 24
Region 0: Memory at c0800000 (64-bit, non-prefetchable) [size=64K]
Capabilities: [70] Power Management version 2
Flags: PMEClk- DSI- D1- D2- AuxCurrent=375mA PME(D0-,D1-,D2-,D3hot+,D3cold+)
Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
Capabilities: [80] MSI: Enable+ Count=1/8 Maskable- 64bit+
Address: 00000000fee0f00c  Data: 41b1
Kernel driver in use: xhci_hcd

00:16.0 Communication controller: Intel Corporation 7 Series/C210
Series Chipset Family MEI Controller #1 (rev 04)
Subsystem: Sony Corporation Device 90b8
Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR- FastB2B- DisINTx+
Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort-
<TAbort- <MAbort- >SERR- <PERR- INTx-
Latency: 0
Interrupt: pin A routed to IRQ 28
Region 0: Memory at c0814000 (64-bit, non-prefetchable) [size=16]
Capabilities: [50] Power Management version 3
Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME(D0+,D1-,D2-,D3hot+,D3cold+)
Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
Capabilities: [8c] MSI: Enable+ Count=1/1 Maskable- 64bit+
Address: 00000000fee0f00c  Data: 4152
Kernel driver in use: mei_me

00:1a.0 USB controller: Intel Corporation 7 Series/C210 Series Chipset
Family USB Enhanced Host Controller #2 (rev 04) (prog-if 20 [EHCI])
Subsystem: Sony Corporation Device 90b8
Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR- FastB2B- DisINTx-
Status: Cap+ 66MHz- UDF- FastB2B+ ParErr- DEVSEL=medium >TAbort-
<TAbort- <MAbort- >SERR- <PERR- INTx-
Latency: 0
Interrupt: pin A routed to IRQ 16
Region 0: Memory at c0819000 (32-bit, non-prefetchable) [size=1K]
Capabilities: [50] Power Management version 2
Flags: PMEClk- DSI- D1- D2- AuxCurrent=375mA PME(D0+,D1-,D2-,D3hot+,D3cold+)
Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-
Capabilities: [58] Debug port: BAR=1 offset=00a0
Capabilities: [98] PCI Advanced Features
AFCap: TP+ FLR+
AFCtrl: FLR-
AFStatus: TP-
Kernel driver in use: ehci-pci

00:1b.0 Audio device: Intel Corporation 7 Series/C210 Series Chipset
Family High Definition Audio Controller (rev 04)
Subsystem: Sony Corporation Device 90b8
Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR- FastB2B- DisINTx+
Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort-
<TAbort- <MAbort- >SERR- <PERR- INTx-
Latency: 0, Cache Line Size: 64 bytes
Interrupt: pin A routed to IRQ 30
Region 0: Memory at c0810000 (64-bit, non-prefetchable) [size=16K]
Capabilities: [50] Power Management version 2
Flags: PMEClk- DSI- D1- D2- AuxCurrent=55mA PME(D0+,D1-,D2-,D3hot+,D3cold+)
Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-
Capabilities: [60] MSI: Enable+ Count=1/1 Maskable- 64bit+
Address: 00000000fee0f00c  Data: 4182
Capabilities: [70] Express (v1) Root Complex Integrated Endpoint, MSI 00
DevCap: MaxPayload 128 bytes, PhantFunc 0
ExtTag- RBE-
DevCtl: Report errors: Correctable- Non-Fatal- Fatal- Unsupported-
RlxdOrd- ExtTag- PhantFunc- AuxPwr- NoSnoop-
MaxPayload 128 bytes, MaxReadReq 128 bytes
DevSta: CorrErr- UncorrErr- FatalErr- UnsuppReq- AuxPwr+ TransPend-
Capabilities: [100 v1] Virtual Channel
Caps: LPEVC=0 RefClk=100ns PATEntryBits=1
Arb: Fixed- WRR32- WRR64- WRR128-
Ctrl: ArbSelect=Fixed
Status: InProgress-
VC0: Caps: PATOffset=00 MaxTimeSlots=1 RejSnoopTrans-
Arb: Fixed- WRR32- WRR64- WRR128- TWRR128- WRR256-
Ctrl: Enable+ ID=0 ArbSelect=Fixed TC/VC=01
Status: NegoPending- InProgress-
VC1: Caps: PATOffset=00 MaxTimeSlots=1 RejSnoopTrans-
Arb: Fixed- WRR32- WRR64- WRR128- TWRR128- WRR256-
Ctrl: Enable+ ID=1 ArbSelect=Fixed TC/VC=22
Status: NegoPending- InProgress-
Capabilities: [130 v1] Root Complex Link
Desc: PortNumber=0f ComponentID=00 EltType=Config
Link0: Desc: TargetPort=00 TargetComponent=00 AssocRCRB-
LinkType=MemMapped LinkValid+
Addr: 00000000fed1c000
Kernel driver in use: snd_hda_intel

00:1c.0 PCI bridge: Intel Corporation 7 Series/C210 Series Chipset
Family PCI Express Root Port 1 (rev c4) (prog-if 00 [Normal decode])
Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR- FastB2B- DisINTx-
Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort-
<TAbort- <MAbort- >SERR- <PERR- INTx-
Latency: 0, Cache Line Size: 64 bytes
Bus: primary=00, secondary=07, subordinate=07, sec-latency=0
I/O behind bridge: 0000f000-00000fff
Memory behind bridge: c0700000-c07fffff
Prefetchable memory behind bridge: 00000000fff00000-00000000000fffff
Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=fast >TAbort-
<TAbort- <MAbort- <SERR- <PERR-
BridgeCtl: Parity- SERR- NoISA- VGA- MAbort- >Reset- FastB2B-
PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-
Capabilities: [40] Express (v2) Root Port (Slot+), MSI 00
DevCap: MaxPayload 128 bytes, PhantFunc 0
ExtTag- RBE+
DevCtl: Report errors: Correctable- Non-Fatal- Fatal- Unsupported-
RlxdOrd- ExtTag- PhantFunc- AuxPwr- NoSnoop-
MaxPayload 128 bytes, MaxReadReq 128 bytes
DevSta: CorrErr- UncorrErr- FatalErr- UnsuppReq- AuxPwr+ TransPend-
LnkCap: Port #1, Speed 5GT/s, Width x1, ASPM L0s L1, Exit Latency L0s
<512ns, L1 <16us
ClockPM- Surprise- LLActRep+ BwNot-
LnkCtl: ASPM L1 Enabled; RCB 64 bytes Disabled- CommClk+
ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
LnkSta: Speed 2.5GT/s, Width x1, TrErr- Train- SlotClk+ DLActive+
BWMgmt+ ABWMgmt-
SltCap: AttnBtn- PwrCtrl- MRL- AttnInd- PwrInd- HotPlug- Surprise-
Slot #0, PowerLimit 10.000W; Interlock- NoCompl+
SltCtl: Enable: AttnBtn- PwrFlt- MRL- PresDet- CmdCplt- HPIrq- LinkChg-
Control: AttnInd Unknown, PwrInd Unknown, Power- Interlock-
SltSta: Status: AttnBtn- PowerFlt- MRL- CmdCplt- PresDet+ Interlock-
Changed: MRL- PresDet- LinkState+
RootCtl: ErrCorrectable- ErrNon-Fatal- ErrFatal- PMEIntEna- CRSVisible-
RootCap: CRSVisible-
RootSta: PME ReqID 0000, PMEStatus- PMEPending-
DevCap2: Completion Timeout: Range BC, TimeoutDis+, LTR-, OBFF Not
Supported ARIFwd-
DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-, LTR-, OBFF
Disabled ARIFwd-
LnkCtl2: Target Link Speed: 5GT/s, EnterCompliance- SpeedDis-
Transmit Margin: Normal Operating Range, EnterModifiedCompliance- ComplianceSOS-
Compliance De-emphasis: -6dB
LnkSta2: Current De-emphasis Level: -3.5dB, EqualizationComplete-,
EqualizationPhase1-
EqualizationPhase2-, EqualizationPhase3-, LinkEqualizationRequest-
Capabilities: [80] MSI: Enable- Count=1/1 Maskable- 64bit-
Address: 00000000  Data: 0000
Capabilities: [90] Subsystem: Sony Corporation Device 90b8
Capabilities: [a0] Power Management version 2
Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME(D0+,D1-,D2-,D3hot+,D3cold+)
Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-
Kernel driver in use: pcieport

00:1c.1 PCI bridge: Intel Corporation 7 Series/C210 Series Chipset
Family PCI Express Root Port 2 (rev c4) (prog-if 00 [Normal decode])
Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR- FastB2B- DisINTx-
Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort-
<TAbort- <MAbort- >SERR- <PERR- INTx-
Latency: 0, Cache Line Size: 64 bytes
Bus: primary=00, secondary=08, subordinate=08, sec-latency=0
I/O behind bridge: 0000f000-00000fff
Memory behind bridge: c0600000-c06fffff
Prefetchable memory behind bridge: 00000000fff00000-00000000000fffff
Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=fast >TAbort-
<TAbort- <MAbort- <SERR- <PERR-
BridgeCtl: Parity- SERR- NoISA- VGA- MAbort- >Reset- FastB2B-
PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-
Capabilities: [40] Express (v2) Root Port (Slot+), MSI 00
DevCap: MaxPayload 128 bytes, PhantFunc 0
ExtTag- RBE+
DevCtl: Report errors: Correctable- Non-Fatal- Fatal- Unsupported-
RlxdOrd- ExtTag- PhantFunc- AuxPwr- NoSnoop-
MaxPayload 128 bytes, MaxReadReq 128 bytes
DevSta: CorrErr- UncorrErr- FatalErr- UnsuppReq- AuxPwr+ TransPend-
LnkCap: Port #2, Speed 5GT/s, Width x1, ASPM L0s L1, Exit Latency L0s
<512ns, L1 <16us
ClockPM- Surprise- LLActRep+ BwNot-
LnkCtl: ASPM Disabled; RCB 64 bytes Disabled- CommClk+
ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
LnkSta: Speed 2.5GT/s, Width x1, TrErr- Train- SlotClk+ DLActive+
BWMgmt+ ABWMgmt-
SltCap: AttnBtn- PwrCtrl- MRL- AttnInd- PwrInd- HotPlug- Surprise-
Slot #1, PowerLimit 10.000W; Interlock- NoCompl+
SltCtl: Enable: AttnBtn- PwrFlt- MRL- PresDet- CmdCplt- HPIrq- LinkChg-
Control: AttnInd Unknown, PwrInd Unknown, Power- Interlock-
SltSta: Status: AttnBtn- PowerFlt- MRL- CmdCplt- PresDet+ Interlock-
Changed: MRL- PresDet- LinkState+
RootCtl: ErrCorrectable- ErrNon-Fatal- ErrFatal- PMEIntEna- CRSVisible-
RootCap: CRSVisible-
RootSta: PME ReqID 0000, PMEStatus- PMEPending-
DevCap2: Completion Timeout: Range BC, TimeoutDis+, LTR-, OBFF Not
Supported ARIFwd-
DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-, LTR-, OBFF
Disabled ARIFwd-
LnkCtl2: Target Link Speed: 5GT/s, EnterCompliance- SpeedDis-
Transmit Margin: Normal Operating Range, EnterModifiedCompliance- ComplianceSOS-
Compliance De-emphasis: -6dB
LnkSta2: Current De-emphasis Level: -3.5dB, EqualizationComplete-,
EqualizationPhase1-
EqualizationPhase2-, EqualizationPhase3-, LinkEqualizationRequest-
Capabilities: [80] MSI: Enable- Count=1/1 Maskable- 64bit-
Address: 00000000  Data: 0000
Capabilities: [90] Subsystem: Sony Corporation Device 90b8
Capabilities: [a0] Power Management version 2
Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME(D0+,D1-,D2-,D3hot+,D3cold+)
Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-
Kernel driver in use: pcieport

00:1c.2 PCI bridge: Intel Corporation 7 Series/C210 Series Chipset
Family PCI Express Root Port 3 (rev c4) (prog-if 00 [Normal decode])
Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR- FastB2B- DisINTx-
Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort-
<TAbort- <MAbort- >SERR- <PERR- INTx-
Latency: 0, Cache Line Size: 64 bytes
Bus: primary=00, secondary=0e, subordinate=0e, sec-latency=0
I/O behind bridge: 00002000-00002fff
Memory behind bridge: c0500000-c05fffff
Prefetchable memory behind bridge: 00000000c0400000-00000000c04fffff
Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=fast >TAbort-
<TAbort- <MAbort- <SERR- <PERR-
BridgeCtl: Parity- SERR- NoISA- VGA- MAbort- >Reset- FastB2B-
PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-
Capabilities: [40] Express (v2) Root Port (Slot+), MSI 00
DevCap: MaxPayload 128 bytes, PhantFunc 0
ExtTag- RBE+
DevCtl: Report errors: Correctable- Non-Fatal- Fatal- Unsupported-
RlxdOrd- ExtTag- PhantFunc- AuxPwr- NoSnoop-
MaxPayload 128 bytes, MaxReadReq 128 bytes
DevSta: CorrErr- UncorrErr- FatalErr- UnsuppReq- AuxPwr+ TransPend-
LnkCap: Port #3, Speed 5GT/s, Width x1, ASPM L0s L1, Exit Latency L0s
<512ns, L1 <16us
ClockPM- Surprise- LLActRep+ BwNot-
LnkCtl: ASPM L1 Enabled; RCB 64 bytes Disabled- CommClk+
ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
LnkSta: Speed 2.5GT/s, Width x1, TrErr- Train- SlotClk+ DLActive+
BWMgmt+ ABWMgmt-
SltCap: AttnBtn- PwrCtrl- MRL- AttnInd- PwrInd- HotPlug- Surprise-
Slot #2, PowerLimit 10.000W; Interlock- NoCompl+
SltCtl: Enable: AttnBtn- PwrFlt- MRL- PresDet- CmdCplt- HPIrq- LinkChg-
Control: AttnInd Unknown, PwrInd Unknown, Power- Interlock-
SltSta: Status: AttnBtn- PowerFlt- MRL- CmdCplt- PresDet+ Interlock-
Changed: MRL- PresDet- LinkState+
RootCtl: ErrCorrectable- ErrNon-Fatal- ErrFatal- PMEIntEna- CRSVisible-
RootCap: CRSVisible-
RootSta: PME ReqID 0000, PMEStatus- PMEPending-
DevCap2: Completion Timeout: Range BC, TimeoutDis+, LTR-, OBFF Not
Supported ARIFwd-
DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-, LTR-, OBFF
Disabled ARIFwd-
LnkCtl2: Target Link Speed: 5GT/s, EnterCompliance- SpeedDis-
Transmit Margin: Normal Operating Range, EnterModifiedCompliance- ComplianceSOS-
Compliance De-emphasis: -6dB
LnkSta2: Current De-emphasis Level: -3.5dB, EqualizationComplete-,
EqualizationPhase1-
EqualizationPhase2-, EqualizationPhase3-, LinkEqualizationRequest-
Capabilities: [80] MSI: Enable- Count=1/1 Maskable- 64bit-
Address: 00000000  Data: 0000
Capabilities: [90] Subsystem: Sony Corporation Device 90b8
Capabilities: [a0] Power Management version 2
Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME(D0+,D1-,D2-,D3hot+,D3cold+)
Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-
Kernel driver in use: pcieport

00:1d.0 USB controller: Intel Corporation 7 Series/C210 Series Chipset
Family USB Enhanced Host Controller #1 (rev 04) (prog-if 20 [EHCI])
Subsystem: Sony Corporation Device 90b8
Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR- FastB2B- DisINTx-
Status: Cap+ 66MHz- UDF- FastB2B+ ParErr- DEVSEL=medium >TAbort-
<TAbort- <MAbort- >SERR- <PERR- INTx-
Latency: 0
Interrupt: pin A routed to IRQ 23
Region 0: Memory at c0818000 (32-bit, non-prefetchable) [size=1K]
Capabilities: [50] Power Management version 2
Flags: PMEClk- DSI- D1- D2- AuxCurrent=375mA PME(D0+,D1-,D2-,D3hot+,D3cold+)
Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-
Capabilities: [58] Debug port: BAR=1 offset=00a0
Capabilities: [98] PCI Advanced Features
AFCap: TP+ FLR+
AFCtrl: FLR-
AFStatus: TP-
Kernel driver in use: ehci-pci

00:1f.0 ISA bridge: Intel Corporation HM76 Express Chipset LPC
Controller (rev 04)
Subsystem: Sony Corporation Device 90b8
Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR- FastB2B- DisINTx-
Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=medium >TAbort-
<TAbort- <MAbort- >SERR- <PERR- INTx-
Latency: 0
Capabilities: [e0] Vendor Specific Information: Len=0c <?>
Kernel driver in use: lpc_ich

00:1f.2 SATA controller: Intel Corporation 7 Series Chipset Family
6-port SATA Controller [AHCI mode] (rev 04) (prog-if 01 [AHCI 1.0])
Subsystem: Sony Corporation Device 90b8
Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR- FastB2B- DisINTx+
Status: Cap+ 66MHz+ UDF- FastB2B+ ParErr- DEVSEL=medium >TAbort-
<TAbort- <MAbort- >SERR- <PERR- INTx-
Latency: 0
Interrupt: pin B routed to IRQ 26
Region 0: I/O ports at 3088 [size=8]
Region 1: I/O ports at 3094 [size=4]
Region 2: I/O ports at 3080 [size=8]
Region 3: I/O ports at 3090 [size=4]
Region 4: I/O ports at 3060 [size=32]
Region 5: Memory at c0817000 (32-bit, non-prefetchable) [size=2K]
Capabilities: [80] MSI: Enable+ Count=1/1 Maskable- 64bit-
Address: fee0c00c  Data: 4122
Capabilities: [70] Power Management version 3
Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME(D0-,D1-,D2-,D3hot+,D3cold-)
Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
Capabilities: [a8] SATA HBA v1.0 BAR4 Offset=00000004
Capabilities: [b0] PCI Advanced Features
AFCap: TP+ FLR+
AFCtrl: FLR-
AFStatus: TP-
Kernel driver in use: ahci

00:1f.3 SMBus: Intel Corporation 7 Series/C210 Series Chipset Family
SMBus Controller (rev 04)
Subsystem: Sony Corporation Device 90b8
Control: I/O+ Mem+ BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR- FastB2B- DisINTx-
Status: Cap- 66MHz- UDF- FastB2B+ ParErr- DEVSEL=medium >TAbort-
<TAbort- <MAbort- >SERR- <PERR- INTx-
Interrupt: pin C routed to IRQ 10
Region 0: Memory at c0815000 (64-bit, non-prefetchable) [size=256]
Region 4: I/O ports at 3040 [size=32]

07:00.0 Network controller: Broadcom Corporation BCM43142 802.11b/g/n (rev 01)
Subsystem: Foxconn International, Inc. Device e071
Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR- FastB2B- DisINTx-
Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort-
<TAbort- <MAbort- >SERR- <PERR- INTx-
Latency: 0, Cache Line Size: 64 bytes
Interrupt: pin A routed to IRQ 7
Region 0: Memory at c0700000 (64-bit, non-prefetchable) [size=32K]
Capabilities: [40] Power Management version 3
Flags: PMEClk- DSI- D1+ D2+ AuxCurrent=0mA PME(D0+,D1-,D2-,D3hot+,D3cold+)
Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=2 PME-
Capabilities: [58] Vendor Specific Information: Len=78 <?>
Capabilities: [48] MSI: Enable- Count=1/1 Maskable- 64bit+
Address: 0000000000000000  Data: 0000
Capabilities: [d0] Express (v1) Endpoint, MSI 00
DevCap: MaxPayload 128 bytes, PhantFunc 0, Latency L0s <4us, L1 unlimited
ExtTag+ AttnBtn- AttnInd- PwrInd- RBE+ FLReset-
DevCtl: Report errors: Correctable- Non-Fatal- Fatal- Unsupported-
RlxdOrd+ ExtTag- PhantFunc- AuxPwr- NoSnoop-
MaxPayload 128 bytes, MaxReadReq 512 bytes
DevSta: CorrErr- UncorrErr- FatalErr- UnsuppReq- AuxPwr+ TransPend-
LnkCap: Port #0, Speed 2.5GT/s, Width x1, ASPM L0s L1, Exit Latency
L0s <4us, L1 <64us
ClockPM+ Surprise- LLActRep- BwNot-
LnkCtl: ASPM L1 Enabled; RCB 64 bytes Disabled- CommClk+
ExtSynch- ClockPM+ AutWidDis- BWInt- AutBWInt-
LnkSta: Speed 2.5GT/s, Width x1, TrErr- Train- SlotClk+ DLActive-
BWMgmt- ABWMgmt-
Capabilities: [100 v1] Advanced Error Reporting
UESta: DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF-
MalfTLP- ECRC- UnsupReq- ACSViol-
UEMsk: DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF-
MalfTLP- ECRC- UnsupReq- ACSViol-
UESvrt: DLP+ SDES+ TLP- FCP+ CmpltTO- CmpltAbrt- UnxCmplt- RxOF+
MalfTLP+ ECRC- UnsupReq- ACSViol-
CESta: RxErr- BadTLP- BadDLLP- Rollover- Timeout- NonFatalErr-
CEMsk: RxErr- BadTLP- BadDLLP- Rollover- Timeout- NonFatalErr+
AERCap: First Error Pointer: 00, GenCap+ CGenEn- ChkCap+ ChkEn-
Capabilities: [13c v1] Virtual Channel
Caps: LPEVC=0 RefClk=100ns PATEntryBits=1
Arb: Fixed- WRR32- WRR64- WRR128-
Ctrl: ArbSelect=Fixed
Status: InProgress-
VC0: Caps: PATOffset=00 MaxTimeSlots=1 RejSnoopTrans-
Arb: Fixed- WRR32- WRR64- WRR128- TWRR128- WRR256-
Ctrl: Enable+ ID=0 ArbSelect=Fixed TC/VC=ff
Status: NegoPending- InProgress-
Capabilities: [160 v1] Device Serial Number 00-00-87-ff-ff-7b-34-23
Capabilities: [16c v1] Power Budgeting <?>

08:00.0 Unassigned class [ff00]: Realtek Semiconductor Co., Ltd.
RTS5209 PCI Express Card Reader (rev 01)
Subsystem: Sony Corporation Device 90b8
Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR- FastB2B- DisINTx+
Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort-
<TAbort- <MAbort- >SERR- <PERR- INTx-
Latency: 0, Cache Line Size: 64 bytes
Interrupt: pin A routed to IRQ 25
Region 0: Memory at c0600000 (32-bit, non-prefetchable) [size=4K]
Capabilities: [40] Power Management version 3
Flags: PMEClk- DSI- D1+ D2+ AuxCurrent=375mA PME(D0-,D1+,D2+,D3hot+,D3cold-)
Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-
Capabilities: [50] MSI: Enable+ Count=1/1 Maskable- 64bit+
Address: 00000000fee0f00c  Data: 41d1
Capabilities: [70] Express (v2) Endpoint, MSI 00
DevCap: MaxPayload 128 bytes, PhantFunc 0, Latency L0s <1us, L1 <8us
ExtTag- AttnBtn- AttnInd- PwrInd- RBE+ FLReset-
DevCtl: Report errors: Correctable- Non-Fatal- Fatal- Unsupported-
RlxdOrd+ ExtTag- PhantFunc- AuxPwr- NoSnoop-
MaxPayload 128 bytes, MaxReadReq 512 bytes
DevSta: CorrErr- UncorrErr- FatalErr- UnsuppReq- AuxPwr- TransPend-
LnkCap: Port #0, Speed 2.5GT/s, Width x1, ASPM L0s L1, Exit Latency
L0s unlimited, L1 <64us
ClockPM+ Surprise- LLActRep- BwNot-
LnkCtl: ASPM L0s L1 Enabled; RCB 64 bytes Disabled- CommClk+
ExtSynch- ClockPM+ AutWidDis- BWInt- AutBWInt-
LnkSta: Speed 2.5GT/s, Width x1, TrErr- Train- SlotClk+ DLActive-
BWMgmt- ABWMgmt-
DevCap2: Completion Timeout: Not Supported, TimeoutDis+, LTR-, OBFF
Not Supported
DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-, LTR-, OBFF Disabled
LnkCtl2: Target Link Speed: 2.5GT/s, EnterCompliance- SpeedDis-
Transmit Margin: Normal Operating Range, EnterModifiedCompliance- ComplianceSOS-
Compliance De-emphasis: -6dB
LnkSta2: Current De-emphasis Level: -6dB, EqualizationComplete-,
EqualizationPhase1-
EqualizationPhase2-, EqualizationPhase3-, LinkEqualizationRequest-
Capabilities: [100 v1] Advanced Error Reporting
UESta: DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF-
MalfTLP- ECRC- UnsupReq- ACSViol-
UEMsk: DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF-
MalfTLP- ECRC- UnsupReq- ACSViol-
UESvrt: DLP+ SDES+ TLP- FCP+ CmpltTO- CmpltAbrt- UnxCmplt- RxOF+
MalfTLP+ ECRC- UnsupReq- ACSViol-
CESta: RxErr- BadTLP- BadDLLP- Rollover- Timeout- NonFatalErr-
CEMsk: RxErr- BadTLP- BadDLLP- Rollover- Timeout- NonFatalErr+
AERCap: First Error Pointer: 00, GenCap+ CGenEn- ChkCap+ ChkEn-
Capabilities: [140 v1] Device Serial Number 00-00-00-01-00-4c-e0-00
Kernel driver in use: rtsx_pci

0e:00.0 Ethernet controller: Realtek Semiconductor Co., Ltd.
RTL8111/8168/8411 PCI Express Gigabit Ethernet Controller (rev 0c)
Subsystem: Sony Corporation Device 90b8
Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR- FastB2B- DisINTx+
Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort-
<TAbort- <MAbort- >SERR- <PERR- INTx-
Latency: 0, Cache Line Size: 64 bytes
Interrupt: pin A routed to IRQ 27
Region 0: I/O ports at 2000 [size=256]
Region 2: Memory at c0500000 (64-bit, non-prefetchable) [size=4K]
Region 4: Memory at c0400000 (64-bit, prefetchable) [size=16K]
Capabilities: [40] Power Management version 3
Flags: PMEClk- DSI- D1+ D2+ AuxCurrent=375mA PME(D0+,D1+,D2+,D3hot+,D3cold+)
Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
Capabilities: [50] MSI: Enable+ Count=1/1 Maskable- 64bit+
Address: 00000000fee0100c  Data: 4142
Capabilities: [70] Express (v2) Endpoint, MSI 01
DevCap: MaxPayload 128 bytes, PhantFunc 0, Latency L0s <512ns, L1 <64us
ExtTag- AttnBtn- AttnInd- PwrInd- RBE+ FLReset-
DevCtl: Report errors: Correctable- Non-Fatal- Fatal- Unsupported-
RlxdOrd+ ExtTag- PhantFunc- AuxPwr- NoSnoop-
MaxPayload 128 bytes, MaxReadReq 4096 bytes
DevSta: CorrErr- UncorrErr- FatalErr- UnsuppReq- AuxPwr+ TransPend-
LnkCap: Port #0, Speed 2.5GT/s, Width x1, ASPM L0s L1, Exit Latency
L0s unlimited, L1 <64us
ClockPM+ Surprise- LLActRep- BwNot-
LnkCtl: ASPM L1 Enabled; RCB 64 bytes Disabled- CommClk+
ExtSynch- ClockPM+ AutWidDis- BWInt- AutBWInt-
LnkSta: Speed 2.5GT/s, Width x1, TrErr- Train- SlotClk+ DLActive-
BWMgmt- ABWMgmt-
DevCap2: Completion Timeout: Range ABCD, TimeoutDis+, LTR+, OBFF Via
message/WAKE#
DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-, LTR-, OBFF Disabled
LnkCtl2: Target Link Speed: 2.5GT/s, EnterCompliance- SpeedDis-
Transmit Margin: Normal Operating Range, EnterModifiedCompliance- ComplianceSOS-
Compliance De-emphasis: -6dB
LnkSta2: Current De-emphasis Level: -6dB, EqualizationComplete-,
EqualizationPhase1-
EqualizationPhase2-, EqualizationPhase3-, LinkEqualizationRequest-
Capabilities: [b0] MSI-X: Enable- Count=4 Masked-
Vector table: BAR=4 offset=00000000
PBA: BAR=4 offset=00000800
Capabilities: [d0] Vital Product Data
Unknown small resource type 00, will not decode more.
Capabilities: [100 v1] Advanced Error Reporting
UESta: DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF-
MalfTLP- ECRC- UnsupReq- ACSViol-
UEMsk: DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF-
MalfTLP- ECRC- UnsupReq- ACSViol-
UESvrt: DLP+ SDES+ TLP- FCP+ CmpltTO- CmpltAbrt- UnxCmplt- RxOF+
MalfTLP+ ECRC- UnsupReq- ACSViol-
CESta: RxErr- BadTLP- BadDLLP- Rollover- Timeout- NonFatalErr-
CEMsk: RxErr- BadTLP- BadDLLP- Rollover- Timeout- NonFatalErr+
AERCap: First Error Pointer: 00, GenCap+ CGenEn- ChkCap+ ChkEn-
Capabilities: [140 v1] Virtual Channel
Caps: LPEVC=0 RefClk=100ns PATEntryBits=1
Arb: Fixed- WRR32- WRR64- WRR128-
Ctrl: ArbSelect=Fixed
Status: InProgress-
VC0: Caps: PATOffset=00 MaxTimeSlots=1 RejSnoopTrans-
Arb: Fixed- WRR32- WRR64- WRR128- TWRR128- WRR256-
Ctrl: Enable+ ID=0 ArbSelect=Fixed TC/VC=ff
Status: NegoPending- InProgress-
Capabilities: [160 v1] Device Serial Number 01-00-00-00-68-4c-e0-00
Capabilities: [170 v1] Latency Tolerance Reporting
Max snoop latency: 0ns
Max no snoop latency: 0ns
Kernel driver in use: r8169

[7.6]
cat /proc/scsi/scsi
Attached devices:
Host: scsi0 Channel: 00 Id: 00 Lun: 00
  Vendor: ATA      Model: Samsung SSD 850  Rev: 1B6Q
  Type:   Direct-Access                    ANSI  SCSI revision: 05
Host: scsi4 Channel: 00 Id: 00 Lun: 00
  Vendor: ATA      Model: TOSHIBA MQ01ABF0 Rev: 3H
  Type:   Direct-Access                    ANSI  SCSI revision: 05

[7.7]

 ls /proc
1     157   1719  2     26    395  759        bus          meminfo
10    158   1731  20    2602  40   76         cgroups      misc
1061  159   1749  2002  2628  41   761        cmdline      modules
1065  160   1763  2005  27    42   784        consoles     mounts
1073  161   1767  2015  28    43   790        cpuinfo      mtrr
1087  162   1769  2046  29    435  791        crypto       net
1099  1623  1784  2056  2911  44   8          devices      pagetypeinfo
11    163   1799  2057  3     45   803        diskstats    partitions
1102  1634  18    2059  30    46   811        dma          sched_debug
1120  1640  1805  2082  3046  47   812        driver       schedstat
1161  1644  1810  21    3053  48   849        execdomains  scsi
1190  1653  1816  2133  3054  5    88         fb           self
12    1659  182   2170  3066  50   896        filesystems  slabinfo
1228  166   1824  2175  31    52   9          fs           softirqs
13    1671  1827  2181  32    53   900        interrupts   stat
1338  1677  183   2192  33    54   907        iomem        swaps
14    168   1840  22    330   583  908        ioports      sys
1415  1681  1845  2205  335   609  911        irq          sysrq-trigger
15    1686  1849  2220  34    610  960        kallsyms     sysvipc
150   169   1857  230   342   66   967        kcore        thread-self
151   1699  1866  2307  35    660  968        keys         timer_list
152   17    1870  2325  36    68   97         key-users    timer_stats
153   170   1879  2366  367   69   98         kmsg         tty
154   1701  1883  2395  37    7    987        kpagecount   uptime
155   1705  19    24    38    70   988        kpageflags   version
156   1708  1913  2419  380   72   acpi       loadavg      vmallocinfo
1561  1710  1932  25    39    731  asound     locks        vmstat
1563  1711  1978  2570  391   732  buddyinfo  mdstat       zoneinfo

[X]

Here is a link to my launchpad bug report:
https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1461986

I restarted the module sony-laptop with debug flags on.(Relavent
Kernel logs: http://paste.ubuntu.com/11678718/) When I try to change
it's value:

echo -n 0 | sudo tee -a /sys/devices/platform/sony-laptop/usb_charge

these are the curresponding kernel log entries:

[  495.400140] sony_laptop: found handle 0x0155 (offset: 0x07)
[  495.400955] sony_laptop: __call_snc_method: [SN07:0x0000000000000107]
[  495.400961] sony_laptop: called SN07 with 0x0107 (result: 0x0000)

After attempting to change, and when I cat the value of usb_charge, I
find that it is unchanged. But when the cat cammand is executed, I get
these kernel messages:

[  683.170315] sony_laptop: found handle 0x0155 (offset: 0x07)
[  683.170458] sony_laptop: __call_snc_method: [SN07:0x0000000000000007]
[  683.170462] sony_laptop: called SN07 with 0x0007 (result: 0x0001)

I don't know if it is relevent, but for writing this bug report, when
I booted into the latest upstream kernel, I could not boot. The second
time it booted successfully.
