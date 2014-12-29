From: Marcus Pollice <marcus.pollice@gmail.com>
Subject: PROBLEM: [HP Compaq nx6310] Function buttons for brightness stopped
 working
Date: Mon, 29 Dec 2014 14:44:34 +0100
Message-ID: <54A15AC2.6060906@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wg0-f42.google.com ([74.125.82.42]:38814 "EHLO
	mail-wg0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751440AbaL2Noj (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 29 Dec 2014 08:44:39 -0500
Received: by mail-wg0-f42.google.com with SMTP id k14so18980853wgh.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 29 Dec 2014 05:44:37 -0800 (PST)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org, mjg59@srcf.ucam.org, kvans32@gmail.com

[1.] One line summary of the problem:
[HP Compaq nx6310] Function buttons for brightness stopped working

[2.] Full description of the problem/report:
In kernels prior to 3.16 the special function buttons of this HP Compaq
nx6310 laptop used to work correctly. I could increase or decrease
brightness, invoke the battery settings (mostly useless but it worked),
switch to an external display or enter sleep mode. The key functions are
invoked using Fn + the key with the designated function as listed below.

Fn + F3 - Sleep - button/sleep SBTN 00000080 00000000 K
Fn + F4 - Switch to external display - video/switchmode VMOD 00000080
00000000
Fn + F8 - Battery information - button/battery BAT 00000080 00000000 K
Fn + F9 - Brightness down - video/brightnessdown BRTDN 00000087 00000000
Fn + F10 - Brightness up - video/brightnessup BRTUP 00000086 00000000

Using 3.16 or a later kernel up to the latest 3.19-rc2 none of these
buttons work. Using acpi_listen I found that no events are fired in 3.16
and later kernels, but under 3.15 and earlier these buttons do indeed
fire ACPI events and thus work correctly. The ACPI events fired are
listed above.

As part of the triaging process at Launchpad a mainline kernel bisection
was done. As a result the offending commit identified is
http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=f82bdd0d77b6bf0dea08a1d957ab45d503f328b1

During the bisection I came across something that may be interesting
with regard to the issue. While a freshly booted kernel with the issue
has the functionality non-working, after going into standby and waking
up it works as it did before. I verified that also with the 3.18 release
kernel as well as the rc1 and rc2 releases of 3.19. This information may
later be helpful when it comes to actually fixing the issue.

The following outputs were generated on 3.19-rc1 but I verified the
issue persists in 3.19-rc2, since the underlying module/code has not
been modified.

[3.] Keywords (i.e., modules, networking, kernel):

[4.] Kernel version (from /proc/version):
Linux version 3.19.0-031900rc1-generic (apw@tangerine) (gcc version
4.6.3 (Ubuntu/Linaro 4.6.3-1ubuntu5) ) #201412210135 SMP Sun Dec 21
01:36:56 UTC 2014

[5.] Output of Oops.. message (if applicable) with symbolic information
resolved (see Documentation/oops-tracing.txt)

[6.] A small shell script or example program which triggers the problem
(if possible)
This is for advanced community members. If you feel comfortable enough
to do this, please do it. It is not crtical if this is beyond your skill
level.

[7.] Environment (from lsb_release -rd)
Description:    Ubuntu 14.10
Release:    14.10

[7.1.] Software (add the output of the ver_linux script here)
If some fields are empty or look unusual you may have an old version.
Compare to the current minimal requirements in Documentation/Changes.
 
Linux HP-nx6310 3.19.0-031900rc1-generic #201412210135 SMP Sun Dec 21
01:36:56 UTC 2014 x86_64 x86_64 x86_64 GNU/Linux
 
Gnu C                 
/usr/src/linux-headers-3.19.0-031900rc1-generic/scripts/ver_linux:
binutils              
util-linux             2.25.1
mount                  debug
module-init-tools      18
e2fsprogs              1.42.10
PPP                    2.4.5
Linux C Library        2.19
Dynamic linker (ldd)   2.19
Procps                 3.3.9
Net-tools              1.60
Kbd                    1.15.5
Sh-utils               8.23
wireless-tools         30
Modules Loaded         ctr ccm bnep rfcomm bluetooth arc4 iwl3945
iwlegacy mac80211 snd_hda_codec_hdmi snd_hda_codec_analog
snd_hda_codec_generic snd_hda_intel cfg80211 snd_hda_controller
snd_hda_codec snd_hwdep i915 snd_pcm hp_wmi snd_seq_midi sparse_keymap
snd_seq_midi_event snd_rawmidi pcmcia snd_seq coretemp snd_seq_device
snd_timer drm_kms_helper joydev yenta_socket drm pcmcia_rsrc serio_raw
lpc_ich pcmcia_core shpchp i2c_algo_bit hp_accel lis3lv02d snd
8250_fintek input_polldev wmi soundcore tpm_infineon video mac_hid
parport_pc ppdev lp parport psmouse ahci libahci b44 firewire_ohci
pata_acpi firewire_core ssb crc_itu_t mii


[7.2.] Processor information (from /proc/cpuinfo):
processor    : 0
vendor_id    : GenuineIntel
cpu family    : 6
model        : 15
model name    : Intel(R) Core(TM)2 CPU         T5500  @ 1.66GHz
stepping    : 6
microcode    : 0xc7
cpu MHz        : 1000.000
cache size    : 2048 KB
physical id    : 0
siblings    : 2
core id        : 0
cpu cores    : 2
apicid        : 0
initial apicid    : 0
fpu        : yes
fpu_exception    : yes
cpuid level    : 10
wp        : yes
flags        : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca
cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall
nx lm constant_tsc arch_perfmon pebs bts rep_good nopl aperfmperf pni
dtes64 monitor ds_cpl est tm2 ssse3 cx16 xtpr pdcm lahf_lm dtherm
bugs        :
bogomips    : 3325.03
clflush size    : 64
cache_alignment    : 64
address sizes    : 36 bits physical, 48 bits virtual
power management:

processor    : 1
vendor_id    : GenuineIntel
cpu family    : 6
model        : 15
model name    : Intel(R) Core(TM)2 CPU         T5500  @ 1.66GHz
stepping    : 6
microcode    : 0xc7
cpu MHz        : 1000.000
cache size    : 2048 KB
physical id    : 0
siblings    : 2
core id        : 1
cpu cores    : 2
apicid        : 1
initial apicid    : 1
fpu        : yes
fpu_exception    : yes
cpuid level    : 10
wp        : yes
flags        : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca
cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall
nx lm constant_tsc arch_perfmon pebs bts rep_good nopl aperfmperf pni
dtes64 monitor ds_cpl est tm2 ssse3 cx16 xtpr pdcm lahf_lm dtherm
bugs        :
bogomips    : 3325.03
clflush size    : 64
cache_alignment    : 64
address sizes    : 36 bits physical, 48 bits virtual
power management:


[7.3.] Module information (from /proc/modules):
ctr 13193 2 - Live 0x0000000000000000
ccm 17856 2 - Live 0x0000000000000000
bnep 23980 2 - Live 0x0000000000000000
rfcomm 75100 0 - Live 0x0000000000000000
bluetooth 510653 10 bnep,rfcomm, Live 0x0000000000000000
arc4 12573 2 - Live 0x0000000000000000
iwl3945 74519 0 - Live 0x0000000000000000
iwlegacy 105101 1 iwl3945, Live 0x0000000000000000
mac80211 751707 2 iwl3945,iwlegacy, Live 0x0000000000000000
snd_hda_codec_hdmi 52670 1 - Live 0x0000000000000000
snd_hda_codec_analog 19240 1 - Live 0x0000000000000000
snd_hda_codec_generic 69995 1 snd_hda_codec_analog, Live 0x0000000000000000
snd_hda_intel 30824 1 - Live 0x0000000000000000
cfg80211 513699 3 iwl3945,iwlegacy,mac80211, Live 0x0000000000000000
snd_hda_controller 32234 1 snd_hda_intel, Live 0x0000000000000000
snd_hda_codec 144641 5
snd_hda_codec_hdmi,snd_hda_codec_analog,snd_hda_codec_generic,snd_hda_intel,snd_hda_controller,
Live 0x0000000000000000
snd_hwdep 17709 1 snd_hda_codec, Live 0x0000000000000000
i915 1087526 2 - Live 0x0000000000000000
snd_pcm 106365 4
snd_hda_codec_hdmi,snd_hda_intel,snd_hda_controller,snd_hda_codec, Live
0x0000000000000000
hp_wmi 14017 0 - Live 0x0000000000000000
snd_seq_midi 13564 0 - Live 0x0000000000000000
sparse_keymap 13890 1 hp_wmi, Live 0x0000000000000000
snd_seq_midi_event 14899 1 snd_seq_midi, Live 0x0000000000000000
snd_rawmidi 31197 1 snd_seq_midi, Live 0x0000000000000000
pcmcia 62760 0 - Live 0x0000000000000000
snd_seq 63540 2 snd_seq_midi,snd_seq_midi_event, Live 0x0000000000000000
coretemp 13638 0 - Live 0x0000000000000000
snd_seq_device 14875 3 snd_seq_midi,snd_rawmidi,snd_seq, Live
0x0000000000000000
snd_timer 30118 2 snd_pcm,snd_seq, Live 0x0000000000000000
drm_kms_helper 119701 1 i915, Live 0x0000000000000000
joydev 17587 0 - Live 0x0000000000000000
yenta_socket 45447 0 - Live 0x0000000000000000
drm 336770 4 i915,drm_kms_helper, Live 0x0000000000000000
pcmcia_rsrc 18591 1 yenta_socket, Live 0x0000000000000000
serio_raw 13483 0 - Live 0x0000000000000000
lpc_ich 21176 0 - Live 0x0000000000000000
pcmcia_core 23715 3 pcmcia,yenta_socket,pcmcia_rsrc, Live 0x0000000000000000
shpchp 37216 0 - Live 0x0000000000000000
i2c_algo_bit 13564 1 i915, Live 0x0000000000000000
hp_accel 26119 0 - Live 0x0000000000000000
lis3lv02d 20280 1 hp_accel, Live 0x0000000000000000
snd 84025 13
snd_hda_codec_hdmi,snd_hda_codec_analog,snd_hda_codec_generic,snd_hda_intel,snd_hda_codec,snd_hwdep,snd_pcm,snd_rawmidi,snd_seq,snd_seq_device,snd_timer,
Live 0x0000000000000000
8250_fintek 12924 0 - Live 0x0000000000000000
input_polldev 14607 1 lis3lv02d, Live 0x0000000000000000
wmi 19379 1 hp_wmi, Live 0x0000000000000000
soundcore 15091 2 snd_hda_codec,snd, Live 0x0000000000000000
tpm_infineon 17169 0 - Live 0x0000000000000000
video 24803 1 i915, Live 0x0000000000000000
mac_hid 13275 0 - Live 0x0000000000000000
parport_pc 32909 0 - Live 0x0000000000000000
ppdev 17711 0 - Live 0x0000000000000000
lp 17799 0 - Live 0x0000000000000000
parport 42481 3 parport_pc,ppdev,lp, Live 0x0000000000000000
psmouse 118332 0 - Live 0x0000000000000000
ahci 34220 2 - Live 0x0000000000000000
libahci 32353 1 ahci, Live 0x0000000000000000
b44 40715 0 - Live 0x0000000000000000
firewire_ohci 45300 0 - Live 0x0000000000000000
pata_acpi 13053 0 - Live 0x0000000000000000
firewire_core 69403 1 firewire_ohci, Live 0x0000000000000000
ssb 67399 1 b44, Live 0x0000000000000000
crc_itu_t 12707 1 firewire_core, Live 0x0000000000000000
mii 13981 1 b44, Live 0x0000000000000000


[7.4.] Loaded driver and hardware information (/proc/ioports, /proc/iomem)
cat /proc/ioports
0000-0cf7 : PCI Bus 0000:00
  0000-001f : dma1
  0020-0021 : pic1
  0040-0043 : timer0
  0050-0053 : timer1
  0060-0060 : keyboard
  0061-0061 : PNP0800:00
  0062-0062 : PNP0C09:00
    0062-0062 : EC data
  0064-0064 : keyboard
  0066-0066 : PNP0C09:00
    0066-0066 : EC cmd
  0070-0071 : rtc0
  0080-008f : dma page reg
  00a0-00a1 : pic2
  00c0-00df : dma2
  00f0-00ff : PNP0C04:00
    00f0-00ff : fpu
  0170-0177 : 0000:00:1f.1
    0170-0177 : ata_piix
  01f0-01f7 : 0000:00:1f.1
    01f0-01f7 : ata_piix
  0376-0376 : 0000:00:1f.1
    0376-0376 : ata_piix
  03c0-03df : vesafb
  03f6-03f6 : 0000:00:1f.1
    03f6-03f6 : ata_piix
  04d0-04d1 : pnp 00:05
  0500-057f : pnp 00:04
  0800-080f : pnp 00:04
0cf8-0cff : PCI conf1
0d00-ffff : PCI Bus 0000:00
  1000-1003 : ACPI PM1a_EVT_BLK
  1004-1005 : ACPI PM1a_CNT_BLK
  1008-100b : ACPI PM_TMR
  1010-1015 : ACPI CPU throttle
  1020-1020 : ACPI PM2_CNT_BLK
  1028-102f : ACPI GPE0_BLK
  1030-1033 : iTCO_wdt
  1060-107f : iTCO_wdt
  1100-113f : 0000:00:1f.0
    1100-113f : pnp 00:05
  1200-121f : pnp 00:05
  1370-1377 : 0000:00:1f.2
    1370-1377 : ahci
  13f0-13f7 : 0000:00:1f.2
    13f0-13f7 : ahci
  1574-1577 : 0000:00:1f.2
    1574-1577 : ahci
  15f4-15f7 : 0000:00:1f.2
    15f4-15f7 : ahci
  2000-2fff : PCI Bus 0000:08
  3000-3fff : PCI Bus 0000:02
    3000-30ff : PCI CardBus 0000:03
    3400-34ff : PCI CardBus 0000:03
  6000-6007 : 0000:00:02.0
  6020-603f : 0000:00:1d.0
    6020-603f : uhci_hcd
  6040-605f : 0000:00:1d.1
    6040-605f : uhci_hcd
  6060-607f : 0000:00:1d.2
    6060-607f : uhci_hcd
  6080-609f : 0000:00:1d.3
    6080-609f : uhci_hcd
  60a0-60af : 0000:00:1f.1
    60a0-60af : ata_piix
  60d0-60df : 0000:00:1f.2
    60d0-60df : ahci

cat /proc/iomem
00000000-00000fff : reserved
00001000-0009fbff : System RAM
0009fc00-0009ffff : reserved
000a0000-000bffff : PCI Bus 0000:00
000c0000-000c7fff : Video ROM
000d0000-000d0fff : Adapter ROM
000d1000-000d27ff : Adapter ROM
000d2800-000d3fff : pnp 00:06
000d4000-000dffff : PCI Bus 0000:00
000e0000-000fffff : reserved
  000f0000-000fffff : System ROM
00100000-7f7cffff : System RAM
  01000000-017d6c43 : Kernel code
  017d6c44-01d24bbf : Kernel data
  01e8d000-01fcffff : Kernel bss
7f7d0000-7f7e55ff : reserved
7f7e5600-7f7f7fff : ACPI Non-volatile Storage
7f7f8000-fedfffff : reserved
  7f800000-fedfffff : PCI Bus 0000:00
    7f800000-7ffbffff : Graphics Stolen Memory
    80000000-801fffff : PCI Bus 0000:08
    84000000-87ffffff : PCI CardBus 0000:03
    88000000-8bffffff : PCI CardBus 0000:03
    d0000000-dfffffff : 0000:00:02.0
    e8000000-e80fffff : PCI Bus 0000:08
      e8000000-e8000fff : 0000:08:00.0
        e8000000-e8000fff : iwl3945
    e8100000-e83fffff : PCI Bus 0000:02
      e8100000-e8100fff : 0000:02:06.0
        e8100000-e8100fff : yenta_socket
      e8101000-e81017ff : 0000:02:06.1
        e8101000-e81017ff : firewire_ohci
      e8104000-e8107fff : 0000:02:06.1
      e8108000-e8109fff : 0000:02:0e.0
        e8108000-e8109fff : b44
    e8400000-e847ffff : 0000:00:02.0
    e8480000-e84bffff : 0000:00:02.0
    e8500000-e857ffff : 0000:00:02.1
    e8580000-e8583fff : 0000:00:1b.0
      e8580000-e8583fff : ICH HD audio
    e8584000-e85843ff : 0000:00:1d.7
      e8584000-e85843ff : ehci_hcd
    e8585000-e85853ff : 0000:00:1f.2
      e8585000-e85853ff : ahci
    f8000000-fbffffff : PCI MMCONFIG 0000 [bus 00-3f]
      f8000000-fbffffff : pnp 00:05
    fec00000-fec00fff : reserved
      fec00000-fec003ff : IOAPIC 0
    fed00000-fed003ff : HPET 0
      fed00000-fed003ff : PNP0103:00
    fed20000-fed9afff : reserved
      fed20000-fed3ffff : pnp 00:05
      fed45000-fed8ffff : pnp 00:05
      fed90000-fed9afff : pnp 00:05
        fed93410-fed93414 : iTCO_wdt
    feda0000-fedbffff : reserved
      feda0000-fedbffff : pnp 00:06
fee00000-fee00fff : Local APIC
  fee00000-fee00fff : reserved
    fee00000-fee00fff : pnp 00:06
fee01000-ffffffff : PCI Bus 0000:00
  ffb00000-ffbfffff : reserved
    ffb00000-ffbfffff : pnp 00:04
  fff00000-ffffffff : reserved
    fff00000-ffffffff : pnp 00:04


[7.5.] PCI information ('lspci -vvv' as root)
00:00.0 Host bridge: Intel Corporation Mobile 945GM/PM/GMS, 943/940GML
and 945GT Express Memory Controller Hub (rev 03)
    Subsystem: Hewlett-Packard Company Device 30aa
    Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR- FastB2B- DisINTx-
    Status: Cap+ 66MHz- UDF- FastB2B+ ParErr- DEVSEL=fast >TAbort-
<TAbort- <MAbort+ >SERR- <PERR- INTx-
    Latency: 0
    Capabilities: [e0] Vendor Specific Information: Len=09 <?>
    Kernel driver in use: agpgart-intel

00:02.0 VGA compatible controller: Intel Corporation Mobile 945GM/GMS,
943/940GML Express Integrated Graphics Controller (rev 03) (prog-if 00
[VGA controller])
    Subsystem: Hewlett-Packard Company Device 30aa
    Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR- FastB2B- DisINTx-
    Status: Cap+ 66MHz- UDF- FastB2B+ ParErr- DEVSEL=fast >TAbort-
<TAbort- <MAbort- >SERR- <PERR- INTx-
    Latency: 0
    Interrupt: pin A routed to IRQ 16
    Region 0: Memory at e8400000 (32-bit, non-prefetchable) [size=512K]
    Region 1: I/O ports at 6000 [size=8]
    Region 2: Memory at d0000000 (32-bit, prefetchable) [size=256M]
    Region 3: Memory at e8480000 (32-bit, non-prefetchable) [size=256K]
    Expansion ROM at <unassigned> [disabled]
    Capabilities: [90] MSI: Enable- Count=1/1 Maskable- 64bit-
        Address: 00000000  Data: 0000
    Capabilities: [d0] Power Management version 2
        Flags: PMEClk- DSI+ D1- D2- AuxCurrent=0mA
PME(D0-,D1-,D2-,D3hot-,D3cold-)
        Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-
    Kernel driver in use: i915

00:02.1 Display controller: Intel Corporation Mobile 945GM/GMS/GME,
943/940GML Express Integrated Graphics Controller (rev 03)
    Subsystem: Hewlett-Packard Company Device 30aa
    Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR- FastB2B- DisINTx-
    Status: Cap+ 66MHz- UDF- FastB2B+ ParErr- DEVSEL=fast >TAbort-
<TAbort- <MAbort- >SERR- <PERR- INTx-
    Latency: 0
    Region 0: Memory at e8500000 (32-bit, non-prefetchable) [size=512K]
    Capabilities: [d0] Power Management version 2
        Flags: PMEClk- DSI+ D1- D2- AuxCurrent=0mA
PME(D0-,D1-,D2-,D3hot-,D3cold-)
        Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-

00:1b.0 Audio device: Intel Corporation NM10/ICH7 Family High Definition
Audio Controller (rev 01)
    Subsystem: Hewlett-Packard Company Device 30aa
    Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR- FastB2B- DisINTx+
    Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort-
<TAbort- <MAbort- >SERR- <PERR- INTx-
    Latency: 0, Cache Line Size: 64 bytes
    Interrupt: pin A routed to IRQ 26
    Region 0: Memory at e8580000 (64-bit, non-prefetchable) [size=16K]
    Capabilities: [50] Power Management version 2
        Flags: PMEClk- DSI- D1- D2- AuxCurrent=55mA
PME(D0+,D1-,D2-,D3hot+,D3cold+)
        Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-
    Capabilities: [60] MSI: Enable+ Count=1/1 Maskable- 64bit+
        Address: 00000000fee0300c  Data: 4152
    Capabilities: [70] Express (v1) Root Complex Integrated Endpoint, MSI 00
        DevCap:    MaxPayload 128 bytes, PhantFunc 0
            ExtTag- RBE-
        DevCtl:    Report errors: Correctable- Non-Fatal- Fatal-
Unsupported-
            RlxdOrd- ExtTag- PhantFunc- AuxPwr- NoSnoop+
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
            Ctrl:    Enable+ ID=1 ArbSelect=Fixed TC/VC=80
            Status:    NegoPending- InProgress-
    Capabilities: [130 v1] Root Complex Link
        Desc:    PortNumber=0f ComponentID=02 EltType=Config
        Link0:    Desc:    TargetPort=00 TargetComponent=02 AssocRCRB-
LinkType=MemMapped LinkValid+
            Addr:    00000000fed90000
    Kernel driver in use: snd_hda_intel

00:1c.0 PCI bridge: Intel Corporation NM10/ICH7 Family PCI Express Port
1 (rev 01) (prog-if 00 [Normal decode])
    Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR- FastB2B- DisINTx+
    Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort-
<TAbort- <MAbort- >SERR- <PERR- INTx-
    Latency: 0, Cache Line Size: 64 bytes
    Bus: primary=00, secondary=08, subordinate=08, sec-latency=0
    I/O behind bridge: 00002000-00002fff
    Memory behind bridge: e8000000-e80fffff
    Prefetchable memory behind bridge: 0000000080000000-00000000801fffff
    Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=fast >TAbort-
<TAbort- <MAbort- <SERR- <PERR-
    BridgeCtl: Parity- SERR- NoISA+ VGA- MAbort- >Reset- FastB2B-
        PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-
    Capabilities: [40] Express (v1) Root Port (Slot+), MSI 00
        DevCap:    MaxPayload 128 bytes, PhantFunc 0
            ExtTag- RBE-
        DevCtl:    Report errors: Correctable- Non-Fatal- Fatal-
Unsupported-
            RlxdOrd- ExtTag- PhantFunc- AuxPwr- NoSnoop-
            MaxPayload 128 bytes, MaxReadReq 128 bytes
        DevSta:    CorrErr- UncorrErr- FatalErr- UnsuppReq- AuxPwr+
TransPend-
        LnkCap:    Port #1, Speed 2.5GT/s, Width x1, ASPM L0s L1, Exit
Latency L0s <256ns, L1 <4us
            ClockPM- Surprise- LLActRep+ BwNot-
        LnkCtl:    ASPM Disabled; RCB 64 bytes Disabled- CommClk+
            ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
        LnkSta:    Speed 2.5GT/s, Width x1, TrErr- Train- SlotClk+
DLActive+ BWMgmt- ABWMgmt-
        SltCap:    AttnBtn- PwrCtrl- MRL- AttnInd- PwrInd- HotPlug+
Surprise+
            Slot #2, PowerLimit 10.000W; Interlock- NoCompl-
        SltCtl:    Enable: AttnBtn+ PwrFlt- MRL- PresDet+ CmdCplt-
HPIrq- LinkChg-
            Control: AttnInd Unknown, PwrInd Unknown, Power- Interlock-
        SltSta:    Status: AttnBtn- PowerFlt- MRL- CmdCplt- PresDet+
Interlock-
            Changed: MRL- PresDet- LinkState-
        RootCtl: ErrCorrectable- ErrNon-Fatal- ErrFatal- PMEIntEna-
CRSVisible-
        RootCap: CRSVisible-
        RootSta: PME ReqID 0000, PMEStatus- PMEPending-
    Capabilities: [80] MSI: Enable+ Count=1/1 Maskable- 64bit-
        Address: fee0300c  Data: 41a1
    Capabilities: [90] Subsystem: Hewlett-Packard Company Device 30aa
    Capabilities: [a0] Power Management version 2
        Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA
PME(D0+,D1-,D2-,D3hot+,D3cold+)
        Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-
    Capabilities: [100 v1] Virtual Channel
        Caps:    LPEVC=0 RefClk=100ns PATEntryBits=1
        Arb:    Fixed+ WRR32- WRR64- WRR128-
        Ctrl:    ArbSelect=Fixed
        Status:    InProgress-
        VC0:    Caps:    PATOffset=00 MaxTimeSlots=1 RejSnoopTrans-
            Arb:    Fixed+ WRR32- WRR64- WRR128- TWRR128- WRR256-
            Ctrl:    Enable+ ID=0 ArbSelect=Fixed TC/VC=01
            Status:    NegoPending- InProgress-
        VC1:    Caps:    PATOffset=00 MaxTimeSlots=1 RejSnoopTrans-
            Arb:    Fixed+ WRR32- WRR64- WRR128- TWRR128- WRR256-
            Ctrl:    Enable- ID=0 ArbSelect=Fixed TC/VC=00
            Status:    NegoPending- InProgress-
    Capabilities: [180 v1] Root Complex Link
        Desc:    PortNumber=01 ComponentID=02 EltType=Config
        Link0:    Desc:    TargetPort=00 TargetComponent=02 AssocRCRB-
LinkType=MemMapped LinkValid+
            Addr:    00000000fed90001
    Kernel driver in use: pcieport

00:1d.0 USB controller: Intel Corporation NM10/ICH7 Family USB UHCI
Controller #1 (rev 01) (prog-if 00 [UHCI])
    Subsystem: Hewlett-Packard Company Device 30aa
    Control: I/O+ Mem- BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR- FastB2B- DisINTx-
    Status: Cap- 66MHz- UDF- FastB2B+ ParErr- DEVSEL=medium >TAbort-
<TAbort- <MAbort- >SERR- <PERR- INTx-
    Latency: 0
    Interrupt: pin A routed to IRQ 20
    Region 4: I/O ports at 6020 [size=32]
    Kernel driver in use: uhci_hcd

00:1d.1 USB controller: Intel Corporation NM10/ICH7 Family USB UHCI
Controller #2 (rev 01) (prog-if 00 [UHCI])
    Subsystem: Hewlett-Packard Company Device 30aa
    Control: I/O+ Mem- BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR- FastB2B- DisINTx-
    Status: Cap- 66MHz- UDF- FastB2B+ ParErr- DEVSEL=medium >TAbort-
<TAbort- <MAbort- >SERR- <PERR- INTx-
    Latency: 0
    Interrupt: pin B routed to IRQ 21
    Region 4: I/O ports at 6040 [size=32]
    Kernel driver in use: uhci_hcd

00:1d.2 USB controller: Intel Corporation NM10/ICH7 Family USB UHCI
Controller #3 (rev 01) (prog-if 00 [UHCI])
    Subsystem: Hewlett-Packard Company Device 30aa
    Control: I/O+ Mem- BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR- FastB2B- DisINTx-
    Status: Cap- 66MHz- UDF- FastB2B+ ParErr- DEVSEL=medium >TAbort-
<TAbort- <MAbort- >SERR- <PERR- INTx-
    Latency: 0
    Interrupt: pin C routed to IRQ 18
    Region 4: I/O ports at 6060 [size=32]
    Kernel driver in use: uhci_hcd

00:1d.3 USB controller: Intel Corporation NM10/ICH7 Family USB UHCI
Controller #4 (rev 01) (prog-if 00 [UHCI])
    Subsystem: Hewlett-Packard Company Device 30aa
    Control: I/O+ Mem- BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR- FastB2B- DisINTx-
    Status: Cap- 66MHz- UDF- FastB2B+ ParErr- DEVSEL=medium >TAbort-
<TAbort- <MAbort- >SERR- <PERR- INTx-
    Latency: 0
    Interrupt: pin D routed to IRQ 19
    Region 4: I/O ports at 6080 [size=32]
    Kernel driver in use: uhci_hcd

00:1d.7 USB controller: Intel Corporation NM10/ICH7 Family USB2 EHCI
Controller (rev 01) (prog-if 20 [EHCI])
    Subsystem: Hewlett-Packard Company Device 30aa
    Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR- FastB2B- DisINTx-
    Status: Cap+ 66MHz- UDF- FastB2B+ ParErr- DEVSEL=medium >TAbort-
<TAbort- <MAbort- >SERR- <PERR- INTx-
    Latency: 0
    Interrupt: pin A routed to IRQ 20
    Region 0: Memory at e8584000 (32-bit, non-prefetchable) [size=1K]
    Capabilities: [50] Power Management version 2
        Flags: PMEClk- DSI- D1- D2- AuxCurrent=375mA
PME(D0+,D1-,D2-,D3hot+,D3cold+)
        Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-
    Capabilities: [58] Debug port: BAR=1 offset=00a0
    Kernel driver in use: ehci-pci

00:1e.0 PCI bridge: Intel Corporation 82801 Mobile PCI Bridge (rev e1)
(prog-if 01 [Subtractive decode])
    Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR+ FastB2B- DisINTx-
    Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort-
<TAbort- <MAbort- >SERR- <PERR- INTx-
    Latency: 0
    Bus: primary=00, secondary=02, subordinate=06, sec-latency=32
    I/O behind bridge: 00003000-00003fff
    Memory behind bridge: e8100000-e83fffff
    Prefetchable memory behind bridge: 00000000fff00000-00000000000fffff
    Secondary status: 66MHz- FastB2B+ ParErr- DEVSEL=medium >TAbort-
<TAbort- <MAbort+ <SERR- <PERR-
    BridgeCtl: Parity- SERR+ NoISA+ VGA- MAbort- >Reset- FastB2B-
        PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-
    Capabilities: [50] Subsystem: Hewlett-Packard Company Device 30aa

00:1f.0 ISA bridge: Intel Corporation 82801GBM (ICH7-M) LPC Interface
Bridge (rev 01)
    Subsystem: Hewlett-Packard Company Device 30aa
    Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR- FastB2B- DisINTx-
    Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=medium >TAbort-
<TAbort- <MAbort- >SERR- <PERR- INTx-
    Latency: 0
    Capabilities: [e0] Vendor Specific Information: Len=0c <?>
    Kernel driver in use: lpc_ich

00:1f.1 IDE interface: Intel Corporation 82801G (ICH7 Family) IDE
Controller (rev 01) (prog-if 8a [Master SecP PriP])
    Subsystem: Hewlett-Packard Company Device 30aa
    Control: I/O+ Mem- BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR- FastB2B- DisINTx-
    Status: Cap- 66MHz- UDF- FastB2B+ ParErr- DEVSEL=medium >TAbort-
<TAbort- <MAbort- >SERR- <PERR- INTx-
    Latency: 0
    Interrupt: pin A routed to IRQ 16
    Region 0: I/O ports at 01f0 [size=8]
    Region 1: I/O ports at 03f4
    Region 2: I/O ports at 0170 [size=8]
    Region 3: I/O ports at 0374
    Region 4: I/O ports at 60a0 [size=16]
    Kernel driver in use: ata_piix

00:1f.2 SATA controller: Intel Corporation 82801GBM/GHM (ICH7-M Family)
SATA Controller [AHCI mode] (rev 01) (prog-if 01 [AHCI 1.0])
    Subsystem: Hewlett-Packard Company Device 30aa
    Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR- FastB2B- DisINTx+
    Status: Cap+ 66MHz+ UDF- FastB2B+ ParErr- DEVSEL=medium >TAbort-
<TAbort- <MAbort- >SERR- <PERR- INTx-
    Latency: 0
    Interrupt: pin B routed to IRQ 25
    Region 0: I/O ports at 13f0 [size=8]
    Region 1: I/O ports at 15f4 [size=4]
    Region 2: I/O ports at 1370 [size=8]
    Region 3: I/O ports at 1574 [size=4]
    Region 4: I/O ports at 60d0 [size=16]
    Region 5: Memory at e8585000 (32-bit, non-prefetchable) [size=1K]
    Capabilities: [80] MSI: Enable+ Count=1/1 Maskable- 64bit-
        Address: fee0300c  Data: 4142
    Capabilities: [70] Power Management version 2
        Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA
PME(D0-,D1-,D2-,D3hot+,D3cold-)
        Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-
    Kernel driver in use: ahci

02:06.0 CardBus bridge: Texas Instruments PCIxx12 Cardbus Controller
    Subsystem: Hewlett-Packard Company Device 30aa
    Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR- FastB2B- DisINTx-
    Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=medium >TAbort-
<TAbort- <MAbort- >SERR- <PERR- INTx-
    Latency: 168, Cache Line Size: 64 bytes
    Interrupt: pin A routed to IRQ 18
    Region 0: Memory at e8100000 (32-bit, non-prefetchable) [size=4K]
    Bus: primary=02, secondary=03, subordinate=06, sec-latency=176
    Memory window 0: 84000000-87ffffff (prefetchable)
    Memory window 1: 88000000-8bffffff
    I/O window 0: 00003000-000030ff
    I/O window 1: 00003400-000034ff
    BridgeCtl: Parity- SERR- ISA- VGA- MAbort- >Reset+ 16bInt+ PostWrite+
    16-bit legacy interface ports at 0001
    Capabilities: [a0] Power Management version 2
        Flags: PMEClk- DSI- D1+ D2+ AuxCurrent=0mA
PME(D0+,D1+,D2+,D3hot+,D3cold-)
        Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-
        Bridge: PM- B3+
    Kernel driver in use: yenta_cardbus

02:06.1 FireWire (IEEE 1394): Texas Instruments PCIxx12 OHCI Compliant
IEEE 1394 Host Controller (prog-if 10 [OHCI])
    Subsystem: Hewlett-Packard Company Device 30aa
    Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR- FastB2B- DisINTx-
    Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=medium >TAbort-
<TAbort- <MAbort- >SERR- <PERR- INTx-
    Latency: 64 (500ns min, 1000ns max), Cache Line Size: 64 bytes
    Interrupt: pin B routed to IRQ 19
    Region 0: Memory at e8101000 (32-bit, non-prefetchable) [size=2K]
    Region 1: Memory at e8104000 (32-bit, non-prefetchable) [size=16K]
    Capabilities: [44] Power Management version 2
        Flags: PMEClk- DSI- D1+ D2+ AuxCurrent=0mA
PME(D0+,D1+,D2+,D3hot+,D3cold-)
        Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME+
    Kernel driver in use: firewire_ohci

02:0e.0 Ethernet controller: Broadcom Corporation BCM4401-B0 100Base-TX
(rev 02)
    Subsystem: Hewlett-Packard Company Device 30aa
    Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR- FastB2B- DisINTx-
    Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort-
<TAbort- <MAbort- >SERR- <PERR- INTx-
    Latency: 64
    Interrupt: pin A routed to IRQ 16
    Region 0: Memory at e8108000 (32-bit, non-prefetchable) [size=8K]
    Capabilities: [40] Power Management version 2
        Flags: PMEClk- DSI- D1+ D2+ AuxCurrent=0mA
PME(D0+,D1+,D2+,D3hot+,D3cold+)
        Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=2 PME-
    Kernel driver in use: b44

08:00.0 Network controller: Intel Corporation PRO/Wireless 3945ABG
[Golan] Network Connection (rev 02)
    Subsystem: Hewlett-Packard Company PRO/Wireless 3945ABG [Golan]
Network Connection
    Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR- FastB2B- DisINTx+
    Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort-
<TAbort- <MAbort- >SERR- <PERR- INTx-
    Latency: 0, Cache Line Size: 64 bytes
    Interrupt: pin A routed to IRQ 27
    Region 0: Memory at e8000000 (32-bit, non-prefetchable) [size=4K]
    Capabilities: [c8] Power Management version 2
        Flags: PMEClk- DSI+ D1- D2- AuxCurrent=0mA
PME(D0+,D1-,D2-,D3hot+,D3cold+)
        Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-
    Capabilities: [d0] MSI: Enable+ Count=1/1 Maskable- 64bit+
        Address: 00000000fee0100c  Data: 4162
    Capabilities: [e0] Express (v1) Legacy Endpoint, MSI 00
        DevCap:    MaxPayload 128 bytes, PhantFunc 0, Latency L0s
<512ns, L1 unlimited
            ExtTag- AttnBtn- AttnInd- PwrInd- RBE- FLReset-
        DevCtl:    Report errors: Correctable- Non-Fatal- Fatal-
Unsupported-
            RlxdOrd+ ExtTag- PhantFunc- AuxPwr- NoSnoop+
            MaxPayload 128 bytes, MaxReadReq 128 bytes
        DevSta:    CorrErr+ UncorrErr- FatalErr- UnsuppReq- AuxPwr+
TransPend-
        LnkCap:    Port #0, Speed 2.5GT/s, Width x1, ASPM L0s L1, Exit
Latency L0s <128ns, L1 <64us
            ClockPM+ Surprise- LLActRep- BwNot-
        LnkCtl:    ASPM Disabled; RCB 64 bytes Disabled- CommClk+
            ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
        LnkSta:    Speed 2.5GT/s, Width x1, TrErr- Train- SlotClk+
DLActive- BWMgmt- ABWMgmt-
    Capabilities: [100 v1] Advanced Error Reporting
        UESta:    DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt-
RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-
        UEMsk:    DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt-
RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-
        UESvrt:    DLP+ SDES- TLP- FCP+ CmpltTO- CmpltAbrt- UnxCmplt-
RxOF+ MalfTLP+ ECRC- UnsupReq- ACSViol-
        CESta:    RxErr- BadTLP- BadDLLP+ Rollover- Timeout- NonFatalErr-
        CEMsk:    RxErr- BadTLP- BadDLLP- Rollover- Timeout- NonFatalErr-
        AERCap:    First Error Pointer: 00, GenCap- CGenEn- ChkCap- ChkEn-
    Capabilities: [140 v1] Device Serial Number 00-18-de-ff-ff-bc-8d-74
    Kernel driver in use: iwl3945



[7.6.] SCSI information (from /proc/scsi/scsi)
Attached devices:
Host: scsi0 Channel: 00 Id: 00 Lun: 00
  Vendor: TSSTcorp Model: CD/DVDW TS-L632D Rev: HH18
  Type:   CD-ROM                           ANSI  SCSI revision: 05
Host: scsi2 Channel: 00 Id: 00 Lun: 00
  Vendor: ATA      Model: FUJITSU MHV2080B Rev: 892C
  Type:   Direct-Access                    ANSI  SCSI revision: 05


[8.] Other notes, patches, fixes, workarounds:
Launchpad bugreport:
https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1397739

Best regards,

-- 
Marcus Pollice
