From: Gaele Strootman <gaele@guruburu.com>
Subject: Backlight control does not work on an Apple dual-GPU (intel/nvidia)
 system using nouveau
Date: Sat, 13 Feb 2016 22:00:31 +0100
Message-ID: <56BF996F.3030503@guruburu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from smtpgw.dds.nl ([91.142.252.201]:6949 "EHLO smtpgw.dds.nl"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751306AbcBMVLH convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 13 Feb 2016 16:11:07 -0500
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?UTF-8?Q?Bruno_Pr=c3=a9mont?= <bonbons@linux-vserver.org>, Bjorn Helgaas <bhelgaas@google.com>, Matthew Garrett <mjg59@srcf.ucam.org>, Darren Hart <dvhart@infradead.org>
Cc: platform-driver-x86@vger.kernel.org

[1.]
Backlight control does not work on an Apple dual-GPU (intel/nvidia)
system using nouveau.

[2.]
This is a regression that first appeared in v4.1:
The backlight control (keys F1 and F2) does not work on an Apple
dual-GPU (MacBookPro11,3) system using nouveau.
It does work while using the proprietary Nvidia driver.

4eebd5a4e72697aac25a8a57d3f888a9d5f80370 is the first bad commit

[3.]

[4.]
Linux version 4.5.0-040500rc3-generic (kernel@gomeisa) (gcc version
5.2.1 20151010 (Ubuntu 5.2.1-22ubuntu2) ) #201602071930 SMP Mon Feb 8
00:34:43 UTC 2016

[5.]

[6.]

[7.]
Description:    Ubuntu 15.10
Release:    15.10

[7.1.]
Linux mozzy 4.5.0-040500rc3-generic #201602071930 SMP Mon Feb 8 00:34:43
UTC 2016 x86_64 x86_64 x86_64 GNU/Linux
 
GNU C            5.2.1
GNU Make        4.0
Binutils        2.25.1
Util-linux        2.26.2
Mount            2.26.2
Module-init-tools    21
E2fsprogs        1.42.12
Pcmciautils        018
PPP            2.4.6
Linux C Library        2.21
Dynamic linker (ldd)    2.21
Linux C++ Library    6.0.21
Procps            3.3.9
Net-tools        1.60
Kbd            1.15.5
Console-tools        1.15.5
Sh-utils        8.23
Udev            225
Wireless-tools        30
Modules Loaded        ablk_helper acpi_als aesni_intel aes_x86_64 ahci
ansi_cprng apple_bl apple_gmux applesmc autofs4 bcm5974 bdc_pci
binfmt_misc bluetooth bnep btbcm btintel btrtl btusb cfg80211 coretemp
crc32_pclmul crct10dif_pclmul cryptd dm_crypt drbg drm drm_kms_helper
fb_sys_fops fjes gf128mul ghash_clmulni_intel glue_helper hid hid_apple
hid_generic i2c_algo_bit industrialio input_leds input_polldev
intel_powerclamp ip6table_filter ip6_tables ip6t_REJECT ip6t_rt
iptable_filter ip_tables ipt_REJECT irqbypass jitterentropy_rng joydev
kfifo_buf kvm kvm_intel libahci lp lpc_ich lrw mac_hid mei mei_me msr
mxm_wmi nf_conntrack nf_conntrack_broadcast nf_conntrack_ftp
nf_conntrack_ipv4 nf_conntrack_ipv6 nf_conntrack_netbios_ns
nf_defrag_ipv4 nf_defrag_ipv6 nf_log_common nf_log_ipv4 nf_log_ipv6
nf_nat nf_nat_ftp nf_reject_ipv4 nf_reject_ipv6 nls_iso8859_1 nouveau
parport parport_pc ppdev rfcomm sbs sbshc shpchp snd snd_hda_codec
snd_hda_codec_cirrus snd_hda_codec_generic snd_hda_codec_hdmi
snd_hda_core snd_hda_intel snd_hwdep snd_pcm snd_rawmidi snd_seq
snd_seq_device snd_seq_midi snd_seq_midi_event snd_timer soundcore
syscopyarea sysfillrect sysimgblt thunderbolt ttm uas usbhid usb_storage
video wl wmi x86_pkg_temp_thermal x_tables xt_addrtype xt_conntrack
xt_hl xt_limit xt_LOG xt_tcpudp

[7.2.]
processor    : 0
vendor_id    : GenuineIntel
cpu family    : 6
model        : 70
model name    : Intel(R) Core(TM) i7-4850HQ CPU @ 2.30GHz
stepping    : 1
microcode    : 0x12
cpu MHz        : 2300.000
cache size    : 6144 KB
physical id    : 0
siblings    : 8
core id        : 0
cpu cores    : 4
apicid        : 0
initial apicid    : 0
fpu        : yes
fpu_exception    : yes
cpuid level    : 13
wp        : yes
flags        : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca
cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall
nx pdpe1gb rdtscp lm constant_tsc arch_perfmon pebs bts rep_good nopl
xtopology nonstop_tsc aperfmperf eagerfpu pni pclmulqdq dtes64 monitor
ds_cpl vmx smx est tm2 ssse3 sdbg fma cx16 xtpr pdcm pcid sse4_1 sse4_2
x2apic movbe popcnt tsc_deadline_timer aes xsave avx f16c rdrand lahf_lm
abm epb tpr_shadow vnmi flexpriority ept vpid fsgsbase tsc_adjust bmi1
avx2 smep bmi2 erms invpcid xsaveopt dtherm ida arat pln pts
bugs        :
bogomips    : 4589.57
clflush size    : 64
cache_alignment    : 64
address sizes    : 39 bits physical, 48 bits virtual
power management:

processor    : 1
vendor_id    : GenuineIntel
cpu family    : 6
model        : 70
model name    : Intel(R) Core(TM) i7-4850HQ CPU @ 2.30GHz
stepping    : 1
microcode    : 0x12
cpu MHz        : 2300.808
cache size    : 6144 KB
physical id    : 0
siblings    : 8
core id        : 1
cpu cores    : 4
apicid        : 2
initial apicid    : 2
fpu        : yes
fpu_exception    : yes
cpuid level    : 13
wp        : yes
flags        : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca
cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall
nx pdpe1gb rdtscp lm constant_tsc arch_perfmon pebs bts rep_good nopl
xtopology nonstop_tsc aperfmperf eagerfpu pni pclmulqdq dtes64 monitor
ds_cpl vmx smx est tm2 ssse3 sdbg fma cx16 xtpr pdcm pcid sse4_1 sse4_2
x2apic movbe popcnt tsc_deadline_timer aes xsave avx f16c rdrand lahf_lm
abm epb tpr_shadow vnmi flexpriority ept vpid fsgsbase tsc_adjust bmi1
avx2 smep bmi2 erms invpcid xsaveopt dtherm ida arat pln pts
bugs        :
bogomips    : 4589.57
clflush size    : 64
cache_alignment    : 64
address sizes    : 39 bits physical, 48 bits virtual
power management:

processor    : 2
vendor_id    : GenuineIntel
cpu family    : 6
model        : 70
model name    : Intel(R) Core(TM) i7-4850HQ CPU @ 2.30GHz
stepping    : 1
microcode    : 0x12
cpu MHz        : 2300.269
cache size    : 6144 KB
physical id    : 0
siblings    : 8
core id        : 2
cpu cores    : 4
apicid        : 4
initial apicid    : 4
fpu        : yes
fpu_exception    : yes
cpuid level    : 13
wp        : yes
flags        : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca
cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall
nx pdpe1gb rdtscp lm constant_tsc arch_perfmon pebs bts rep_good nopl
xtopology nonstop_tsc aperfmperf eagerfpu pni pclmulqdq dtes64 monitor
ds_cpl vmx smx est tm2 ssse3 sdbg fma cx16 xtpr pdcm pcid sse4_1 sse4_2
x2apic movbe popcnt tsc_deadline_timer aes xsave avx f16c rdrand lahf_lm
abm epb tpr_shadow vnmi flexpriority ept vpid fsgsbase tsc_adjust bmi1
avx2 smep bmi2 erms invpcid xsaveopt dtherm ida arat pln pts
bugs        :
bogomips    : 4589.57
clflush size    : 64
cache_alignment    : 64
address sizes    : 39 bits physical, 48 bits virtual
power management:

processor    : 3
vendor_id    : GenuineIntel
cpu family    : 6
model        : 70
model name    : Intel(R) Core(TM) i7-4850HQ CPU @ 2.30GHz
stepping    : 1
microcode    : 0x12
cpu MHz        : 2305.300
cache size    : 6144 KB
physical id    : 0
siblings    : 8
core id        : 3
cpu cores    : 4
apicid        : 6
initial apicid    : 6
fpu        : yes
fpu_exception    : yes
cpuid level    : 13
wp        : yes
flags        : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca
cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall
nx pdpe1gb rdtscp lm constant_tsc arch_perfmon pebs bts rep_good nopl
xtopology nonstop_tsc aperfmperf eagerfpu pni pclmulqdq dtes64 monitor
ds_cpl vmx smx est tm2 ssse3 sdbg fma cx16 xtpr pdcm pcid sse4_1 sse4_2
x2apic movbe popcnt tsc_deadline_timer aes xsave avx f16c rdrand lahf_lm
abm epb tpr_shadow vnmi flexpriority ept vpid fsgsbase tsc_adjust bmi1
avx2 smep bmi2 erms invpcid xsaveopt dtherm ida arat pln pts
bugs        :
bogomips    : 4589.57
clflush size    : 64
cache_alignment    : 64
address sizes    : 39 bits physical, 48 bits virtual
power management:

processor    : 4
vendor_id    : GenuineIntel
cpu family    : 6
model        : 70
model name    : Intel(R) Core(TM) i7-4850HQ CPU @ 2.30GHz
stepping    : 1
microcode    : 0x12
cpu MHz        : 2300.988
cache size    : 6144 KB
physical id    : 0
siblings    : 8
core id        : 0
cpu cores    : 4
apicid        : 1
initial apicid    : 1
fpu        : yes
fpu_exception    : yes
cpuid level    : 13
wp        : yes
flags        : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca
cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall
nx pdpe1gb rdtscp lm constant_tsc arch_perfmon pebs bts rep_good nopl
xtopology nonstop_tsc aperfmperf eagerfpu pni pclmulqdq dtes64 monitor
ds_cpl vmx smx est tm2 ssse3 sdbg fma cx16 xtpr pdcm pcid sse4_1 sse4_2
x2apic movbe popcnt tsc_deadline_timer aes xsave avx f16c rdrand lahf_lm
abm epb tpr_shadow vnmi flexpriority ept vpid fsgsbase tsc_adjust bmi1
avx2 smep bmi2 erms invpcid xsaveopt dtherm ida arat pln pts
bugs        :
bogomips    : 4589.57
clflush size    : 64
cache_alignment    : 64
address sizes    : 39 bits physical, 48 bits virtual
power management:

processor    : 5
vendor_id    : GenuineIntel
cpu family    : 6
model        : 70
model name    : Intel(R) Core(TM) i7-4850HQ CPU @ 2.30GHz
stepping    : 1
microcode    : 0x12
cpu MHz        : 2301.078
cache size    : 6144 KB
physical id    : 0
siblings    : 8
core id        : 1
cpu cores    : 4
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
ds_cpl vmx smx est tm2 ssse3 sdbg fma cx16 xtpr pdcm pcid sse4_1 sse4_2
x2apic movbe popcnt tsc_deadline_timer aes xsave avx f16c rdrand lahf_lm
abm epb tpr_shadow vnmi flexpriority ept vpid fsgsbase tsc_adjust bmi1
avx2 smep bmi2 erms invpcid xsaveopt dtherm ida arat pln pts
bugs        :
bogomips    : 4589.57
clflush size    : 64
cache_alignment    : 64
address sizes    : 39 bits physical, 48 bits virtual
power management:

processor    : 6
vendor_id    : GenuineIntel
cpu family    : 6
model        : 70
model name    : Intel(R) Core(TM) i7-4850HQ CPU @ 2.30GHz
stepping    : 1
microcode    : 0x12
cpu MHz        : 2300.179
cache size    : 6144 KB
physical id    : 0
siblings    : 8
core id        : 2
cpu cores    : 4
apicid        : 5
initial apicid    : 5
fpu        : yes
fpu_exception    : yes
cpuid level    : 13
wp        : yes
flags        : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca
cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall
nx pdpe1gb rdtscp lm constant_tsc arch_perfmon pebs bts rep_good nopl
xtopology nonstop_tsc aperfmperf eagerfpu pni pclmulqdq dtes64 monitor
ds_cpl vmx smx est tm2 ssse3 sdbg fma cx16 xtpr pdcm pcid sse4_1 sse4_2
x2apic movbe popcnt tsc_deadline_timer aes xsave avx f16c rdrand lahf_lm
abm epb tpr_shadow vnmi flexpriority ept vpid fsgsbase tsc_adjust bmi1
avx2 smep bmi2 erms invpcid xsaveopt dtherm ida arat pln pts
bugs        :
bogomips    : 4589.57
clflush size    : 64
cache_alignment    : 64
address sizes    : 39 bits physical, 48 bits virtual
power management:

processor    : 7
vendor_id    : GenuineIntel
cpu family    : 6
model        : 70
model name    : Intel(R) Core(TM) i7-4850HQ CPU @ 2.30GHz
stepping    : 1
microcode    : 0x12
cpu MHz        : 2772.757
cache size    : 6144 KB
physical id    : 0
siblings    : 8
core id        : 3
cpu cores    : 4
apicid        : 7
initial apicid    : 7
fpu        : yes
fpu_exception    : yes
cpuid level    : 13
wp        : yes
flags        : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca
cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall
nx pdpe1gb rdtscp lm constant_tsc arch_perfmon pebs bts rep_good nopl
xtopology nonstop_tsc aperfmperf eagerfpu pni pclmulqdq dtes64 monitor
ds_cpl vmx smx est tm2 ssse3 sdbg fma cx16 xtpr pdcm pcid sse4_1 sse4_2
x2apic movbe popcnt tsc_deadline_timer aes xsave avx f16c rdrand lahf_lm
abm epb tpr_shadow vnmi flexpriority ept vpid fsgsbase tsc_adjust bmi1
avx2 smep bmi2 erms invpcid xsaveopt dtherm ida arat pln pts
bugs        :
bogomips    : 4589.57
clflush size    : 64
cache_alignment    : 64
address sizes    : 39 bits physical, 48 bits virtual
power management:

[7.3.]
rfcomm 69632 0 - Live 0x0000000000000000
msr 16384 0 - Live 0x0000000000000000
binfmt_misc 20480 1 - Live 0x0000000000000000
bnep 20480 2 - Live 0x0000000000000000
jitterentropy_rng 16384 0 - Live 0x0000000000000000
drbg 32768 1 - Live 0x0000000000000000
ansi_cprng 16384 0 - Live 0x0000000000000000
dm_crypt 28672 1 - Live 0x0000000000000000
snd_hda_codec_hdmi 53248 1 - Live 0x0000000000000000
nls_iso8859_1 16384 1 - Live 0x0000000000000000
joydev 20480 0 - Live 0x0000000000000000
applesmc 20480 0 - Live 0x0000000000000000
input_polldev 16384 1 applesmc, Live 0x0000000000000000
x86_pkg_temp_thermal 16384 0 - Live 0x0000000000000000
intel_powerclamp 16384 0 - Live 0x0000000000000000
coretemp 16384 0 - Live 0x0000000000000000
kvm_intel 184320 0 - Live 0x0000000000000000
kvm 561152 1 kvm_intel, Live 0x0000000000000000
irqbypass 16384 1 kvm, Live 0x0000000000000000
crct10dif_pclmul 16384 0 - Live 0x0000000000000000
wl 6365184 0 - Live 0x0000000000000000 (POE)
crc32_pclmul 16384 0 - Live 0x0000000000000000
ghash_clmulni_intel 16384 0 - Live 0x0000000000000000
aesni_intel 167936 2825 - Live 0x0000000000000000
snd_hda_codec_cirrus 20480 1 - Live 0x0000000000000000
aes_x86_64 20480 1 aesni_intel, Live 0x0000000000000000
snd_hda_codec_generic 73728 1 snd_hda_codec_cirrus, Live 0x0000000000000000
lrw 16384 1 aesni_intel, Live 0x0000000000000000
gf128mul 16384 1 lrw, Live 0x0000000000000000
glue_helper 16384 1 aesni_intel, Live 0x0000000000000000
ablk_helper 16384 1 aesni_intel, Live 0x0000000000000000
btusb 45056 0 - Live 0x0000000000000000
cryptd 20480 1415 ghash_clmulni_intel,aesni_intel,ablk_helper, Live
0x0000000000000000
btrtl 16384 1 btusb, Live 0x0000000000000000
btbcm 16384 1 btusb, Live 0x0000000000000000
snd_hda_intel 36864 5 - Live 0x0000000000000000
btintel 16384 1 btusb, Live 0x0000000000000000
bluetooth 520192 29 rfcomm,bnep,btusb,btrtl,btbcm,btintel, Live
0x0000000000000000
snd_hda_codec 135168 4
snd_hda_codec_hdmi,snd_hda_codec_cirrus,snd_hda_codec_generic,snd_hda_intel,
Live 0x0000000000000000
input_leds 16384 0 - Live 0x0000000000000000
cfg80211 565248 1 wl, Live 0x0000000000000000
snd_hda_core 73728 5
snd_hda_codec_hdmi,snd_hda_codec_cirrus,snd_hda_codec_generic,snd_hda_intel,snd_hda_codec,
Live 0x0000000000000000
bdc_pci 16384 0 - Live 0x0000000000000000
bcm5974 16384 0 - Live 0x0000000000000000
lpc_ich 24576 0 - Live 0x0000000000000000
snd_seq_midi 16384 0 - Live 0x0000000000000000
snd_hwdep 16384 1 snd_hda_codec, Live 0x0000000000000000
snd_seq_midi_event 16384 1 snd_seq_midi, Live 0x0000000000000000
mei_me 32768 0 - Live 0x0000000000000000
snd_rawmidi 32768 1 snd_seq_midi, Live 0x0000000000000000
snd_pcm 102400 4
snd_hda_codec_hdmi,snd_hda_intel,snd_hda_codec,snd_hda_core, Live
0x0000000000000000
mei 98304 1 mei_me, Live 0x0000000000000000
snd_seq 69632 2 snd_seq_midi,snd_seq_midi_event, Live 0x0000000000000000
snd_seq_device 16384 3 snd_seq_midi,snd_rawmidi,snd_seq, Live
0x0000000000000000
thunderbolt 53248 0 - Live 0x0000000000000000
snd_timer 32768 2 snd_pcm,snd_seq, Live 0x0000000000000000
snd 81920 21
snd_hda_codec_hdmi,snd_hda_codec_cirrus,snd_hda_codec_generic,snd_hda_intel,snd_hda_codec,snd_hwdep,snd_rawmidi,snd_pcm,snd_seq,snd_seq_device,snd_timer,
Live 0x0000000000000000
soundcore 16384 1 snd, Live 0x0000000000000000
sbs 16384 0 - Live 0x0000000000000000
acpi_als 16384 0 - Live 0x0000000000000000
apple_gmux 16384 0 - Live 0x0000000000000000
kfifo_buf 16384 1 acpi_als, Live 0x0000000000000000
ip6t_REJECT 16384 1 - Live 0x0000000000000000
industrialio 61440 2 acpi_als,kfifo_buf, Live 0x0000000000000000
shpchp 36864 0 - Live 0x0000000000000000
sbshc 16384 1 sbs, Live 0x0000000000000000
nf_reject_ipv6 16384 1 ip6t_REJECT, Live 0x0000000000000000
apple_bl 16384 1 apple_gmux, Live 0x0000000000000000
mac_hid 16384 0 - Live 0x0000000000000000
nf_log_ipv6 16384 5 - Live 0x0000000000000000
xt_hl 16384 22 - Live 0x0000000000000000
ip6t_rt 16384 3 - Live 0x0000000000000000
nf_conntrack_ipv6 20480 8 - Live 0x0000000000000000
nf_defrag_ipv6 36864 1 nf_conntrack_ipv6, Live 0x0000000000000000
ipt_REJECT 16384 1 - Live 0x0000000000000000
nf_reject_ipv4 16384 1 ipt_REJECT, Live 0x0000000000000000
nf_log_ipv4 16384 5 - Live 0x0000000000000000
nf_log_common 16384 2 nf_log_ipv6,nf_log_ipv4, Live 0x0000000000000000
xt_LOG 16384 10 - Live 0x0000000000000000
xt_limit 16384 13 - Live 0x0000000000000000
xt_tcpudp 16384 18 - Live 0x0000000000000000
xt_addrtype 16384 4 - Live 0x0000000000000000
nf_conntrack_ipv4 16384 8 - Live 0x0000000000000000
nf_defrag_ipv4 16384 1 nf_conntrack_ipv4, Live 0x0000000000000000
xt_conntrack 16384 16 - Live 0x0000000000000000
ip6table_filter 16384 1 - Live 0x0000000000000000
ip6_tables 28672 1 ip6table_filter, Live 0x0000000000000000
nf_conntrack_netbios_ns 16384 0 - Live 0x0000000000000000
nf_conntrack_broadcast 16384 1 nf_conntrack_netbios_ns, Live
0x0000000000000000
nf_nat_ftp 16384 0 - Live 0x0000000000000000
nf_nat 24576 1 nf_nat_ftp, Live 0x0000000000000000
nf_conntrack_ftp 20480 1 nf_nat_ftp, Live 0x0000000000000000
nf_conntrack 106496 8
nf_conntrack_ipv6,nf_conntrack_ipv4,xt_conntrack,nf_conntrack_netbios_ns,nf_conntrack_broadcast,nf_nat_ftp,nf_nat,nf_conntrack_ftp,
Live 0x0000000000000000
iptable_filter 16384 1 - Live 0x0000000000000000
ip_tables 28672 1 iptable_filter, Live 0x0000000000000000
parport_pc 32768 0 - Live 0x0000000000000000
x_tables 36864 13
ip6t_REJECT,xt_hl,ip6t_rt,ipt_REJECT,xt_LOG,xt_limit,xt_tcpudp,xt_addrtype,xt_conntrack,ip6table_filter,ip6_tables,iptable_filter,ip_tables,
Live 0x0000000000000000
ppdev 20480 0 - Live 0x0000000000000000
lp 20480 0 - Live 0x0000000000000000
parport 49152 3 parport_pc,ppdev,lp, Live 0x0000000000000000
autofs4 40960 2 - Live 0x0000000000000000
hid_generic 16384 0 - Live 0x0000000000000000
hid_apple 16384 0 - Live 0x0000000000000000
usbhid 49152 0 - Live 0x0000000000000000
hid 118784 3 hid_generic,hid_apple,usbhid, Live 0x0000000000000000
nouveau 1503232 4 - Live 0x0000000000000000
mxm_wmi 16384 1 nouveau, Live 0x0000000000000000
wmi 20480 2 nouveau,mxm_wmi, Live 0x0000000000000000
i2c_algo_bit 16384 1 nouveau, Live 0x0000000000000000
ttm 98304 1 nouveau, Live 0x0000000000000000
drm_kms_helper 147456 1 nouveau, Live 0x0000000000000000
syscopyarea 16384 1 drm_kms_helper, Live 0x0000000000000000
uas 24576 0 - Live 0x0000000000000000
sysfillrect 16384 1 drm_kms_helper, Live 0x0000000000000000
sysimgblt 16384 1 drm_kms_helper, Live 0x0000000000000000
ahci 36864 3 - Live 0x0000000000000000
fb_sys_fops 16384 1 drm_kms_helper, Live 0x0000000000000000
usb_storage 69632 1 uas, Live 0x0000000000000000
libahci 32768 1 ahci, Live 0x0000000000000000
drm 364544 7 nouveau,ttm,drm_kms_helper, Live 0x0000000000000000
fjes 28672 0 - Live 0x0000000000000000
video 40960 2 apple_gmux,nouveau, Live 0x0000000000000000

[7.4.]
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
  0300-031f : APP0001:00
    0300-031f : applesmc
  0400-0403 : ACPI PM1a_EVT_BLK
  0404-0405 : ACPI PM1a_CNT_BLK
  0408-040b : ACPI PM_TMR
  0410-0415 : ACPI CPU throttle
  0420-042f : ACPI GPE0_BLK
  0430-0433 : iTCO_wdt.0.auto
  0450-0450 : ACPI PM2_CNT_BLK
  0460-047f : iTCO_wdt.0.auto
  0700-07fd : Apple gmux
  0800-087f : pnp 00:01
0cf8-0cff : PCI conf1
0d00-ffff : PCI Bus 0000:00
  1000-1fff : PCI Bus 0000:01
    1000-107f : 0000:01:00.0
  2000-2fff : PCI Bus 0000:02
  3000-5fff : PCI Bus 0000:06
    3000-4fff : PCI Bus 0000:07
      3000-3fff : PCI Bus 0000:09
      4000-4fff : PCI Bus 0000:3b
  efa0-efbf : 0000:00:1f.3
  ffff-ffff : pnp 00:01


00000000-00000fff : reserved
00001000-00057fff : System RAM
00058000-00058fff : reserved
00059000-0008efff : System RAM
0008f000-0008ffff : reserved
00090000-0009ffff : System RAM
000a0000-000bffff : PCI Bus 0000:00
  000a0000-000bffff : reserved
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
000f0000-000fffff : PCI Bus 0000:00
  000f0000-000fffff : System ROM
00100000-7ad13fff : System RAM
  02000000-028284f9 : Kernel code
  028284fa-02f4497f : Kernel data
  030c3000-03205fff : Kernel bss
7ad14000-7ad52fff : ACPI Non-volatile Storage
7ad53000-7ad5efff : System RAM
7ad5f000-7ad8efff : ACPI Tables
7ad8f000-7ae38fff : System RAM
7ae39000-7ae8efff : reserved
7ae8f000-7aecffff : System RAM
7aed0000-7aefefff : reserved
7aeff000-7af7afff : System RAM
7af7b000-7afe4fff : reserved
7afe5000-7affffff : System RAM
7b000000-7f9fffff : reserved
7fa00000-feafffff : PCI Bus 0000:00
  7fa00000-7fbfffff : PCI Bus 0000:02
  7fc00000-7fdfffff : PCI Bus 0000:02
  80000000-91ffffff : PCI Bus 0000:01
    80000000-8fffffff : 0000:01:00.0
    90000000-91ffffff : 0000:01:00.0
  a0000000-afffffff : PCI Bus 0000:04
    a0000000-afffffff : 0000:04:00.0
  c0000000-c10fffff : PCI Bus 0000:01
    c0000000-c0ffffff : 0000:01:00.0
    c1000000-c107ffff : 0000:01:00.0
    c1080000-c1083fff : 0000:01:00.1
      c1080000-c1083fff : ICH HD audio
  c1800000-c1afffff : PCI Bus 0000:03
    c1800000-c19fffff : 0000:03:00.0
    c1a00000-c1a07fff : 0000:03:00.0
  c1b00000-c1bfffff : PCI Bus 0000:05
    c1b00000-c1b01fff : 0000:05:00.0
      c1b00000-c1b01fff : ahci
    c1b10000-c1b1ffff : 0000:05:00.0
  c1c00000-c1dfffff : PCI Bus 0000:04
    c1c00000-c1cfffff : 0000:04:00.0
    c1d00000-c1d0ffff : bdc_usb3
      c1d00000-c1d0ffff : 0000:04:00.0
  c1e00000-c1e0ffff : 0000:00:14.0
    c1e00000-c1e0ffff : xhci-hcd
  c1e14000-c1e17fff : 0000:00:1b.0
    c1e14000-c1e17fff : ICH HD audio
  c1e19000-c1e190ff : 0000:00:1f.3
  c1e19100-c1e1910f : 0000:00:16.0
    c1e19100-c1e1910f : mei_me
  c1f00000-cdffffff : PCI Bus 0000:06
    c1f00000-c9ffffff : PCI Bus 0000:07
      c1f00000-c1ffffff : PCI Bus 0000:08
        c1f00000-c1f3ffff : 0000:08:00.0
          c1f00000-c1f3ffff : thunderbolt
        c1f40000-c1f40fff : 0000:08:00.0
      c2000000-c5ffffff : PCI Bus 0000:09
      c6000000-c9ffffff : PCI Bus 0000:3b
  ce000000-d9ffffff : PCI Bus 0000:06
    ce000000-d5ffffff : PCI Bus 0000:07
      ce000000-d1ffffff : PCI Bus 0000:09
      d2000000-d5ffffff : PCI Bus 0000:3b
  e0000000-e9cfffff : PCI MMCONFIG 0000 [bus 00-9c]
    e00f8000-e00f8fff : reserved
fec00000-fec003ff : IOAPIC 0
fed00000-fed03fff : pnp 00:00
  fed00000-fed003ff : HPET 0
fed10000-fed17fff : pnp 00:04
fed18000-fed18fff : pnp 00:04
fed19000-fed19fff : pnp 00:04
fed1c000-fed1ffff : reserved
  fed1c000-fed1ffff : pnp 00:04
    fed1f410-fed1f414 : iTCO_wdt.0.auto
fed20000-fed3ffff : pnp 00:04
fed40000-fed44fff : PCI Bus 0000:00
fed45000-fed8ffff : pnp 00:04
fed90000-fed90fff : dmar0
fed91000-fed91fff : dmar1
fee00000-feefffff : pnp 00:04
  fee00000-fee00fff : Local APIC
fef00000-fef0ffff : APP0001:00
ff000000-ffffffff : INT0800:00
  ffe10000-ffe3ffff : reserved
100000000-47f5fffff : System RAM
47f600000-47fffffff : RAM buffer

[7.5.]
00:00.0 Host bridge: Intel Corporation Crystal Well DRAM Controller (rev 08)
    Subsystem: Apple Inc. Device 012f
    Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR- FastB2B- DisINTx-
    Status: Cap+ 66MHz- UDF- FastB2B+ ParErr- DEVSEL=fast >TAbort-
<TAbort- <MAbort+ >SERR- <PERR- INTx-
    Latency: 0
    Capabilities: [e0] Vendor Specific Information: Len=0c <?>

00:01.0 PCI bridge: Intel Corporation Crystal Well PCI Express x16
Controller (rev 08) (prog-if 00 [Normal decode])
    Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR- FastB2B- DisINTx+
    Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort-
<TAbort- <MAbort- >SERR- <PERR- INTx-
    Latency: 0, Cache Line Size: 256 bytes
    Interrupt: pin A routed to IRQ 26
    Bus: primary=00, secondary=01, subordinate=01, sec-latency=0
    I/O behind bridge: 00001000-00001fff
    Memory behind bridge: c0000000-c10fffff
    Prefetchable memory behind bridge: 0000000080000000-0000000091ffffff
    Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=fast >TAbort-
<TAbort- <MAbort+ <SERR- <PERR-
    BridgeCtl: Parity- SERR- NoISA- VGA+ MAbort- >Reset- FastB2B-
        PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-
    Capabilities: [88] Subsystem: Apple Inc. Device 012f
    Capabilities: [80] Power Management version 3
        Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA
PME(D0+,D1-,D2-,D3hot+,D3cold+)
        Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
    Capabilities: [90] MSI: Enable+ Count=1/1 Maskable- 64bit-
        Address: 00000000  Data: 0000
    Capabilities: [a0] Express (v2) Root Port (Slot+), MSI 00
        DevCap:    MaxPayload 256 bytes, PhantFunc 0
            ExtTag- RBE+
        DevCtl:    Report errors: Correctable- Non-Fatal- Fatal-
Unsupported-
            RlxdOrd- ExtTag- PhantFunc- AuxPwr- NoSnoop-
            MaxPayload 256 bytes, MaxReadReq 128 bytes
        DevSta:    CorrErr- UncorrErr- FatalErr- UnsuppReq- AuxPwr-
TransPend-
        LnkCap:    Port #2, Speed 8GT/s, Width x8, ASPM L0s L1, Exit
Latency L0s <256ns, L1 <8us
            ClockPM- Surprise- LLActRep- BwNot+ ASPMOptComp+
        LnkCtl:    ASPM L0s L1 Enabled; RCB 64 bytes Disabled- CommClk+
            ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
        LnkSta:    Speed 2.5GT/s, Width x8, TrErr- Train+ SlotClk+
DLActive- BWMgmt+ ABWMgmt+
        SltCap:    AttnBtn- PwrCtrl- MRL- AttnInd- PwrInd- HotPlug-
Surprise-
            Slot #1, PowerLimit 75.000W; Interlock- NoCompl+
        SltCtl:    Enable: AttnBtn- PwrFlt- MRL- PresDet- CmdCplt-
HPIrq- LinkChg-
            Control: AttnInd Unknown, PwrInd Unknown, Power- Interlock-
        SltSta:    Status: AttnBtn- PowerFlt- MRL- CmdCplt- PresDet+
Interlock-
            Changed: MRL- PresDet- LinkState-
        RootCtl: ErrCorrectable- ErrNon-Fatal- ErrFatal- PMEIntEna-
CRSVisible-
        RootCap: CRSVisible-
        RootSta: PME ReqID 0000, PMEStatus- PMEPending-
        DevCap2: Completion Timeout: Not Supported, TimeoutDis-, LTR+,
OBFF Via WAKE# ARIFwd-
        DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-, LTR+,
OBFF Via WAKE# ARIFwd-
        LnkCtl2: Target Link Speed: 8GT/s, EnterCompliance- SpeedDis-
             Transmit Margin: Normal Operating Range,
EnterModifiedCompliance- ComplianceSOS-
             Compliance De-emphasis: -6dB
        LnkSta2: Current De-emphasis Level: -6dB, EqualizationComplete+,
EqualizationPhase1+
             EqualizationPhase2+, EqualizationPhase3+,
LinkEqualizationRequest-
    Capabilities: [100 v1] Virtual Channel
        Caps:    LPEVC=0 RefClk=100ns PATEntryBits=1
        Arb:    Fixed- WRR32- WRR64- WRR128-
        Ctrl:    ArbSelect=Fixed
        Status:    InProgress-
        VC0:    Caps:    PATOffset=00 MaxTimeSlots=1 RejSnoopTrans-
            Arb:    Fixed+ WRR32- WRR64- WRR128- TWRR128- WRR256-
            Ctrl:    Enable+ ID=0 ArbSelect=Fixed TC/VC=ff
            Status:    NegoPending- InProgress-
    Capabilities: [140 v1] Root Complex Link
        Desc:    PortNumber=02 ComponentID=01 EltType=Config
        Link0:    Desc:    TargetPort=00 TargetComponent=01 AssocRCRB-
LinkType=MemMapped LinkValid+
            Addr:    00000000fed19000
    Capabilities: [d94 v1] #19
    Kernel driver in use: pcieport

00:01.1 PCI bridge: Intel Corporation Crystal Well PCI Express x8
Controller (rev 08) (prog-if 00 [Normal decode])
    Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR- FastB2B- DisINTx+
    Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort-
<TAbort- <MAbort- >SERR- <PERR- INTx-
    Latency: 0, Cache Line Size: 256 bytes
    Interrupt: pin A routed to IRQ 27
    Bus: primary=00, secondary=06, subordinate=9c, sec-latency=0
    I/O behind bridge: 00003000-00005fff
    Memory behind bridge: c1f00000-cdffffff
    Prefetchable memory behind bridge: 00000000ce000000-00000000d9ffffff
    Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=fast >TAbort-
<TAbort- <MAbort+ <SERR- <PERR-
    BridgeCtl: Parity- SERR- NoISA- VGA- MAbort- >Reset- FastB2B-
        PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-
    Capabilities: [88] Subsystem: Apple Inc. Device 012f
    Capabilities: [80] Power Management version 3
        Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA
PME(D0+,D1-,D2-,D3hot+,D3cold+)
        Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
    Capabilities: [90] MSI: Enable+ Count=1/1 Maskable- 64bit-
        Address: 00000000  Data: 0000
    Capabilities: [a0] Express (v2) Root Port (Slot+), MSI 00
        DevCap:    MaxPayload 128 bytes, PhantFunc 0
            ExtTag- RBE+
        DevCtl:    Report errors: Correctable- Non-Fatal- Fatal-
Unsupported-
            RlxdOrd- ExtTag- PhantFunc- AuxPwr- NoSnoop-
            MaxPayload 128 bytes, MaxReadReq 128 bytes
        DevSta:    CorrErr- UncorrErr- FatalErr- UnsuppReq- AuxPwr-
TransPend-
        LnkCap:    Port #3, Speed 5GT/s, Width x8, ASPM L0s L1, Exit
Latency L0s <256ns, L1 <8us
            ClockPM- Surprise- LLActRep- BwNot+ ASPMOptComp+
        LnkCtl:    ASPM Disabled; RCB 64 bytes Disabled- CommClk+
            ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
        LnkSta:    Speed 5GT/s, Width x4, TrErr- Train- SlotClk+
DLActive- BWMgmt+ ABWMgmt+
        SltCap:    AttnBtn- PwrCtrl- MRL- AttnInd- PwrInd- HotPlug-
Surprise-
            Slot #2, PowerLimit 75.000W; Interlock- NoCompl+
        SltCtl:    Enable: AttnBtn- PwrFlt- MRL- PresDet- CmdCplt-
HPIrq- LinkChg-
            Control: AttnInd Unknown, PwrInd Unknown, Power- Interlock-
        SltSta:    Status: AttnBtn- PowerFlt- MRL- CmdCplt- PresDet+
Interlock-
            Changed: MRL- PresDet- LinkState-
        RootCtl: ErrCorrectable- ErrNon-Fatal- ErrFatal- PMEIntEna-
CRSVisible-
        RootCap: CRSVisible-
        RootSta: PME ReqID 0000, PMEStatus- PMEPending-
        DevCap2: Completion Timeout: Not Supported, TimeoutDis-, LTR+,
OBFF Via WAKE# ARIFwd-
        DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-, LTR+,
OBFF Via WAKE# ARIFwd-
        LnkCtl2: Target Link Speed: 5GT/s, EnterCompliance- SpeedDis-
             Transmit Margin: Normal Operating Range,
EnterModifiedCompliance- ComplianceSOS-
             Compliance De-emphasis: -6dB
        LnkSta2: Current De-emphasis Level: -3.5dB,
EqualizationComplete-, EqualizationPhase1-
             EqualizationPhase2-, EqualizationPhase3-,
LinkEqualizationRequest-
    Capabilities: [100 v1] Virtual Channel
        Caps:    LPEVC=0 RefClk=100ns PATEntryBits=1
        Arb:    Fixed- WRR32- WRR64- WRR128-
        Ctrl:    ArbSelect=Fixed
        Status:    InProgress-
        VC0:    Caps:    PATOffset=00 MaxTimeSlots=1 RejSnoopTrans-
            Arb:    Fixed+ WRR32- WRR64- WRR128- TWRR128- WRR256-
            Ctrl:    Enable+ ID=0 ArbSelect=Fixed TC/VC=ff
            Status:    NegoPending- InProgress-
    Capabilities: [140 v1] Root Complex Link
        Desc:    PortNumber=03 ComponentID=01 EltType=Config
        Link0:    Desc:    TargetPort=00 TargetComponent=01 AssocRCRB-
LinkType=MemMapped LinkValid+
            Addr:    00000000fed19000
    Capabilities: [d94 v1] #19
    Kernel driver in use: pcieport

00:14.0 USB controller: Intel Corporation 8 Series/C220 Series Chipset
Family USB xHCI (rev 05) (prog-if 30 [XHCI])
    Subsystem: Intel Corporation Device 7270
    Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR- FastB2B- DisINTx+
    Status: Cap+ 66MHz- UDF- FastB2B+ ParErr- DEVSEL=medium >TAbort-
<TAbort- <MAbort- >SERR- <PERR- INTx-
    Latency: 0
    Interrupt: pin A routed to IRQ 35
    Region 0: Memory at c1e00000 (64-bit, non-prefetchable) [size=64K]
    Capabilities: [70] Power Management version 2
        Flags: PMEClk- DSI- D1- D2- AuxCurrent=375mA
PME(D0-,D1-,D2-,D3hot+,D3cold+)
        Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
    Capabilities: [80] MSI: Enable+ Count=1/8 Maskable- 64bit+
        Address: 00000000fee00378  Data: 0000
    Kernel driver in use: xhci_hcd

00:16.0 Communication controller: Intel Corporation 8 Series/C220 Series
Chipset Family MEI Controller #1 (rev 04)
    Subsystem: Intel Corporation Device 7270
    Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR- FastB2B- DisINTx+
    Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort-
<TAbort- <MAbort- >SERR- <PERR- INTx-
    Latency: 0
    Interrupt: pin A routed to IRQ 38
    Region 0: Memory at c1e19100 (64-bit, non-prefetchable) [size=16]
    Capabilities: [50] Power Management version 3
        Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA
PME(D0+,D1-,D2-,D3hot+,D3cold+)
        Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
    Capabilities: [8c] MSI: Enable+ Count=1/1 Maskable- 64bit+
        Address: 00000000fee003b8  Data: 0000
    Kernel driver in use: mei_me

00:1b.0 Audio device: Intel Corporation 8 Series/C220 Series Chipset
High Definition Audio Controller (rev 05)
    Subsystem: Intel Corporation Device 7270
    Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR- FastB2B- DisINTx+
    Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort-
<TAbort- <MAbort- >SERR- <PERR- INTx-
    Latency: 0, Cache Line Size: 256 bytes
    Interrupt: pin A routed to IRQ 40
    Region 0: Memory at c1e14000 (64-bit, non-prefetchable) [size=16K]
    Capabilities: [50] Power Management version 2
        Flags: PMEClk- DSI- D1- D2- AuxCurrent=55mA
PME(D0+,D1-,D2-,D3hot+,D3cold+)
        Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-
    Capabilities: [60] MSI: Enable+ Count=1/1 Maskable- 64bit+
        Address: 00000000fee00438  Data: 0000
    Capabilities: [70] Express (v1) Root Complex Integrated Endpoint, MSI 00
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
            Ctrl:    Enable+ ID=0 ArbSelect=Fixed TC/VC=01
            Status:    NegoPending- InProgress-
        VC1:    Caps:    PATOffset=00 MaxTimeSlots=1 RejSnoopTrans-
            Arb:    Fixed- WRR32- WRR64- WRR128- TWRR128- WRR256-
            Ctrl:    Enable+ ID=2 ArbSelect=Fixed TC/VC=04
            Status:    NegoPending- InProgress-
    Kernel driver in use: snd_hda_intel

00:1c.0 PCI bridge: Intel Corporation 8 Series/C220 Series Chipset
Family PCI Express Root Port #1 (rev d5) (prog-if 00 [Normal decode])
    Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR- FastB2B- DisINTx+
    Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort-
<TAbort- <MAbort- >SERR- <PERR- INTx-
    Latency: 0, Cache Line Size: 256 bytes
    Interrupt: pin A routed to IRQ 28
    Bus: primary=00, secondary=02, subordinate=02, sec-latency=0
    I/O behind bridge: 00002000-00002fff
    Memory behind bridge: 7fa00000-7fbfffff
    Prefetchable memory behind bridge: 000000007fc00000-000000007fdfffff
    Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=fast >TAbort-
<TAbort- <MAbort+ <SERR- <PERR-
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
        LnkCap:    Port #1, Speed 5GT/s, Width x1, ASPM L0s L1, Exit
Latency L0s <1us, L1 <4us
            ClockPM- Surprise- LLActRep+ BwNot+ ASPMOptComp-
        LnkCtl:    ASPM Disabled; RCB 64 bytes Disabled- CommClk-
            ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
        LnkSta:    Speed 2.5GT/s, Width x0, TrErr- Train- SlotClk+
DLActive- BWMgmt- ABWMgmt-
        SltCap:    AttnBtn- PwrCtrl- MRL- AttnInd- PwrInd- HotPlug+
Surprise+
            Slot #0, PowerLimit 0.000W; Interlock- NoCompl+
        SltCtl:    Enable: AttnBtn- PwrFlt- MRL- PresDet+ CmdCplt-
HPIrq+ LinkChg+
            Control: AttnInd Unknown, PwrInd Unknown, Power- Interlock-
        SltSta:    Status: AttnBtn- PowerFlt- MRL- CmdCplt- PresDet-
Interlock-
            Changed: MRL- PresDet- LinkState-
        RootCtl: ErrCorrectable- ErrNon-Fatal- ErrFatal- PMEIntEna-
CRSVisible-
        RootCap: CRSVisible-
        RootSta: PME ReqID 0000, PMEStatus- PMEPending-
        DevCap2: Completion Timeout: Range ABC, TimeoutDis+, LTR+, OBFF
Via WAKE# ARIFwd-
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
        Address: fee00258  Data: 0000
    Capabilities: [90] Subsystem: Intel Corporation Device 7270
    Capabilities: [a0] Power Management version 3
        Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA
PME(D0+,D1-,D2-,D3hot+,D3cold+)
        Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-
    Kernel driver in use: pcieport

00:1c.2 PCI bridge: Intel Corporation 8 Series/C220 Series Chipset
Family PCI Express Root Port #3 (rev d5) (prog-if 00 [Normal decode])
    Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR- FastB2B- DisINTx-
    Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort-
<TAbort- <MAbort- >SERR- <PERR- INTx-
    Latency: 0, Cache Line Size: 256 bytes
    Interrupt: pin C routed to IRQ 18
    Bus: primary=00, secondary=03, subordinate=03, sec-latency=0
    I/O behind bridge: 0000f000-00000fff
    Memory behind bridge: c1800000-c1afffff
    Prefetchable memory behind bridge: 00000000fff00000-00000000000fffff
    Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=fast >TAbort-
<TAbort- <MAbort+ <SERR- <PERR-
    BridgeCtl: Parity- SERR- NoISA- VGA- MAbort- >Reset- FastB2B-
        PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-
    Capabilities: [40] Express (v2) Root Port (Slot+), MSI 00
        DevCap:    MaxPayload 128 bytes, PhantFunc 0
            ExtTag- RBE+
        DevCtl:    Report errors: Correctable- Non-Fatal+ Fatal+
Unsupported+
            RlxdOrd- ExtTag- PhantFunc- AuxPwr- NoSnoop-
            MaxPayload 128 bytes, MaxReadReq 128 bytes
        DevSta:    CorrErr+ UncorrErr- FatalErr- UnsuppReq- AuxPwr+
TransPend-
        LnkCap:    Port #3, Speed 5GT/s, Width x1, ASPM L0s L1, Exit
Latency L0s <512ns, L1 <16us
            ClockPM- Surprise- LLActRep+ BwNot+ ASPMOptComp-
        LnkCtl:    ASPM L0s L1 Enabled; RCB 64 bytes Disabled- CommClk+
            ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
        LnkSta:    Speed 2.5GT/s, Width x1, TrErr- Train- SlotClk+
DLActive+ BWMgmt+ ABWMgmt-
        SltCap:    AttnBtn- PwrCtrl- MRL- AttnInd- PwrInd- HotPlug-
Surprise-
            Slot #2, PowerLimit 10.000W; Interlock- NoCompl+
        SltCtl:    Enable: AttnBtn- PwrFlt- MRL- PresDet- CmdCplt-
HPIrq- LinkChg-
            Control: AttnInd Unknown, PwrInd Unknown, Power- Interlock-
        SltSta:    Status: AttnBtn- PowerFlt- MRL- CmdCplt- PresDet+
Interlock-
            Changed: MRL- PresDet- LinkState-
        RootCtl: ErrCorrectable- ErrNon-Fatal- ErrFatal- PMEIntEna-
CRSVisible-
        RootCap: CRSVisible-
        RootSta: PME ReqID 0000, PMEStatus- PMEPending-
        DevCap2: Completion Timeout: Range ABC, TimeoutDis+, LTR+, OBFF
Not Supported ARIFwd-
        DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-, LTR+,
OBFF Disabled ARIFwd-
        LnkCtl2: Target Link Speed: 2.5GT/s, EnterCompliance- SpeedDis-
             Transmit Margin: Normal Operating Range,
EnterModifiedCompliance- ComplianceSOS-
             Compliance De-emphasis: -6dB
        LnkSta2: Current De-emphasis Level: -3.5dB,
EqualizationComplete-, EqualizationPhase1-
             EqualizationPhase2-, EqualizationPhase3-,
LinkEqualizationRequest-
    Capabilities: [80] MSI: Enable- Count=1/1 Maskable- 64bit-
        Address: 00000000  Data: 0000
    Capabilities: [90] Subsystem: Intel Corporation Device 7270
    Capabilities: [a0] Power Management version 3
        Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA
PME(D0+,D1-,D2-,D3hot+,D3cold+)
        Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-
    Kernel driver in use: pcieport

00:1c.3 PCI bridge: Intel Corporation 8 Series/C220 Series Chipset
Family PCI Express Root Port #4 (rev d5) (prog-if 00 [Normal decode])
    Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR- FastB2B- DisINTx-
    Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort-
<TAbort- <MAbort- >SERR- <PERR- INTx-
    Latency: 0, Cache Line Size: 256 bytes
    Interrupt: pin D routed to IRQ 19
    Bus: primary=00, secondary=04, subordinate=04, sec-latency=0
    I/O behind bridge: 0000f000-00000fff
    Memory behind bridge: c1c00000-c1dfffff
    Prefetchable memory behind bridge: 00000000a0000000-00000000afffffff
    Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=fast >TAbort-
<TAbort- <MAbort+ <SERR- <PERR-
    BridgeCtl: Parity- SERR- NoISA- VGA- MAbort- >Reset- FastB2B-
        PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-
    Capabilities: [40] Express (v2) Root Port (Slot+), MSI 00
        DevCap:    MaxPayload 128 bytes, PhantFunc 0
            ExtTag- RBE+
        DevCtl:    Report errors: Correctable- Non-Fatal+ Fatal+
Unsupported+
            RlxdOrd- ExtTag- PhantFunc- AuxPwr- NoSnoop-
            MaxPayload 128 bytes, MaxReadReq 128 bytes
        DevSta:    CorrErr- UncorrErr- FatalErr- UnsuppReq- AuxPwr+
TransPend-
        LnkCap:    Port #4, Speed 5GT/s, Width x1, ASPM L0s L1, Exit
Latency L0s <512ns, L1 <16us
            ClockPM- Surprise- LLActRep+ BwNot+ ASPMOptComp-
        LnkCtl:    ASPM L1 Enabled; RCB 64 bytes Disabled- CommClk+
            ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
        LnkSta:    Speed 5GT/s, Width x1, TrErr- Train- SlotClk+
DLActive+ BWMgmt+ ABWMgmt-
        SltCap:    AttnBtn- PwrCtrl- MRL- AttnInd- PwrInd- HotPlug-
Surprise-
            Slot #3, PowerLimit 10.000W; Interlock- NoCompl+
        SltCtl:    Enable: AttnBtn- PwrFlt- MRL- PresDet- CmdCplt-
HPIrq- LinkChg-
            Control: AttnInd Unknown, PwrInd Unknown, Power- Interlock-
        SltSta:    Status: AttnBtn- PowerFlt- MRL- CmdCplt- PresDet+
Interlock-
            Changed: MRL- PresDet- LinkState-
        RootCtl: ErrCorrectable- ErrNon-Fatal- ErrFatal- PMEIntEna-
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
        LnkSta2: Current De-emphasis Level: -6dB, EqualizationComplete-,
EqualizationPhase1-
             EqualizationPhase2-, EqualizationPhase3-,
LinkEqualizationRequest-
    Capabilities: [80] MSI: Enable- Count=1/1 Maskable- 64bit-
        Address: 00000000  Data: 0000
    Capabilities: [90] Subsystem: Intel Corporation Device 7270
    Capabilities: [a0] Power Management version 3
        Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA
PME(D0+,D1-,D2-,D3hot+,D3cold+)
        Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-
    Kernel driver in use: pcieport

00:1c.4 PCI bridge: Intel Corporation 8 Series/C220 Series Chipset
Family PCI Express Root Port #5 (rev d5) (prog-if 00 [Normal decode])
    Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR- FastB2B- DisINTx-
    Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort-
<TAbort- <MAbort- >SERR- <PERR- INTx-
    Latency: 0, Cache Line Size: 256 bytes
    Interrupt: pin A routed to IRQ 16
    Bus: primary=00, secondary=05, subordinate=05, sec-latency=0
    I/O behind bridge: 0000f000-00000fff
    Memory behind bridge: c1b00000-c1bfffff
    Prefetchable memory behind bridge: 00000000fff00000-00000000000fffff
    Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=fast >TAbort-
<TAbort- <MAbort+ <SERR- <PERR-
    BridgeCtl: Parity- SERR- NoISA- VGA- MAbort- >Reset- FastB2B-
        PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-
    Capabilities: [40] Express (v2) Root Port (Slot+), MSI 00
        DevCap:    MaxPayload 128 bytes, PhantFunc 0
            ExtTag- RBE+
        DevCtl:    Report errors: Correctable- Non-Fatal+ Fatal+
Unsupported+
            RlxdOrd- ExtTag- PhantFunc- AuxPwr- NoSnoop-
            MaxPayload 128 bytes, MaxReadReq 128 bytes
        DevSta:    CorrErr- UncorrErr- FatalErr- UnsuppReq- AuxPwr+
TransPend-
        LnkCap:    Port #5, Speed 5GT/s, Width x4, ASPM L0s L1, Exit
Latency L0s <512ns, L1 <16us
            ClockPM- Surprise- LLActRep+ BwNot+ ASPMOptComp-
        LnkCtl:    ASPM L1 Enabled; RCB 64 bytes Disabled- CommClk+
            ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
        LnkSta:    Speed 5GT/s, Width x2, TrErr- Train- SlotClk+
DLActive+ BWMgmt+ ABWMgmt-
        SltCap:    AttnBtn- PwrCtrl- MRL- AttnInd- PwrInd- HotPlug-
Surprise-
            Slot #4, PowerLimit 25.000W; Interlock- NoCompl+
        SltCtl:    Enable: AttnBtn- PwrFlt- MRL- PresDet- CmdCplt-
HPIrq- LinkChg-
            Control: AttnInd Unknown, PwrInd Unknown, Power- Interlock-
        SltSta:    Status: AttnBtn- PowerFlt- MRL- CmdCplt- PresDet+
Interlock-
            Changed: MRL- PresDet- LinkState-
        RootCtl: ErrCorrectable- ErrNon-Fatal- ErrFatal- PMEIntEna-
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
        LnkSta2: Current De-emphasis Level: -6dB, EqualizationComplete-,
EqualizationPhase1-
             EqualizationPhase2-, EqualizationPhase3-,
LinkEqualizationRequest-
    Capabilities: [80] MSI: Enable- Count=1/1 Maskable- 64bit-
        Address: 00000000  Data: 0000
    Capabilities: [90] Subsystem: Intel Corporation Device 7270
    Capabilities: [a0] Power Management version 3
        Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA
PME(D0+,D1-,D2-,D3hot+,D3cold+)
        Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-
    Kernel driver in use: pcieport

00:1f.0 ISA bridge: Intel Corporation HM87 Express LPC Controller (rev 05)
    Subsystem: Intel Corporation Device 7270
    Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR- FastB2B- DisINTx-
    Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=medium >TAbort-
<TAbort- <MAbort- >SERR- <PERR- INTx-
    Latency: 0
    Capabilities: [e0] Vendor Specific Information: Len=0c <?>
    Kernel driver in use: lpc_ich

00:1f.3 SMBus: Intel Corporation 8 Series/C220 Series Chipset Family
SMBus Controller (rev 05)
    Subsystem: Intel Corporation Device 7270
    Control: I/O+ Mem+ BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR- FastB2B- DisINTx-
    Status: Cap- 66MHz- UDF- FastB2B+ ParErr- DEVSEL=medium >TAbort-
<TAbort- <MAbort- >SERR- <PERR- INTx-
    Interrupt: pin C routed to IRQ 0
    Region 0: Memory at c1e19000 (64-bit, non-prefetchable) [size=256]
    Region 4: I/O ports at efa0 [size=32]

01:00.0 VGA compatible controller: NVIDIA Corporation GK107M [GeForce GT
750M Mac Edition] (rev a1) (prog-if 00 [VGA controller])
    Subsystem: Apple Inc. Device 0130
    Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR- FastB2B- DisINTx+
    Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort-
<TAbort- <MAbort- >SERR- <PERR- INTx-
    Latency: 0, Cache Line Size: 256 bytes
    Interrupt: pin A routed to IRQ 36
    Region 0: Memory at c0000000 (32-bit, non-prefetchable) [size=16M]
    Region 1: Memory at 80000000 (64-bit, prefetchable) [size=256M]
    Region 3: Memory at 90000000 (64-bit, prefetchable) [size=32M]
    Region 5: I/O ports at 1000 [size=128]
    Expansion ROM at c1000000 [disabled] [size=512K]
    Capabilities: [60] Power Management version 3
        Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA
PME(D0-,D1-,D2-,D3hot-,D3cold-)
        Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
    Capabilities: [68] MSI: Enable+ Count=1/1 Maskable- 64bit+
        Address: 00000000fee00398  Data: 0000
    Capabilities: [78] Express (v2) Endpoint, MSI 00
        DevCap:    MaxPayload 256 bytes, PhantFunc 0, Latency L0s
unlimited, L1 <64us
            ExtTag+ AttnBtn- AttnInd- PwrInd- RBE+ FLReset-
        DevCtl:    Report errors: Correctable- Non-Fatal- Fatal-
Unsupported-
            RlxdOrd+ ExtTag+ PhantFunc- AuxPwr- NoSnoop+
            MaxPayload 256 bytes, MaxReadReq 512 bytes
        DevSta:    CorrErr+ UncorrErr- FatalErr- UnsuppReq+ AuxPwr-
TransPend-
        LnkCap:    Port #0, Speed 8GT/s, Width x16, ASPM L0s L1, Exit
Latency L0s <512ns, L1 <4us
            ClockPM+ Surprise- LLActRep- BwNot- ASPMOptComp+
        LnkCtl:    ASPM L0s L1 Enabled; RCB 64 bytes Disabled- CommClk+
            ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
        LnkSta:    Speed 2.5GT/s, Width x8, TrErr- Train- SlotClk+
DLActive- BWMgmt- ABWMgmt-
        DevCap2: Completion Timeout: Range AB, TimeoutDis+, LTR-, OBFF
Not Supported
        DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-, LTR-,
OBFF Disabled
        LnkCtl2: Target Link Speed: 8GT/s, EnterCompliance- SpeedDis-
             Transmit Margin: Normal Operating Range,
EnterModifiedCompliance- ComplianceSOS-
             Compliance De-emphasis: -6dB
        LnkSta2: Current De-emphasis Level: -3.5dB,
EqualizationComplete+, EqualizationPhase1+
             EqualizationPhase2+, EqualizationPhase3+,
LinkEqualizationRequest+
    Capabilities: [b4] Vendor Specific Information: Len=14 <?>
    Capabilities: [100 v1] Virtual Channel
        Caps:    LPEVC=0 RefClk=100ns PATEntryBits=1
        Arb:    Fixed- WRR32- WRR64- WRR128-
        Ctrl:    ArbSelect=Fixed
        Status:    InProgress-
        VC0:    Caps:    PATOffset=00 MaxTimeSlots=1 RejSnoopTrans-
            Arb:    Fixed- WRR32- WRR64- WRR128- TWRR128- WRR256-
            Ctrl:    Enable+ ID=0 ArbSelect=Fixed TC/VC=ff
            Status:    NegoPending- InProgress-
    Capabilities: [128 v1] Power Budgeting <?>
    Capabilities: [420 v2] Advanced Error Reporting
        UESta:    DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt-
RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-
        UEMsk:    DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt-
RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-
        UESvrt:    DLP+ SDES+ TLP- FCP+ CmpltTO- CmpltAbrt- UnxCmplt-
RxOF+ MalfTLP+ ECRC- UnsupReq- ACSViol-
        CESta:    RxErr- BadTLP- BadDLLP- Rollover- Timeout- NonFatalErr+
        CEMsk:    RxErr- BadTLP- BadDLLP- Rollover- Timeout- NonFatalErr+
        AERCap:    First Error Pointer: 00, GenCap- CGenEn- ChkCap- ChkEn-
    Capabilities: [600 v1] Vendor Specific Information: ID=0001 Rev=1
Len=024 <?>
    Capabilities: [900 v1] #19
    Kernel driver in use: nouveau

01:00.1 Audio device: NVIDIA Corporation GK107 HDMI Audio Controller
(rev a1)
    Subsystem: Apple Inc. Device 0130
    Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR- FastB2B- DisINTx-
    Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort-
<TAbort- <MAbort- >SERR- <PERR- INTx-
    Latency: 0, Cache Line Size: 256 bytes
    Interrupt: pin B routed to IRQ 17
    Region 0: Memory at c1080000 (32-bit, non-prefetchable) [size=16K]
    Capabilities: [60] Power Management version 3
        Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA
PME(D0-,D1-,D2-,D3hot-,D3cold-)
        Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
    Capabilities: [68] MSI: Enable- Count=1/1 Maskable- 64bit+
        Address: 0000000000000000  Data: 0000
    Capabilities: [78] Express (v2) Endpoint, MSI 00
        DevCap:    MaxPayload 256 bytes, PhantFunc 0, Latency L0s
unlimited, L1 <64us
            ExtTag+ AttnBtn- AttnInd- PwrInd- RBE+ FLReset-
        DevCtl:    Report errors: Correctable- Non-Fatal- Fatal-
Unsupported-
            RlxdOrd+ ExtTag+ PhantFunc- AuxPwr- NoSnoop+
            MaxPayload 256 bytes, MaxReadReq 512 bytes
        DevSta:    CorrErr- UncorrErr- FatalErr- UnsuppReq- AuxPwr-
TransPend-
        LnkCap:    Port #0, Speed 8GT/s, Width x16, ASPM L0s L1, Exit
Latency L0s <512ns, L1 <4us
            ClockPM+ Surprise- LLActRep- BwNot- ASPMOptComp+
        LnkCtl:    ASPM L0s L1 Enabled; RCB 64 bytes Disabled- CommClk+
            ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
        LnkSta:    Speed 2.5GT/s, Width x8, TrErr- Train- SlotClk+
DLActive- BWMgmt- ABWMgmt-
        DevCap2: Completion Timeout: Range AB, TimeoutDis+, LTR-, OBFF
Not Supported
        DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-, LTR-,
OBFF Disabled
        LnkSta2: Current De-emphasis Level: -3.5dB,
EqualizationComplete+, EqualizationPhase1+
             EqualizationPhase2+, EqualizationPhase3+,
LinkEqualizationRequest+
    Kernel driver in use: snd_hda_intel

03:00.0 Network controller: Broadcom Corporation BCM4360 802.11ac
Wireless Network Adapter (rev 03)
    Subsystem: Apple Inc. Device 0134
    Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR- FastB2B- DisINTx-
    Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort-
<TAbort- <MAbort- >SERR- <PERR- INTx-
    Latency: 0, Cache Line Size: 256 bytes
    Interrupt: pin A routed to IRQ 18
    Region 0: Memory at c1a00000 (64-bit, non-prefetchable) [size=32K]
    Region 2: Memory at c1800000 (64-bit, non-prefetchable) [size=2M]
    Capabilities: [48] Power Management version 3
        Flags: PMEClk- DSI- D1+ D2+ AuxCurrent=0mA
PME(D0+,D1+,D2+,D3hot+,D3cold+)
        Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=2 PME-
    Capabilities: [58] MSI: Enable- Count=1/1 Maskable- 64bit+
        Address: 0000000000000000  Data: 0000
    Capabilities: [68] Vendor Specific Information: Len=44 <?>
    Capabilities: [ac] Express (v2) Endpoint, MSI 00
        DevCap:    MaxPayload 256 bytes, PhantFunc 0, Latency L0s <4us,
L1 unlimited
            ExtTag- AttnBtn- AttnInd- PwrInd- RBE+ FLReset-
        DevCtl:    Report errors: Correctable- Non-Fatal- Fatal-
Unsupported-
            RlxdOrd+ ExtTag- PhantFunc- AuxPwr+ NoSnoop+
            MaxPayload 128 bytes, MaxReadReq 1024 bytes
        DevSta:    CorrErr- UncorrErr- FatalErr- UnsuppReq- AuxPwr+
TransPend-
        LnkCap:    Port #0, Speed 2.5GT/s, Width x1, ASPM L0s L1, Exit
Latency L0s <2us, L1 <32us
            ClockPM+ Surprise- LLActRep- BwNot- ASPMOptComp+
        LnkCtl:    ASPM L0s L1 Enabled; RCB 64 bytes Disabled- CommClk+
            ExtSynch- ClockPM+ AutWidDis- BWInt- AutBWInt-
        LnkSta:    Speed 2.5GT/s, Width x1, TrErr- Train- SlotClk+
DLActive- BWMgmt- ABWMgmt-
        DevCap2: Completion Timeout: Range ABCD, TimeoutDis+, LTR+, OBFF
Via WAKE#
        DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-, LTR+,
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
        AERCap:    First Error Pointer: 00, GenCap+ CGenEn- ChkCap+ ChkEn-
    Capabilities: [13c v1] Device Serial Number b8-e8-00-ff-ff-00-00-01
    Capabilities: [150 v1] Power Budgeting <?>
    Capabilities: [160 v1] Virtual Channel
        Caps:    LPEVC=0 RefClk=100ns PATEntryBits=1
        Arb:    Fixed- WRR32- WRR64- WRR128-
        Ctrl:    ArbSelect=Fixed
        Status:    InProgress-
        VC0:    Caps:    PATOffset=00 MaxTimeSlots=1 RejSnoopTrans-
            Arb:    Fixed- WRR32- WRR64- WRR128- TWRR128- WRR256-
            Ctrl:    Enable+ ID=0 ArbSelect=Fixed TC/VC=ff
            Status:    NegoPending- InProgress-
    Capabilities: [1b0 v1] Latency Tolerance Reporting
        Max snoop latency: 71680ns
        Max no snoop latency: 71680ns
    Capabilities: [220 v1] #15
    Kernel driver in use: wl

04:00.0 Multimedia controller: Broadcom Corporation 720p FaceTime HD Camera
    Subsystem: Broadcom Corporation 720p FaceTime HD Camera
    Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR- FastB2B- DisINTx+
    Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort-
<TAbort- <MAbort- >SERR- <PERR- INTx-
    Latency: 0, Cache Line Size: 256 bytes
    Interrupt: pin A routed to IRQ 39
    Region 0: Memory at c1d00000 (64-bit, non-prefetchable) [size=64K]
    Region 2: Memory at a0000000 (64-bit, prefetchable) [size=256M]
    Region 4: Memory at c1c00000 (64-bit, non-prefetchable) [size=1M]
    Capabilities: [48] Power Management version 3
        Flags: PMEClk- DSI- D1+ D2- AuxCurrent=0mA
PME(D0+,D1-,D2-,D3hot+,D3cold-)
        Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=2 PME-
    Capabilities: [58] MSI: Enable+ Count=1/1 Maskable- 64bit+
        Address: 0000000000000000  Data: 0000
    Capabilities: [68] Vendor Specific Information: Len=44 <?>
    Capabilities: [ac] Express (v2) Endpoint, MSI 00
        DevCap:    MaxPayload 512 bytes, PhantFunc 0, Latency L0s <4us,
L1 unlimited
            ExtTag- AttnBtn- AttnInd- PwrInd- RBE+ FLReset-
        DevCtl:    Report errors: Correctable- Non-Fatal- Fatal-
Unsupported-
            RlxdOrd+ ExtTag- PhantFunc- AuxPwr+ NoSnoop+
            MaxPayload 128 bytes, MaxReadReq 512 bytes
        DevSta:    CorrErr+ UncorrErr- FatalErr- UnsuppReq+ AuxPwr-
TransPend-
        LnkCap:    Port #0, Speed 5GT/s, Width x1, ASPM L0s L1, Exit
Latency L0s <2us, L1 <32us
            ClockPM+ Surprise- LLActRep- BwNot- ASPMOptComp+
        LnkCtl:    ASPM L1 Enabled; RCB 64 bytes Disabled- CommClk+
            ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
        LnkSta:    Speed 5GT/s, Width x1, TrErr- Train- SlotClk+
DLActive- BWMgmt- ABWMgmt-
        DevCap2: Completion Timeout: Range ABCD, TimeoutDis+, LTR+, OBFF
Via WAKE#
        DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-, LTR+,
OBFF Disabled
        LnkCtl2: Target Link Speed: 2.5GT/s, EnterCompliance- SpeedDis-
             Transmit Margin: Normal Operating Range,
EnterModifiedCompliance- ComplianceSOS-
             Compliance De-emphasis: -6dB
        LnkSta2: Current De-emphasis Level: -6dB, EqualizationComplete-,
EqualizationPhase1-
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
        AERCap:    First Error Pointer: 00, GenCap+ CGenEn- ChkCap+ ChkEn-
    Capabilities: [13c v1] Device Serial Number 00-00-00-ff-ff-00-00-00
    Capabilities: [150 v1] Power Budgeting <?>
    Capabilities: [160 v1] Virtual Channel
        Caps:    LPEVC=0 RefClk=100ns PATEntryBits=1
        Arb:    Fixed- WRR32- WRR64- WRR128-
        Ctrl:    ArbSelect=Fixed
        Status:    InProgress-
        VC0:    Caps:    PATOffset=00 MaxTimeSlots=1 RejSnoopTrans-
            Arb:    Fixed- WRR32- WRR64- WRR128- TWRR128- WRR256-
            Ctrl:    Enable+ ID=0 ArbSelect=Fixed TC/VC=ff
            Status:    NegoPending- InProgress-
    Capabilities: [1b0 v1] Latency Tolerance Reporting
        Max snoop latency: 71680ns
        Max no snoop latency: 71680ns
    Capabilities: [220 v1] #15
    Kernel driver in use: bdc-pci

05:00.0 SATA controller: Samsung Electronics Co Ltd Apple PCIe SSD (rev
01) (prog-if 01 [AHCI 1.0])
    Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR- FastB2B- DisINTx-
    Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort-
<TAbort- <MAbort- >SERR- <PERR- INTx-
    Latency: 0, Cache Line Size: 256 bytes
    Interrupt: pin A routed to IRQ 16
    Region 5: Memory at c1b00000 (32-bit, non-prefetchable) [size=8K]
    Expansion ROM at c1b10000 [disabled] [size=64K]
    Capabilities: [40] Power Management version 3
        Flags: PMEClk- DSI- D1- D2- AuxCurrent=375mA
PME(D0-,D1-,D2-,D3hot+,D3cold+)
        Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-
    Capabilities: [50] MSI: Enable- Count=1/2 Maskable+ 64bit+
        Address: 0000000000000000  Data: 0000
        Masking: 00000000  Pending: 00000000
    Capabilities: [70] Express (v2) Endpoint, MSI 00
        DevCap:    MaxPayload 256 bytes, PhantFunc 0, Latency L0s
unlimited, L1 unlimited
            ExtTag- AttnBtn- AttnInd- PwrInd- RBE+ FLReset-
        DevCtl:    Report errors: Correctable- Non-Fatal- Fatal-
Unsupported-
            RlxdOrd+ ExtTag- PhantFunc- AuxPwr- NoSnoop+
            MaxPayload 128 bytes, MaxReadReq 512 bytes
        DevSta:    CorrErr+ UncorrErr- FatalErr- UnsuppReq+ AuxPwr+
TransPend-
        LnkCap:    Port #0, Speed 5GT/s, Width x4, ASPM L0s L1, Exit
Latency L0s <4us, L1 <64us
            ClockPM+ Surprise- LLActRep- BwNot- ASPMOptComp+
        LnkCtl:    ASPM L1 Enabled; RCB 64 bytes Disabled- CommClk+
            ExtSynch- ClockPM+ AutWidDis- BWInt- AutBWInt-
        LnkSta:    Speed 5GT/s, Width x2, TrErr- Train- SlotClk+
DLActive- BWMgmt- ABWMgmt-
        DevCap2: Completion Timeout: Not Supported, TimeoutDis+, LTR+,
OBFF Not Supported
        DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-, LTR+,
OBFF Disabled
        LnkCtl2: Target Link Speed: 5GT/s, EnterCompliance- SpeedDis-
             Transmit Margin: Normal Operating Range,
EnterModifiedCompliance- ComplianceSOS-
             Compliance De-emphasis: -6dB
        LnkSta2: Current De-emphasis Level: -6dB, EqualizationComplete-,
EqualizationPhase1-
             EqualizationPhase2-, EqualizationPhase3-,
LinkEqualizationRequest-
    Capabilities: [d0] Vital Product Data
pcilib: sysfs_read_vpd: read failed: Connection timed out
        Not readable
    Capabilities: [100 v2] Advanced Error Reporting
        UESta:    DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt-
RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-
        UEMsk:    DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt-
RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-
        UESvrt:    DLP+ SDES+ TLP- FCP+ CmpltTO- CmpltAbrt- UnxCmplt-
RxOF+ MalfTLP+ ECRC- UnsupReq- ACSViol-
        CESta:    RxErr- BadTLP- BadDLLP- Rollover- Timeout- NonFatalErr-
        CEMsk:    RxErr- BadTLP- BadDLLP- Rollover- Timeout- NonFatalErr+
        AERCap:    First Error Pointer: 00, GenCap+ CGenEn- ChkCap+ ChkEn-
    Capabilities: [140 v1] Device Serial Number 00-00-00-00-00-00-00-00
    Capabilities: [150 v1] Power Budgeting <?>
    Capabilities: [160 v1] Latency Tolerance Reporting
        Max snoop latency: 71680ns
        Max no snoop latency: 71680ns
    Kernel driver in use: ahci

06:00.0 PCI bridge: Intel Corporation Device 156d (prog-if 00 [Normal
decode])
    Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR- FastB2B- DisINTx+
    Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort-
<TAbort- <MAbort- >SERR- <PERR- INTx-
    Latency: 0, Cache Line Size: 256 bytes
    Interrupt: pin A routed to IRQ 29
    Bus: primary=06, secondary=07, subordinate=6c, sec-latency=0
    I/O behind bridge: 00003000-00004fff
    Memory behind bridge: c1f00000-c9ffffff
    Prefetchable memory behind bridge: 00000000ce000000-00000000d5ffffff
    Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=fast >TAbort-
<TAbort- <MAbort- <SERR- <PERR-
    BridgeCtl: Parity- SERR- NoISA- VGA- MAbort- >Reset- FastB2B-
        PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-
    Capabilities: [80] Power Management version 3
        Flags: PMEClk- DSI- D1+ D2+ AuxCurrent=0mA
PME(D0+,D1+,D2+,D3hot+,D3cold+)
        Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=1 PME-
    Capabilities: [88] MSI: Enable+ Count=1/1 Maskable- 64bit+
        Address: 0000000000000000  Data: 0000
    Capabilities: [ac] Subsystem: Device 2222:1111
    Capabilities: [c0] Express (v2) Upstream Port, MSI 00
        DevCap:    MaxPayload 128 bytes, PhantFunc 0
            ExtTag+ AttnBtn- AttnInd- PwrInd- RBE+ SlotPowerLimit 75.000W
        DevCtl:    Report errors: Correctable- Non-Fatal- Fatal-
Unsupported-
            RlxdOrd+ ExtTag+ PhantFunc- AuxPwr- NoSnoop+
            MaxPayload 128 bytes, MaxReadReq 512 bytes
        DevSta:    CorrErr+ UncorrErr- FatalErr- UnsuppReq+ AuxPwr+
TransPend-
        LnkCap:    Port #0, Speed 5GT/s, Width x4, ASPM L0s L1, Exit
Latency L0s <2us, L1 <4us
            ClockPM+ Surprise- LLActRep- BwNot- ASPMOptComp-
        LnkCtl:    ASPM Disabled; Disabled- CommClk+
            ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
        LnkSta:    Speed 5GT/s, Width x4, TrErr- Train- SlotClk+
DLActive- BWMgmt- ABWMgmt-
        DevCap2: Completion Timeout: Not Supported, TimeoutDis-, LTR+,
OBFF Not Supported
        DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-, LTR+,
OBFF Disabled
        LnkCtl2: Target Link Speed: 5GT/s, EnterCompliance- SpeedDis-
             Transmit Margin: Normal Operating Range,
EnterModifiedCompliance- ComplianceSOS-
             Compliance De-emphasis: -6dB
        LnkSta2: Current De-emphasis Level: -3.5dB,
EqualizationComplete-, EqualizationPhase1-
             EqualizationPhase2-, EqualizationPhase3-,
LinkEqualizationRequest-
    Capabilities: [100 v1] Device Serial Number df-a2-b0-91-f0-e9-07-00
    Capabilities: [200 v1] Advanced Error Reporting
        UESta:    DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt-
RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-
        UEMsk:    DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt-
RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-
        UESvrt:    DLP+ SDES+ TLP- FCP+ CmpltTO- CmpltAbrt- UnxCmplt-
RxOF+ MalfTLP+ ECRC- UnsupReq- ACSViol-
        CESta:    RxErr- BadTLP- BadDLLP- Rollover- Timeout- NonFatalErr-
        CEMsk:    RxErr- BadTLP- BadDLLP- Rollover- Timeout- NonFatalErr+
        AERCap:    First Error Pointer: 00, GenCap- CGenEn- ChkCap- ChkEn-
    Capabilities: [300 v1] Virtual Channel
        Caps:    LPEVC=0 RefClk=100ns PATEntryBits=1
        Arb:    Fixed- WRR32- WRR64- WRR128-
        Ctrl:    ArbSelect=Fixed
        Status:    InProgress-
        VC0:    Caps:    PATOffset=00 MaxTimeSlots=1 RejSnoopTrans-
            Arb:    Fixed+ WRR32- WRR64- WRR128- TWRR128- WRR256-
            Ctrl:    Enable+ ID=0 ArbSelect=Fixed TC/VC=ff
            Status:    NegoPending- InProgress-
    Capabilities: [400 v1] Power Budgeting <?>
    Capabilities: [500 v1] Vendor Specific Information: ID=1234 Rev=1
Len=050 <?>
    Capabilities: [600 v1] Latency Tolerance Reporting
        Max snoop latency: 71680ns
        Max no snoop latency: 71680ns
    Kernel driver in use: pcieport

07:00.0 PCI bridge: Intel Corporation Device 156d (prog-if 00 [Normal
decode])
    Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR- FastB2B- DisINTx+
    Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort-
<TAbort- <MAbort- >SERR- <PERR- INTx-
    Latency: 0, Cache Line Size: 256 bytes
    Interrupt: pin A routed to IRQ 30
    Bus: primary=07, secondary=08, subordinate=08, sec-latency=0
    I/O behind bridge: 0000f000-00000fff
    Memory behind bridge: c1f00000-c1ffffff
    Prefetchable memory behind bridge: 00000000fff00000-00000000000fffff
    Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=fast >TAbort-
<TAbort- <MAbort- <SERR- <PERR-
    BridgeCtl: Parity- SERR- NoISA- VGA- MAbort- >Reset- FastB2B-
        PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-
    Capabilities: [80] Power Management version 3
        Flags: PMEClk- DSI- D1+ D2+ AuxCurrent=0mA
PME(D0+,D1+,D2+,D3hot+,D3cold+)
        Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=1 PME-
    Capabilities: [88] MSI: Enable+ Count=1/1 Maskable- 64bit+
        Address: 00000000fee002f8  Data: 0000
    Capabilities: [ac] Subsystem: Device 2222:1111
    Capabilities: [c0] Express (v2) Downstream Port (Slot+), MSI 00
        DevCap:    MaxPayload 128 bytes, PhantFunc 0
            ExtTag+ RBE+
        DevCtl:    Report errors: Correctable- Non-Fatal- Fatal-
Unsupported-
            RlxdOrd+ ExtTag+ PhantFunc- AuxPwr- NoSnoop+
            MaxPayload 128 bytes, MaxReadReq 512 bytes
        DevSta:    CorrErr- UncorrErr+ FatalErr- UnsuppReq+ AuxPwr+
TransPend-
        LnkCap:    Port #0, Speed 2.5GT/s, Width x4, ASPM L0s L1, Exit
Latency L0s <2us, L1 <4us
            ClockPM- Surprise- LLActRep+ BwNot+ ASPMOptComp-
        LnkCtl:    ASPM Disabled; Disabled- CommClk+
            ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
        LnkSta:    Speed 2.5GT/s, Width x4, TrErr- Train- SlotClk+
DLActive+ BWMgmt+ ABWMgmt-
        SltCap:    AttnBtn- PwrCtrl- MRL- AttnInd- PwrInd- HotPlug+
Surprise+
            Slot #0, PowerLimit 0.000W; Interlock- NoCompl+
        SltCtl:    Enable: AttnBtn- PwrFlt- MRL- PresDet+ CmdCplt-
HPIrq+ LinkChg+
            Control: AttnInd Unknown, PwrInd Unknown, Power- Interlock-
        SltSta:    Status: AttnBtn- PowerFlt- MRL- CmdCplt- PresDet+
Interlock-
            Changed: MRL- PresDet- LinkState-
        DevCap2: Completion Timeout: Not Supported, TimeoutDis-, LTR+,
OBFF Not Supported ARIFwd-
        DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-, LTR+,
OBFF Disabled ARIFwd-
        LnkCtl2: Target Link Speed: 2.5GT/s, EnterCompliance- SpeedDis-,
Selectable De-emphasis: -6dB
             Transmit Margin: Normal Operating Range,
EnterModifiedCompliance- ComplianceSOS-
             Compliance De-emphasis: -6dB
        LnkSta2: Current De-emphasis Level: -3.5dB,
EqualizationComplete-, EqualizationPhase1-
             EqualizationPhase2-, EqualizationPhase3-,
LinkEqualizationRequest-
    Capabilities: [100 v1] Device Serial Number df-a2-b0-91-f0-e9-07-00
    Capabilities: [200 v1] Advanced Error Reporting
        UESta:    DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt-
RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-
        UEMsk:    DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt-
RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-
        UESvrt:    DLP+ SDES+ TLP- FCP+ CmpltTO- CmpltAbrt- UnxCmplt-
RxOF+ MalfTLP+ ECRC- UnsupReq- ACSViol-
        CESta:    RxErr- BadTLP- BadDLLP- Rollover- Timeout- NonFatalErr-
        CEMsk:    RxErr- BadTLP- BadDLLP- Rollover- Timeout- NonFatalErr+
        AERCap:    First Error Pointer: 00, GenCap- CGenEn- ChkCap- ChkEn-
    Capabilities: [300 v1] Virtual Channel
        Caps:    LPEVC=0 RefClk=100ns PATEntryBits=1
        Arb:    Fixed- WRR32- WRR64- WRR128-
        Ctrl:    ArbSelect=Fixed
        Status:    InProgress-
        VC0:    Caps:    PATOffset=00 MaxTimeSlots=1 RejSnoopTrans-
            Arb:    Fixed+ WRR32- WRR64- WRR128- TWRR128- WRR256-
            Ctrl:    Enable+ ID=0 ArbSelect=Fixed TC/VC=ff
            Status:    NegoPending- InProgress-
    Capabilities: [400 v1] Power Budgeting <?>
    Capabilities: [500 v1] Vendor Specific Information: ID=1234 Rev=1
Len=050 <?>
    Kernel driver in use: pcieport

07:03.0 PCI bridge: Intel Corporation Device 156d (prog-if 00 [Normal
decode])
    Physical Slot: 2
    Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR- FastB2B- DisINTx+
    Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort-
<TAbort- <MAbort- >SERR- <PERR- INTx-
    Latency: 0, Cache Line Size: 256 bytes
    Interrupt: pin A routed to IRQ 31
    Bus: primary=07, secondary=09, subordinate=39, sec-latency=0
    I/O behind bridge: 00003000-00003fff
    Memory behind bridge: c2000000-c5ffffff
    Prefetchable memory behind bridge: 00000000ce000000-00000000d1ffffff
    Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=fast >TAbort-
<TAbort- <MAbort- <SERR- <PERR-
    BridgeCtl: Parity- SERR- NoISA- VGA- MAbort- >Reset- FastB2B-
        PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-
    Capabilities: [80] Power Management version 3
        Flags: PMEClk- DSI- D1+ D2+ AuxCurrent=0mA
PME(D0+,D1+,D2+,D3hot+,D3cold+)
        Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=1 PME-
    Capabilities: [88] MSI: Enable+ Count=1/1 Maskable- 64bit+
        Address: 00000000fee002b8  Data: 0000
    Capabilities: [ac] Subsystem: Device 2222:1111
    Capabilities: [c0] Express (v2) Downstream Port (Slot+), MSI 00
        DevCap:    MaxPayload 128 bytes, PhantFunc 0
            ExtTag+ RBE+
        DevCtl:    Report errors: Correctable- Non-Fatal- Fatal-
Unsupported-
            RlxdOrd+ ExtTag+ PhantFunc- AuxPwr- NoSnoop+
            MaxPayload 128 bytes, MaxReadReq 512 bytes
        DevSta:    CorrErr- UncorrErr- FatalErr- UnsuppReq- AuxPwr+
TransPend-
        LnkCap:    Port #3, Speed 2.5GT/s, Width x4, ASPM L0s L1, Exit
Latency L0s <2us, L1 <4us
            ClockPM- Surprise- LLActRep+ BwNot+ ASPMOptComp-
        LnkCtl:    ASPM Disabled; Disabled- CommClk+
            ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
        LnkSta:    Speed 2.5GT/s, Width x4, TrErr- Train- SlotClk+
DLActive- BWMgmt- ABWMgmt-
        SltCap:    AttnBtn- PwrCtrl- MRL- AttnInd- PwrInd- HotPlug+
Surprise+
            Slot #3, PowerLimit 0.000W; Interlock- NoCompl+
        SltCtl:    Enable: AttnBtn- PwrFlt- MRL- PresDet+ CmdCplt-
HPIrq+ LinkChg+
            Control: AttnInd Unknown, PwrInd Unknown, Power- Interlock-
        SltSta:    Status: AttnBtn- PowerFlt- MRL- CmdCplt- PresDet-
Interlock-
            Changed: MRL- PresDet- LinkState-
        DevCap2: Completion Timeout: Not Supported, TimeoutDis-, LTR+,
OBFF Not Supported ARIFwd-
        DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-, LTR-,
OBFF Disabled ARIFwd-
        LnkCtl2: Target Link Speed: 2.5GT/s, EnterCompliance- SpeedDis-,
Selectable De-emphasis: -6dB
             Transmit Margin: Normal Operating Range,
EnterModifiedCompliance- ComplianceSOS-
             Compliance De-emphasis: -6dB
        LnkSta2: Current De-emphasis Level: -3.5dB,
EqualizationComplete-, EqualizationPhase1-
             EqualizationPhase2-, EqualizationPhase3-,
LinkEqualizationRequest-
    Capabilities: [100 v1] Device Serial Number df-a2-b0-91-f0-e9-07-00
    Capabilities: [200 v1] Advanced Error Reporting
        UESta:    DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt-
RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-
        UEMsk:    DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt-
RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-
        UESvrt:    DLP+ SDES+ TLP- FCP+ CmpltTO- CmpltAbrt- UnxCmplt-
RxOF+ MalfTLP+ ECRC- UnsupReq- ACSViol-
        CESta:    RxErr- BadTLP- BadDLLP- Rollover- Timeout- NonFatalErr-
        CEMsk:    RxErr- BadTLP- BadDLLP- Rollover- Timeout- NonFatalErr+
        AERCap:    First Error Pointer: 00, GenCap- CGenEn- ChkCap- ChkEn-
    Capabilities: [300 v1] Virtual Channel
        Caps:    LPEVC=0 RefClk=100ns PATEntryBits=1
        Arb:    Fixed- WRR32- WRR64- WRR128-
        Ctrl:    ArbSelect=Fixed
        Status:    InProgress-
        VC0:    Caps:    PATOffset=00 MaxTimeSlots=1 RejSnoopTrans-
            Arb:    Fixed+ WRR32- WRR64- WRR128- TWRR128- WRR256-
            Ctrl:    Enable+ ID=0 ArbSelect=Fixed TC/VC=ff
            Status:    NegoPending+ InProgress-
    Capabilities: [400 v1] Power Budgeting <?>
    Capabilities: [500 v1] Vendor Specific Information: ID=1234 Rev=1
Len=050 <?>
    Kernel driver in use: pcieport

07:04.0 PCI bridge: Intel Corporation Device 156d (prog-if 00 [Normal
decode])
    Physical Slot: 3
    Control: I/O- Mem- BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR- FastB2B- DisINTx+
    Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort-
<TAbort- <MAbort- >SERR- <PERR- INTx-
    Latency: 0, Cache Line Size: 256 bytes
    Interrupt: pin A routed to IRQ 32
    Bus: primary=07, secondary=3a, subordinate=3a, sec-latency=0
    I/O behind bridge: 0000f000-00000fff
    Memory behind bridge: fff00000-000fffff
    Prefetchable memory behind bridge: 00000000fff00000-00000000000fffff
    Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=fast >TAbort-
<TAbort- <MAbort- <SERR- <PERR-
    BridgeCtl: Parity- SERR- NoISA- VGA- MAbort- >Reset- FastB2B-
        PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-
    Capabilities: [80] Power Management version 3
        Flags: PMEClk- DSI- D1+ D2+ AuxCurrent=0mA
PME(D0+,D1+,D2+,D3hot+,D3cold+)
        Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=1 PME-
    Capabilities: [88] MSI: Enable+ Count=1/1 Maskable- 64bit+
        Address: 00000000fee00338  Data: 0000
    Capabilities: [ac] Subsystem: Device 2222:1111
    Capabilities: [c0] Express (v2) Downstream Port (Slot+), MSI 00
        DevCap:    MaxPayload 128 bytes, PhantFunc 0
            ExtTag+ RBE+
        DevCtl:    Report errors: Correctable- Non-Fatal- Fatal-
Unsupported-
            RlxdOrd+ ExtTag+ PhantFunc- AuxPwr- NoSnoop+
            MaxPayload 128 bytes, MaxReadReq 512 bytes
        DevSta:    CorrErr- UncorrErr- FatalErr- UnsuppReq- AuxPwr+
TransPend-
        LnkCap:    Port #4, Speed 2.5GT/s, Width x4, ASPM L0s L1, Exit
Latency L0s <2us, L1 <4us
            ClockPM- Surprise- LLActRep+ BwNot+ ASPMOptComp-
        LnkCtl:    ASPM Disabled; Disabled- CommClk+
            ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
        LnkSta:    Speed 2.5GT/s, Width x4, TrErr- Train- SlotClk+
DLActive- BWMgmt- ABWMgmt-
        SltCap:    AttnBtn- PwrCtrl- MRL- AttnInd- PwrInd- HotPlug+
Surprise+
            Slot #4, PowerLimit 0.000W; Interlock- NoCompl+
        SltCtl:    Enable: AttnBtn- PwrFlt- MRL- PresDet+ CmdCplt-
HPIrq+ LinkChg+
            Control: AttnInd Unknown, PwrInd Unknown, Power- Interlock-
        SltSta:    Status: AttnBtn- PowerFlt- MRL- CmdCplt- PresDet-
Interlock-
            Changed: MRL- PresDet- LinkState-
        DevCap2: Completion Timeout: Not Supported, TimeoutDis-, LTR+,
OBFF Not Supported ARIFwd-
        DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-, LTR-,
OBFF Disabled ARIFwd-
        LnkCtl2: Target Link Speed: 2.5GT/s, EnterCompliance- SpeedDis-,
Selectable De-emphasis: -6dB
             Transmit Margin: Normal Operating Range,
EnterModifiedCompliance- ComplianceSOS-
             Compliance De-emphasis: -6dB
        LnkSta2: Current De-emphasis Level: -3.5dB,
EqualizationComplete-, EqualizationPhase1-
             EqualizationPhase2-, EqualizationPhase3-,
LinkEqualizationRequest-
    Capabilities: [100 v1] Device Serial Number df-a2-b0-91-f0-e9-07-00
    Capabilities: [200 v1] Advanced Error Reporting
        UESta:    DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt-
RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-
        UEMsk:    DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt-
RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-
        UESvrt:    DLP+ SDES+ TLP- FCP+ CmpltTO- CmpltAbrt- UnxCmplt-
RxOF+ MalfTLP+ ECRC- UnsupReq- ACSViol-
        CESta:    RxErr- BadTLP- BadDLLP- Rollover- Timeout- NonFatalErr-
        CEMsk:    RxErr- BadTLP- BadDLLP- Rollover- Timeout- NonFatalErr+
        AERCap:    First Error Pointer: 00, GenCap- CGenEn- ChkCap- ChkEn-
    Capabilities: [300 v1] Virtual Channel
        Caps:    LPEVC=0 RefClk=100ns PATEntryBits=1
        Arb:    Fixed- WRR32- WRR64- WRR128-
        Ctrl:    ArbSelect=Fixed
        Status:    InProgress-
        VC0:    Caps:    PATOffset=00 MaxTimeSlots=1 RejSnoopTrans-
            Arb:    Fixed+ WRR32- WRR64- WRR128- TWRR128- WRR256-
            Ctrl:    Enable+ ID=0 ArbSelect=Fixed TC/VC=ff
            Status:    NegoPending+ InProgress-
    Capabilities: [400 v1] Power Budgeting <?>
    Capabilities: [500 v1] Vendor Specific Information: ID=1234 Rev=1
Len=050 <?>
    Kernel driver in use: pcieport

07:05.0 PCI bridge: Intel Corporation Device 156d (prog-if 00 [Normal
decode])
    Physical Slot: 4
    Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR- FastB2B- DisINTx+
    Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort-
<TAbort- <MAbort- >SERR- <PERR- INTx-
    Latency: 0, Cache Line Size: 256 bytes
    Interrupt: pin A routed to IRQ 33
    Bus: primary=07, secondary=3b, subordinate=6b, sec-latency=0
    I/O behind bridge: 00004000-00004fff
    Memory behind bridge: c6000000-c9ffffff
    Prefetchable memory behind bridge: 00000000d2000000-00000000d5ffffff
    Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=fast >TAbort-
<TAbort- <MAbort- <SERR- <PERR-
    BridgeCtl: Parity- SERR- NoISA- VGA- MAbort- >Reset- FastB2B-
        PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-
    Capabilities: [80] Power Management version 3
        Flags: PMEClk- DSI- D1+ D2+ AuxCurrent=0mA
PME(D0+,D1+,D2+,D3hot+,D3cold+)
        Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=1 PME-
    Capabilities: [88] MSI: Enable+ Count=1/1 Maskable- 64bit+
        Address: 00000000fee00318  Data: 0000
    Capabilities: [ac] Subsystem: Device 2222:1111
    Capabilities: [c0] Express (v2) Downstream Port (Slot+), MSI 00
        DevCap:    MaxPayload 128 bytes, PhantFunc 0
            ExtTag+ RBE+
        DevCtl:    Report errors: Correctable- Non-Fatal- Fatal-
Unsupported-
            RlxdOrd+ ExtTag+ PhantFunc- AuxPwr- NoSnoop+
            MaxPayload 128 bytes, MaxReadReq 512 bytes
        DevSta:    CorrErr- UncorrErr- FatalErr- UnsuppReq- AuxPwr+
TransPend-
        LnkCap:    Port #5, Speed 2.5GT/s, Width x4, ASPM L0s L1, Exit
Latency L0s <2us, L1 <4us
            ClockPM- Surprise- LLActRep+ BwNot+ ASPMOptComp-
        LnkCtl:    ASPM Disabled; Disabled- CommClk+
            ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
        LnkSta:    Speed 2.5GT/s, Width x4, TrErr- Train- SlotClk+
DLActive- BWMgmt- ABWMgmt-
        SltCap:    AttnBtn- PwrCtrl- MRL- AttnInd- PwrInd- HotPlug+
Surprise+
            Slot #5, PowerLimit 0.000W; Interlock- NoCompl+
        SltCtl:    Enable: AttnBtn- PwrFlt- MRL- PresDet+ CmdCplt-
HPIrq+ LinkChg+
            Control: AttnInd Unknown, PwrInd Unknown, Power- Interlock-
        SltSta:    Status: AttnBtn- PowerFlt- MRL- CmdCplt- PresDet-
Interlock-
            Changed: MRL- PresDet- LinkState-
        DevCap2: Completion Timeout: Not Supported, TimeoutDis-, LTR+,
OBFF Not Supported ARIFwd-
        DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-, LTR-,
OBFF Disabled ARIFwd-
        LnkCtl2: Target Link Speed: 2.5GT/s, EnterCompliance- SpeedDis-,
Selectable De-emphasis: -6dB
             Transmit Margin: Normal Operating Range,
EnterModifiedCompliance- ComplianceSOS-
             Compliance De-emphasis: -6dB
        LnkSta2: Current De-emphasis Level: -3.5dB,
EqualizationComplete-, EqualizationPhase1-
             EqualizationPhase2-, EqualizationPhase3-,
LinkEqualizationRequest-
    Capabilities: [100 v1] Device Serial Number df-a2-b0-91-f0-e9-07-00
    Capabilities: [200 v1] Advanced Error Reporting
        UESta:    DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt-
RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-
        UEMsk:    DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt-
RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-
        UESvrt:    DLP+ SDES+ TLP- FCP+ CmpltTO- CmpltAbrt- UnxCmplt-
RxOF+ MalfTLP+ ECRC- UnsupReq- ACSViol-
        CESta:    RxErr- BadTLP- BadDLLP- Rollover- Timeout- NonFatalErr-
        CEMsk:    RxErr- BadTLP- BadDLLP- Rollover- Timeout- NonFatalErr+
        AERCap:    First Error Pointer: 00, GenCap- CGenEn- ChkCap- ChkEn-
    Capabilities: [300 v1] Virtual Channel
        Caps:    LPEVC=0 RefClk=100ns PATEntryBits=1
        Arb:    Fixed- WRR32- WRR64- WRR128-
        Ctrl:    ArbSelect=Fixed
        Status:    InProgress-
        VC0:    Caps:    PATOffset=00 MaxTimeSlots=1 RejSnoopTrans-
            Arb:    Fixed+ WRR32- WRR64- WRR128- TWRR128- WRR256-
            Ctrl:    Enable+ ID=0 ArbSelect=Fixed TC/VC=ff
            Status:    NegoPending+ InProgress-
    Capabilities: [400 v1] Power Budgeting <?>
    Capabilities: [500 v1] Vendor Specific Information: ID=1234 Rev=1
Len=050 <?>
    Kernel driver in use: pcieport

07:06.0 PCI bridge: Intel Corporation Device 156d (prog-if 00 [Normal
decode])
    Physical Slot: 5
    Control: I/O- Mem- BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR- FastB2B- DisINTx+
    Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort-
<TAbort- <MAbort- >SERR- <PERR- INTx-
    Latency: 0, Cache Line Size: 256 bytes
    Interrupt: pin A routed to IRQ 34
    Bus: primary=07, secondary=6c, subordinate=6c, sec-latency=0
    I/O behind bridge: 0000f000-00000fff
    Memory behind bridge: fff00000-000fffff
    Prefetchable memory behind bridge: 00000000fff00000-00000000000fffff
    Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=fast >TAbort-
<TAbort- <MAbort- <SERR- <PERR-
    BridgeCtl: Parity- SERR- NoISA- VGA- MAbort- >Reset- FastB2B-
        PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-
    Capabilities: [80] Power Management version 3
        Flags: PMEClk- DSI- D1+ D2+ AuxCurrent=0mA
PME(D0+,D1+,D2+,D3hot+,D3cold+)
        Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=1 PME-
    Capabilities: [88] MSI: Enable+ Count=1/1 Maskable- 64bit+
        Address: 00000000fee00358  Data: 0000
    Capabilities: [ac] Subsystem: Device 2222:1111
    Capabilities: [c0] Express (v2) Downstream Port (Slot+), MSI 00
        DevCap:    MaxPayload 128 bytes, PhantFunc 0
            ExtTag+ RBE+
        DevCtl:    Report errors: Correctable- Non-Fatal- Fatal-
Unsupported-
            RlxdOrd+ ExtTag+ PhantFunc- AuxPwr- NoSnoop+
            MaxPayload 128 bytes, MaxReadReq 512 bytes
        DevSta:    CorrErr- UncorrErr- FatalErr- UnsuppReq- AuxPwr+
TransPend-
        LnkCap:    Port #6, Speed 2.5GT/s, Width x4, ASPM L0s L1, Exit
Latency L0s <2us, L1 <4us
            ClockPM- Surprise- LLActRep+ BwNot+ ASPMOptComp-
        LnkCtl:    ASPM Disabled; Disabled- CommClk+
            ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
        LnkSta:    Speed 2.5GT/s, Width x4, TrErr- Train- SlotClk+
DLActive- BWMgmt- ABWMgmt-
        SltCap:    AttnBtn- PwrCtrl- MRL- AttnInd- PwrInd- HotPlug+
Surprise+
            Slot #6, PowerLimit 0.000W; Interlock- NoCompl+
        SltCtl:    Enable: AttnBtn- PwrFlt- MRL- PresDet+ CmdCplt-
HPIrq+ LinkChg+
            Control: AttnInd Unknown, PwrInd Unknown, Power- Interlock-
        SltSta:    Status: AttnBtn- PowerFlt- MRL- CmdCplt- PresDet-
Interlock-
            Changed: MRL- PresDet- LinkState-
        DevCap2: Completion Timeout: Not Supported, TimeoutDis-, LTR+,
OBFF Not Supported ARIFwd-
        DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-, LTR-,
OBFF Disabled ARIFwd-
        LnkCtl2: Target Link Speed: 2.5GT/s, EnterCompliance- SpeedDis-,
Selectable De-emphasis: -6dB
             Transmit Margin: Normal Operating Range,
EnterModifiedCompliance- ComplianceSOS-
             Compliance De-emphasis: -6dB
        LnkSta2: Current De-emphasis Level: -3.5dB,
EqualizationComplete-, EqualizationPhase1-
             EqualizationPhase2-, EqualizationPhase3-,
LinkEqualizationRequest-
    Capabilities: [100 v1] Device Serial Number df-a2-b0-91-f0-e9-07-00
    Capabilities: [200 v1] Advanced Error Reporting
        UESta:    DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt-
RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-
        UEMsk:    DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt-
RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-
        UESvrt:    DLP+ SDES+ TLP- FCP+ CmpltTO- CmpltAbrt- UnxCmplt-
RxOF+ MalfTLP+ ECRC- UnsupReq- ACSViol-
        CESta:    RxErr- BadTLP- BadDLLP- Rollover- Timeout- NonFatalErr-
        CEMsk:    RxErr- BadTLP- BadDLLP- Rollover- Timeout- NonFatalErr+
        AERCap:    First Error Pointer: 00, GenCap- CGenEn- ChkCap- ChkEn-
    Capabilities: [300 v1] Virtual Channel
        Caps:    LPEVC=0 RefClk=100ns PATEntryBits=1
        Arb:    Fixed- WRR32- WRR64- WRR128-
        Ctrl:    ArbSelect=Fixed
        Status:    InProgress-
        VC0:    Caps:    PATOffset=00 MaxTimeSlots=1 RejSnoopTrans-
            Arb:    Fixed+ WRR32- WRR64- WRR128- TWRR128- WRR256-
            Ctrl:    Enable+ ID=0 ArbSelect=Fixed TC/VC=ff
            Status:    NegoPending+ InProgress-
    Capabilities: [400 v1] Power Budgeting <?>
    Capabilities: [500 v1] Vendor Specific Information: ID=1234 Rev=1
Len=050 <?>
    Kernel driver in use: pcieport

08:00.0 System peripheral: Intel Corporation Device 156c
    Subsystem: Device 2222:1111
    Physical Slot: 0-1
    Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR- FastB2B- DisINTx+
    Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort-
<TAbort- <MAbort- >SERR- <PERR- INTx-
    Latency: 0, Cache Line Size: 256 bytes
    Interrupt: pin A routed to IRQ 37
    Region 0: Memory at c1f00000 (32-bit, non-prefetchable) [size=256K]
    Region 1: Memory at c1f40000 (32-bit, non-prefetchable) [size=4K]
    Capabilities: [80] Power Management version 3
        Flags: PMEClk- DSI- D1+ D2+ AuxCurrent=0mA
PME(D0+,D1+,D2+,D3hot+,D3cold+)
        Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=1 PME-
    Capabilities: [88] MSI: Enable+ Count=1/1 Maskable- 64bit+
        Address: 00000000fee003d8  Data: 0000
    Capabilities: [c0] Express (v2) Endpoint, MSI 00
        DevCap:    MaxPayload 128 bytes, PhantFunc 0, Latency L0s <2us,
L1 <4us
            ExtTag+ AttnBtn- AttnInd- PwrInd- RBE+ FLReset-
        DevCtl:    Report errors: Correctable- Non-Fatal- Fatal-
Unsupported-
            RlxdOrd+ ExtTag+ PhantFunc- AuxPwr- NoSnoop+
            MaxPayload 128 bytes, MaxReadReq 512 bytes
        DevSta:    CorrErr+ UncorrErr- FatalErr- UnsuppReq+ AuxPwr+
TransPend-
        LnkCap:    Port #0, Speed 2.5GT/s, Width x4, ASPM L0s L1, Exit
Latency L0s <2us, L1 <4us
            ClockPM+ Surprise- LLActRep- BwNot- ASPMOptComp-
        LnkCtl:    ASPM Disabled; RCB 64 bytes Disabled- CommClk+
            ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
        LnkSta:    Speed 2.5GT/s, Width x4, TrErr- Train- SlotClk+
DLActive- BWMgmt- ABWMgmt-
        DevCap2: Completion Timeout: Range B, TimeoutDis+, LTR+, OBFF
Not Supported
        DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-, LTR+,
OBFF Disabled
        LnkCtl2: Target Link Speed: 2.5GT/s, EnterCompliance- SpeedDis-
             Transmit Margin: Normal Operating Range,
EnterModifiedCompliance- ComplianceSOS-
             Compliance De-emphasis: -6dB
        LnkSta2: Current De-emphasis Level: -3.5dB,
EqualizationComplete-, EqualizationPhase1-
             EqualizationPhase2-, EqualizationPhase3-,
LinkEqualizationRequest-
    Capabilities: [a0] MSI-X: Enable- Count=16 Masked-
        Vector table: BAR=1 offset=00000000
        PBA: BAR=1 offset=00000fa0
    Capabilities: [100 v1] Device Serial Number df-a2-b0-91-f0-e9-07-00
    Capabilities: [200 v1] Advanced Error Reporting
        UESta:    DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt-
RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-
        UEMsk:    DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt-
RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-
        UESvrt:    DLP+ SDES+ TLP- FCP+ CmpltTO- CmpltAbrt- UnxCmplt-
RxOF+ MalfTLP+ ECRC- UnsupReq- ACSViol-
        CESta:    RxErr- BadTLP- BadDLLP- Rollover- Timeout- NonFatalErr-
        CEMsk:    RxErr- BadTLP- BadDLLP- Rollover- Timeout- NonFatalErr+
        AERCap:    First Error Pointer: 00, GenCap- CGenEn- ChkCap- ChkEn-
    Capabilities: [300 v1] Virtual Channel
        Caps:    LPEVC=0 RefClk=100ns PATEntryBits=1
        Arb:    Fixed- WRR32- WRR64- WRR128-
        Ctrl:    ArbSelect=Fixed
        Status:    InProgress-
        VC0:    Caps:    PATOffset=00 MaxTimeSlots=1 RejSnoopTrans-
            Arb:    Fixed- WRR32- WRR64- WRR128- TWRR128- WRR256-
            Ctrl:    Enable+ ID=0 ArbSelect=Fixed TC/VC=ff
            Status:    NegoPending- InProgress-
    Capabilities: [400 v1] Power Budgeting <?>
    Capabilities: [500 v1] Vendor Specific Information: ID=1234 Rev=1
Len=050 <?>
    Capabilities: [600 v1] Latency Tolerance Reporting
        Max snoop latency: 71680ns
        Max no snoop latency: 71680ns
    Kernel driver in use: thunderbolt

[7.6.]
Attached devices:
Host: scsi1 Channel: 00 Id: 00 Lun: 00
  Vendor: ATA      Model: APPLE SSD SM0512 Rev: JA1Q
  Type:   Direct-Access                    ANSI  SCSI revision: 05
Host: scsi0 Channel: 00 Id: 00 Lun: 00
  Vendor: APPLE    Model: SD Card Reader   Rev: 3.00
  Type:   Direct-Access                    ANSI  SCSI revision: 06

[7.7.]
1     1531  21    2567  2848  3528  542  83    asound         misc
10    1553  22    2596  2849  3529  544  84    brcm_monitor0  modules
100   1567  2245  26    2852  3570  545  85    buddyinfo      mounts
101   1568  2246  2604  2854  36    546  86    bus            mtrr
1018  1569  23    2626  2856  3620  55   87    cgroups        net
102   1570  2328  2627  2858  37    56   88    cmdline        pagetypeinfo
1024  1571  2349  2628  2887  3704  569  89    consoles       partitions
103   16    2355  2629  2891  3713  57   9     cpuinfo        sched_debug
104   1602  2364  2632  2900  372   572  90    crypto         schedstat
105   17    2429  2635  2954  375   573  91    devices        scsi
106   175   2432  2642  2967  377   58   92    diskstats      self
107   176   2447  2643  2976  38    59   93    dma            slabinfo
1091  177   2455  2665  3     40    6    939   driver         softirqs
11    1781  2467  2666  30    41    60   94    execdomains    stat
110   18    2483  267   3045  419   613  943   fb             swaps
1109  1816  2486  269   3051  42    62   946   filesystems    sys
111   183   25    2695  3066  43    63   949   fs             sysrq-trigger
1114  184   2517  27    307   439   64   95    interrupts     sysvipc
112   185   2523  270   3090  44    671  953   iomem          thread-self
117   1859  2526  2705  31    45    7    96    ioports        timer_list
12    186   2533  2730  32    46    728  965   irq            timer_stats
13    1866  2535  2737  3242  47    731  97    kallsyms       tty
130   1878  2536  2747  3252  48    733  970   kcore          uptime
131   189   2542  2749  3281  49    788  975   keys           version
14    191   2544  2769  33    5     79   98    key-users      vmallocinfo
1461  192   2545  2782  3308  50    790  980   kmsg           vmstat
1464  1924  2554  2785  3314  509   791  984   kpagecgroup    zoneinfo
1476  1935  2555  2794  3321  51    793  986   kpagecount
1483  1945  2557  28    3402  52    794  99    kpageflags
15    197   2559  2800  3479  524   8    993   loadavg
1507  198   2560  2805  35    53    80   994   locks
1508  2     2562  2810  351   538   81   996   mdstat
1509  20    2565  2829  3522  54    82   acpi  meminfo

[X.]
https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1512691
