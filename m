From: Olli Niemikorpi <mr.oole@gmail.com>
Subject: Touchpad not detected (ASUS TP300LA)
Date: Wed, 5 Nov 2014 13:53:57 +0200
Message-ID: <CAFXqH2P3iXajMVNamydGnYoCrBAUHvHjemgFDWk2eJHs7Qt2Gg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qg0-f42.google.com ([209.85.192.42]:35687 "EHLO
	mail-qg0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754394AbaKELx6 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 5 Nov 2014 06:53:58 -0500
Received: by mail-qg0-f42.google.com with SMTP id i50so11212767qgf.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 05 Nov 2014 03:53:57 -0800 (PST)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: acpi4asus-user@lists.sourceforge.net, platform-driver-x86@vger.kernel.org

[1.] One line summary of the problem:

Touchpad not detected (ASUS TP300LA)

[2.] Full description of the problem/report:
The command "xinput list" says there is a PS/2 Logitech Wheel Mouse.
Touchpad works as a mouse, but without any scrolling facilities.

[4.] Kernel version (from /proc/version):
Linux version 3.18.0-031800rc3-generic (apw@tangerine) (gcc version
4.6.3 (Ubuntu/Linaro 4.6.3-1ubuntu5) ) #201411022335 SMP Sun Nov 2
23:36:52 UTC 2014

[7.] Environment
Distributor ID: Ubuntu

Description: Ubuntu 14.10

Release: 14.10

Codename: utopic

[7.1.] Software (add the output of the ver_linux script here)
If some fields are empty or look unusual you may have an old version.

Compare to the current minimal requirements in Documentation/Changes.

Linux niemikorpi-TP300LA 3.18.0-031800rc3-generic #201411022335 SMP
Sun Nov 2 23:36:52 UTC 2014 x86_64 x86_64 x86_64 GNU/Linux

Gnu C 4.9.1

Gnu make 4.0

binutils 2.24.90.20141014

util-linux 2.25.1

mount debug

module-init-tools 18

e2fsprogs 1.42.10

pcmciautils 018

PPP 2.4.5

Linux C Library 2.19

Dynamic linker (ldd) 2.19

Procps 3.3.9

Net-tools 1.60

Kbd 1.15.5

Sh-utils 8.23

wireless-tools 30

Modules Loaded ctr ccm rfcomm bnep nls_iso8859_1 intel_rapl
x86_pkg_temp_thermal arc4 intel_powerclamp coretemp kvm_intel kvm
iwlmvm snd_soc_rt5640 snd_soc_rl6231 mac80211 snd_hda_codec_realtek
snd_hda_codec_generic crct10dif_pclmul snd_hda_codec_hdmi
snd_hda_intel iwlwifi crc32_pclmul snd_hda_controller uvcvideo
snd_soc_core snd_hda_codec ghash_clmulni_intel snd_compress
snd_pcm_dmaengine aesni_intel snd_hwdep asus_nb_wmi snd_pcm aes_x86_64
asus_wmi videobuf2_vmalloc lrw joydev gf128mul videobuf2_memops
glue_helper videobuf2_core sparse_keymap cfg80211 i915 ablk_helper
snd_seq_midi snd_seq_midi_event cryptd snd_rawmidi v4l2_common
serio_raw videodev media drm_kms_helper snd_seq i2c_hid snd_seq_device
snd_timer hid_multitouch drm btusb ak8975 bluetooth int3400_thermal
shpchp industrialio snd acpi_thermal_rel soundcore wmi i2c_algo_bit
parport_pc mei_me ppdev i2c_designware_platform lpc_ich dw_dmac video
i2c_designware_core lp dw_dmac_core mei parport 8250_dw
snd_soc_sst_acpi spi_pxa2xx_platform int3402_thermal mac_hid
hid_generic usbhid hid psmouse ahci libahci sdhci_acpi sdhci

[7.2.] Processor information (from /proc/cpuinfo):
processor : 0

vendor_id : GenuineIntel

cpu family : 6

model : 69

model name : Intel(R) Core(TM) i3-4030U CPU @ 1.90GHz

stepping : 1

microcode : 0x17

cpu MHz : 1900.000

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
pdpe1gb rdtscp lm constant_tsc arch_perfmon pebs bts rep_good nopl
xtopology nonstop_tsc aperfmperf eagerfpu pni pclmulqdq dtes64 monitor
ds_cpl vmx est tm2 ssse3 fma cx16 xtpr pdcm pcid sse4_1 sse4_2 x2apic
movbe popcnt tsc_deadline_timer aes xsave avx f16c rdrand lahf_lm abm
arat epb pln pts dtherm tpr_shadow vnmi flexpriority ept vpid fsgsbase
tsc_adjust bmi1 avx2 smep bmi2 erms invpcid xsaveopt

bugs :

bogomips : 3791.23

clflush size : 64

cache_alignment : 64

address sizes : 39 bits physical, 48 bits virtual

power management:


processor : 1

vendor_id : GenuineIntel

cpu family : 6

model : 69

model name : Intel(R) Core(TM) i3-4030U CPU @ 1.90GHz

stepping : 1

microcode : 0x17

cpu MHz : 1899.925

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
pdpe1gb rdtscp lm constant_tsc arch_perfmon pebs bts rep_good nopl
xtopology nonstop_tsc aperfmperf eagerfpu pni pclmulqdq dtes64 monitor
ds_cpl vmx est tm2 ssse3 fma cx16 xtpr pdcm pcid sse4_1 sse4_2 x2apic
movbe popcnt tsc_deadline_timer aes xsave avx f16c rdrand lahf_lm abm
arat epb pln pts dtherm tpr_shadow vnmi flexpriority ept vpid fsgsbase
tsc_adjust bmi1 avx2 smep bmi2 erms invpcid xsaveopt

bugs :

bogomips : 3791.23

clflush size : 64

cache_alignment : 64

address sizes : 39 bits physical, 48 bits virtual

power management:


processor : 2

vendor_id : GenuineIntel

cpu family : 6

model : 69

model name : Intel(R) Core(TM) i3-4030U CPU @ 1.90GHz

stepping : 1

microcode : 0x17

cpu MHz : 1899.925

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
pdpe1gb rdtscp lm constant_tsc arch_perfmon pebs bts rep_good nopl
xtopology nonstop_tsc aperfmperf eagerfpu pni pclmulqdq dtes64 monitor
ds_cpl vmx est tm2 ssse3 fma cx16 xtpr pdcm pcid sse4_1 sse4_2 x2apic
movbe popcnt tsc_deadline_timer aes xsave avx f16c rdrand lahf_lm abm
arat epb pln pts dtherm tpr_shadow vnmi flexpriority ept vpid fsgsbase
tsc_adjust bmi1 avx2 smep bmi2 erms invpcid xsaveopt

bugs :

bogomips : 3791.23

clflush size : 64

cache_alignment : 64

address sizes : 39 bits physical, 48 bits virtual

power management:


processor : 3

vendor_id : GenuineIntel

cpu family : 6

model : 69

model name : Intel(R) Core(TM) i3-4030U CPU @ 1.90GHz

stepping : 1

microcode : 0x17

cpu MHz : 1900.000

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
pdpe1gb rdtscp lm constant_tsc arch_perfmon pebs bts rep_good nopl
xtopology nonstop_tsc aperfmperf eagerfpu pni pclmulqdq dtes64 monitor
ds_cpl vmx est tm2 ssse3 fma cx16 xtpr pdcm pcid sse4_1 sse4_2 x2apic
movbe popcnt tsc_deadline_timer aes xsave avx f16c rdrand lahf_lm abm
arat epb pln pts dtherm tpr_shadow vnmi flexpriority ept vpid fsgsbase
tsc_adjust bmi1 avx2 smep bmi2 erms invpcid xsaveopt

bugs :

bogomips : 3791.23

clflush size : 64

cache_alignment : 64

address sizes : 39 bits physical, 48 bits virtual

power management:

[7.3.] Module information (from /proc/modules):
ctr 13193 2 - Live 0x0000000000000000

ccm 17856 2 - Live 0x0000000000000000

rfcomm 75066 8 - Live 0x0000000000000000

bnep 23980 2 - Live 0x0000000000000000

nls_iso8859_1 12713 1 - Live 0x0000000000000000

intel_rapl 19196 0 - Live 0x0000000000000000

x86_pkg_temp_thermal 14312 0 - Live 0x0000000000000000

arc4 12573 2 - Live 0x0000000000000000

intel_powerclamp 19099 0 - Live 0x0000000000000000

coretemp 13638 0 - Live 0x0000000000000000

kvm_intel 149984 0 - Live 0x0000000000000000

kvm 475233 1 kvm_intel, Live 0x0000000000000000

iwlmvm 254598 0 - Live 0x0000000000000000

snd_soc_rt5640 93325 0 - Live 0x0000000000000000

snd_soc_rl6231 13037 1 snd_soc_rt5640, Live 0x0000000000000000

mac80211 697143 1 iwlmvm, Live 0x0000000000000000

snd_hda_codec_realtek 76099 1 - Live 0x0000000000000000

snd_hda_codec_generic 69995 1 snd_hda_codec_realtek, Live 0x0000000000000000

crct10dif_pclmul 14268 0 - Live 0x0000000000000000

snd_hda_codec_hdmi 52670 1 - Live 0x0000000000000000

snd_hda_intel 30783 5 - Live 0x0000000000000000

iwlwifi 193774 1 iwlmvm, Live 0x0000000000000000

crc32_pclmul 13180 0 - Live 0x0000000000000000

snd_hda_controller 32234 1 snd_hda_intel, Live 0x0000000000000000

uvcvideo 86723 0 - Live 0x0000000000000000

snd_soc_core 207596 1 snd_soc_rt5640, Live 0x0000000000000000

snd_hda_codec 144641 5
snd_hda_codec_realtek,snd_hda_codec_generic,snd_hda_codec_hdmi,snd_hda_intel,snd_hda_controller,
Live 0x0000000000000000

ghash_clmulni_intel 13230 0 - Live 0x0000000000000000

snd_compress 19395 1 snd_soc_core, Live 0x0000000000000000

snd_pcm_dmaengine 15229 1 snd_soc_core, Live 0x0000000000000000

aesni_intel 169686 4 - Live 0x0000000000000000

snd_hwdep 17709 1 snd_hda_codec, Live 0x0000000000000000

asus_nb_wmi 21128 0 - Live 0x0000000000000000

snd_pcm 106273 7
snd_soc_rt5640,snd_hda_codec_hdmi,snd_hda_intel,snd_hda_controller,snd_soc_core,snd_hda_codec,snd_pcm_dmaengine,
Live 0x0000000000000000

aes_x86_64 17131 1 aesni_intel, Live 0x0000000000000000

asus_wmi 24697 1 asus_nb_wmi, Live 0x0000000000000000

videobuf2_vmalloc 13216 1 uvcvideo, Live 0x0000000000000000

lrw 13323 1 aesni_intel, Live 0x0000000000000000

joydev 17587 0 - Live 0x0000000000000000

gf128mul 14951 1 lrw, Live 0x0000000000000000

videobuf2_memops 13362 1 videobuf2_vmalloc, Live 0x0000000000000000

glue_helper 14095 1 aesni_intel, Live 0x0000000000000000

videobuf2_core 51547 1 uvcvideo, Live 0x0000000000000000

sparse_keymap 13890 1 asus_wmi, Live 0x0000000000000000

cfg80211 520257 3 iwlmvm,mac80211,iwlwifi, Live 0x0000000000000000

i915 1031913 6 - Live 0x0000000000000000

ablk_helper 13597 1 aesni_intel, Live 0x0000000000000000

snd_seq_midi 13564 0 - Live 0x0000000000000000

snd_seq_midi_event 14899 1 snd_seq_midi, Live 0x0000000000000000

cryptd 20531 3 ghash_clmulni_intel,aesni_intel,ablk_helper, Live
0x0000000000000000

snd_rawmidi 31197 1 snd_seq_midi, Live 0x0000000000000000

v4l2_common 15715 1 videobuf2_core, Live 0x0000000000000000

serio_raw 13483 0 - Live 0x0000000000000000

videodev 163831 3 uvcvideo,videobuf2_core,v4l2_common, Live 0x0000000000000000

media 22008 2 uvcvideo,videodev, Live 0x0000000000000000

drm_kms_helper 99802 1 i915, Live 0x0000000000000000

snd_seq 63540 2 snd_seq_midi,snd_seq_midi_event, Live 0x0000000000000000

i2c_hid 19065 0 - Live 0x0000000000000000

snd_seq_device 14497 3 snd_seq_midi,snd_rawmidi,snd_seq, Live 0x0000000000000000

snd_timer 30118 2 snd_pcm,snd_seq, Live 0x0000000000000000

hid_multitouch 17657 0 - Live 0x0000000000000000

drm 323675 5 i915,drm_kms_helper, Live 0x0000000000000000

btusb 32691 0 - Live 0x0000000000000000

ak8975 13391 0 - Live 0x0000000000000000

bluetooth 486890 22 rfcomm,bnep,btusb, Live 0x0000000000000000

int3400_thermal 13040 0 - Live 0x0000000000000000

shpchp 37216 0 - Live 0x0000000000000000

industrialio 55454 1 ak8975, Live 0x0000000000000000

snd 84025 23 snd_hda_codec_realtek,snd_hda_codec_generic,snd_hda_codec_hdmi,snd_hda_intel,snd_soc_core,snd_hda_codec,snd_compress,snd_hwdep,snd_pcm,snd_rawmidi,snd_seq,snd_seq_device,snd_timer,
Live 0x0000000000000000

acpi_thermal_rel 13807 1 int3400_thermal, Live 0x0000000000000000

soundcore 15091 2 snd_hda_codec,snd, Live 0x0000000000000000

wmi 19379 1 asus_wmi, Live 0x0000000000000000

i2c_algo_bit 13564 1 i915, Live 0x0000000000000000

parport_pc 32909 0 - Live 0x0000000000000000

mei_me 19565 0 - Live 0x0000000000000000

ppdev 17711 0 - Live 0x0000000000000000

i2c_designware_platform 13025 0 - Live 0x0000000000000000

lpc_ich 21176 0 - Live 0x0000000000000000

dw_dmac 12835 0 - Live 0x0000000000000000

video 20649 2 asus_wmi,i915, Live 0x0000000000000000

i2c_designware_core 14990 1 i2c_designware_platform, Live 0x0000000000000000

lp 17799 0 - Live 0x0000000000000000

dw_dmac_core 28558 1 dw_dmac, Live 0x0000000000000000

mei 88473 1 mei_me, Live 0x0000000000000000

parport 42481 3 parport_pc,ppdev,lp, Live 0x0000000000000000

8250_dw 13474 0 - Live 0x0000000000000000

snd_soc_sst_acpi 13007 0 - Live 0x0000000000000000

spi_pxa2xx_platform 23256 0 - Live 0x0000000000000000

int3402_thermal 13060 0 - Live 0x0000000000000000

mac_hid 13275 0 - Live 0x0000000000000000

hid_generic 12559 0 - Live 0x0000000000000000

usbhid 53155 0 - Live 0x0000000000000000

hid 110572 4 i2c_hid,hid_multitouch,hid_generic,usbhid, Live 0x0000000000000000

psmouse 118117 0 - Live 0x0000000000000000

ahci 34220 4 - Live 0x0000000000000000

libahci 32446 1 ahci, Live 0x0000000000000000

sdhci_acpi 13502 0 - Live 0x0000000000000000

sdhci 43929 1 sdhci_acpi, Live 0x0000000000000000

[7.4.] Loaded driver and hardware information (/proc/ioports, /proc/iomem)
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

0240-0259 : pnp 00:05

04d0-04d1 : pnp 00:04

0680-069f : pnp 00:01

0cf8-0cff : PCI conf1

0d00-ffff : PCI Bus 0000:00

164e-164f : pnp 00:01

1800-1803 : ACPI PM1a_EVT_BLK

1804-1805 : ACPI PM1a_CNT_BLK

1808-180b : ACPI PM_TMR

1810-1815 : ACPI CPU throttle

1830-1833 : iTCO_wdt

1850-1850 : ACPI PM2_CNT_BLK

1854-1857 : pnp 00:03

1860-187f : iTCO_wdt

1880-189f : ACPI GPE0_BLK

1c00-1fff : INT33C7:00

1c00-1fff : lp-gpio

f000-f03f : 0000:00:02.0

f040-f05f : 0000:00:1f.3

f060-f07f : 0000:00:1f.2

f060-f07f : ahci

f080-f083 : 0000:00:1f.2

f080-f083 : ahci

f090-f097 : 0000:00:1f.2

f090-f097 : ahci

f0a0-f0a3 : 0000:00:1f.2

f0a0-f0a3 : ahci

f0b0-f0b7 : 0000:00:1f.2

f0b0-f0b7 : ahci

ffff-ffff : pnp 00:01

ffff-ffff : pnp 00:01

ffff-ffff : pnp 00:01


00000000-00000fff : reserved

00001000-00057fff : System RAM

00058000-00058fff : reserved

00059000-0009dfff : System RAM

0009e000-0009ffff : reserved

000a0000-000bffff : PCI Bus 0000:00

000c0000-000c3fff : PCI Bus 0000:00

000c4000-000c7fff : PCI Bus 0000:00

000c8000-000cbfff : PCI Bus 0000:00

000cc000-000cffff : PCI Bus 0000:00

000d0000-000d3fff : PCI Bus 0000:00

000d4000-000d7fff : PCI Bus 0000:00

000d8000-000dbfff : PCI Bus 0000:00

000dc000-000dffff : PCI Bus 0000:00

000e0000-000e3fff : PCI Bus 0000:00

000e4000-000e7fff : PCI Bus 0000:00

000e8000-000ebfff : PCI Bus 0000:00

000ec000-000effff : PCI Bus 0000:00

000f0000-000fffff : System ROM

00100000-bda9bfff : System RAM

02000000-027ae357 : Kernel code

027ae358-02d1997f : Kernel data

02e80000-02fc8fff : Kernel bss

bda9c000-bdaa2fff : ACPI Non-volatile Storage

bdaa3000-be2f9fff : System RAM

be2fa000-be578fff : reserved

be579000-cd917fff : System RAM

cd918000-cdb1ffff : reserved

cdb20000-cde5dfff : System RAM

cde5e000-ceb29fff : ACPI Non-volatile Storage

ceb2a000-cef53fff : reserved

cef54000-ceffefff : reserved

cefff000-ceffffff : System RAM

cf000000-cfbfffff : RAM buffer

cfc00000-dfdfffff : reserved

cfe00000-dfdfffff : Graphics Stolen Memory

dfe00000-feafffff : PCI Bus 0000:00

e0000000-efffffff : 0000:00:02.0

f7800000-f7bfffff : 0000:00:02.0

f7c00000-f7cfffff : PCI Bus 0000:02

f7c00000-f7c01fff : 0000:02:00.0

f7c00000-f7c01fff : iwlwifi

f7d00000-f7d0ffff : 0000:00:14.0

f7d00000-f7d0ffff : xhci-hcd

f7d10000-f7d17fff : 0000:00:04.0

f7d18000-f7d1bfff : 0000:00:1b.0

f7d18000-f7d1bfff : ICH HD audio

f7d1c000-f7d1ffff : 0000:00:03.0

f7d1c000-f7d1ffff : ICH HD audio

f7d21000-f7d210ff : 0000:00:1f.3

f7d22000-f7d227ff : 0000:00:1f.2

f7d22000-f7d227ff : ahci

f7d23000-f7d233ff : 0000:00:1d.0

f7d23000-f7d233ff : ehci_hcd

f7d25000-f7d2501f : 0000:00:16.0

f7d25000-f7d2501f : mei_me

f7fdf000-f7fdffff : pnp 00:09

f7fe0000-f7feffff : pnp 00:09

f8000000-fbffffff : PCI MMCONFIG 0000 [bus 00-3f]

f8000000-fbffffff : reserved

f8000000-fbffffff : pnp 00:09

fe103000-fe103fff : INT33C2:00

fe103000-fe103fff : INT33C2:00

fe104000-fe104fff : pnp 00:08

fec00000-fec00fff : reserved

fec00000-fec003ff : IOAPIC 0

fed00000-fed03fff : reserved

fed00000-fed003ff : HPET 0

fed00000-fed003ff : PNP0103:00

fed10000-fed17fff : pnp 00:09

fed18000-fed18fff : pnp 00:09

fed19000-fed19fff : pnp 00:09

fed1c000-fed1ffff : reserved

fed1c000-fed1ffff : pnp 00:09

fed1f410-fed1f414 : iTCO_wdt

fed20000-fed3ffff : pnp 00:09

fed40000-fed44fff : pnp 00:00

fed45000-fed8ffff : pnp 00:09

fed90000-fed90fff : dmar0

fed91000-fed91fff : dmar1

fee00000-fee00fff : Local APIC

fee00000-fee00fff : reserved

ff000000-ffffffff : reserved

ff000000-ffffffff : INT0800:00

ff000000-ffffffff : pnp 00:09

100000000-11f1fffff : System RAM

11f200000-11fffffff : RAM buffer

[7.5.] PCI information ('lspci -vvv' as root)
00:00.0 Host bridge: Intel Corporation Haswell-ULT DRAM Controller (rev 0b)

00:02.0 VGA compatible controller: Intel Corporation Haswell-ULT
Integrated Graphics Controller (rev 0b)

00:03.0 Audio device: Intel Corporation Haswell-ULT HD Audio Controller (rev 0b)

00:04.0 Signal processing controller: Intel Corporation Device 0a03 (rev 0b)

00:14.0 USB controller: Intel Corporation 8 Series USB xHCI HC (rev 04)

00:16.0 Communication controller: Intel Corporation 8 Series HECI #0 (rev 04)

00:1b.0 Audio device: Intel Corporation 8 Series HD Audio Controller (rev 04)

00:1c.0 PCI bridge: Intel Corporation 8 Series PCI Express Root Port 1 (rev e4)

00:1c.3 PCI bridge: Intel Corporation 8 Series PCI Express Root Port 4 (rev e4)

00:1d.0 USB controller: Intel Corporation 8 Series USB EHCI #1 (rev 04)

00:1f.0 ISA bridge: Intel Corporation 8 Series LPC Controller (rev 04)

00:1f.2 SATA controller: Intel Corporation 8 Series SATA Controller 1
[AHCI mode] (rev 04)

00:1f.3 SMBus: Intel Corporation 8 Series SMBus Controller (rev 04)

02:00.0 Network controller: Intel Corporation Wireless 7260 (rev cb)

[7.6.] SCSI information (from /proc/scsi/scsi)
Attached devices:

Host: scsi0 Channel: 00 Id: 00 Lun: 00

Vendor: ATA Model: TOSHIBA MQ01ABF0 Rev: 1J

Type: Direct-Access ANSI SCSI revision: 05


7.7.] Other information that might be relevant to the problem (please
look in /proc and include all information that you think to be
relevant):

