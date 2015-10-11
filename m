From: Daniel d'Andrada <daniel.dandrada@canonical.com>
Subject: PROBLEM: "Wi-fi disabled by hardware switch" permanently on Lenovo
 Yoga 2 13
Date: Sun, 11 Oct 2015 10:35:18 -0300
Message-ID: <561A6596.8070201@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from youngberry.canonical.com ([91.189.89.112]:47414 "EHLO
	youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750853AbbJKNfX (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 11 Oct 2015 09:35:23 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org
Cc: Ike Panhc <ike.pan@canonical.com>

[1.] "Wi-fi disabled by hardware switch" permanently on Lenovo Yoga 2 13

[2.] Full description of the problem/report:
Can't use wifi at all. The indicator panel says "Wi-fi disabled by 
hardware switch". Pressing the "airplane mode" key makes no difference.
Once I blacklisted ideapad_laptop kernel module, I did get wi-fi back. 
But after a couple of minutes it would become slow and unreliable to be 
point of being unusable.
Also the "? /" key doesn't work at all (it has a pt-BR keyboard layout)
It all works fine under Win 8 (the OS that ships with this laptop).

[4.] Kernel version (from /proc/version):
Linux version 4.3.0-040300rc4-generic (kernel@gomeisa) (gcc version 
4.8.4 (Ubuntu 4.8.4-2ubuntu1~14.04) ) #201510041330 SMP Sun Oct 4 
17:32:10 UTC 2015

[7.] Environment
Description:    Ubuntu Wily Werewolf (development branch)
Release:    15.10

[7.1.] Software (add the output of the ver_linux script here)
Linux 4.3.0-040300rc4-generic #201510041330 SMP Sun Oct 4 17:32:10 UTC 
2015 x86_64 x86_64 x86_64 GNU/Linux

Gnu C                  5.2.1
Gnu make               4.0
binutils               2.25.1
util-linux             2.26.2
mount                  debug
module-init-tools      21
e2fsprogs              1.42.12
pcmciautils            018
PPP                    2.4.6
Linux C Library        2.21
Dynamic linker (ldd)   2.21
Procps                 3.3.9
Net-tools              1.60
Kbd                    1.15.5
Sh-utils               8.23
wireless-tools         30
Modules Loaded         rfcomm bnep rtsx_usb_ms memstick rtsx_usb_sdmmc 
ax88179_178a rtsx_usb usbnet mii hid_sensor_rotation hid_sensor_als 
hid_sensor_magn_3d hid_sensor_accel_3d hid_sensor_gyro_3d 
hid_sensor_incl_3d hid_sensor_trigger industrialio_triggered_buffer 
kfifo_buf uvcvideo industrialio btusb btrtl hid_sensor_iio_common btbcm 
btintel hid_sensor_custom videobuf2_vmalloc videobuf2_memops 
videobuf2_core bluetooth v4l2_common hid_sensor_hub videodev 
hid_multitouch usbhid media drbg ansi_cprng dm_crypt arc4 intel_rapl 
iosf_mbi iwlmvm mac80211 x86_pkg_temp_thermal intel_powerclamp coretemp 
kvm crct10dif_pclmul crc32_pclmul ghash_clmulni_intel aesni_intel 
aes_x86_64 snd_hda_codec_hdmi snd_hda_codec_realtek snd_soc_rt5640 
snd_hda_codec_generic snd_soc_rl6231 snd_hda_intel lrw iwlwifi gf128mul 
snd_soc_core snd_hda_codec glue_helper snd_hda_core snd_compress 
ac97_bus snd_pcm_dmaengine snd_hwdep cfg80211 snd_pcm snd_seq_midi 
snd_seq_midi_event input_leds joydev snd_rawmidi ablk_helper snd_seq 
ideapad_laptop cryptd serio_raw snd_seq_device snd_timer elan_i2c 
sparse_keymap snd mei_me dw_dmac shpchp lpc_ich mei dw_dmac_core 
soundcore snd_soc_sst_acpi soc_button_array i2c_designware_platform 
spi_pxa2xx_platform 8250_dw i2c_designware_core mac_hid parport_pc ppdev 
lp parport autofs4 i915 i2c_algo_bit drm_kms_helper syscopyarea 
sysfillrect sysimgblt fb_sys_fops psmouse drm ahci libahci video i2c_hid 
sdhci_acpi sdhci hid fjes

[7.2.] Processor information (from /proc/cpuinfo):
processor    : 3
vendor_id    : GenuineIntel
cpu family    : 6
model        : 69
model name    : Intel(R) Core(TM) i3-4010U CPU @ 1.70GHz
stepping    : 1
microcode    : 0x17
cpu MHz        : 1255.675
cache size    : 3072 KB
physical id    : 0
siblings    : 4
core id        : 1
cpu cores    : 2
apicid        : 3
initial apicid    : 3
fpu        : yes
fpu_exception    : yes
cpuid level    : 13
wp        : yes
flags        : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca 
cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall 
nx pdpe1gb rdtscp lm constant_tsc arch_perfmon pebs bts rep_good nopl 
xtopology nonstop_tsc aperfmperf eagerfpu pni pclmulqdq dtes64 monitor 
ds_cpl vmx est tm2 ssse3 sdbg fma cx16 xtpr pdcm pcid sse4_1 sse4_2 
x2apic movbe popcnt tsc_deadline_timer aes xsave avx f16c rdrand lahf_lm 
abm arat epb pln pts dtherm tpr_shadow vnmi flexpriority ept vpid 
fsgsbase tsc_adjust bmi1 avx2 smep bmi2 erms invpcid xsaveopt
bugs        :
bogomips    : 3392.04
clflush size    : 64
cache_alignment    : 64
address sizes    : 39 bits physical, 48 bits virtual
power management:

[7.3.] Module information (from /proc/modules):
rfcomm 69632 0 - Live 0x0000000000000000
bnep 20480 2 - Live 0x0000000000000000
rtsx_usb_ms 20480 0 - Live 0x0000000000000000
memstick 20480 1 rtsx_usb_ms, Live 0x0000000000000000
rtsx_usb_sdmmc 28672 0 - Live 0x0000000000000000
ax88179_178a 24576 0 - Live 0x0000000000000000
rtsx_usb 24576 2 rtsx_usb_ms,rtsx_usb_sdmmc, Live 0x0000000000000000
usbnet 40960 1 ax88179_178a, Live 0x0000000000000000
mii 16384 2 ax88179_178a,usbnet, Live 0x0000000000000000
hid_sensor_rotation 16384 0 - Live 0x0000000000000000
hid_sensor_als 16384 0 - Live 0x0000000000000000
hid_sensor_magn_3d 16384 0 - Live 0x0000000000000000
hid_sensor_accel_3d 16384 0 - Live 0x0000000000000000
hid_sensor_gyro_3d 16384 0 - Live 0x0000000000000000
hid_sensor_incl_3d 16384 0 - Live 0x0000000000000000
hid_sensor_trigger 16384 12 
hid_sensor_rotation,hid_sensor_als,hid_sensor_magn_3d,hid_sensor_accel_3d,hid_sensor_gyro_3d,hid_sensor_incl_3d, 
Live 0x0000000000000000
industrialio_triggered_buffer 16384 6 
hid_sensor_rotation,hid_sensor_als,hid_sensor_magn_3d,hid_sensor_accel_3d,hid_sensor_gyro_3d,hid_sensor_incl_3d, 
Live 0x0000000000000000
kfifo_buf 16384 1 industrialio_triggered_buffer, Live 0x0000000000000000
uvcvideo 90112 0 - Live 0x0000000000000000
industrialio 57344 9 
hid_sensor_rotation,hid_sensor_als,hid_sensor_magn_3d,hid_sensor_accel_3d,hid_sensor_gyro_3d,hid_sensor_incl_3d,hid_sensor_trigger,industrialio_triggered_buffer,kfifo_buf, 
Live 0x0000000000000000
btusb 45056 0 - Live 0x0000000000000000
btrtl 16384 1 btusb, Live 0x0000000000000000
hid_sensor_iio_common 16384 7 
hid_sensor_rotation,hid_sensor_als,hid_sensor_magn_3d,hid_sensor_accel_3d,hid_sensor_gyro_3d,hid_sensor_incl_3d,hid_sensor_trigger, 
Live 0x0000000000000000
btbcm 16384 1 btusb, Live 0x0000000000000000
btintel 16384 1 btusb, Live 0x0000000000000000
hid_sensor_custom 20480 0 - Live 0x0000000000000000
videobuf2_vmalloc 16384 1 uvcvideo, Live 0x0000000000000000
videobuf2_memops 16384 1 videobuf2_vmalloc, Live 0x0000000000000000
videobuf2_core 49152 1 uvcvideo, Live 0x0000000000000000
bluetooth 516096 29 rfcomm,bnep,btusb,btrtl,btbcm,btintel, Live 
0x0000000000000000
v4l2_common 16384 1 videobuf2_core, Live 0x0000000000000000
hid_sensor_hub 20480 9 
hid_sensor_rotation,hid_sensor_als,hid_sensor_magn_3d,hid_sensor_accel_3d,hid_sensor_gyro_3d,hid_sensor_incl_3d,hid_sensor_trigger,hid_sensor_iio_common,hid_sensor_custom, 
Live 0x0000000000000000
videodev 172032 3 uvcvideo,videobuf2_core,v4l2_common, Live 
0x0000000000000000
hid_multitouch 20480 0 - Live 0x0000000000000000
usbhid 49152 0 - Live 0x0000000000000000
media 24576 2 uvcvideo,videodev, Live 0x0000000000000000
drbg 28672 1 - Live 0x0000000000000000
ansi_cprng 16384 0 - Live 0x0000000000000000
dm_crypt 28672 1 - Live 0x0000000000000000
arc4 16384 2 - Live 0x0000000000000000
intel_rapl 20480 0 - Live 0x0000000000000000
iosf_mbi 16384 1 intel_rapl, Live 0x0000000000000000
iwlmvm 307200 0 - Live 0x0000000000000000
mac80211 724992 1 iwlmvm, Live 0x0000000000000000
x86_pkg_temp_thermal 16384 0 - Live 0x0000000000000000
intel_powerclamp 16384 0 - Live 0x0000000000000000
coretemp 16384 0 - Live 0x0000000000000000
kvm 507904 0 - Live 0x0000000000000000
crct10dif_pclmul 16384 0 - Live 0x0000000000000000
crc32_pclmul 16384 0 - Live 0x0000000000000000
ghash_clmulni_intel 16384 0 - Live 0x0000000000000000
aesni_intel 167936 205 - Live 0x0000000000000000
aes_x86_64 20480 1 aesni_intel, Live 0x0000000000000000
snd_hda_codec_hdmi 49152 1 - Live 0x0000000000000000
snd_hda_codec_realtek 81920 1 - Live 0x0000000000000000
snd_soc_rt5640 114688 0 - Live 0x0000000000000000
snd_hda_codec_generic 73728 1 snd_hda_codec_realtek, Live 0x0000000000000000
snd_soc_rl6231 16384 1 snd_soc_rt5640, Live 0x0000000000000000
snd_hda_intel 36864 5 - Live 0x0000000000000000
lrw 16384 1 aesni_intel, Live 0x0000000000000000
iwlwifi 208896 1 iwlmvm, Live 0x0000000000000000
gf128mul 16384 1 lrw, Live 0x0000000000000000
snd_soc_core 192512 1 snd_soc_rt5640, Live 0x0000000000000000
snd_hda_codec 135168 4 
snd_hda_codec_hdmi,snd_hda_codec_realtek,snd_hda_codec_generic,snd_hda_intel, 
Live 0x0000000000000000
glue_helper 16384 1 aesni_intel, Live 0x0000000000000000
snd_hda_core 65536 5 
snd_hda_codec_hdmi,snd_hda_codec_realtek,snd_hda_codec_generic,snd_hda_intel,snd_hda_codec, 
Live 0x0000000000000000
snd_compress 20480 1 snd_soc_core, Live 0x0000000000000000
ac97_bus 16384 1 snd_soc_core, Live 0x0000000000000000
snd_pcm_dmaengine 16384 1 snd_soc_core, Live 0x0000000000000000
snd_hwdep 16384 1 snd_hda_codec, Live 0x0000000000000000
cfg80211 540672 3 iwlmvm,mac80211,iwlwifi, Live 0x0000000000000000
snd_pcm 102400 7 
snd_hda_codec_hdmi,snd_soc_rt5640,snd_hda_intel,snd_soc_core,snd_hda_codec,snd_hda_core,snd_pcm_dmaengine, 
Live 0x0000000000000000
snd_seq_midi 16384 0 - Live 0x0000000000000000
snd_seq_midi_event 16384 1 snd_seq_midi, Live 0x0000000000000000
input_leds 16384 0 - Live 0x0000000000000000
joydev 20480 0 - Live 0x0000000000000000
snd_rawmidi 32768 1 snd_seq_midi, Live 0x0000000000000000
ablk_helper 16384 1 aesni_intel, Live 0x0000000000000000
snd_seq 69632 2 snd_seq_midi,snd_seq_midi_event, Live 0x0000000000000000
ideapad_laptop 24576 0 - Live 0x0000000000000000
cryptd 20480 105 ghash_clmulni_intel,aesni_intel,ablk_helper, Live 
0x0000000000000000
serio_raw 16384 0 - Live 0x0000000000000000
snd_seq_device 16384 3 snd_seq_midi,snd_rawmidi,snd_seq, Live 
0x0000000000000000
snd_timer 32768 2 snd_pcm,snd_seq, Live 0x0000000000000000
elan_i2c 36864 0 - Live 0x0000000000000000
sparse_keymap 16384 1 ideapad_laptop, Live 0x0000000000000000
snd 81920 23 
snd_hda_codec_hdmi,snd_hda_codec_realtek,snd_hda_codec_generic,snd_hda_intel,snd_soc_core,snd_hda_codec,snd_compress,snd_hwdep,snd_pcm,snd_rawmidi,snd_seq,snd_seq_device,snd_timer, 
Live 0x0000000000000000
mei_me 28672 0 - Live 0x0000000000000000
dw_dmac 16384 0 - Live 0x0000000000000000
shpchp 36864 0 - Live 0x0000000000000000
lpc_ich 24576 0 - Live 0x0000000000000000
mei 98304 1 mei_me, Live 0x0000000000000000
dw_dmac_core 24576 1 dw_dmac, Live 0x0000000000000000
soundcore 16384 1 snd, Live 0x0000000000000000
snd_soc_sst_acpi 16384 0 - Live 0x0000000000000000
soc_button_array 16384 0 - Live 0x0000000000000000
i2c_designware_platform 16384 0 - Live 0x0000000000000000
spi_pxa2xx_platform 24576 0 - Live 0x0000000000000000
8250_dw 16384 0 - Live 0x0000000000000000
i2c_designware_core 16384 1 i2c_designware_platform, Live 0x0000000000000000
mac_hid 16384 0 - Live 0x0000000000000000
parport_pc 36864 0 - Live 0x0000000000000000
ppdev 20480 0 - Live 0x0000000000000000
lp 20480 0 - Live 0x0000000000000000
parport 49152 3 parport_pc,ppdev,lp, Live 0x0000000000000000
autofs4 40960 2 - Live 0x0000000000000000
i915 1138688 4 - Live 0x0000000000000000
i2c_algo_bit 16384 1 i915, Live 0x0000000000000000
drm_kms_helper 131072 1 i915, Live 0x0000000000000000
syscopyarea 16384 1 drm_kms_helper, Live 0x0000000000000000
sysfillrect 16384 1 drm_kms_helper, Live 0x0000000000000000
sysimgblt 16384 1 drm_kms_helper, Live 0x0000000000000000
fb_sys_fops 16384 1 drm_kms_helper, Live 0x0000000000000000
psmouse 122880 0 - Live 0x0000000000000000
drm 352256 5 i915,drm_kms_helper, Live 0x0000000000000000
ahci 36864 2 - Live 0x0000000000000000
libahci 32768 1 ahci, Live 0x0000000000000000
video 36864 2 ideapad_laptop,i915, Live 0x0000000000000000
i2c_hid 20480 0 - Live 0x0000000000000000
sdhci_acpi 16384 0 - Live 0x0000000000000000
sdhci 45056 1 sdhci_acpi, Live 0x0000000000000000
hid 118784 4 hid_sensor_hub,hid_multitouch,usbhid,i2c_hid, Live 
0x0000000000000000
fjes 28672 0 - Live 0x0000000000000000

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
   03c0-03df : vesafb
   0680-069f : pnp 00:00
0cf8-0cff : PCI conf1
0d00-ffff : PCI Bus 0000:00
   164e-164f : pnp 00:00
   1800-1803 : ACPI PM1a_EVT_BLK
   1804-1805 : ACPI PM1a_CNT_BLK
   1808-180b : ACPI PM_TMR
   1810-1815 : ACPI CPU throttle
   1830-1833 : iTCO_wdt.0.auto
   1850-1850 : ACPI PM2_CNT_BLK
   1854-1857 : pnp 00:02
   1860-187f : iTCO_wdt.0.auto
   1880-189f : ACPI GPE0_BLK
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
   fd60-fd63 : pnp 00:00
   ffff-ffff : pnp 00:00
     ffff-ffff : pnp 00:00
       ffff-ffff : pnp 00:00


00000000-00000fff : reserved
00001000-0009d3ff : System RAM
0009d400-0009ffff : reserved
000a0000-000bffff : PCI Bus 0000:00
000c0000-000cebff : Video ROM
000cf000-000cffff : Adapter ROM
000d0000-000d0fff : Adapter ROM
000e0000-000fffff : reserved
   000f0000-000fffff : System ROM
00100000-9735ffff : System RAM
   01000000-017b908b : Kernel code
   017b908c-01d3c4ff : Kernel data
   01eb3000-01ff7fff : Kernel bss
97360000-97b5ffff : reserved
97b60000-9cabefff : System RAM
9cabf000-9cebefff : reserved
9cebf000-9cfbefff : ACPI Non-volatile Storage
9cfbf000-9cffefff : ACPI Tables
9cfff000-9cffffff : System RAM
9d000000-9f9fffff : reserved
   9da00000-9f9fffff : Graphics Stolen Memory
9fa00000-feafffff : PCI Bus 0000:00
   9fa10000-9fa1ffff : pnp 00:05
   9fa20000-9fa20fff : pnp 00:05
   a0000000-afffffff : 0000:00:02.0
   b0000000-b03fffff : 0000:00:02.0
   b0400000-b04fffff : PCI Bus 0000:01
     b0400000-b0401fff : 0000:01:00.0
       b0400000-b0401fff : iwlwifi
   b0500000-b050ffff : 0000:00:14.0
     b0500000-b050ffff : xhci-hcd
   b0510000-b0513fff : 0000:00:03.0
     b0510000-b0513fff : ICH HD audio
   b0514000-b0517fff : 0000:00:1b.0
     b0514000-b0517fff : ICH HD audio
   b0518000-b051801f : 0000:00:16.0
     b0518000-b051801f : mei_me
   b0519000-b05190ff : 0000:00:1f.3
   b051b000-b051b7ff : 0000:00:1f.2
     b051b000-b051b7ff : ahci
   b051c000-b051c3ff : 0000:00:1d.0
     b051c000-b051c3ff : ehci_hcd
   e0000000-efffffff : PCI MMCONFIG 0000 [bus 00-ff]
     e0000000-efffffff : reserved
       e0000000-efffffff : pnp 00:05
   fe101000-fe112fff : reserved
feb00000-feb0ffff : reserved
fec00000-fec00fff : reserved
   fec00000-fec003ff : IOAPIC 0
fed00000-fee00fff : reserved
   fed00000-fed003ff : HPET 0
     fed00000-fed003ff : PNP0103:00
   fed10000-fed17fff : pnp 00:05
   fed18000-fed18fff : pnp 00:05
   fed19000-fed19fff : pnp 00:05
   fed1c000-fed1ffff : pnp 00:05
     fed1f410-fed1f414 : iTCO_wdt.0.auto
   fed20000-fed3ffff : pnp 00:05
   fed90000-fed90fff : dmar0
   fed91000-fed91fff : dmar1
   fee00000-fee00fff : Local APIC
ff000000-ff000fff : pnp 00:05
ff010000-ffffffff : INT0800:00
   ffa00000-ffffffff : reserved
100000000-15f5fffff : System RAM
15f600000-15fffffff : RAM buffer

[7.5.] PCI information ('lspci -vvv' as root)
00:00.0 Host bridge: Intel Corporation Haswell-ULT DRAM Controller (rev 09)
     Subsystem: Lenovo Device 3978
     Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- 
Stepping- SERR- FastB2B- DisINTx-
     Status: Cap+ 66MHz- UDF- FastB2B+ ParErr- DEVSEL=fast >TAbort- 
<TAbort- <MAbort+ >SERR- <PERR- INTx-
     Latency: 0
     Capabilities: [e0] Vendor Specific Information: Len=0c <?>
     Kernel driver in use: hsw_uncore

00:02.0 VGA compatible controller: Intel Corporation Haswell-ULT 
Integrated Graphics Controller (rev 09) (prog-if 00 [VGA controller])
     Subsystem: Lenovo Device 3978
     Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- 
Stepping- SERR- FastB2B- DisINTx+
     Status: Cap+ 66MHz- UDF- FastB2B+ ParErr- DEVSEL=fast >TAbort- 
<TAbort- <MAbort- >SERR- <PERR- INTx-
     Latency: 0
     Interrupt: pin A routed to IRQ 45
     Region 0: Memory at b0000000 (64-bit, non-prefetchable) [size=4M]
     Region 2: Memory at a0000000 (64-bit, prefetchable) [size=256M]
     Region 4: I/O ports at 3000 [size=64]
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

00:03.0 Audio device: Intel Corporation Haswell-ULT HD Audio Controller 
(rev 09)
     Subsystem: Lenovo Device 3978
     Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- 
Stepping- SERR- FastB2B- DisINTx+
     Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- 
<TAbort- <MAbort- >SERR- <PERR- INTx-
     Latency: 0, Cache Line Size: 64 bytes
     Interrupt: pin A routed to IRQ 49
     Region 0: Memory at b0510000 (64-bit, non-prefetchable) [size=16K]
     Capabilities: [50] Power Management version 2
         Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA 
PME(D0-,D1-,D2-,D3hot-,D3cold-)
         Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-
     Capabilities: [60] MSI: Enable+ Count=1/1 Maskable- 64bit-
         Address: fee002d8  Data: 0000
     Capabilities: [70] Express (v1) Root Complex Integrated Endpoint, 
MSI 00
         DevCap:    MaxPayload 128 bytes, PhantFunc 0
             ExtTag- RBE-
         DevCtl:    Report errors: Correctable- Non-Fatal- Fatal- 
Unsupported-
             RlxdOrd- ExtTag- PhantFunc- AuxPwr- NoSnoop-
             MaxPayload 128 bytes, MaxReadReq 128 bytes
         DevSta:    CorrErr- UncorrErr- FatalErr- UnsuppReq- AuxPwr- 
TransPend-
     Kernel driver in use: snd_hda_intel

00:14.0 USB controller: Intel Corporation 8 Series USB xHCI HC (rev 04) 
(prog-if 30 [XHCI])
     Subsystem: Lenovo Device 3978
     Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- 
Stepping- SERR- FastB2B- DisINTx+
     Status: Cap+ 66MHz- UDF- FastB2B+ ParErr- DEVSEL=medium >TAbort- 
<TAbort- <MAbort- >SERR- <PERR- INTx-
     Latency: 0
     Interrupt: pin A routed to IRQ 43
     Region 0: Memory at b0500000 (64-bit, non-prefetchable) [size=64K]
     Capabilities: [70] Power Management version 2
         Flags: PMEClk- DSI- D1- D2- AuxCurrent=375mA 
PME(D0-,D1-,D2-,D3hot+,D3cold+)
         Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
     Capabilities: [80] MSI: Enable+ Count=1/8 Maskable- 64bit+
         Address: 00000000fee00238  Data: 0000
     Kernel driver in use: xhci_hcd

00:16.0 Communication controller: Intel Corporation 8 Series HECI #0 
(rev 04)
     Subsystem: Lenovo Device 3978
     Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- 
Stepping- SERR- FastB2B- DisINTx+
     Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- 
<TAbort- <MAbort- >SERR- <PERR- INTx-
     Latency: 0
     Interrupt: pin A routed to IRQ 46
     Region 0: Memory at b0518000 (64-bit, non-prefetchable) [size=32]
     Capabilities: [50] Power Management version 3
         Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA 
PME(D0+,D1-,D2-,D3hot+,D3cold+)
         Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
     Capabilities: [8c] MSI: Enable+ Count=1/1 Maskable- 64bit+
         Address: 00000000fee00298  Data: 0000
     Kernel driver in use: mei_me

00:1b.0 Audio device: Intel Corporation 8 Series HD Audio Controller 
(rev 04)
     Subsystem: Lenovo Device 3978
     Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- 
Stepping- SERR- FastB2B- DisINTx+
     Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- 
<TAbort- <MAbort- >SERR- <PERR- INTx-
     Latency: 0, Cache Line Size: 64 bytes
     Interrupt: pin A routed to IRQ 48
     Region 0: Memory at b0514000 (64-bit, non-prefetchable) [size=16K]
     Capabilities: [50] Power Management version 3
         Flags: PMEClk- DSI- D1- D2- AuxCurrent=55mA 
PME(D0+,D1-,D2-,D3hot+,D3cold+)
         Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-
     Capabilities: [60] MSI: Enable+ Count=1/1 Maskable- 64bit+
         Address: 00000000fee002f8  Data: 0000
     Capabilities: [70] Express (v1) Root Complex Integrated Endpoint, 
MSI 00
         DevCap:    MaxPayload 128 bytes, PhantFunc 0
             ExtTag- RBE-
         DevCtl:    Report errors: Correctable- Non-Fatal- Fatal- 
Unsupported-
             RlxdOrd- ExtTag- PhantFunc- AuxPwr- NoSnoop-
             MaxPayload 128 bytes, MaxReadReq 128 bytes
         DevSta:    CorrErr- UncorrErr- FatalErr- UnsuppReq- AuxPwr+ 
TransPend-
     Capabilities: [100 v1] Virtual Channel
         Caps:    LPEVC=0 RefClk=100ns PATEntryBits=1
         Arb:    Fixed- WRR32- WRR64- WRR128-
         Ctrl:    ArbSelect=Fixed
         Status:    InProgress-
         VC0:    Caps:    PATOffset=00 MaxTimeSlots=1 RejSnoopTrans-
             Arb:    Fixed- WRR32- WRR64- WRR128- TWRR128- WRR256-
             Ctrl:    Enable+ ID=0 ArbSelect=Fixed TC/VC=ff
             Status:    NegoPending- InProgress-
         VC1:    Caps:    PATOffset=00 MaxTimeSlots=1 RejSnoopTrans-
             Arb:    Fixed- WRR32- WRR64- WRR128- TWRR128- WRR256-
             Ctrl:    Enable- ID=0 ArbSelect=Fixed TC/VC=00
             Status:    NegoPending- InProgress-
     Kernel driver in use: snd_hda_intel

00:1c.0 PCI bridge: Intel Corporation 8 Series PCI Express Root Port 4 
(rev e4) (prog-if 00 [Normal decode])
     Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- 
Stepping- SERR- FastB2B- DisINTx+
     Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- 
<TAbort- <MAbort- >SERR- <PERR- INTx-
     Latency: 0, Cache Line Size: 64 bytes
     Interrupt: pin D routed to IRQ 42
     Bus: primary=00, secondary=01, subordinate=01, sec-latency=0
     I/O behind bridge: 0000f000-00000fff
     Memory behind bridge: b0400000-b04fffff
     Prefetchable memory behind bridge: 00000000fff00000-00000000000fffff
     Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=fast >TAbort- 
<TAbort- <MAbort- <SERR- <PERR-
     BridgeCtl: Parity- SERR- NoISA- VGA- MAbort- >Reset- FastB2B-
         PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-
     Capabilities: [40] Express (v2) Root Port (Slot+), MSI 00
         DevCap:    MaxPayload 128 bytes, PhantFunc 0
             ExtTag- RBE+
         DevCtl:    Report errors: Correctable- Non-Fatal- Fatal- 
Unsupported-
             RlxdOrd- ExtTag- PhantFunc- AuxPwr- NoSnoop-
             MaxPayload 128 bytes, MaxReadReq 128 bytes
         DevSta:    CorrErr- UncorrErr- FatalErr- UnsuppReq- AuxPwr+ 
TransPend-
         LnkCap:    Port #4, Speed 5GT/s, Width x1, ASPM L0s L1, Exit 
Latency L0s <512ns, L1 <16us
             ClockPM- Surprise- LLActRep+ BwNot+ ASPMOptComp-
         LnkCtl:    ASPM L1 Enabled; RCB 64 bytes Disabled- CommClk+
             ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
         LnkSta:    Speed 2.5GT/s, Width x1, TrErr- Train- SlotClk+ 
DLActive+ BWMgmt+ ABWMgmt-
         SltCap:    AttnBtn- PwrCtrl- MRL- AttnInd- PwrInd- HotPlug- 
Surprise-
             Slot #3, PowerLimit 10.000W; Interlock- NoCompl+
         SltCtl:    Enable: AttnBtn- PwrFlt- MRL- PresDet- CmdCplt- 
HPIrq- LinkChg-
             Control: AttnInd Unknown, PwrInd Unknown, Power- Interlock-
         SltSta:    Status: AttnBtn- PowerFlt- MRL- CmdCplt- PresDet+ 
Interlock-
             Changed: MRL- PresDet- LinkState+
         RootCtl: ErrCorrectable- ErrNon-Fatal- ErrFatal- PMEIntEna+ 
CRSVisible-
         RootCap: CRSVisible-
         RootSta: PME ReqID 0000, PMEStatus- PMEPending-
         DevCap2: Completion Timeout: Range ABC, TimeoutDis+, LTR+, OBFF 
Not Supported ARIFwd-
         DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-, LTR+, 
OBFF Disabled ARIFwd-
         LnkCtl2: Target Link Speed: 5GT/s, EnterCompliance- SpeedDis-
              Transmit Margin: Normal Operating Range, 
EnterModifiedCompliance- ComplianceSOS-
              Compliance De-emphasis: -6dB
         LnkSta2: Current De-emphasis Level: -3.5dB, 
EqualizationComplete-, EqualizationPhase1-
              EqualizationPhase2-, EqualizationPhase3-, 
LinkEqualizationRequest-
     Capabilities: [80] MSI: Enable+ Count=1/1 Maskable- 64bit-
         Address: fee00218  Data: 0000
     Capabilities: [90] Subsystem: Lenovo Device 3978
     Capabilities: [a0] Power Management version 3
         Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA 
PME(D0+,D1-,D2-,D3hot+,D3cold+)
         Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-
     Capabilities: [100 v0] #00
     Capabilities: [200 v1] L1 PM Substates
         L1SubCap: PCI-PM_L1.2+ PCI-PM_L1.1+ ASPM_L1.2+ ASPM_L1.1+ 
L1_PM_Substates+
               PortCommonModeRestoreTime=40us PortTPowerOnTime=10us
     Kernel driver in use: pcieport

00:1d.0 USB controller: Intel Corporation 8 Series USB EHCI #1 (rev 04) 
(prog-if 20 [EHCI])
     Subsystem: Lenovo Device 3978
     Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- 
Stepping- SERR- FastB2B- DisINTx-
     Status: Cap+ 66MHz- UDF- FastB2B+ ParErr- DEVSEL=medium >TAbort- 
<TAbort- <MAbort- >SERR- <PERR- INTx-
     Latency: 0
     Interrupt: pin A routed to IRQ 23
     Region 0: Memory at b051c000 (32-bit, non-prefetchable) [size=1K]
     Capabilities: [50] Power Management version 3
         Flags: PMEClk- DSI- D1- D2- AuxCurrent=375mA 
PME(D0+,D1-,D2-,D3hot+,D3cold+)
         Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
     Capabilities: [58] Debug port: BAR=1 offset=00a0
     Capabilities: [98] PCI Advanced Features
         AFCap: TP+ FLR+
         AFCtrl: FLR-
         AFStatus: TP-
     Kernel driver in use: ehci-pci

00:1f.0 ISA bridge: Intel Corporation 8 Series LPC Controller (rev 04)
     Subsystem: Lenovo Device 3978
     Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- 
Stepping- SERR- FastB2B- DisINTx-
     Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=medium >TAbort- 
<TAbort- <MAbort- >SERR- <PERR- INTx-
     Latency: 0
     Capabilities: [e0] Vendor Specific Information: Len=0c <?>
     Kernel driver in use: lpc_ich

00:1f.2 SATA controller: Intel Corporation 8 Series SATA Controller 1 
[AHCI mode] (rev 04) (prog-if 01 [AHCI 1.0])
     Subsystem: Lenovo Device 3978
     Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- 
Stepping- SERR- FastB2B- DisINTx+
     Status: Cap+ 66MHz+ UDF- FastB2B+ ParErr- DEVSEL=medium >TAbort- 
<TAbort- <MAbort- >SERR- <PERR- INTx-
     Latency: 0
     Interrupt: pin B routed to IRQ 44
     Region 0: I/O ports at 3088 [size=8]
     Region 1: I/O ports at 3094 [size=4]
     Region 2: I/O ports at 3080 [size=8]
     Region 3: I/O ports at 3090 [size=4]
     Region 4: I/O ports at 3060 [size=32]
     Region 5: Memory at b051b000 (32-bit, non-prefetchable) [size=2K]
     Capabilities: [80] MSI: Enable+ Count=1/1 Maskable- 64bit-
         Address: fee00278  Data: 0000
     Capabilities: [70] Power Management version 3
         Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA 
PME(D0-,D1-,D2-,D3hot+,D3cold-)
         Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
     Capabilities: [a8] SATA HBA v1.0 BAR4 Offset=00000004
     Kernel driver in use: ahci

00:1f.3 SMBus: Intel Corporation 8 Series SMBus Controller (rev 04)
     Subsystem: Lenovo Device 3978
     Control: I/O+ Mem+ BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr- 
Stepping- SERR- FastB2B- DisINTx-
     Status: Cap- 66MHz- UDF- FastB2B+ ParErr- DEVSEL=medium >TAbort- 
<TAbort- <MAbort- >SERR- <PERR- INTx-
     Interrupt: pin C routed to IRQ 11
     Region 0: Memory at b0519000 (64-bit, non-prefetchable) [size=256]
     Region 4: I/O ports at 3040 [size=32]

01:00.0 Network controller: Intel Corporation Wireless 7260 (rev 6b)
     Subsystem: Intel Corporation Wireless-N 7260
     Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- 
Stepping- SERR- FastB2B- DisINTx+
     Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- 
<TAbort- <MAbort- >SERR- <PERR- INTx-
     Latency: 0, Cache Line Size: 64 bytes
     Interrupt: pin A routed to IRQ 47
     Region 0: Memory at b0400000 (64-bit, non-prefetchable) [size=8K]
     Capabilities: [c8] Power Management version 3
         Flags: PMEClk- DSI+ D1- D2- AuxCurrent=0mA 
PME(D0+,D1-,D2-,D3hot+,D3cold+)
         Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-
     Capabilities: [d0] MSI: Enable+ Count=1/1 Maskable- 64bit+
         Address: 00000000fee002b8  Data: 0000
     Capabilities: [40] Express (v2) Endpoint, MSI 00
         DevCap:    MaxPayload 128 bytes, PhantFunc 0, Latency L0s 
<512ns, L1 unlimited
             ExtTag- AttnBtn- AttnInd- PwrInd- RBE+ FLReset+
         DevCtl:    Report errors: Correctable- Non-Fatal- Fatal- 
Unsupported-
             RlxdOrd+ ExtTag- PhantFunc- AuxPwr+ NoSnoop+ FLReset-
             MaxPayload 128 bytes, MaxReadReq 128 bytes
         DevSta:    CorrErr- UncorrErr- FatalErr- UnsuppReq- AuxPwr+ 
TransPend-
         LnkCap:    Port #0, Speed 2.5GT/s, Width x1, ASPM L0s L1, Exit 
Latency L0s <4us, L1 <32us
             ClockPM+ Surprise- LLActRep- BwNot- ASPMOptComp-
         LnkCtl:    ASPM L1 Enabled; RCB 64 bytes Disabled- CommClk+
             ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
         LnkSta:    Speed 2.5GT/s, Width x1, TrErr- Train- SlotClk+ 
DLActive- BWMgmt- ABWMgmt-
         DevCap2: Completion Timeout: Range B, TimeoutDis+, LTR+, OBFF 
Via WAKE#
         DevCtl2: Completion Timeout: 16ms to 55ms, TimeoutDis-, LTR+, 
OBFF Disabled
         LnkCtl2: Target Link Speed: 2.5GT/s, EnterCompliance- SpeedDis-
              Transmit Margin: Normal Operating Range, 
EnterModifiedCompliance- ComplianceSOS-
              Compliance De-emphasis: -6dB
         LnkSta2: Current De-emphasis Level: -3.5dB, 
EqualizationComplete-, EqualizationPhase1-
              EqualizationPhase2-, EqualizationPhase3-, 
LinkEqualizationRequest-
     Capabilities: [100 v1] Advanced Error Reporting
         UESta:    DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- 
RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-
         UEMsk:    DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- 
RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-
         UESvrt:    DLP+ SDES+ TLP- FCP+ CmpltTO- CmpltAbrt- UnxCmplt- 
RxOF+ MalfTLP+ ECRC- UnsupReq- ACSViol-
         CESta:    RxErr- BadTLP- BadDLLP- Rollover- Timeout- NonFatalErr-
         CEMsk:    RxErr- BadTLP- BadDLLP- Rollover- Timeout- NonFatalErr+
         AERCap:    First Error Pointer: 00, GenCap- CGenEn- ChkCap- ChkEn-
     Capabilities: [140 v1] Device Serial Number e8-2a-ea-ff-ff-dc-4f-06
     Capabilities: [14c v1] Latency Tolerance Reporting
         Max snoop latency: 3145728ns
         Max no snoop latency: 3145728ns
     Capabilities: [154 v1] Vendor Specific Information: ID=cafe Rev=1 
Len=014 <?>
     Kernel driver in use: iwlwifi


[7.6.] SCSI information (from /proc/scsi/scsi)
Attached devices:
Host: scsi0 Channel: 00 Id: 00 Lun: 00
   Vendor: ATA      Model: WDC WD5000M22K-2 Rev: 1A03
   Type:   Direct-Access                    ANSI  SCSI revision: 05

[X.] Other notes, patches, fixes, workarounds:
I was using a USB 3.0 ethernet dongle for network access while fetching 
all the info above