ls /proc
1 1486 21 2347 26 3071 44 844 dma partitions

10 149 2122 2349 2644 31 45 848 driver sched_debug

11 15 2128 2355 2652 3164 46 853 execdomains schedstat

1103 150 2129 2356 2667 32 47 898 fb scsi

1107 151 2143 2380 2668 3253 48 899 filesystems self

1115 1513 2157 24 27 3283 483 9 fs slabinfo

1117 152 2159 2428 2708 33 491 902 interrupts softirqs

1120 158 2161 2444 2714 34 5 907 iomem stat

1152 1591 2165 2465 2716 342 50 908 ioports swaps

1196 160 2185 2466 2731 348 51 91 irq sys

1197 1608 2189 2473 2756 35 516 916 kallsyms sysrq-trigger

12 168 2192 2480 2782 36 518 917 kcore sysvipc

1271 169 22 2484 2792 363 521 92 keys thread-self

13 1695 2201 2485 2794 37 529 926 key-users timer_list

1318 17 2210 2486 28 38 53 947 kmsg timer_stats

1385 18 2212 2487 282 39 54 948 kpagecount tty

14 1851 2215 2496 283 395 55 acpi kpageflags uptime

1400 19 2233 25 2832 40 644 asound loadavg version

1412 2 2254 2502 2863 408 67 buddyinfo locks vmallocinfo

1415 20 2268 2515 2879 409 68 bus mdstat vmstat

143 2004 2285 2520 2896 41 7 cgroups meminfo zoneinfo

144 2007 2296 2530 29 410 70 cmdline misc

1442 2070 2298 254 2907 411 71 consoles modules

145 2071 2339 2541 2916 42 72 cpuinfo mounts

146 2088 2340 2544 2917 428 8 crypto mtrr

147 2098 2342 2552 2929 429 817 devices net

148 2099 2346 2571 3 43 840 diskstats pagetypeinfo

[X.] Other notes, patches, fixes, workarounds:
https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1387984
