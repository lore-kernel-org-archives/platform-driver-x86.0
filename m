Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE2152DE709
	for <platform-driver-x86@vger.kernel.org>; Tue, 12 Aug 2025 05:51:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754977877; cv=none; b=CIoq3ZdBM5XG8urTrzuP/vSQsRV2wiI/v9idC8VWKL/APQsqENW+9d0310PsJ3aMTMJxqHkokKFLsNqIdA/auA//2DY6dBbNCAiZLPCncwFPQZVpAkFeppoL/rNYcz5h7cJqoTAH4/sEepAbccQZU7v3hjdXxNKuE3o8kcAUNB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754977877; c=relaxed/simple;
	bh=NMViGDBQHVGuLbZUBWaQTdFt+vtnTQDqsiF0ddFulqY=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=XwI9Hnt+r8n5qIUwvr9QkFJCG8T5JwXHKhc3dQBI/pRW9sIJ5e+1PWkSxhdkksc0u/Bx3u1WCik6AcylzdjAPFEsS98+YAcgFS2RE3tC97YJo14t+luAUjqeYjdB8ieyzjgjdyBs4pYnL3+Fkzhb2KXKIbIRRE23UaPMxzW1Esw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bune.city; spf=pass smtp.mailfrom=bune.city; dkim=pass (2048-bit key) header.d=bune.city header.i=@bune.city header.b=Qur4GvLm; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bune.city
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bune.city
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bune.city header.i=@bune.city header.b="Qur4GvLm"
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4c1LG84x3mz9txD;
	Tue, 12 Aug 2025 07:50:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bune.city; s=MBO0001;
	t=1754977856;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:autocrypt:autocrypt;
	bh=FBHJ5DNSgvOihuN4ShIR3joRZG/3gTumbSksgt63nmY=;
	b=Qur4GvLmYTX10ezfjjPFRnDDI249+6xuBwTi8gL0ZxL75QGBY+odfHysFL96U03DicV4zz
	Xnd/rFnmVU4tGPiOi1oJB6nv1CLW9iAoIlPMBE2b6cW/XwBK+391XIjRj82DDH9CQalHTG
	MUHggsmXKrkL7djJTcuIHbrQPZadvEp85K6LZUNrkq5ojKPqdX0EZRDcwll2Ka0a1Iytre
	twTNPpl6s+4OcDLcDIzn9pfYnlnBuXhabScT+j38bCKN1ur/4aU1CDH48QHTJW5BcmVXIV
	BU3cYAbnqatSlnu7bOCn3St2LsLNPiTo6dZT046C5ThQHhv86V/259Huo55Isg==
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of lynne@bune.city designates 2001:67c:2050:b231:465::102 as permitted sender) smtp.mailfrom=lynne@bune.city
Message-ID: <3f56e68f-85df-4c0a-982c-43f9d635be38@bune.city>
Date: Tue, 12 Aug 2025 15:50:47 +1000
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Language: en-AU
To: platform-driver-x86@vger.kernel.org
Cc: jlee@suse.com
From: Lynne Megido <lynne@bune.city>
Subject: PROBLEM: acer-wmi driver fails to initialise with Linux kernel >6.14
Autocrypt: addr=lynne@bune.city; keydata=
 xsFNBF361HkBEACmcec2sVdVpfCfSVtoYbVSqDz5xLaHKUUBRFcULF9dbWCIYbb3mYe6eMiW
 pgTtFdXGcWCUuAvtCEbA7hXbNGgJsE7O+uA70/rclVzsdgaDc13rooMaxS6BvxRm1Cxdk3rH
 z6Q4kW2PNx1G3mAMNdBupigqXA9Aa8hoqG1oBaN96JEmZhM/z0KYHknpQ836oEAlxvMRFLSm
 nTxDhd4KIq6Y1c4Y08ra/vNWEf5XT4nGyOizDvIqPXTpUV0ZCZszaMnHBlRfpcJjocYRyB3s
 iMC3fh71xriO2quQev3CZSkvY96eHjLse/HI47w4MpTmgHmcbH+ZtotW/W64vxsRRY7xL4Y/
 kloz0fmHj5Y0v/X0oVp7XUIs1s3abObOsEKCU5+JbBVqUvD7gz1tmWEjDcEX4GmMu73BvKiL
 jIodIOoUeIngjIJ5bnllCcMmySYn7Xw8fDzP2cyveS8Z2ho6FNuUYhV/30OhiS7U91pAZIed
 FeSiS5yUO/1uDq+pfCFilm8xVFUJiODUVZG4EYzxmYEWCnjSQFuzKKBz7PjH5lfb+CWVkddZ
 qPvrxWC5ED92/QSK3d215HuBGtb0GhuhY7KfUPr56j1DSKZJQAy5saLihEg+aF0jh601fvY0
 yMsACqmnZ6sVd2ggjUFVR5Y5Aupq4tonHhGx2hYv57lX+r8agwARAQABzThMeW5uZSBQYWln
 ZSBMYXdzb24gKGh0dHBzOi8vYnVuZS5jaXR5KSA8bHlubmVAYnVuZS5jaXR5PsLBjgQTAQgA
 OBYhBFJhC2V3uNhbyGISS/ChhLUhPZ+QBQJd+tR5AhsDBQsJCAcCBhUKCQgLAgQWAgMBAh4B
 AheAAAoJEPChhLUhPZ+Qhs4P/jDN9NsYQCB8VxN2g3i7dyN2hJAX7/8sNAGLKD+jyJcNFb0/
 zlK/l5Qz8zLz2hYY/ZPE88QJdwITrJLk+3sTdXGDhDmOjobmtJEnv89M8hArygxzBekGkYXB
 ZdkxRlBL7VEfBMS3Tqm2txtjte+g5NbAQRPJiITFnLQWRA+MAoXB13AdOg6ylkJjE1BTthNU
 wqfMcK2BTCUCGUTOY4e4NFrIsPODSt3LYJwQxmrDOvhPRXn2Be2IUV94HPqKe81e8tv8JWsh
 a82Y10zFaI4n9cgIjrVuuQFIViVubocREfkCGCrPeinVo4vwNdoobC8kYC7IZ6ceBsa1J/2o
 rDnisLDikvZ2KCeCms7c1JNiPuUrgkhMuDpxxBiYrR8I0Y0R5k6YN2CnsDyEVPyjEeJsF3FF
 X9U5KqWtyog5WUr5fjGaWiVi8P1r6AEipoQCizdsk4rd0jxDny06lOIizCeXaz8WJKjUvj4N
 D1n0NUNbITJOWPNcPbMCq5buTo+6FsV5SJgyIi+pDFiiTBoo/d+EgwFjgYfaLJ/DzJP9mVNy
 1mxC33JT17ir0YYGxfUPKKyf8qq97h8mb6Irlf5zEnJCraZD4zNjft8UeFALlC6FvRVU9ulW
 6ld4wS/yC0o8i+SFT7QIWD4sV4YbgdRCfcxObODGhjEvJhwWgqZQVzYTY01xzsFNBF361HkB
 EACxer2iJW7l0PfFAPyNW73mkl5KeADnq7jHpDRwBbpYXf/x33WYTxQUcICbmgSEBVJxkzQG
 IY/3j7IQtlnqlwTOFEjccC3rrUEiA4giKu+26YERUynOPqjPr7+uM0E5CWxvivUHdrV1igca
 WbWwHWnvdRMT5PgUDxhCdZBYc+D8dGwXzV5qDrPWeOgjCUTJ5qZkBRtPYAhrwTSEB7kYBsgI
 N4Jbd40n5RUHqZOEg5RtgCBbgF70Tfh2VPEzV6VDW/Z1RmKGAtzbskTiSyvoejAi/PJIef2l
 jHimdzc80oaQ+sR9qZDcJoengQPYQxNozr699d7fq9UNUcZdlZtQQdzcbmxj1Styt439TNO/
 +VQPQwz+xhhe5EEjpefVg9r8QlEqpSSyThqPOq0CU7hc7B5MlYu3Pf+Wd3e9HxWl87ngbJKP
 k4r4sbTnlabuW250Xzd1dqsY3uz7bf7gsr41AHMZAG2HSGYF42G9KZQWJmrUJX1jlUoWchcz
 wyZKAJJHm6S9Qcax2GuJLN899qGyxGnp0r/rU51Rpslu7ZR+b0l0hA4y9kENlTpbQkTO3N+n
 VzCDAzOShwlFCc6EaQuJD6UFkbtv12SIw45M5H+yZxlmnWQW6DR9Mx9VkYAC6LJraz3wWcRH
 SVMf93rSZLdCdFzCuGRczhI5314kTVuy0zCS+QARAQABwsF2BBgBCAAgFiEEUmELZXe42FvI
 YhJL8KGEtSE9n5AFAl361HkCGwwACgkQ8KGEtSE9n5AivQ//WsdDiAtL5zBQa7Ah810ndfqN
 3wwrlDk38KjHZdh1isglGpeduTE7m6rQI7zfFql06SUJ5GsEon/8uAvgABWzBHj3Qg4q21Qe
 DRiVdp4F9rb5PaSVNeR5h7ABC8qFLbAsm/2nKca/bYTMuW0oer2WggNdtc8sMEYHM83iCrTz
 xBYPQKWKKl+vQ+egrW+eVJvAu5vvpPGD1qRCSrYImJTI8GD0LovUS7ffolbY+XoEnQ9Hltw0
 qaNyZ9zhja3WRni16/Gm6mSD8K12mJb4ZVeeTfYv2beuABRrNH1ULOYasFCUd5YPt2l3otpD
 N113KBPchXS24u7mcLTiWDKeQyfjBYDyL09RFqMWgjSKyM8lq97hd34Ey8MYKjj0htn8g825
 VIF/cNoA9GMc3s6q/4pIm/DNtzh2mb7r56AnoeK9cpsLughZe7sbGICu8CD59dGM0up5OrcK
 w3GPHwMkHkqzOdO0UyZrfEltn0QK4LkOv6vmvH7/QwZ8GjBuVN8UHOLHwSadNoeH+DeBtgkG
 a+zwQAPThYGDQeq3HJ3acBVsLHIdUL9Yo8f87z0L1cZD/yq3aG2JFlSiyuhwZnrfpWNbNrD4
 yTfgH+ez1U+6yxUxCqsl/mcaeerclSw0cm36MfVIVWwz0j/g22L3MZHn+sBgNKfQkfCGE+IX
 chJ4omUM9fg=
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4c1LG84x3mz9txD

(This is my first time submitting a Linux bug report, and also to a
mailing list in general. I apologise for any formatting errors
or technical errors.)

[1.] One line summary of the problem:
acer-wmi driver fails to initialise with Linux kernel >6.14

[2.] Full description of the problem/report:
The acer-wmi driver fails to initialise under Linux kernel 6.14 or
later. Probing fails during startup and when manually running
modprobe. This driver is used to control thermal throttling and clock
speeds on my Acer Predator Helios Neo 16.

This is the reported error:

```
May 02 12:37:12 kernel: acer-wmi acer-wmi: Failed to register 
platform_profile class device with empty choices
May 02 12:37:12 kernel: acer-wmi acer-wmi: probe with driver acer-wmi 
failed with error -22
```

I reported this issue to the Fedora project Bugzilla here:
https://bugzilla.redhat.com/show_bug.cgi?id=2363614

[3.] Keywords (i.e., modules, networking, kernel):
modules, drivers

[4.] Kernel information

[4.1.] Kernel version (from /proc/version):
Linux version 6.15.9-201.fc42.x86_64 
(mockbuild@fcd66b5b9bf7458aab425e003fa252bc) (gcc (GCC) 15.1.1 20250521 
(Red Hat 15.1.1-2), GNU ld version 2.44-6.fc42) #1 SMP PREEMPT_DYNAMIC 
Sat Aug  2 11:37:34 UTC 2025

[4.2.] Kernel .config file:
Upstream Fedora

[5.] Most recent kernel version which did not have the bug:
6.12.41

[6.] Output of Oops.. message (if applicable) with symbolic information
      resolved (see Documentation/admin-guide/bug-hunting.rst)

[7.] A small shell script or example program which triggers the
      problem (if possible)

Not applicable. The issue can be reproduced by pressing the
"performance" mode switch button and observing that it has
no effect.

[8.] Environment

[8.1.] Software (add the output of the ver_linux script here)
If some fields are empty or look unusual you may have an old version.
Compare to the current minimal requirements in Documentation/Changes.

Linux pasiphael 6.15.9-201.fc42.x86_64 #1 SMP PREEMPT_DYNAMIC Sat Aug  2 
11:37:34 UTC 2025 x86_64 GNU/Linux

GNU C                   15
GNU Make                4.4.1
Binutils                2.44
Util-linux              2.40.4
Mount                   2.40.4
Module-init-tools       33
E2fsprogs               1.47.2
Jfsutils                1.1.15
Xfsprogs                6.12.0
Quota-tools             4.09
PPP                     2.5.1
Nfs-utils               2.8.3
Bison                   3.8.2
Flex                    2.6.4
Linux C++ Library       6.0.34
Dynamic linker (ldd)    2.41
Procps                  4.0.4
Net-tools               2.10
Kbd                     2.7.1
Console-tools           2.7.1
Sh-utils                9.6
Udev                    257
Modules Loaded          ac97_bus acer_wireless acer_wmi acpi_pad 
acpi_thermal_rel act_csum binfmt_misc bluetooth bnep bridge btbcm 
btintel btmtk btrtl btusb cec cfg80211 cls_u32 coretemp crc8 drm_buddy 
drm_display_helper drm_exec drm_gpusvm drm_gpuvm drm_suballoc_helper 
drm_ttm_helper dw_dmac fat fuse ghash_clmulni_intel gpu_sched 
hid_logitech_dj hid_logitech_hidpp hid_multitouch i2c_algo_bit i2c_dev 
i2c_hid i2c_hid_acpi i2c_i801 i2c_smbus i915 idma64 int3400_thermal 
int3403_thermal int340x_thermal_zone intel_cstate intel_pmc_bxt 
intel_pmc_core intel_powerclamp intel_rapl_common intel_rapl_msr 
intel_tcc_cooling intel_uncore intel_uncore_frequency 
intel_uncore_frequency_common intel_vsec irqbypass iscsi_tcp 
iTCO_vendor_support iTCO_wdt iwlmvm iwlwifi joydev kvm kvm_intel libarc4 
libiscsi libiscsi_tcp llc loop lz4_compress lz4hc_compress mac80211 mc 
mei mei_hdcp mei_me mei_pxp mmc_core mtd nf_conntrack 
nf_conntrack_broadcast nf_conntrack_netbios_ns nf_conntrack_tftp 
nf_defrag_ipv4 nf_defrag_ipv6 nf_nat nf_nat_tftp nfnetlink 
nf_reject_ipv4 nf_reject_ipv6 nf_tables nft_chain_nat nft_ct nft_fib 
nft_fib_inet nft_fib_ipv4 nft_fib_ipv6 nft_masq nft_reject 
nft_reject_inet nft_reject_ipv4 nvidia nvidia_drm nvidia_modeset 
nvidia_uvm nvidia_wmi_ec_backlight nvme nvme_auth nvme_core nvme_keyring 
pcspkr pinctrl_alderlake pkcs8_key_parser platform_profile pmt_class 
pmt_telemetry polyval_clmulni polyval_generic processor_thermal_device 
processor_thermal_device_pci processor_thermal_mbox 
processor_thermal_power_floor processor_thermal_rapl 
processor_thermal_rfim processor_thermal_wt_hint 
processor_thermal_wt_req qrtr r8169 rapl realtek rfcomm rfkill rtsx_pci 
rtsx_pci_sdmmc sch_htb scsi_transport_iscsi serio_raw sha1_ssse3 
sha256_ssse3 sha512_ssse3 snd snd_compress snd_ctl_led snd_hda_codec 
snd_hda_codec_generic snd_hda_codec_hdmi snd_hda_codec_realtek 
snd_hda_core snd_hda_ext_core snd_hda_intel snd_hda_scodec_component 
snd_hrtimer snd_hwdep snd_intel_dspcfg snd_intel_sdw_acpi snd_pcm 
snd_pcm_dmaengine snd_seq snd_seq_device snd_seq_dummy snd_soc_acpi 
snd_soc_acpi_intel_match snd_soc_acpi_intel_sdca_quirks snd_soc_avs 
snd_soc_core snd_soc_dmic snd_soc_hdac_hda snd_soc_hda_codec 
snd_soc_intel_hda_dsp_common snd_soc_intel_sof_board_helpers 
snd_soc_sdca snd_soc_skl_hda_dsp snd_sof snd_sof_intel_hda 
snd_sof_intel_hda_common snd_sof_intel_hda_generic 
snd_sof_intel_hda_mlink snd_sof_intel_hda_sdw_bpt snd_sof_pci 
snd_sof_pci_intel_cnl snd_sof_pci_intel_tgl snd_sof_probes snd_sof_utils 
snd_sof_xtensa_dsp snd_timer soundcore soundwire_bus soundwire_cadence 
soundwire_generic_allocation soundwire_intel sparse_keymap spd5118 
spi_intel spi_intel_pci spi_nor spi_pxa2xx_core spi_pxa2xx_platform stp 
sunrpc thunderbolt ttm tun typec typec_ucsi ucsi_acpi uinput uvc 
uvcvideo vboxdrv vboxnetadp vboxnetflt vfat video videobuf2_common 
videobuf2_memops videobuf2_v4l2 videobuf2_vmalloc videodev vmd wmi 
wmi_bmof x86_pkg_temp_thermal xe zram

[8.2.] Processor information (from /proc/cpuinfo):
processor    : 0
vendor_id    : GenuineIntel
cpu family    : 6
model        : 191
model name    : 13th Gen Intel(R) Core(TM) i7-13700HX
stepping    : 2
microcode    : 0x3a
cpu MHz        : 3499.657
cache size    : 30720 KB
physical id    : 0
siblings    : 24
core id        : 0
cpu cores    : 16
apicid        : 0
initial apicid    : 0
fpu        : yes
fpu_exception    : yes
cpuid level    : 32
wp        : yes
flags        : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca 
cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall 
nx pdpe1gb rdtscp lm constant_tsc art arch_perfmon pebs bts rep_good 
nopl xtopology nonstop_tsc cpuid aperfmperf tsc_known_freq pni pclmulqdq 
dtes64 monitor ds_cpl vmx est tm2 ssse3 sdbg fma cx16 xtpr pdcm pcid 
sse4_1 sse4_2 x2apic movbe popcnt tsc_deadline_timer aes xsave avx f16c 
rdrand lahf_lm abm 3dnowprefetch cpuid_fault epb ssbd ibrs ibpb stibp 
ibrs_enhanced tpr_shadow flexpriority ept vpid ept_ad fsgsbase 
tsc_adjust bmi1 avx2 smep bmi2 erms invpcid rdseed adx smap clflushopt 
clwb intel_pt sha_ni xsaveopt xsavec xgetbv1 xsaves split_lock_detect 
user_shstk avx_vnni dtherm ida arat pln pts hwp hwp_notify 
hwp_act_window hwp_epp hwp_pkg_req hfi vnmi umip pku ospke waitpkg gfni 
vaes vpclmulqdq rdpid movdiri movdir64b fsrm md_clear serialize arch_lbr 
ibt flush_l1d arch_capabilities
vmx flags    : vnmi preemption_timer posted_intr invvpid ept_x_only 
ept_ad ept_1gb flexpriority apicv tsc_offset vtpr mtf vapic ept vpid 
unrestricted_guest vapic_reg vid ple shadow_vmcs ept_violation_ve 
ept_mode_based_exec tsc_scaling usr_wait_pause
bugs        : spectre_v1 spectre_v2 spec_store_bypass swapgs eibrs_pbrsb 
rfds bhi spectre_v2_user
bogomips    : 4608.00
clflush size    : 64
cache_alignment    : 64
address sizes    : 39 bits physical, 48 bits virtual
power management:

processor    : 1
vendor_id    : GenuineIntel
cpu family    : 6
model        : 191
model name    : 13th Gen Intel(R) Core(TM) i7-13700HX
stepping    : 2
microcode    : 0x3a
cpu MHz        : 800.000
cache size    : 30720 KB
physical id    : 0
siblings    : 24
core id        : 0
cpu cores    : 16
apicid        : 1
initial apicid    : 1
fpu        : yes
fpu_exception    : yes
cpuid level    : 32
wp        : yes
flags        : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca 
cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall 
nx pdpe1gb rdtscp lm constant_tsc art arch_perfmon pebs bts rep_good 
nopl xtopology nonstop_tsc cpuid aperfmperf tsc_known_freq pni pclmulqdq 
dtes64 monitor ds_cpl vmx est tm2 ssse3 sdbg fma cx16 xtpr pdcm pcid 
sse4_1 sse4_2 x2apic movbe popcnt tsc_deadline_timer aes xsave avx f16c 
rdrand lahf_lm abm 3dnowprefetch cpuid_fault epb ssbd ibrs ibpb stibp 
ibrs_enhanced tpr_shadow flexpriority ept vpid ept_ad fsgsbase 
tsc_adjust bmi1 avx2 smep bmi2 erms invpcid rdseed adx smap clflushopt 
clwb intel_pt sha_ni xsaveopt xsavec xgetbv1 xsaves split_lock_detect 
user_shstk avx_vnni dtherm ida arat pln pts hwp hwp_notify 
hwp_act_window hwp_epp hwp_pkg_req hfi vnmi umip pku ospke waitpkg gfni 
vaes vpclmulqdq rdpid movdiri movdir64b fsrm md_clear serialize arch_lbr 
ibt flush_l1d arch_capabilities
vmx flags    : vnmi preemption_timer posted_intr invvpid ept_x_only 
ept_ad ept_1gb flexpriority apicv tsc_offset vtpr mtf vapic ept vpid 
unrestricted_guest vapic_reg vid ple shadow_vmcs ept_violation_ve 
ept_mode_based_exec tsc_scaling usr_wait_pause
bugs        : spectre_v1 spectre_v2 spec_store_bypass swapgs eibrs_pbrsb 
rfds bhi spectre_v2_user
bogomips    : 4608.00
clflush size    : 64
cache_alignment    : 64
address sizes    : 39 bits physical, 48 bits virtual
power management:

processor    : 2
vendor_id    : GenuineIntel
cpu family    : 6
model        : 191
model name    : 13th Gen Intel(R) Core(TM) i7-13700HX
stepping    : 2
microcode    : 0x3a
cpu MHz        : 4550.125
cache size    : 30720 KB
physical id    : 0
siblings    : 24
core id        : 4
cpu cores    : 16
apicid        : 8
initial apicid    : 8
fpu        : yes
fpu_exception    : yes
cpuid level    : 32
wp        : yes
flags        : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca 
cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall 
nx pdpe1gb rdtscp lm constant_tsc art arch_perfmon pebs bts rep_good 
nopl xtopology nonstop_tsc cpuid aperfmperf tsc_known_freq pni pclmulqdq 
dtes64 monitor ds_cpl vmx est tm2 ssse3 sdbg fma cx16 xtpr pdcm pcid 
sse4_1 sse4_2 x2apic movbe popcnt tsc_deadline_timer aes xsave avx f16c 
rdrand lahf_lm abm 3dnowprefetch cpuid_fault epb ssbd ibrs ibpb stibp 
ibrs_enhanced tpr_shadow flexpriority ept vpid ept_ad fsgsbase 
tsc_adjust bmi1 avx2 smep bmi2 erms invpcid rdseed adx smap clflushopt 
clwb intel_pt sha_ni xsaveopt xsavec xgetbv1 xsaves split_lock_detect 
user_shstk avx_vnni dtherm ida arat pln pts hwp hwp_notify 
hwp_act_window hwp_epp hwp_pkg_req hfi vnmi umip pku ospke waitpkg gfni 
vaes vpclmulqdq rdpid movdiri movdir64b fsrm md_clear serialize arch_lbr 
ibt flush_l1d arch_capabilities
vmx flags    : vnmi preemption_timer posted_intr invvpid ept_x_only 
ept_ad ept_1gb flexpriority apicv tsc_offset vtpr mtf vapic ept vpid 
unrestricted_guest vapic_reg vid ple shadow_vmcs ept_violation_ve 
ept_mode_based_exec tsc_scaling usr_wait_pause
bugs        : spectre_v1 spectre_v2 spec_store_bypass swapgs eibrs_pbrsb 
rfds bhi spectre_v2_user
bogomips    : 4608.00
clflush size    : 64
cache_alignment    : 64
address sizes    : 39 bits physical, 48 bits virtual
power management:

processor    : 3
vendor_id    : GenuineIntel
cpu family    : 6
model        : 191
model name    : 13th Gen Intel(R) Core(TM) i7-13700HX
stepping    : 2
microcode    : 0x3a
cpu MHz        : 4574.278
cache size    : 30720 KB
physical id    : 0
siblings    : 24
core id        : 4
cpu cores    : 16
apicid        : 9
initial apicid    : 9
fpu        : yes
fpu_exception    : yes
cpuid level    : 32
wp        : yes
flags        : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca 
cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall 
nx pdpe1gb rdtscp lm constant_tsc art arch_perfmon pebs bts rep_good 
nopl xtopology nonstop_tsc cpuid aperfmperf tsc_known_freq pni pclmulqdq 
dtes64 monitor ds_cpl vmx est tm2 ssse3 sdbg fma cx16 xtpr pdcm pcid 
sse4_1 sse4_2 x2apic movbe popcnt tsc_deadline_timer aes xsave avx f16c 
rdrand lahf_lm abm 3dnowprefetch cpuid_fault epb ssbd ibrs ibpb stibp 
ibrs_enhanced tpr_shadow flexpriority ept vpid ept_ad fsgsbase 
tsc_adjust bmi1 avx2 smep bmi2 erms invpcid rdseed adx smap clflushopt 
clwb intel_pt sha_ni xsaveopt xsavec xgetbv1 xsaves split_lock_detect 
user_shstk avx_vnni dtherm ida arat pln pts hwp hwp_notify 
hwp_act_window hwp_epp hwp_pkg_req hfi vnmi umip pku ospke waitpkg gfni 
vaes vpclmulqdq rdpid movdiri movdir64b fsrm md_clear serialize arch_lbr 
ibt flush_l1d arch_capabilities
vmx flags    : vnmi preemption_timer posted_intr invvpid ept_x_only 
ept_ad ept_1gb flexpriority apicv tsc_offset vtpr mtf vapic ept vpid 
unrestricted_guest vapic_reg vid ple shadow_vmcs ept_violation_ve 
ept_mode_based_exec tsc_scaling usr_wait_pause
bugs        : spectre_v1 spectre_v2 spec_store_bypass swapgs eibrs_pbrsb 
rfds bhi spectre_v2_user
bogomips    : 4608.00
clflush size    : 64
cache_alignment    : 64
address sizes    : 39 bits physical, 48 bits virtual
power management:

processor    : 4
vendor_id    : GenuineIntel
cpu family    : 6
model        : 191
model name    : 13th Gen Intel(R) Core(TM) i7-13700HX
stepping    : 2
microcode    : 0x3a
cpu MHz        : 994.211
cache size    : 30720 KB
physical id    : 0
siblings    : 24
core id        : 8
cpu cores    : 16
apicid        : 16
initial apicid    : 16
fpu        : yes
fpu_exception    : yes
cpuid level    : 32
wp        : yes
flags        : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca 
cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall 
nx pdpe1gb rdtscp lm constant_tsc art arch_perfmon pebs bts rep_good 
nopl xtopology nonstop_tsc cpuid aperfmperf tsc_known_freq pni pclmulqdq 
dtes64 monitor ds_cpl vmx est tm2 ssse3 sdbg fma cx16 xtpr pdcm pcid 
sse4_1 sse4_2 x2apic movbe popcnt tsc_deadline_timer aes xsave avx f16c 
rdrand lahf_lm abm 3dnowprefetch cpuid_fault epb ssbd ibrs ibpb stibp 
ibrs_enhanced tpr_shadow flexpriority ept vpid ept_ad fsgsbase 
tsc_adjust bmi1 avx2 smep bmi2 erms invpcid rdseed adx smap clflushopt 
clwb intel_pt sha_ni xsaveopt xsavec xgetbv1 xsaves split_lock_detect 
user_shstk avx_vnni dtherm ida arat pln pts hwp hwp_notify 
hwp_act_window hwp_epp hwp_pkg_req hfi vnmi umip pku ospke waitpkg gfni 
vaes vpclmulqdq rdpid movdiri movdir64b fsrm md_clear serialize arch_lbr 
ibt flush_l1d arch_capabilities
vmx flags    : vnmi preemption_timer posted_intr invvpid ept_x_only 
ept_ad ept_1gb flexpriority apicv tsc_offset vtpr mtf vapic ept vpid 
unrestricted_guest vapic_reg vid ple shadow_vmcs ept_violation_ve 
ept_mode_based_exec tsc_scaling usr_wait_pause
bugs        : spectre_v1 spectre_v2 spec_store_bypass swapgs eibrs_pbrsb 
rfds bhi spectre_v2_user
bogomips    : 4608.00
clflush size    : 64
cache_alignment    : 64
address sizes    : 39 bits physical, 48 bits virtual
power management:

processor    : 5
vendor_id    : GenuineIntel
cpu family    : 6
model        : 191
model name    : 13th Gen Intel(R) Core(TM) i7-13700HX
stepping    : 2
microcode    : 0x3a
cpu MHz        : 1367.750
cache size    : 30720 KB
physical id    : 0
siblings    : 24
core id        : 8
cpu cores    : 16
apicid        : 17
initial apicid    : 17
fpu        : yes
fpu_exception    : yes
cpuid level    : 32
wp        : yes
flags        : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca 
cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall 
nx pdpe1gb rdtscp lm constant_tsc art arch_perfmon pebs bts rep_good 
nopl xtopology nonstop_tsc cpuid aperfmperf tsc_known_freq pni pclmulqdq 
dtes64 monitor ds_cpl vmx est tm2 ssse3 sdbg fma cx16 xtpr pdcm pcid 
sse4_1 sse4_2 x2apic movbe popcnt tsc_deadline_timer aes xsave avx f16c 
rdrand lahf_lm abm 3dnowprefetch cpuid_fault epb ssbd ibrs ibpb stibp 
ibrs_enhanced tpr_shadow flexpriority ept vpid ept_ad fsgsbase 
tsc_adjust bmi1 avx2 smep bmi2 erms invpcid rdseed adx smap clflushopt 
clwb intel_pt sha_ni xsaveopt xsavec xgetbv1 xsaves split_lock_detect 
user_shstk avx_vnni dtherm ida arat pln pts hwp hwp_notify 
hwp_act_window hwp_epp hwp_pkg_req hfi vnmi umip pku ospke waitpkg gfni 
vaes vpclmulqdq rdpid movdiri movdir64b fsrm md_clear serialize arch_lbr 
ibt flush_l1d arch_capabilities
vmx flags    : vnmi preemption_timer posted_intr invvpid ept_x_only 
ept_ad ept_1gb flexpriority apicv tsc_offset vtpr mtf vapic ept vpid 
unrestricted_guest vapic_reg vid ple shadow_vmcs ept_violation_ve 
ept_mode_based_exec tsc_scaling usr_wait_pause
bugs        : spectre_v1 spectre_v2 spec_store_bypass swapgs eibrs_pbrsb 
rfds bhi spectre_v2_user
bogomips    : 4608.00
clflush size    : 64
cache_alignment    : 64
address sizes    : 39 bits physical, 48 bits virtual
power management:

processor    : 6
vendor_id    : GenuineIntel
cpu family    : 6
model        : 191
model name    : 13th Gen Intel(R) Core(TM) i7-13700HX
stepping    : 2
microcode    : 0x3a
cpu MHz        : 981.134
cache size    : 30720 KB
physical id    : 0
siblings    : 24
core id        : 12
cpu cores    : 16
apicid        : 24
initial apicid    : 24
fpu        : yes
fpu_exception    : yes
cpuid level    : 32
wp        : yes
flags        : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca 
cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall 
nx pdpe1gb rdtscp lm constant_tsc art arch_perfmon pebs bts rep_good 
nopl xtopology nonstop_tsc cpuid aperfmperf tsc_known_freq pni pclmulqdq 
dtes64 monitor ds_cpl vmx est tm2 ssse3 sdbg fma cx16 xtpr pdcm pcid 
sse4_1 sse4_2 x2apic movbe popcnt tsc_deadline_timer aes xsave avx f16c 
rdrand lahf_lm abm 3dnowprefetch cpuid_fault epb ssbd ibrs ibpb stibp 
ibrs_enhanced tpr_shadow flexpriority ept vpid ept_ad fsgsbase 
tsc_adjust bmi1 avx2 smep bmi2 erms invpcid rdseed adx smap clflushopt 
clwb intel_pt sha_ni xsaveopt xsavec xgetbv1 xsaves split_lock_detect 
user_shstk avx_vnni dtherm ida arat pln pts hwp hwp_notify 
hwp_act_window hwp_epp hwp_pkg_req hfi vnmi umip pku ospke waitpkg gfni 
vaes vpclmulqdq rdpid movdiri movdir64b fsrm md_clear serialize arch_lbr 
ibt flush_l1d arch_capabilities
vmx flags    : vnmi preemption_timer posted_intr invvpid ept_x_only 
ept_ad ept_1gb flexpriority apicv tsc_offset vtpr mtf vapic ept vpid 
unrestricted_guest vapic_reg vid ple shadow_vmcs ept_violation_ve 
ept_mode_based_exec tsc_scaling usr_wait_pause
bugs        : spectre_v1 spectre_v2 spec_store_bypass swapgs eibrs_pbrsb 
rfds bhi spectre_v2_user
bogomips    : 4608.00
clflush size    : 64
cache_alignment    : 64
address sizes    : 39 bits physical, 48 bits virtual
power management:

processor    : 7
vendor_id    : GenuineIntel
cpu family    : 6
model        : 191
model name    : 13th Gen Intel(R) Core(TM) i7-13700HX
stepping    : 2
microcode    : 0x3a
cpu MHz        : 800.000
cache size    : 30720 KB
physical id    : 0
siblings    : 24
core id        : 12
cpu cores    : 16
apicid        : 25
initial apicid    : 25
fpu        : yes
fpu_exception    : yes
cpuid level    : 32
wp        : yes
flags        : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca 
cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall 
nx pdpe1gb rdtscp lm constant_tsc art arch_perfmon pebs bts rep_good 
nopl xtopology nonstop_tsc cpuid aperfmperf tsc_known_freq pni pclmulqdq 
dtes64 monitor ds_cpl vmx est tm2 ssse3 sdbg fma cx16 xtpr pdcm pcid 
sse4_1 sse4_2 x2apic movbe popcnt tsc_deadline_timer aes xsave avx f16c 
rdrand lahf_lm abm 3dnowprefetch cpuid_fault epb ssbd ibrs ibpb stibp 
ibrs_enhanced tpr_shadow flexpriority ept vpid ept_ad fsgsbase 
tsc_adjust bmi1 avx2 smep bmi2 erms invpcid rdseed adx smap clflushopt 
clwb intel_pt sha_ni xsaveopt xsavec xgetbv1 xsaves split_lock_detect 
user_shstk avx_vnni dtherm ida arat pln pts hwp hwp_notify 
hwp_act_window hwp_epp hwp_pkg_req hfi vnmi umip pku ospke waitpkg gfni 
vaes vpclmulqdq rdpid movdiri movdir64b fsrm md_clear serialize arch_lbr 
ibt flush_l1d arch_capabilities
vmx flags    : vnmi preemption_timer posted_intr invvpid ept_x_only 
ept_ad ept_1gb flexpriority apicv tsc_offset vtpr mtf vapic ept vpid 
unrestricted_guest vapic_reg vid ple shadow_vmcs ept_violation_ve 
ept_mode_based_exec tsc_scaling usr_wait_pause
bugs        : spectre_v1 spectre_v2 spec_store_bypass swapgs eibrs_pbrsb 
rfds bhi spectre_v2_user
bogomips    : 4608.00
clflush size    : 64
cache_alignment    : 64
address sizes    : 39 bits physical, 48 bits virtual
power management:

processor    : 8
vendor_id    : GenuineIntel
cpu family    : 6
model        : 191
model name    : 13th Gen Intel(R) Core(TM) i7-13700HX
stepping    : 2
microcode    : 0x3a
cpu MHz        : 4531.399
cache size    : 30720 KB
physical id    : 0
siblings    : 24
core id        : 16
cpu cores    : 16
apicid        : 32
initial apicid    : 32
fpu        : yes
fpu_exception    : yes
cpuid level    : 32
wp        : yes
flags        : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca 
cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall 
nx pdpe1gb rdtscp lm constant_tsc art arch_perfmon pebs bts rep_good 
nopl xtopology nonstop_tsc cpuid aperfmperf tsc_known_freq pni pclmulqdq 
dtes64 monitor ds_cpl vmx est tm2 ssse3 sdbg fma cx16 xtpr pdcm pcid 
sse4_1 sse4_2 x2apic movbe popcnt tsc_deadline_timer aes xsave avx f16c 
rdrand lahf_lm abm 3dnowprefetch cpuid_fault epb ssbd ibrs ibpb stibp 
ibrs_enhanced tpr_shadow flexpriority ept vpid ept_ad fsgsbase 
tsc_adjust bmi1 avx2 smep bmi2 erms invpcid rdseed adx smap clflushopt 
clwb intel_pt sha_ni xsaveopt xsavec xgetbv1 xsaves split_lock_detect 
user_shstk avx_vnni dtherm ida arat pln pts hwp hwp_notify 
hwp_act_window hwp_epp hwp_pkg_req hfi vnmi umip pku ospke waitpkg gfni 
vaes vpclmulqdq rdpid movdiri movdir64b fsrm md_clear serialize arch_lbr 
ibt flush_l1d arch_capabilities
vmx flags    : vnmi preemption_timer posted_intr invvpid ept_x_only 
ept_ad ept_1gb flexpriority apicv tsc_offset vtpr mtf vapic ept vpid 
unrestricted_guest vapic_reg vid ple shadow_vmcs ept_violation_ve 
ept_mode_based_exec tsc_scaling usr_wait_pause
bugs        : spectre_v1 spectre_v2 spec_store_bypass swapgs eibrs_pbrsb 
rfds bhi spectre_v2_user
bogomips    : 4608.00
clflush size    : 64
cache_alignment    : 64
address sizes    : 39 bits physical, 48 bits virtual
power management:

processor    : 9
vendor_id    : GenuineIntel
cpu family    : 6
model        : 191
model name    : 13th Gen Intel(R) Core(TM) i7-13700HX
stepping    : 2
microcode    : 0x3a
cpu MHz        : 4543.632
cache size    : 30720 KB
physical id    : 0
siblings    : 24
core id        : 16
cpu cores    : 16
apicid        : 33
initial apicid    : 33
fpu        : yes
fpu_exception    : yes
cpuid level    : 32
wp        : yes
flags        : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca 
cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall 
nx pdpe1gb rdtscp lm constant_tsc art arch_perfmon pebs bts rep_good 
nopl xtopology nonstop_tsc cpuid aperfmperf tsc_known_freq pni pclmulqdq 
dtes64 monitor ds_cpl vmx est tm2 ssse3 sdbg fma cx16 xtpr pdcm pcid 
sse4_1 sse4_2 x2apic movbe popcnt tsc_deadline_timer aes xsave avx f16c 
rdrand lahf_lm abm 3dnowprefetch cpuid_fault epb ssbd ibrs ibpb stibp 
ibrs_enhanced tpr_shadow flexpriority ept vpid ept_ad fsgsbase 
tsc_adjust bmi1 avx2 smep bmi2 erms invpcid rdseed adx smap clflushopt 
clwb intel_pt sha_ni xsaveopt xsavec xgetbv1 xsaves split_lock_detect 
user_shstk avx_vnni dtherm ida arat pln pts hwp hwp_notify 
hwp_act_window hwp_epp hwp_pkg_req hfi vnmi umip pku ospke waitpkg gfni 
vaes vpclmulqdq rdpid movdiri movdir64b fsrm md_clear serialize arch_lbr 
ibt flush_l1d arch_capabilities
vmx flags    : vnmi preemption_timer posted_intr invvpid ept_x_only 
ept_ad ept_1gb flexpriority apicv tsc_offset vtpr mtf vapic ept vpid 
unrestricted_guest vapic_reg vid ple shadow_vmcs ept_violation_ve 
ept_mode_based_exec tsc_scaling usr_wait_pause
bugs        : spectre_v1 spectre_v2 spec_store_bypass swapgs eibrs_pbrsb 
rfds bhi spectre_v2_user
bogomips    : 4608.00
clflush size    : 64
cache_alignment    : 64
address sizes    : 39 bits physical, 48 bits virtual
power management:

processor    : 10
vendor_id    : GenuineIntel
cpu family    : 6
model        : 191
model name    : 13th Gen Intel(R) Core(TM) i7-13700HX
stepping    : 2
microcode    : 0x3a
cpu MHz        : 800.393
cache size    : 30720 KB
physical id    : 0
siblings    : 24
core id        : 20
cpu cores    : 16
apicid        : 40
initial apicid    : 40
fpu        : yes
fpu_exception    : yes
cpuid level    : 32
wp        : yes
flags        : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca 
cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall 
nx pdpe1gb rdtscp lm constant_tsc art arch_perfmon pebs bts rep_good 
nopl xtopology nonstop_tsc cpuid aperfmperf tsc_known_freq pni pclmulqdq 
dtes64 monitor ds_cpl vmx est tm2 ssse3 sdbg fma cx16 xtpr pdcm pcid 
sse4_1 sse4_2 x2apic movbe popcnt tsc_deadline_timer aes xsave avx f16c 
rdrand lahf_lm abm 3dnowprefetch cpuid_fault epb ssbd ibrs ibpb stibp 
ibrs_enhanced tpr_shadow flexpriority ept vpid ept_ad fsgsbase 
tsc_adjust bmi1 avx2 smep bmi2 erms invpcid rdseed adx smap clflushopt 
clwb intel_pt sha_ni xsaveopt xsavec xgetbv1 xsaves split_lock_detect 
user_shstk avx_vnni dtherm ida arat pln pts hwp hwp_notify 
hwp_act_window hwp_epp hwp_pkg_req hfi vnmi umip pku ospke waitpkg gfni 
vaes vpclmulqdq rdpid movdiri movdir64b fsrm md_clear serialize arch_lbr 
ibt flush_l1d arch_capabilities
vmx flags    : vnmi preemption_timer posted_intr invvpid ept_x_only 
ept_ad ept_1gb flexpriority apicv tsc_offset vtpr mtf vapic ept vpid 
unrestricted_guest vapic_reg vid ple shadow_vmcs ept_violation_ve 
ept_mode_based_exec tsc_scaling usr_wait_pause
bugs        : spectre_v1 spectre_v2 spec_store_bypass swapgs eibrs_pbrsb 
rfds bhi spectre_v2_user
bogomips    : 4608.00
clflush size    : 64
cache_alignment    : 64
address sizes    : 39 bits physical, 48 bits virtual
power management:

processor    : 11
vendor_id    : GenuineIntel
cpu family    : 6
model        : 191
model name    : 13th Gen Intel(R) Core(TM) i7-13700HX
stepping    : 2
microcode    : 0x3a
cpu MHz        : 800.000
cache size    : 30720 KB
physical id    : 0
siblings    : 24
core id        : 20
cpu cores    : 16
apicid        : 41
initial apicid    : 41
fpu        : yes
fpu_exception    : yes
cpuid level    : 32
wp        : yes
flags        : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca 
cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall 
nx pdpe1gb rdtscp lm constant_tsc art arch_perfmon pebs bts rep_good 
nopl xtopology nonstop_tsc cpuid aperfmperf tsc_known_freq pni pclmulqdq 
dtes64 monitor ds_cpl vmx est tm2 ssse3 sdbg fma cx16 xtpr pdcm pcid 
sse4_1 sse4_2 x2apic movbe popcnt tsc_deadline_timer aes xsave avx f16c 
rdrand lahf_lm abm 3dnowprefetch cpuid_fault epb ssbd ibrs ibpb stibp 
ibrs_enhanced tpr_shadow flexpriority ept vpid ept_ad fsgsbase 
tsc_adjust bmi1 avx2 smep bmi2 erms invpcid rdseed adx smap clflushopt 
clwb intel_pt sha_ni xsaveopt xsavec xgetbv1 xsaves split_lock_detect 
user_shstk avx_vnni dtherm ida arat pln pts hwp hwp_notify 
hwp_act_window hwp_epp hwp_pkg_req hfi vnmi umip pku ospke waitpkg gfni 
vaes vpclmulqdq rdpid movdiri movdir64b fsrm md_clear serialize arch_lbr 
ibt flush_l1d arch_capabilities
vmx flags    : vnmi preemption_timer posted_intr invvpid ept_x_only 
ept_ad ept_1gb flexpriority apicv tsc_offset vtpr mtf vapic ept vpid 
unrestricted_guest vapic_reg vid ple shadow_vmcs ept_violation_ve 
ept_mode_based_exec tsc_scaling usr_wait_pause
bugs        : spectre_v1 spectre_v2 spec_store_bypass swapgs eibrs_pbrsb 
rfds bhi spectre_v2_user
bogomips    : 4608.00
clflush size    : 64
cache_alignment    : 64
address sizes    : 39 bits physical, 48 bits virtual
power management:

processor    : 12
vendor_id    : GenuineIntel
cpu family    : 6
model        : 191
model name    : 13th Gen Intel(R) Core(TM) i7-13700HX
stepping    : 2
microcode    : 0x3a
cpu MHz        : 2125.227
cache size    : 30720 KB
physical id    : 0
siblings    : 24
core id        : 24
cpu cores    : 16
apicid        : 48
initial apicid    : 48
fpu        : yes
fpu_exception    : yes
cpuid level    : 32
wp        : yes
flags        : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca 
cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall 
nx pdpe1gb rdtscp lm constant_tsc art arch_perfmon pebs bts rep_good 
nopl xtopology nonstop_tsc cpuid aperfmperf tsc_known_freq pni pclmulqdq 
dtes64 monitor ds_cpl vmx est tm2 ssse3 sdbg fma cx16 xtpr pdcm pcid 
sse4_1 sse4_2 x2apic movbe popcnt tsc_deadline_timer aes xsave avx f16c 
rdrand lahf_lm abm 3dnowprefetch cpuid_fault epb ssbd ibrs ibpb stibp 
ibrs_enhanced tpr_shadow flexpriority ept vpid ept_ad fsgsbase 
tsc_adjust bmi1 avx2 smep bmi2 erms invpcid rdseed adx smap clflushopt 
clwb intel_pt sha_ni xsaveopt xsavec xgetbv1 xsaves split_lock_detect 
user_shstk avx_vnni dtherm ida arat pln pts hwp hwp_notify 
hwp_act_window hwp_epp hwp_pkg_req hfi vnmi umip pku ospke waitpkg gfni 
vaes vpclmulqdq rdpid movdiri movdir64b fsrm md_clear serialize arch_lbr 
ibt flush_l1d arch_capabilities
vmx flags    : vnmi preemption_timer posted_intr invvpid ept_x_only 
ept_ad ept_1gb flexpriority apicv tsc_offset vtpr mtf vapic ept vpid 
unrestricted_guest vapic_reg vid ple shadow_vmcs ept_violation_ve 
ept_mode_based_exec tsc_scaling usr_wait_pause
bugs        : spectre_v1 spectre_v2 spec_store_bypass swapgs eibrs_pbrsb 
rfds bhi spectre_v2_user
bogomips    : 4608.00
clflush size    : 64
cache_alignment    : 64
address sizes    : 39 bits physical, 48 bits virtual
power management:

processor    : 13
vendor_id    : GenuineIntel
cpu family    : 6
model        : 191
model name    : 13th Gen Intel(R) Core(TM) i7-13700HX
stepping    : 2
microcode    : 0x3a
cpu MHz        : 800.000
cache size    : 30720 KB
physical id    : 0
siblings    : 24
core id        : 24
cpu cores    : 16
apicid        : 49
initial apicid    : 49
fpu        : yes
fpu_exception    : yes
cpuid level    : 32
wp        : yes
flags        : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca 
cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall 
nx pdpe1gb rdtscp lm constant_tsc art arch_perfmon pebs bts rep_good 
nopl xtopology nonstop_tsc cpuid aperfmperf tsc_known_freq pni pclmulqdq 
dtes64 monitor ds_cpl vmx est tm2 ssse3 sdbg fma cx16 xtpr pdcm pcid 
sse4_1 sse4_2 x2apic movbe popcnt tsc_deadline_timer aes xsave avx f16c 
rdrand lahf_lm abm 3dnowprefetch cpuid_fault epb ssbd ibrs ibpb stibp 
ibrs_enhanced tpr_shadow flexpriority ept vpid ept_ad fsgsbase 
tsc_adjust bmi1 avx2 smep bmi2 erms invpcid rdseed adx smap clflushopt 
clwb intel_pt sha_ni xsaveopt xsavec xgetbv1 xsaves split_lock_detect 
user_shstk avx_vnni dtherm ida arat pln pts hwp hwp_notify 
hwp_act_window hwp_epp hwp_pkg_req hfi vnmi umip pku ospke waitpkg gfni 
vaes vpclmulqdq rdpid movdiri movdir64b fsrm md_clear serialize arch_lbr 
ibt flush_l1d arch_capabilities
vmx flags    : vnmi preemption_timer posted_intr invvpid ept_x_only 
ept_ad ept_1gb flexpriority apicv tsc_offset vtpr mtf vapic ept vpid 
unrestricted_guest vapic_reg vid ple shadow_vmcs ept_violation_ve 
ept_mode_based_exec tsc_scaling usr_wait_pause
bugs        : spectre_v1 spectre_v2 spec_store_bypass swapgs eibrs_pbrsb 
rfds bhi spectre_v2_user
bogomips    : 4608.00
clflush size    : 64
cache_alignment    : 64
address sizes    : 39 bits physical, 48 bits virtual
power management:

processor    : 14
vendor_id    : GenuineIntel
cpu family    : 6
model        : 191
model name    : 13th Gen Intel(R) Core(TM) i7-13700HX
stepping    : 2
microcode    : 0x3a
cpu MHz        : 2170.816
cache size    : 30720 KB
physical id    : 0
siblings    : 24
core id        : 28
cpu cores    : 16
apicid        : 56
initial apicid    : 56
fpu        : yes
fpu_exception    : yes
cpuid level    : 32
wp        : yes
flags        : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca 
cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall 
nx pdpe1gb rdtscp lm constant_tsc art arch_perfmon pebs bts rep_good 
nopl xtopology nonstop_tsc cpuid aperfmperf tsc_known_freq pni pclmulqdq 
dtes64 monitor ds_cpl vmx est tm2 ssse3 sdbg fma cx16 xtpr pdcm pcid 
sse4_1 sse4_2 x2apic movbe popcnt tsc_deadline_timer aes xsave avx f16c 
rdrand lahf_lm abm 3dnowprefetch cpuid_fault epb ssbd ibrs ibpb stibp 
ibrs_enhanced tpr_shadow flexpriority ept vpid ept_ad fsgsbase 
tsc_adjust bmi1 avx2 smep bmi2 erms invpcid rdseed adx smap clflushopt 
clwb intel_pt sha_ni xsaveopt xsavec xgetbv1 xsaves split_lock_detect 
user_shstk avx_vnni dtherm ida arat pln pts hwp hwp_notify 
hwp_act_window hwp_epp hwp_pkg_req hfi vnmi umip pku ospke waitpkg gfni 
vaes vpclmulqdq rdpid movdiri movdir64b fsrm md_clear serialize arch_lbr 
ibt flush_l1d arch_capabilities
vmx flags    : vnmi preemption_timer posted_intr invvpid ept_x_only 
ept_ad ept_1gb flexpriority apicv tsc_offset vtpr mtf vapic ept vpid 
unrestricted_guest vapic_reg vid ple shadow_vmcs ept_violation_ve 
ept_mode_based_exec tsc_scaling usr_wait_pause
bugs        : spectre_v1 spectre_v2 spec_store_bypass swapgs eibrs_pbrsb 
rfds bhi spectre_v2_user
bogomips    : 4608.00
clflush size    : 64
cache_alignment    : 64
address sizes    : 39 bits physical, 48 bits virtual
power management:

processor    : 15
vendor_id    : GenuineIntel
cpu family    : 6
model        : 191
model name    : 13th Gen Intel(R) Core(TM) i7-13700HX
stepping    : 2
microcode    : 0x3a
cpu MHz        : 4500.000
cache size    : 30720 KB
physical id    : 0
siblings    : 24
core id        : 28
cpu cores    : 16
apicid        : 57
initial apicid    : 57
fpu        : yes
fpu_exception    : yes
cpuid level    : 32
wp        : yes
flags        : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca 
cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall 
nx pdpe1gb rdtscp lm constant_tsc art arch_perfmon pebs bts rep_good 
nopl xtopology nonstop_tsc cpuid aperfmperf tsc_known_freq pni pclmulqdq 
dtes64 monitor ds_cpl vmx est tm2 ssse3 sdbg fma cx16 xtpr pdcm pcid 
sse4_1 sse4_2 x2apic movbe popcnt tsc_deadline_timer aes xsave avx f16c 
rdrand lahf_lm abm 3dnowprefetch cpuid_fault epb ssbd ibrs ibpb stibp 
ibrs_enhanced tpr_shadow flexpriority ept vpid ept_ad fsgsbase 
tsc_adjust bmi1 avx2 smep bmi2 erms invpcid rdseed adx smap clflushopt 
clwb intel_pt sha_ni xsaveopt xsavec xgetbv1 xsaves split_lock_detect 
user_shstk avx_vnni dtherm ida arat pln pts hwp hwp_notify 
hwp_act_window hwp_epp hwp_pkg_req hfi vnmi umip pku ospke waitpkg gfni 
vaes vpclmulqdq rdpid movdiri movdir64b fsrm md_clear serialize arch_lbr 
ibt flush_l1d arch_capabilities
vmx flags    : vnmi preemption_timer posted_intr invvpid ept_x_only 
ept_ad ept_1gb flexpriority apicv tsc_offset vtpr mtf vapic ept vpid 
unrestricted_guest vapic_reg vid ple shadow_vmcs ept_violation_ve 
ept_mode_based_exec tsc_scaling usr_wait_pause
bugs        : spectre_v1 spectre_v2 spec_store_bypass swapgs eibrs_pbrsb 
rfds bhi spectre_v2_user
bogomips    : 4608.00
clflush size    : 64
cache_alignment    : 64
address sizes    : 39 bits physical, 48 bits virtual
power management:

processor    : 16
vendor_id    : GenuineIntel
cpu family    : 6
model        : 191
model name    : 13th Gen Intel(R) Core(TM) i7-13700HX
stepping    : 2
microcode    : 0x3a
cpu MHz        : 1811.120
cache size    : 30720 KB
physical id    : 0
siblings    : 24
core id        : 32
cpu cores    : 16
apicid        : 64
initial apicid    : 64
fpu        : yes
fpu_exception    : yes
cpuid level    : 32
wp        : yes
flags        : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca 
cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall 
nx pdpe1gb rdtscp lm constant_tsc art arch_perfmon pebs bts rep_good 
nopl xtopology nonstop_tsc cpuid aperfmperf tsc_known_freq pni pclmulqdq 
dtes64 monitor ds_cpl vmx est tm2 ssse3 sdbg fma cx16 xtpr pdcm pcid 
sse4_1 sse4_2 x2apic movbe popcnt tsc_deadline_timer aes xsave avx f16c 
rdrand lahf_lm abm 3dnowprefetch cpuid_fault epb ssbd ibrs ibpb stibp 
ibrs_enhanced tpr_shadow flexpriority ept vpid ept_ad fsgsbase 
tsc_adjust bmi1 avx2 smep bmi2 erms invpcid rdseed adx smap clflushopt 
clwb intel_pt sha_ni xsaveopt xsavec xgetbv1 xsaves split_lock_detect 
user_shstk avx_vnni dtherm ida arat pln pts hwp hwp_notify 
hwp_act_window hwp_epp hwp_pkg_req hfi vnmi umip pku ospke waitpkg gfni 
vaes vpclmulqdq rdpid movdiri movdir64b fsrm md_clear serialize arch_lbr 
ibt flush_l1d arch_capabilities
vmx flags    : vnmi preemption_timer posted_intr invvpid ept_x_only 
ept_ad ept_1gb flexpriority apicv tsc_offset vtpr mtf vapic ept vpid 
unrestricted_guest vapic_reg vid ple shadow_vmcs ept_violation_ve 
ept_mode_based_exec tsc_scaling usr_wait_pause
bugs        : spectre_v1 spectre_v2 spec_store_bypass swapgs eibrs_pbrsb 
rfds bhi spectre_v2_user
bogomips    : 4608.00
clflush size    : 64
cache_alignment    : 64
address sizes    : 39 bits physical, 48 bits virtual
power management:

processor    : 17
vendor_id    : GenuineIntel
cpu family    : 6
model        : 191
model name    : 13th Gen Intel(R) Core(TM) i7-13700HX
stepping    : 2
microcode    : 0x3a
cpu MHz        : 2595.121
cache size    : 30720 KB
physical id    : 0
siblings    : 24
core id        : 33
cpu cores    : 16
apicid        : 66
initial apicid    : 66
fpu        : yes
fpu_exception    : yes
cpuid level    : 32
wp        : yes
flags        : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca 
cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall 
nx pdpe1gb rdtscp lm constant_tsc art arch_perfmon pebs bts rep_good 
nopl xtopology nonstop_tsc cpuid aperfmperf tsc_known_freq pni pclmulqdq 
dtes64 monitor ds_cpl vmx est tm2 ssse3 sdbg fma cx16 xtpr pdcm pcid 
sse4_1 sse4_2 x2apic movbe popcnt tsc_deadline_timer aes xsave avx f16c 
rdrand lahf_lm abm 3dnowprefetch cpuid_fault epb ssbd ibrs ibpb stibp 
ibrs_enhanced tpr_shadow flexpriority ept vpid ept_ad fsgsbase 
tsc_adjust bmi1 avx2 smep bmi2 erms invpcid rdseed adx smap clflushopt 
clwb intel_pt sha_ni xsaveopt xsavec xgetbv1 xsaves split_lock_detect 
user_shstk avx_vnni dtherm ida arat pln pts hwp hwp_notify 
hwp_act_window hwp_epp hwp_pkg_req hfi vnmi umip pku ospke waitpkg gfni 
vaes vpclmulqdq rdpid movdiri movdir64b fsrm md_clear serialize arch_lbr 
ibt flush_l1d arch_capabilities
vmx flags    : vnmi preemption_timer posted_intr invvpid ept_x_only 
ept_ad ept_1gb flexpriority apicv tsc_offset vtpr mtf vapic ept vpid 
unrestricted_guest vapic_reg vid ple shadow_vmcs ept_violation_ve 
ept_mode_based_exec tsc_scaling usr_wait_pause
bugs        : spectre_v1 spectre_v2 spec_store_bypass swapgs eibrs_pbrsb 
rfds bhi spectre_v2_user
bogomips    : 4608.00
clflush size    : 64
cache_alignment    : 64
address sizes    : 39 bits physical, 48 bits virtual
power management:

processor    : 18
vendor_id    : GenuineIntel
cpu family    : 6
model        : 191
model name    : 13th Gen Intel(R) Core(TM) i7-13700HX
stepping    : 2
microcode    : 0x3a
cpu MHz        : 1302.916
cache size    : 30720 KB
physical id    : 0
siblings    : 24
core id        : 34
cpu cores    : 16
apicid        : 68
initial apicid    : 68
fpu        : yes
fpu_exception    : yes
cpuid level    : 32
wp        : yes
flags        : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca 
cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall 
nx pdpe1gb rdtscp lm constant_tsc art arch_perfmon pebs bts rep_good 
nopl xtopology nonstop_tsc cpuid aperfmperf tsc_known_freq pni pclmulqdq 
dtes64 monitor ds_cpl vmx est tm2 ssse3 sdbg fma cx16 xtpr pdcm pcid 
sse4_1 sse4_2 x2apic movbe popcnt tsc_deadline_timer aes xsave avx f16c 
rdrand lahf_lm abm 3dnowprefetch cpuid_fault epb ssbd ibrs ibpb stibp 
ibrs_enhanced tpr_shadow flexpriority ept vpid ept_ad fsgsbase 
tsc_adjust bmi1 avx2 smep bmi2 erms invpcid rdseed adx smap clflushopt 
clwb intel_pt sha_ni xsaveopt xsavec xgetbv1 xsaves split_lock_detect 
user_shstk avx_vnni dtherm ida arat pln pts hwp hwp_notify 
hwp_act_window hwp_epp hwp_pkg_req hfi vnmi umip pku ospke waitpkg gfni 
vaes vpclmulqdq rdpid movdiri movdir64b fsrm md_clear serialize arch_lbr 
ibt flush_l1d arch_capabilities
vmx flags    : vnmi preemption_timer posted_intr invvpid ept_x_only 
ept_ad ept_1gb flexpriority apicv tsc_offset vtpr mtf vapic ept vpid 
unrestricted_guest vapic_reg vid ple shadow_vmcs ept_violation_ve 
ept_mode_based_exec tsc_scaling usr_wait_pause
bugs        : spectre_v1 spectre_v2 spec_store_bypass swapgs eibrs_pbrsb 
rfds bhi spectre_v2_user
bogomips    : 4608.00
clflush size    : 64
cache_alignment    : 64
address sizes    : 39 bits physical, 48 bits virtual
power management:

processor    : 19
vendor_id    : GenuineIntel
cpu family    : 6
model        : 191
model name    : 13th Gen Intel(R) Core(TM) i7-13700HX
stepping    : 2
microcode    : 0x3a
cpu MHz        : 932.255
cache size    : 30720 KB
physical id    : 0
siblings    : 24
core id        : 35
cpu cores    : 16
apicid        : 70
initial apicid    : 70
fpu        : yes
fpu_exception    : yes
cpuid level    : 32
wp        : yes
flags        : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca 
cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall 
nx pdpe1gb rdtscp lm constant_tsc art arch_perfmon pebs bts rep_good 
nopl xtopology nonstop_tsc cpuid aperfmperf tsc_known_freq pni pclmulqdq 
dtes64 monitor ds_cpl vmx est tm2 ssse3 sdbg fma cx16 xtpr pdcm pcid 
sse4_1 sse4_2 x2apic movbe popcnt tsc_deadline_timer aes xsave avx f16c 
rdrand lahf_lm abm 3dnowprefetch cpuid_fault epb ssbd ibrs ibpb stibp 
ibrs_enhanced tpr_shadow flexpriority ept vpid ept_ad fsgsbase 
tsc_adjust bmi1 avx2 smep bmi2 erms invpcid rdseed adx smap clflushopt 
clwb intel_pt sha_ni xsaveopt xsavec xgetbv1 xsaves split_lock_detect 
user_shstk avx_vnni dtherm ida arat pln pts hwp hwp_notify 
hwp_act_window hwp_epp hwp_pkg_req hfi vnmi umip pku ospke waitpkg gfni 
vaes vpclmulqdq rdpid movdiri movdir64b fsrm md_clear serialize arch_lbr 
ibt flush_l1d arch_capabilities
vmx flags    : vnmi preemption_timer posted_intr invvpid ept_x_only 
ept_ad ept_1gb flexpriority apicv tsc_offset vtpr mtf vapic ept vpid 
unrestricted_guest vapic_reg vid ple shadow_vmcs ept_violation_ve 
ept_mode_based_exec tsc_scaling usr_wait_pause
bugs        : spectre_v1 spectre_v2 spec_store_bypass swapgs eibrs_pbrsb 
rfds bhi spectre_v2_user
bogomips    : 4608.00
clflush size    : 64
cache_alignment    : 64
address sizes    : 39 bits physical, 48 bits virtual
power management:

processor    : 20
vendor_id    : GenuineIntel
cpu family    : 6
model        : 191
model name    : 13th Gen Intel(R) Core(TM) i7-13700HX
stepping    : 2
microcode    : 0x3a
cpu MHz        : 3697.485
cache size    : 30720 KB
physical id    : 0
siblings    : 24
core id        : 36
cpu cores    : 16
apicid        : 72
initial apicid    : 72
fpu        : yes
fpu_exception    : yes
cpuid level    : 32
wp        : yes
flags        : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca 
cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall 
nx pdpe1gb rdtscp lm constant_tsc art arch_perfmon pebs bts rep_good 
nopl xtopology nonstop_tsc cpuid aperfmperf tsc_known_freq pni pclmulqdq 
dtes64 monitor ds_cpl vmx est tm2 ssse3 sdbg fma cx16 xtpr pdcm pcid 
sse4_1 sse4_2 x2apic movbe popcnt tsc_deadline_timer aes xsave avx f16c 
rdrand lahf_lm abm 3dnowprefetch cpuid_fault epb ssbd ibrs ibpb stibp 
ibrs_enhanced tpr_shadow flexpriority ept vpid ept_ad fsgsbase 
tsc_adjust bmi1 avx2 smep bmi2 erms invpcid rdseed adx smap clflushopt 
clwb intel_pt sha_ni xsaveopt xsavec xgetbv1 xsaves split_lock_detect 
user_shstk avx_vnni dtherm ida arat pln pts hwp hwp_notify 
hwp_act_window hwp_epp hwp_pkg_req hfi vnmi umip pku ospke waitpkg gfni 
vaes vpclmulqdq rdpid movdiri movdir64b fsrm md_clear serialize arch_lbr 
ibt flush_l1d arch_capabilities
vmx flags    : vnmi preemption_timer posted_intr invvpid ept_x_only 
ept_ad ept_1gb flexpriority apicv tsc_offset vtpr mtf vapic ept vpid 
unrestricted_guest vapic_reg vid ple shadow_vmcs ept_violation_ve 
ept_mode_based_exec tsc_scaling usr_wait_pause
bugs        : spectre_v1 spectre_v2 spec_store_bypass swapgs eibrs_pbrsb 
rfds bhi spectre_v2_user
bogomips    : 4608.00
clflush size    : 64
cache_alignment    : 64
address sizes    : 39 bits physical, 48 bits virtual
power management:

processor    : 21
vendor_id    : GenuineIntel
cpu family    : 6
model        : 191
model name    : 13th Gen Intel(R) Core(TM) i7-13700HX
stepping    : 2
microcode    : 0x3a
cpu MHz        : 3696.620
cache size    : 30720 KB
physical id    : 0
siblings    : 24
core id        : 37
cpu cores    : 16
apicid        : 74
initial apicid    : 74
fpu        : yes
fpu_exception    : yes
cpuid level    : 32
wp        : yes
flags        : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca 
cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall 
nx pdpe1gb rdtscp lm constant_tsc art arch_perfmon pebs bts rep_good 
nopl xtopology nonstop_tsc cpuid aperfmperf tsc_known_freq pni pclmulqdq 
dtes64 monitor ds_cpl vmx est tm2 ssse3 sdbg fma cx16 xtpr pdcm pcid 
sse4_1 sse4_2 x2apic movbe popcnt tsc_deadline_timer aes xsave avx f16c 
rdrand lahf_lm abm 3dnowprefetch cpuid_fault epb ssbd ibrs ibpb stibp 
ibrs_enhanced tpr_shadow flexpriority ept vpid ept_ad fsgsbase 
tsc_adjust bmi1 avx2 smep bmi2 erms invpcid rdseed adx smap clflushopt 
clwb intel_pt sha_ni xsaveopt xsavec xgetbv1 xsaves split_lock_detect 
user_shstk avx_vnni dtherm ida arat pln pts hwp hwp_notify 
hwp_act_window hwp_epp hwp_pkg_req hfi vnmi umip pku ospke waitpkg gfni 
vaes vpclmulqdq rdpid movdiri movdir64b fsrm md_clear serialize arch_lbr 
ibt flush_l1d arch_capabilities
vmx flags    : vnmi preemption_timer posted_intr invvpid ept_x_only 
ept_ad ept_1gb flexpriority apicv tsc_offset vtpr mtf vapic ept vpid 
unrestricted_guest vapic_reg vid ple shadow_vmcs ept_violation_ve 
ept_mode_based_exec tsc_scaling usr_wait_pause
bugs        : spectre_v1 spectre_v2 spec_store_bypass swapgs eibrs_pbrsb 
rfds bhi spectre_v2_user
bogomips    : 4608.00
clflush size    : 64
cache_alignment    : 64
address sizes    : 39 bits physical, 48 bits virtual
power management:

processor    : 22
vendor_id    : GenuineIntel
cpu family    : 6
model        : 191
model name    : 13th Gen Intel(R) Core(TM) i7-13700HX
stepping    : 2
microcode    : 0x3a
cpu MHz        : 3702.924
cache size    : 30720 KB
physical id    : 0
siblings    : 24
core id        : 38
cpu cores    : 16
apicid        : 76
initial apicid    : 76
fpu        : yes
fpu_exception    : yes
cpuid level    : 32
wp        : yes
flags        : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca 
cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall 
nx pdpe1gb rdtscp lm constant_tsc art arch_perfmon pebs bts rep_good 
nopl xtopology nonstop_tsc cpuid aperfmperf tsc_known_freq pni pclmulqdq 
dtes64 monitor ds_cpl vmx est tm2 ssse3 sdbg fma cx16 xtpr pdcm pcid 
sse4_1 sse4_2 x2apic movbe popcnt tsc_deadline_timer aes xsave avx f16c 
rdrand lahf_lm abm 3dnowprefetch cpuid_fault epb ssbd ibrs ibpb stibp 
ibrs_enhanced tpr_shadow flexpriority ept vpid ept_ad fsgsbase 
tsc_adjust bmi1 avx2 smep bmi2 erms invpcid rdseed adx smap clflushopt 
clwb intel_pt sha_ni xsaveopt xsavec xgetbv1 xsaves split_lock_detect 
user_shstk avx_vnni dtherm ida arat pln pts hwp hwp_notify 
hwp_act_window hwp_epp hwp_pkg_req hfi vnmi umip pku ospke waitpkg gfni 
vaes vpclmulqdq rdpid movdiri movdir64b fsrm md_clear serialize arch_lbr 
ibt flush_l1d arch_capabilities
vmx flags    : vnmi preemption_timer posted_intr invvpid ept_x_only 
ept_ad ept_1gb flexpriority apicv tsc_offset vtpr mtf vapic ept vpid 
unrestricted_guest vapic_reg vid ple shadow_vmcs ept_violation_ve 
ept_mode_based_exec tsc_scaling usr_wait_pause
bugs        : spectre_v1 spectre_v2 spec_store_bypass swapgs eibrs_pbrsb 
rfds bhi spectre_v2_user
bogomips    : 4608.00
clflush size    : 64
cache_alignment    : 64
address sizes    : 39 bits physical, 48 bits virtual
power management:

processor    : 23
vendor_id    : GenuineIntel
cpu family    : 6
model        : 191
model name    : 13th Gen Intel(R) Core(TM) i7-13700HX
stepping    : 2
microcode    : 0x3a
cpu MHz        : 1172.465
cache size    : 30720 KB
physical id    : 0
siblings    : 24
core id        : 39
cpu cores    : 16
apicid        : 78
initial apicid    : 78
fpu        : yes
fpu_exception    : yes
cpuid level    : 32
wp        : yes
flags        : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca 
cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall 
nx pdpe1gb rdtscp lm constant_tsc art arch_perfmon pebs bts rep_good 
nopl xtopology nonstop_tsc cpuid aperfmperf tsc_known_freq pni pclmulqdq 
dtes64 monitor ds_cpl vmx est tm2 ssse3 sdbg fma cx16 xtpr pdcm pcid 
sse4_1 sse4_2 x2apic movbe popcnt tsc_deadline_timer aes xsave avx f16c 
rdrand lahf_lm abm 3dnowprefetch cpuid_fault epb ssbd ibrs ibpb stibp 
ibrs_enhanced tpr_shadow flexpriority ept vpid ept_ad fsgsbase 
tsc_adjust bmi1 avx2 smep bmi2 erms invpcid rdseed adx smap clflushopt 
clwb intel_pt sha_ni xsaveopt xsavec xgetbv1 xsaves split_lock_detect 
user_shstk avx_vnni dtherm ida arat pln pts hwp hwp_notify 
hwp_act_window hwp_epp hwp_pkg_req hfi vnmi umip pku ospke waitpkg gfni 
vaes vpclmulqdq rdpid movdiri movdir64b fsrm md_clear serialize arch_lbr 
ibt flush_l1d arch_capabilities
vmx flags    : vnmi preemption_timer posted_intr invvpid ept_x_only 
ept_ad ept_1gb flexpriority apicv tsc_offset vtpr mtf vapic ept vpid 
unrestricted_guest vapic_reg vid ple shadow_vmcs ept_violation_ve 
ept_mode_based_exec tsc_scaling usr_wait_pause
bugs        : spectre_v1 spectre_v2 spec_store_bypass swapgs eibrs_pbrsb 
rfds bhi spectre_v2_user
bogomips    : 4608.00
clflush size    : 64
cache_alignment    : 64
address sizes    : 39 bits physical, 48 bits virtual
power management:

[8.3.] Module information (from /proc/modules):
uinput 32768 1 - Live 0x0000000000000000
rfcomm 110592 18 - Live 0x0000000000000000
snd_seq_dummy 12288 0 - Live 0x0000000000000000
snd_hrtimer 12288 1 - Live 0x0000000000000000
vboxnetadp 32768 0 - Live 0x0000000000000000 (OE)
vboxnetflt 40960 0 - Live 0x0000000000000000 (OE)
vboxdrv 712704 2 vboxnetadp,vboxnetflt, Live 0x0000000000000000 (OE)
nft_masq 12288 3 - Live 0x0000000000000000
nft_reject_ipv4 12288 2 - Live 0x0000000000000000
act_csum 16384 1 - Live 0x0000000000000000
cls_u32 32768 1 - Live 0x0000000000000000
sch_htb 45056 1 - Live 0x0000000000000000
tun 77824 2 - Live 0x0000000000000000
nf_nat_tftp 12288 0 - Live 0x0000000000000000
nf_conntrack_tftp 20480 3 nf_nat_tftp, Live 0x0000000000000000
bridge 475136 0 - Live 0x0000000000000000
stp 12288 1 bridge, Live 0x0000000000000000
llc 16384 2 bridge,stp, Live 0x0000000000000000
nf_conntrack_netbios_ns 12288 1 - Live 0x0000000000000000
nf_conntrack_broadcast 12288 1 nf_conntrack_netbios_ns, Live 
0x0000000000000000
nft_fib_inet 12288 1 - Live 0x0000000000000000
nft_fib_ipv4 12288 1 nft_fib_inet, Live 0x0000000000000000
nft_fib_ipv6 12288 1 nft_fib_inet, Live 0x0000000000000000
nft_fib 12288 3 nft_fib_inet,nft_fib_ipv4,nft_fib_ipv6, Live 
0x0000000000000000
nft_reject_inet 12288 13 - Live 0x0000000000000000
nf_reject_ipv4 12288 2 nft_reject_ipv4,nft_reject_inet, Live 
0x0000000000000000
nf_reject_ipv6 20480 1 nft_reject_inet, Live 0x0000000000000000
nft_reject 12288 2 nft_reject_ipv4,nft_reject_inet, Live 0x0000000000000000
nft_ct 28672 11 - Live 0x0000000000000000
nft_chain_nat 12288 5 - Live 0x0000000000000000
nf_nat 65536 3 nft_masq,nf_nat_tftp,nft_chain_nat, Live 0x0000000000000000
nf_conntrack 212992 7 
nft_masq,nf_nat_tftp,nf_conntrack_tftp,nf_conntrack_netbios_ns,nf_conntrack_broadcast,nft_ct,nf_nat, 
Live 0x0000000000000000
nf_defrag_ipv6 24576 1 nf_conntrack, Live 0x0000000000000000
nf_defrag_ipv4 12288 1 nf_conntrack, Live 0x0000000000000000
snd_ctl_led 28672 0 - Live 0x0000000000000000
snd_soc_skl_hda_dsp 16384 5 - Live 0x0000000000000000
snd_soc_intel_sof_board_helpers 28672 1 snd_soc_skl_hda_dsp, Live 
0x0000000000000000
snd_sof_probes 32768 0 - Live 0x0000000000000000
snd_soc_intel_hda_dsp_common 16384 1 snd_soc_intel_sof_board_helpers, 
Live 0x0000000000000000
nf_tables 425984 573 
nft_masq,nft_reject_ipv4,nft_fib_inet,nft_fib_ipv4,nft_fib_ipv6,nft_fib,nft_reject_inet,nft_reject,nft_ct,nft_chain_nat, 
Live 0x0000000000000000
snd_hda_codec_realtek 233472 1 - Live 0x0000000000000000
snd_hda_codec_generic 139264 1 snd_hda_codec_realtek, Live 
0x0000000000000000
snd_hda_scodec_component 20480 1 snd_hda_codec_realtek, Live 
0x0000000000000000
snd_soc_dmic 12288 1 - Live 0x0000000000000000
snd_sof_pci_intel_tgl 16384 0 - Live 0x0000000000000000
snd_sof_pci_intel_cnl 20480 1 snd_sof_pci_intel_tgl, Live 0x0000000000000000
snd_sof_intel_hda_generic 45056 2 
snd_sof_pci_intel_tgl,snd_sof_pci_intel_cnl, Live 0x0000000000000000
soundwire_intel 98304 1 snd_sof_intel_hda_generic, Live 0x0000000000000000
snd_sof_intel_hda_sdw_bpt 24576 1 soundwire_intel, Live 0x0000000000000000
snd_sof_intel_hda_common 217088 4 
snd_sof_pci_intel_tgl,snd_sof_pci_intel_cnl,snd_sof_intel_hda_generic,snd_sof_intel_hda_sdw_bpt, 
Live 0x0000000000000000
snd_soc_hdac_hda 28672 1 snd_sof_intel_hda_common, Live 0x0000000000000000
snd_sof_intel_hda_mlink 49152 4 
snd_sof_intel_hda_generic,soundwire_intel,snd_sof_intel_hda_sdw_bpt,snd_sof_intel_hda_common, 
Live 0x0000000000000000
snd_sof_intel_hda 20480 2 
snd_sof_intel_hda_generic,snd_sof_intel_hda_common, Live 0x0000000000000000
soundwire_cadence 57344 1 soundwire_intel, Live 0x0000000000000000
snd_sof_pci 24576 3 
snd_sof_pci_intel_tgl,snd_sof_pci_intel_cnl,snd_sof_intel_hda_generic, 
Live 0x0000000000000000
qrtr 57344 2 - Live 0x0000000000000000
snd_sof_xtensa_dsp 16384 1 snd_sof_intel_hda_generic, Live 
0x0000000000000000
snd_sof 512000 7 
snd_sof_probes,snd_sof_pci_intel_cnl,snd_sof_intel_hda_generic,snd_sof_intel_hda_sdw_bpt,snd_sof_intel_hda_common,snd_sof_intel_hda,snd_sof_pci, 
Live 0x0000000000000000
snd_sof_utils 16384 1 snd_sof, Live 0x0000000000000000
snd_soc_acpi_intel_match 135168 4 
snd_soc_intel_sof_board_helpers,snd_sof_pci_intel_tgl,snd_sof_pci_intel_cnl,snd_sof_intel_hda_generic, 
Live 0x0000000000000000
snd_soc_acpi_intel_sdca_quirks 12288 1 snd_soc_acpi_intel_match, Live 
0x0000000000000000
soundwire_generic_allocation 24576 1 soundwire_intel, Live 
0x0000000000000000
snd_soc_acpi 16384 2 snd_sof_intel_hda_generic,snd_soc_acpi_intel_match, 
Live 0x0000000000000000
crc8 12288 1 soundwire_cadence, Live 0x0000000000000000
soundwire_bus 1212416 3 
soundwire_intel,soundwire_cadence,soundwire_generic_allocation, Live 
0x0000000000000000
snd_soc_sdca 57344 2 snd_soc_acpi_intel_sdca_quirks,soundwire_bus, Live 
0x0000000000000000
snd_soc_avs 270336 0 - Live 0x0000000000000000
snd_soc_hda_codec 28672 1 snd_soc_avs, Live 0x0000000000000000
snd_hda_ext_core 36864 7 
snd_sof_intel_hda_sdw_bpt,snd_sof_intel_hda_common,snd_soc_hdac_hda,snd_sof_intel_hda_mlink,snd_sof_intel_hda,snd_soc_avs,snd_soc_hda_codec, 
Live 0x0000000000000000
snd_soc_core 491520 10 
snd_soc_skl_hda_dsp,snd_soc_intel_sof_board_helpers,snd_sof_probes,snd_soc_dmic,soundwire_intel,snd_sof_intel_hda_common,snd_soc_hdac_hda,snd_sof,snd_soc_avs,snd_soc_hda_codec, 
Live 0x0000000000000000
snd_compress 28672 3 snd_sof_probes,snd_soc_avs,snd_soc_core, Live 
0x0000000000000000
snd_hda_codec_hdmi 102400 2 - Live 0x0000000000000000
ac97_bus 12288 1 snd_soc_core, Live 0x0000000000000000
snd_pcm_dmaengine 16384 1 snd_soc_core, Live 0x0000000000000000
bnep 36864 2 - Live 0x0000000000000000
binfmt_misc 28672 1 - Live 0x0000000000000000
vfat 24576 1 - Live 0x0000000000000000
fat 126976 1 vfat, Live 0x0000000000000000
iwlmvm 929792 0 - Live 0x0000000000000000
intel_uncore_frequency 12288 0 - Live 0x0000000000000000
intel_uncore_frequency_common 16384 1 intel_uncore_frequency, Live 
0x0000000000000000
intel_tcc_cooling 12288 0 - Live 0x0000000000000000
x86_pkg_temp_thermal 16384 0 - Live 0x0000000000000000
intel_powerclamp 28672 0 - Live 0x0000000000000000
coretemp 24576 0 - Live 0x0000000000000000
nvidia_drm 159744 5 - Live 0x0000000000000000 (OE)
nvidia_modeset 2162688 1 nvidia_drm, Live 0x0000000000000000 (OE)
mac80211 1925120 1 iwlmvm, Live 0x0000000000000000
kvm_intel 471040 0 - Live 0x0000000000000000
nvidia_uvm 4218880 0 - Live 0x0000000000000000 (OE)
snd_hda_intel 73728 2 - Live 0x0000000000000000
kvm 1486848 1 kvm_intel, Live 0x0000000000000000
libarc4 12288 1 mac80211, Live 0x0000000000000000
snd_intel_dspcfg 40960 5 
snd_sof_intel_hda_generic,snd_sof_intel_hda_common,snd_sof,snd_soc_avs,snd_hda_intel, 
Live 0x0000000000000000
snd_intel_sdw_acpi 16384 2 snd_sof_intel_hda_generic,snd_intel_dspcfg, 
Live 0x0000000000000000
snd_hda_codec 233472 10 
snd_soc_skl_hda_dsp,snd_soc_intel_hda_dsp_common,snd_hda_codec_realtek,snd_hda_codec_generic,snd_soc_hdac_hda,snd_sof_intel_hda,snd_soc_avs,snd_soc_hda_codec,snd_hda_codec_hdmi,snd_hda_intel, 
Live 0x0000000000000000
uvcvideo 200704 1 - Live 0x0000000000000000
snd_hda_core 159744 12 
snd_soc_intel_hda_dsp_common,snd_hda_codec_realtek,snd_hda_codec_generic,snd_sof_intel_hda_common,snd_soc_hdac_hda,snd_sof_intel_hda,snd_soc_avs,snd_soc_hda_codec,snd_hda_ext_core,snd_hda_codec_hdmi,snd_hda_intel,snd_hda_codec, 
Live 0x0000000000000000
btusb 81920 0 - Live 0x0000000000000000
uvc 12288 1 uvcvideo, Live 0x0000000000000000
btrtl 36864 1 btusb, Live 0x0000000000000000
videobuf2_vmalloc 20480 1 uvcvideo, Live 0x0000000000000000
snd_hwdep 24576 1 snd_hda_codec, Live 0x0000000000000000
videobuf2_memops 16384 1 videobuf2_vmalloc, Live 0x0000000000000000
videobuf2_v4l2 40960 1 uvcvideo, Live 0x0000000000000000
btintel 73728 1 btusb, Live 0x0000000000000000
snd_seq 135168 7 snd_seq_dummy, Live 0x0000000000000000
videobuf2_common 102400 4 
uvcvideo,videobuf2_vmalloc,videobuf2_memops,videobuf2_v4l2, Live 
0x0000000000000000
btbcm 24576 1 btusb, Live 0x0000000000000000
irqbypass 12288 1 kvm, Live 0x0000000000000000
iwlwifi 598016 1 iwlmvm, Live 0x0000000000000000
btmtk 32768 1 btusb, Live 0x0000000000000000
snd_seq_device 16384 1 snd_seq, Live 0x0000000000000000
rapl 20480 0 - Live 0x0000000000000000
processor_thermal_device_pci 16384 0 - Live 0x0000000000000000
videodev 421888 2 uvcvideo,videobuf2_v4l2, Live 0x0000000000000000
bluetooth 1089536 44 rfcomm,bnep,btusb,btrtl,btintel,btbcm,btmtk, Live 
0x0000000000000000
intel_cstate 20480 0 - Live 0x0000000000000000
nvidia 12951552 26 nvidia_modeset,nvidia_uvm, Live 0x0000000000000000 (OE)
spi_nor 184320 0 - Live 0x0000000000000000
iTCO_wdt 16384 0 - Live 0x0000000000000000
processor_thermal_device 20480 1 processor_thermal_device_pci, Live 
0x0000000000000000
snd_pcm 212992 13 
snd_sof_intel_hda_generic,soundwire_intel,snd_sof_intel_hda_common,snd_sof,snd_sof_utils,snd_soc_avs,snd_soc_core,snd_compress,snd_hda_codec_hdmi,snd_pcm_dmaengine,snd_hda_intel,snd_hda_codec,snd_hda_core, 
Live 0x0000000000000000
intel_pmc_bxt 16384 1 iTCO_wdt, Live 0x0000000000000000
processor_thermal_wt_hint 16384 2 
processor_thermal_device_pci,processor_thermal_device, Live 
0x0000000000000000
cfg80211 1503232 3 iwlmvm,mac80211,iwlwifi, Live 0x0000000000000000
thunderbolt 598016 0 - Live 0x0000000000000000
mtd 110592 2 spi_nor, Live 0x0000000000000000
spd5118 16384 0 - Live 0x0000000000000000
mei_hdcp 28672 0 - Live 0x0000000000000000
mei_pxp 20480 0 - Live 0x0000000000000000
mc 94208 5 uvcvideo,videobuf2_v4l2,videobuf2_common,videodev, Live 
0x0000000000000000
iTCO_vendor_support 12288 1 iTCO_wdt, Live 0x0000000000000000
intel_rapl_msr 20480 0 - Live 0x0000000000000000
intel_uncore 278528 0 - Live 0x0000000000000000
processor_thermal_rfim 49152 1 processor_thermal_device, Live 
0x0000000000000000
snd_timer 57344 3 snd_hrtimer,snd_seq,snd_pcm, Live 0x0000000000000000
processor_thermal_rapl 16384 1 processor_thermal_device, Live 
0x0000000000000000
nvidia_wmi_ec_backlight 12288 0 - Live 0x0000000000000000
snd 163840 30 
snd_ctl_led,snd_hda_codec_realtek,snd_hda_codec_generic,snd_sof,snd_soc_core,snd_compress,snd_hda_codec_hdmi,snd_hda_intel,snd_hda_codec,snd_hwdep,snd_seq,snd_seq_device,snd_pcm,snd_timer, 
Live 0x0000000000000000
wmi_bmof 12288 0 - Live 0x0000000000000000
intel_rapl_common 61440 2 intel_rapl_msr,processor_thermal_rapl, Live 
0x0000000000000000
spi_intel_pci 12288 0 - Live 0x0000000000000000
intel_pmc_core 147456 0 - Live 0x0000000000000000
i2c_i801 40960 0 - Live 0x0000000000000000
pcspkr 12288 0 - Live 0x0000000000000000
spi_intel 36864 1 spi_intel_pci, Live 0x0000000000000000
processor_thermal_wt_req 12288 1 processor_thermal_device, Live 
0x0000000000000000
soundcore 16384 2 snd_ctl_led,snd, Live 0x0000000000000000
i2c_smbus 20480 1 i2c_i801, Live 0x0000000000000000
int3403_thermal 16384 0 - Live 0x0000000000000000
int3400_thermal 24576 0 - Live 0x0000000000000000
pmt_telemetry 16384 1 intel_pmc_core, Live 0x0000000000000000
processor_thermal_power_floor 12288 2 
processor_thermal_device_pci,processor_thermal_device, Live 
0x0000000000000000
idma64 20480 0 - Live 0x0000000000000000
processor_thermal_mbox 12288 4 
processor_thermal_wt_hint,processor_thermal_rfim,processor_thermal_wt_req,processor_thermal_power_floor, 
Live 0x0000000000000000
int340x_thermal_zone 16384 2 processor_thermal_device,int3403_thermal, 
Live 0x0000000000000000
acer_wireless 16384 0 - Live 0x0000000000000000
acpi_thermal_rel 28672 1 int3400_thermal, Live 0x0000000000000000
acpi_pad 184320 0 - Live 0x0000000000000000
pmt_class 16384 1 pmt_telemetry, Live 0x0000000000000000
joydev 36864 0 - Live 0x0000000000000000
mei_me 61440 2 - Live 0x0000000000000000
mei 204800 5 mei_hdcp,mei_pxp,mei_me, Live 0x0000000000000000
loop 45056 0 - Live 0x0000000000000000
zram 65536 1 - Live 0x0000000000000000
lz4hc_compress 20480 1 zram, Live 0x0000000000000000
lz4_compress 24576 1 zram, Live 0x0000000000000000
xe 4083712 0 - Live 0x0000000000000000
intel_vsec 20480 2 intel_pmc_core,xe, Live 0x0000000000000000
drm_ttm_helper 16384 2 nvidia_drm,xe, Live 0x0000000000000000
drm_suballoc_helper 20480 1 xe, Live 0x0000000000000000
gpu_sched 65536 1 xe, Live 0x0000000000000000
drm_gpuvm 45056 1 xe, Live 0x0000000000000000
drm_exec 12288 2 xe,drm_gpuvm, Live 0x0000000000000000
drm_gpusvm 36864 1 xe, Live 0x0000000000000000
i915 5279744 98 - Live 0x0000000000000000
i2c_algo_bit 20480 2 xe,i915, Live 0x0000000000000000
hid_logitech_hidpp 81920 0 - Live 0x0000000000000000
drm_buddy 32768 2 xe,i915, Live 0x0000000000000000
ttm 135168 3 xe,drm_ttm_helper,i915, Live 0x0000000000000000
nvme 73728 3 - Live 0x0000000000000000
rtsx_pci_sdmmc 40960 0 - Live 0x0000000000000000
drm_display_helper 315392 2 xe,i915, Live 0x0000000000000000
nvme_core 270336 4 nvme, Live 0x0000000000000000
mmc_core 303104 1 rtsx_pci_sdmmc, Live 0x0000000000000000
polyval_clmulni 12288 0 - Live 0x0000000000000000
polyval_generic 12288 1 polyval_clmulni, Live 0x0000000000000000
r8169 135168 0 - Live 0x0000000000000000
ghash_clmulni_intel 16384 0 - Live 0x0000000000000000
sha512_ssse3 53248 0 - Live 0x0000000000000000
spi_pxa2xx_platform 12288 0 - Live 0x0000000000000000
sha256_ssse3 36864 0 - Live 0x0000000000000000
dw_dmac 12288 0 - Live 0x0000000000000000
ucsi_acpi 12288 0 - Live 0x0000000000000000
nvme_keyring 20480 1 nvme_core, Live 0x0000000000000000
hid_multitouch 36864 0 - Live 0x0000000000000000
nvme_auth 32768 1 nvme_core, Live 0x0000000000000000
typec_ucsi 77824 1 ucsi_acpi, Live 0x0000000000000000
rtsx_pci 147456 1 rtsx_pci_sdmmc, Live 0x0000000000000000
sha1_ssse3 32768 0 - Live 0x0000000000000000
realtek 53248 1 - Live 0x0000000000000000
spi_pxa2xx_core 36864 1 spi_pxa2xx_platform, Live 0x0000000000000000
cec 102400 3 xe,i915,drm_display_helper, Live 0x0000000000000000
typec 118784 1 typec_ucsi, Live 0x0000000000000000
vmd 28672 0 - Live 0x0000000000000000
i2c_hid_acpi 12288 0 - Live 0x0000000000000000
i2c_hid 49152 1 i2c_hid_acpi, Live 0x0000000000000000
pinctrl_alderlake 32768 1 - Live 0x0000000000000000
serio_raw 20480 0 - Live 0x0000000000000000
hid_logitech_dj 45056 0 - Live 0x0000000000000000
sunrpc 925696 1 - Live 0x0000000000000000
iscsi_tcp 28672 0 - Live 0x0000000000000000
libiscsi_tcp 40960 1 iscsi_tcp, Live 0x0000000000000000
libiscsi 94208 2 iscsi_tcp,libiscsi_tcp, Live 0x0000000000000000
scsi_transport_iscsi 192512 3 iscsi_tcp,libiscsi_tcp,libiscsi, Live 
0x0000000000000000
pkcs8_key_parser 12288 0 - Live 0x0000000000000000
fuse 286720 7 - Live 0x0000000000000000
i2c_dev 28672 0 - Live 0x0000000000000000
acer_wmi 45056 0 - Live 0x0000000000000000
sparse_keymap 12288 1 acer_wmi, Live 0x0000000000000000
platform_profile 16384 1 acer_wmi, Live 0x0000000000000000
rfkill 45056 10 iwlmvm,bluetooth,cfg80211,acer_wmi, Live 0x0000000000000000
video 81920 5 nvidia_modeset,nvidia_wmi_ec_backlight,xe,i915,acer_wmi, 
Live 0x0000000000000000
wmi 32768 4 nvidia_wmi_ec_backlight,wmi_bmof,acer_wmi,video, Live 
0x0000000000000000
nfnetlink 20480 3 nf_tables, Live 0x0000000000000000

[8.4.] Loaded driver and hardware information (/proc/ioports, /proc/iomem)
0000-0000 : PCI Bus 0000:00
   0000-0000 : dma1
   0000-0000 : pic1
   0000-0000 : timer0
   0000-0000 : timer1
   0000-0000 : keyboard
   0000-0000 : PNP0C09:00
     0000-0000 : EC data
   0000-0000 : keyboard
   0000-0000 : PNP0C09:00
     0000-0000 : EC cmd
   0000-0000 : PNP0C09:00
   0000-0000 : PNP0C09:00
   0000-0000 : PNP0C09:00
   0000-0000 : PNP0C09:00
   0000-0000 : rtc0
   0000-0000 : dma page reg
   0000-0000 : pic2
   0000-0000 : dma2
   0000-0000 : fpu
   0000-0000 : iTCO_wdt
     0000-0000 : iTCO_wdt
   0000-0000 : pnp 00:00
0000-0000 : PCI conf1
0000-0000 : PCI Bus 0000:00
   0000-0000 : pnp 00:00
   0000-0000 : ACPI PM1a_EVT_BLK
   0000-0000 : ACPI PM1a_CNT_BLK
   0000-0000 : ACPI PM_TMR
   0000-0000 : ACPI PM2_CNT_BLK
   0000-0000 : pnp 00:02
   0000-0000 : ACPI GPE0_BLK
   0000-0000 : pnp 00:05
   0000-0000 : PCI Bus 0000:6d
     0000-0000 : 0000:6d:00.0
   0000-0000 : PCI Bus 0000:01
     0000-0000 : 0000:01:00.0
   0000-0000 : 0000:00:02.0
   0000-0000 : PCI Bus 0000:02
     0000-0000 : PCI Bus 0000:03
       0000-0000 : PCI Bus 0000:05
       0000-0000 : PCI Bus 0000:39
   0000-0000 : 0000:00:1f.4

00000000-00000000 : Reserved
00000000-00000000 : System RAM
00000000-00000000 : Reserved
   00000000-00000000 : PCI Bus 0000:00
   00000000-00000000 : System ROM
00000000-00000000 : System RAM
00000000-00000000 : Reserved
00000000-00000000 : System RAM
00000000-00000000 : Reserved
00000000-00000000 : System RAM
00000000-00000000 : Reserved
00000000-00000000 : System RAM
00000000-00000000 : Reserved
00000000-00000000 : ACPI Non-volatile Storage
   00000000-00000000 : USBC000:00
00000000-00000000 : ACPI Tables
00000000-00000000 : System RAM
00000000-00000000 : Reserved
00000000-00000000 : Reserved
00000000-00000000 : Reserved
   00000000-00000000 : Graphics Stolen Memory
00000000-00000000 : PCI Bus 0000:00
   00000000-00000000 : 0000:00:1f.5
     00000000-00000000 : 0000:00:1f.5 0000:00:1f.5
   00000000-00000000 : PCI Bus 0000:02
     00000000-00000000 : PCI Bus 0000:03
       00000000-00000000 : PCI Bus 0000:39
       00000000-00000000 : PCI Bus 0000:38
         00000000-00000000 : 0000:38:00.0
           00000000-00000000 : xhci-hcd
       00000000-00000000 : PCI Bus 0000:05
   00000000-00000000 : PCI Bus 0000:6d
     00000000-00000000 : 0000:6d:00.0
     00000000-00000000 : 0000:6d:00.0
       00000000-00000000 : r8169
   00000000-00000000 : PCI Bus 0000:6c
     00000000-00000000 : 0000:6c:00.0
       00000000-00000000 : rtsx_pci
   00000000-00000000 : 0000:00:14.0
     00000000-00000000 : xhci-hcd
   00000000-00000000 : 0000:00:0e.0
     00000000-00000000 : VMD MEMBAR1
       00000000-00000000 : PCI Bus 10000:e1
         00000000-00000000 : 10000:e1:00.0
           00000000-00000000 : nvme
       00000000-00000000 : PCI Bus 10000:e2
         00000000-00000000 : 10000:e2:00.0
           00000000-00000000 : nvme
   00000000-00000000 : PCI Bus 0000:01
     00000000-00000000 : 0000:01:00.0
       00000000-00000000 : nvidia
     00000000-00000000 : 0000:01:00.1
       00000000-00000000 : ICH HD audio
     00000000-00000000 : 0000:01:00.0
00000000-00000000 : PCI ECAM 0000 [bus 00-e0]
00000000-00000000 : INTC1085:00
   00000000-00000000 : INTC1085:00 INTC1085:00
00000000-00000000 : INTC1085:00
   00000000-00000000 : INTC1085:00 INTC1085:00
00000000-00000000 : INTC1085:00
   00000000-00000000 : INTC1085:00 INTC1085:00
00000000-00000000 : INTC1085:00
   00000000-00000000 : INTC1085:00 INTC1085:00
00000000-00000000 : INTC1085:00
   00000000-00000000 : INTC1085:00 INTC1085:00
00000000-00000000 : IOAPIC 0
00000000-00000000 : HPET 0
   00000000-00000000 : PNP0103:00
00000000-00000000 : Reserved
   00000000-00000000 : INTC6001:00
     00000000-00000000 : INTC6001:00
00000000-00000000 : dmar0
00000000-00000000 : dmar1
00000000-00000000 : pnp 00:04
00000000-00000000 : pnp 00:04
00000000-00000000 : pnp 00:04
00000000-00000000 : pnp 00:04
00000000-00000000 : System RAM
   00000000-00000000 : Kernel code
   00000000-00000000 : Kernel rodata
   00000000-00000000 : Kernel data
   00000000-00000000 : Kernel bss
00000000-00000000 : RAM buffer
00000000-00000000 : PCI Bus 0000:00
   00000000-00000000 : 0000:00:02.0
   00000000-00000000 : 0000:00:02.0
   00000000-00000000 : 0000:00:15.0
     00000000-00000000 : lpss_dev
       00000000-00000000 : i2c_designware.0 lpss_dev
     00000000-00000000 : lpss_priv
     00000000-00000000 : idma64.0
       00000000-00000000 : idma64.0 idma64.0
   00000000-00000000 : 0000:00:15.3
     00000000-00000000 : lpss_dev
       00000000-00000000 : i2c_designware.1 lpss_dev
     00000000-00000000 : lpss_priv
     00000000-00000000 : idma64.1
       00000000-00000000 : idma64.1 idma64.1
   00000000-00000000 : 0000:00:1e.0
     00000000-00000000 : lpss_dev
       00000000-00000000 : serial
     00000000-00000000 : lpss_priv
     00000000-00000000 : idma64.2
       00000000-00000000 : idma64.2 idma64.2
   00000000-00000000 : 0000:00:1e.3
     00000000-00000000 : lpss_dev
       00000000-00000000 : pxa2xx-spi.3 lpss_dev
     00000000-00000000 : lpss_priv
     00000000-00000000 : idma64.3
       00000000-00000000 : idma64.3 idma64.3
   00000000-00000000 : 0000:00:02.0
   00000000-00000000 : PCI Bus 0000:01
     00000000-00000000 : 0000:01:00.0
     00000000-00000000 : 0000:01:00.0
   00000000-00000000 : 0000:00:0e.0
   00000000-00000000 : 0000:00:02.0
   00000000-00000000 : 0000:00:1f.3
     00000000-00000000 : Audio DSP
   00000000-00000000 : 0000:00:0e.0
     00000000-00000000 : VMD MEMBAR2
   00000000-00000000 : 0000:00:04.0
     00000000-00000000 : proc_thermal
   00000000-00000000 : 0000:00:1f.3
     00000000-00000000 : Audio DSP
   00000000-00000000 : 0000:00:14.3
     00000000-00000000 : iwlwifi
   00000000-00000000 : 0000:00:14.2
   00000000-00000000 : 0000:00:1f.4
     00000000-00000000 : i801_smbus
   00000000-00000000 : 0000:00:16.0
     00000000-00000000 : mei_me
   00000000-00000000 : 0000:00:14.2
   00000000-00000000 : 0000:00:08.0
   00000000-00000000 : PCI Bus 0000:02
     00000000-00000000 : PCI Bus 0000:03
       00000000-00000000 : PCI Bus 0000:39
       00000000-00000000 : PCI Bus 0000:05
       00000000-00000000 : PCI Bus 0000:04
         00000000-00000000 : 0000:04:00.0
           00000000-00000000 : thunderbolt
         00000000-00000000 : 0000:04:00.0

[8.5.] PCI information ('lspci -vvv' as root)
0000:00:00.0 Host bridge: Intel Corporation Device 4637 (rev 02)
         Subsystem: Acer Incorporated [ALI] Device 170f
         Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- 
ParErr- Stepping- SERR+ FastB2B- DisINTx-
         Status: Cap+ 66MHz- UDF- FastB2B+ ParErr- DEVSEL=fast >TAbort- 
<TAbort- <MAbort- >SERR- <PERR- INTx-
         Latency: 0
         IOMMU group: 1

0000:00:01.0 PCI bridge: Intel Corporation 12th Gen Core Processor PCI 
Express x16 Controller #1 (rev 02) (prog-if 00 [Normal decode])
         Subsystem: Acer Incorporated [ALI] Device 170f
         Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- 
ParErr- Stepping- SERR+ FastB2B- DisINTx+
         Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- 
<TAbort- <MAbort- >SERR- <PERR- INTx-
         Latency: 0, Cache Line Size: 64 bytes
         Interrupt: pin A routed to IRQ 122
         IOMMU group: 2
         Bus: primary=00, secondary=01, subordinate=01, sec-latency=0
         I/O behind bridge: 4000-4fff [size=4K] [16-bit]
         Memory behind bridge: 86000000-870fffff [size=17M] [32-bit]
         Prefetchable memory behind bridge: 6000000000-6201ffffff 
[size=8224M] [32-bit]
         Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=fast >TAbort- 
<TAbort- <MAbort- <SERR- <PERR-
         BridgeCtl: Parity- SERR+ NoISA- VGA- VGA16- MAbort- >Reset- 
FastB2B-
                 PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-
         Capabilities: [40] Express (v2) Root Port (Slot+), IntMsgNum 0
                 DevCap: MaxPayload 256 bytes, PhantFunc 0
                         ExtTag- RBE+ TEE-IO-
                 DevCtl: CorrErr+ NonFatalErr+ FatalErr+ UnsupReq+
                         RlxdOrd- ExtTag- PhantFunc- AuxPwr- NoSnoop-
                         MaxPayload 256 bytes, MaxReadReq 128 bytes
                 DevSta: CorrErr- NonFatalErr- FatalErr- UnsupReq- 
AuxPwr+ TransPend-
                 LnkCap: Port #2, Speed 32GT/s, Width x8, ASPM not supported
                         ClockPM- Surprise- LLActRep+ BwNot+ ASPMOptComp+
                 LnkCtl: ASPM Disabled; RCB 64 bytes, LnkDisable- CommClk+
                         ExtSynch- ClockPM- AutWidDis- BWInt+ AutBWInt+ 
FltModeDis-
                 LnkSta: Speed 16GT/s, Width x8
                         TrErr- Train- SlotClk+ DLActive+ BWMgmt- ABWMgmt-
                 SltCap: AttnBtn- PwrCtrl- MRL- AttnInd- PwrInd- 
HotPlug- Surprise-
                         Slot #1, PowerLimit 75W; Interlock- NoCompl+
                 SltCtl: Enable: AttnBtn- PwrFlt- MRL- PresDet- CmdCplt- 
HPIrq- LinkChg-
                         Control: AttnInd Unknown, PwrInd Unknown, 
Power- Interlock-
                 SltSta: Status: AttnBtn- PowerFlt- MRL- CmdCplt- 
PresDet+ Interlock-
                         Changed: MRL- PresDet+ LinkState+
                 RootCap: CRSVisible-
                 RootCtl: ErrCorrectable- ErrNon-Fatal- ErrFatal- 
PMEIntEna+ CRSVisible-
                 RootSta: PME ReqID 0000, PMEStatus- PMEPending-
                 DevCap2: Completion Timeout: Range ABC, TimeoutDis+ 
NROPrPrP- LTR+
                          10BitTagComp+ 10BitTagReq+ OBFF Via WAKE#, 
ExtFmt+ EETLPPrefix+, MaxEETLPPrefixes 2
                          EmergencyPowerReduction Not Supported, 
EmergencyPowerReductionInit-
                          FRS- LN System CLS Not Supported, TPHComp- 
ExtTPHComp- ARIFwd+
                          AtomicOpsCap: Routing+ 32bit+ 64bit+ 128bitCAS+
                 DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis- 
ARIFwd-
                          AtomicOpsCtl: ReqEn+ EgressBlck-
                          IDOReq- IDOCompl- LTR+ EmergencyPowerReductionReq-
                          10BitTagReq- OBFF Disabled, EETLPPrefixBlk-
                 LnkCap2: Supported Link Speeds: 2.5-32GT/s, Crosslink- 
Retimer+ 2Retimers+ DRS-
                 LnkCtl2: Target Link Speed: 16GT/s, EnterCompliance- 
SpeedDis-
                          Transmit Margin: Normal Operating Range, 
EnterModifiedCompliance- ComplianceSOS-
                          Compliance Preset/De-emphasis: -6dB 
de-emphasis, 0dB preshoot
                 LnkSta2: Current De-emphasis Level: -3.5dB, 
EqualizationComplete+ EqualizationPhase1+
                          EqualizationPhase2+ EqualizationPhase3+ 
LinkEqualizationRequest-
                          Retimer- 2Retimers- CrosslinkRes: unsupported, 
FltMode-
         Capabilities: [80] MSI: Enable+ Count=1/1 Maskable- 64bit+
                 Address: 00000000fee00238  Data: 0000
         Capabilities: [98] Subsystem: Acer Incorporated [ALI] Device 170f
         Capabilities: [a0] Power Management version 3
                 Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA 
PME(D0+,D1-,D2-,D3hot+,D3cold+)
                 Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-
         Capabilities: [100 v0] Null
         Capabilities: [220 v1] Access Control Services
                 ACSCap: SrcValid+ TransBlk+ ReqRedir+ CmpltRedir+ 
UpstreamFwd+ EgressCtrl- DirectTrans-
                 ACSCtl: SrcValid+ TransBlk- ReqRedir+ CmpltRedir+ 
UpstreamFwd+ EgressCtrl- DirectTrans-
         Capabilities: [150 v1] Precision Time Measurement
                 PTMCap: Requester- Responder+ Root+
                 PTMClockGranularity: 4ns
                 PTMControl: Enabled+ RootSelected+
                 PTMEffectiveGranularity: Unknown
         Capabilities: [a30 v1] Secondary PCI Express
                 LnkCtl3: LnkEquIntrruptEn- PerformEqu-
                 LaneErrStat: 0
         Capabilities: [a90 v1] Data Link Feature <?>
         Capabilities: [a9c v1] Physical Layer 16.0 GT/s
                 Phy16Sta: EquComplete+ EquPhase1+ EquPhase2+ EquPhase3+ 
LinkEquRequest-
         Capabilities: [edc v1] Lane Margining at the Receiver
                 PortCap: Uses Driver-
                 PortSta: MargReady+ MargSoftReady-
         Capabilities: [adc v1] Physical Layer 32.0 GT/s
                 Phy32Cap: EqualizationBypass- NoEqualizationNeeded-
                           ModTsMode0+ ModTsMode1- ModTsMode2-
                 Phy32Ctl: EqualizationBypassDis- NoEqualizationNeededDis+
                           Modified TS Usage Mode: PCI Express
                 Phy32Sta: EquComplete- EquPhase1- EquPhase2- EquPhase3- 
LinkEquRequest-
                           Received Enhanced Link Behavior Control: Full 
Equalization required
                           ModTsRecv- TxPrecodeOn- TxPrecodeReq- 
NoEqualizationNeededRecv-
         Kernel driver in use: pcieport

0000:00:02.0 VGA compatible controller: Intel Corporation Alder Lake-HX 
GT1 [UHD Graphics 770] (rev 0c) (prog-if 00 [VGA controller])
         Subsystem: Acer Incorporated [ALI] Device 170f
         Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- 
ParErr- Stepping- SERR- FastB2B- DisINTx+
         Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- 
<TAbort- <MAbort- >SERR- <PERR- INTx-
         Latency: 0, Cache Line Size: 64 bytes
         Interrupt: pin A routed to IRQ 196
         IOMMU group: 0
         Region 0: Memory at 6204000000 (64-bit, non-prefetchable) 
[size=16M]
         Region 2: Memory at 4000000000 (64-bit, prefetchable) [size=256M]
         Region 4: I/O ports at 5000 [size=64]
         Expansion ROM at 000c0000 [virtual] [disabled] [size=128K]
         Capabilities: [40] Vendor Specific Information: Intel 
Capabilities v1
                 CapA: Peg60Dis- Peg12Dis- Peg11Dis- Peg10Dis- PeLWUDis- 
DmiWidth=x4
                       EccDis- ForceEccEn- VTdDis- DmiG2Dis- PegG2Dis- 
DDRMaxSize=Unlimited
                       1NDis- CDDis- DDPCDis- X2APICEn- PDCDis- IGDis- 
CDID=0 CRID=0
                       DDROCCAP+ OCEn+ DDRWrtVrefEn- DDR3LEn-
                 CapB: ImguDis- OCbySSKUCap- OCbySSKUEn- SMTCap- 
CacheSzCap 0x0
                       SoftBinCap- DDR3MaxFreqWithRef100=Disabled PegG3Dis-
                       PkgTyp- AddGfxEn- AddGfxCap- PegX16Dis- DmiG3Dis- 
GmmDis-
                       DDR3MaxFreq=2932MHz LPDDR3En-
         Capabilities: [70] Express (v2) Root Complex Integrated 
Endpoint, IntMsgNum 0
                 DevCap: MaxPayload 128 bytes, PhantFunc 0
                         ExtTag- RBE+ FLReset+ TEE-IO-
                 DevCtl: CorrErr- NonFatalErr- FatalErr- UnsupReq-
                         RlxdOrd- ExtTag- PhantFunc- AuxPwr- NoSnoop- 
FLReset-
                         MaxPayload 128 bytes, MaxReadReq 128 bytes
                 DevSta: CorrErr- NonFatalErr- FatalErr- UnsupReq- 
AuxPwr- TransPend-
                 DevCap2: Completion Timeout: Not Supported, TimeoutDis- 
NROPrPrP- LTR-
                          10BitTagComp- 10BitTagReq- OBFF Not Supported, 
ExtFmt- EETLPPrefix-
                          EmergencyPowerReduction Not Supported, 
EmergencyPowerReductionInit-
                          FRS-
                          AtomicOpsCap: 32bit- 64bit- 128bitCAS-
                 DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-
                          AtomicOpsCtl: ReqEn-
                          IDOReq- IDOCompl- LTR- EmergencyPowerReductionReq-
                          10BitTagReq- OBFF Disabled, EETLPPrefixBlk-
         Capabilities: [ac] MSI: Enable+ Count=1/1 Maskable+ 64bit-
                 Address: fee00018  Data: 0000
                 Masking: 00000000  Pending: 00000000
         Capabilities: [d0] Power Management version 2
                 Flags: PMEClk- DSI+ D1- D2- AuxCurrent=0mA 
PME(D0-,D1-,D2-,D3hot-,D3cold-)
                 Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-
         Capabilities: [100 v1] Process Address Space ID (PASID)
                 PASIDCap: Exec- Priv-, Max PASID Width: 14
                 PASIDCtl: Enable- Exec- Priv-
         Capabilities: [200 v1] Address Translation Service (ATS)
                 ATSCap: Invalidate Queue Depth: 00
                 ATSCtl: Enable-, Smallest Translation Unit: 00
         Capabilities: [300 v1] Page Request Interface (PRI)
                 PRICtl: Enable- Reset-
                 PRISta: RF- UPRGI- Stopped+ PASID+
                 Page Request Capacity: 00008000, Page Request 
Allocation: 00000000
         Capabilities: [320 v1] Single Root I/O Virtualization (SR-IOV)
                 IOVCap: Migration- 10BitTagReq- IntMsgNum 0
                 IOVCtl: Enable- Migration- Interrupt- MSE- 
ARIHierarchy- 10BitTagReq-
                 IOVSta: Migration-
                 Initial VFs: 7, Total VFs: 7, Number of VFs: 0, 
Function Dependency Link: 00
                 VF offset: 1, stride: 1, Device ID: 4688
                 Supported Page Size: 00000553, System Page Size: 00000001
                 Region 0: Memory at 0000004010000000 (64-bit, 
non-prefetchable)
                 Region 2: Memory at 0000004020000000 (64-bit, prefetchable)
                 VF Migration: offset: 00000000, BIR: 0
         Kernel driver in use: i915
         Kernel modules: i915, xe

0000:00:04.0 Signal processing controller: Intel Corporation Alder Lake 
Innovation Platform Framework Processor Participant (rev 02)
         Subsystem: Acer Incorporated [ALI] Device 170f
         Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- 
ParErr- Stepping- SERR- FastB2B- DisINTx-
         Status: Cap+ 66MHz- UDF- FastB2B+ ParErr- DEVSEL=fast >TAbort- 
<TAbort- <MAbort- >SERR- <PERR- INTx-
         Latency: 0
         Interrupt: pin A routed to IRQ 16
         IOMMU group: 3
         Region 0: Memory at 6205200000 (64-bit, non-prefetchable) 
[size=128K]
         Capabilities: [90] MSI: Enable- Count=1/1 Maskable- 64bit-
                 Address: 00000000  Data: 0000
         Capabilities: [d0] Power Management version 3
                 Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA 
PME(D0-,D1-,D2-,D3hot-,D3cold-)
                 Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
         Capabilities: [e0] Vendor Specific Information: Intel 
Capabilities v1
                 CapA: Peg60Dis- Peg12Dis- Peg11Dis- Peg10Dis- PeLWUDis- 
DmiWidth=x4
                       EccDis- ForceEccEn- VTdDis- DmiG2Dis- PegG2Dis- 
DDRMaxSize=Unlimited
                       1NDis- CDDis- DDPCDis- X2APICEn- PDCDis- IGDis- 
CDID=0 CRID=0
                       DDROCCAP- OCEn- DDRWrtVrefEn- DDR3LEn-
                 CapB: ImguDis- OCbySSKUCap- OCbySSKUEn- SMTCap- 
CacheSzCap 0x0
                       SoftBinCap- DDR3MaxFreqWithRef100=Disabled PegG3Dis-
                       PkgTyp- AddGfxEn- AddGfxCap- PegX16Dis- DmiG3Dis- 
GmmDis-
                       DDR3MaxFreq=2932MHz LPDDR3En-
         Kernel driver in use: proc_thermal_pci
         Kernel modules: processor_thermal_device_pci

0000:00:06.0 System peripheral: Intel Corporation RST VMD Managed Controller
         Subsystem: Acer Incorporated [ALI] Device 170f
         Control: I/O- Mem- BusMaster- SpecCycle- MemWINV- VGASnoop- 
ParErr- Stepping- SERR- FastB2B- DisINTx-
         Status: Cap- 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- 
<TAbort- <MAbort- >SERR- <PERR- INTx-
         IOMMU group: 4

0000:00:08.0 System peripheral: Intel Corporation 12th Gen Core 
Processor Gaussian & Neural Accelerator (rev 02)
         Subsystem: Acer Incorporated [ALI] Device 170f
         Control: I/O- Mem- BusMaster- SpecCycle- MemWINV- VGASnoop- 
ParErr- Stepping- SERR- FastB2B- DisINTx-
         Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- 
<TAbort- <MAbort- >SERR- <PERR- INTx-
         Interrupt: pin A routed to IRQ 255
         IOMMU group: 5
         Region 0: Memory at 6205233000 (64-bit, non-prefetchable) 
[disabled] [size=4K]
         Capabilities: [90] MSI: Enable- Count=1/1 Maskable- 64bit-
                 Address: 00000000  Data: 0000
         Capabilities: [a0] Vendor Specific Information: Intel <unknown>
         Capabilities: [dc] Power Management version 2
                 Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA 
PME(D0-,D1-,D2-,D3hot-,D3cold-)
                 Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-
         Capabilities: [f0] PCI Advanced Features
                 AFCap: TP+ FLR+
                 AFCtrl: FLR-
                 AFStatus: TP-

0000:00:0e.0 RAID bus controller: Intel Corporation Volume Management 
Device NVMe RAID Controller
         Subsystem: Acer Incorporated [ALI] Device 170f
         Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- 
ParErr- Stepping- SERR- FastB2B- DisINTx+
         Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- 
<TAbort- <MAbort- >SERR- <PERR- INTx-
         Latency: 0, Cache Line Size: 64 bytes
         IOMMU group: 6
         Region 0: Memory at 6202000000 (64-bit, non-prefetchable) 
[size=32M]
         Region 2: Memory at 84000000 (32-bit, non-prefetchable) [size=32M]
         Region 4: Memory at 6205100000 (64-bit, non-prefetchable) [size=1M]
         Capabilities: [80] MSI-X: Enable+ Count=19 Masked-
                 Vector table: BAR=4 offset=00000000
                 PBA: BAR=4 offset=00001000
         Capabilities: [90] Express (v2) Root Complex Integrated 
Endpoint, IntMsgNum 0
                 DevCap: MaxPayload 128 bytes, PhantFunc 0
                         ExtTag- RBE- FLReset- TEE-IO-
                 DevCtl: CorrErr- NonFatalErr- FatalErr- UnsupReq-
                         RlxdOrd- ExtTag- PhantFunc- AuxPwr- NoSnoop-
                         MaxPayload 128 bytes, MaxReadReq 128 bytes
                 DevSta: CorrErr- NonFatalErr- FatalErr- UnsupReq- 
AuxPwr- TransPend-
                 DevCap2: Completion Timeout: Not Supported, TimeoutDis- 
NROPrPrP- LTR-
                          10BitTagComp- 10BitTagReq- OBFF Not Supported, 
ExtFmt- EETLPPrefix-
                          EmergencyPowerReduction Not Supported, 
EmergencyPowerReductionInit-
                          FRS-
                          AtomicOpsCap: 32bit- 64bit- 128bitCAS-
                 DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-
                          AtomicOpsCtl: ReqEn-
                          IDOReq- IDOCompl- LTR- EmergencyPowerReductionReq-
                          10BitTagReq- OBFF Disabled, EETLPPrefixBlk-
         Capabilities: [e0] Power Management version 3
                 Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA 
PME(D0-,D1-,D2-,D3hot-,D3cold-)
                 Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
         Kernel driver in use: vmd
         Kernel modules: vmd

0000:00:14.0 USB controller: Intel Corporation Raptor Lake USB 3.2 Gen 
2x2 (20 Gb/s) XHCI Host Controller (rev 11) (prog-if 30 [XHCI])
         Subsystem: Acer Incorporated [ALI] Device 170f
         Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- 
ParErr- Stepping- SERR- FastB2B- DisINTx+
         Status: Cap+ 66MHz- UDF- FastB2B+ ParErr- DEVSEL=medium 
 >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
         Latency: 0
         Interrupt: pin A routed to IRQ 128
         IOMMU group: 7
         Region 0: Memory at 82380000 (64-bit, non-prefetchable) [size=64K]
         Capabilities: [70] Power Management version 2
                 Flags: PMEClk- DSI- D1- D2- AuxCurrent=375mA 
PME(D0-,D1-,D2-,D3hot+,D3cold+)
                 Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
         Capabilities: [80] MSI: Enable+ Count=8/8 Maskable- 64bit+
                 Address: 00000000fee00418  Data: 0000
         Capabilities: [90] Vendor Specific Information: Intel <unknown>
         Capabilities: [b0] Vendor Specific Information: Intel 
Capabilities v1
         Kernel driver in use: xhci_hcd
         Kernel modules: mei_me

0000:00:14.2 RAM memory: Intel Corporation Raptor Lake-S PCH Shared SRAM 
(rev 11)
         Subsystem: Acer Incorporated [ALI] Device 170f
         Control: I/O- Mem- BusMaster- SpecCycle- MemWINV- VGASnoop- 
ParErr- Stepping- SERR- FastB2B- DisINTx-
         Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- 
<TAbort- <MAbort- >SERR- <PERR- INTx-
         IOMMU group: 7
         Region 0: Memory at 6205228000 (64-bit, non-prefetchable) 
[disabled] [size=16K]
         Region 2: Memory at 6205232000 (64-bit, non-prefetchable) 
[disabled] [size=4K]
         Capabilities: [80] Power Management version 3
                 Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA 
PME(D0-,D1-,D2-,D3hot-,D3cold-)
                 Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-

0000:00:14.3 Network controller: Intel Corporation Raptor Lake-S PCH 
CNVi WiFi (rev 11)
         Subsystem: Rivet Networks Device 1652
         Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- 
ParErr- Stepping- SERR- FastB2B- DisINTx+
         Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- 
<TAbort- <MAbort- >SERR- <PERR- INTx-
         Latency: 0, Cache Line Size: 64 bytes
         Interrupt: pin C routed to IRQ 18
         IOMMU group: 8
         Region 0: Memory at 6205224000 (64-bit, non-prefetchable) 
[size=16K]
         Capabilities: [c8] Power Management version 3
                 Flags: PMEClk- DSI+ D1- D2- AuxCurrent=0mA 
PME(D0+,D1-,D2-,D3hot+,D3cold+)
                 Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
         Capabilities: [d0] MSI: Enable- Count=1/1 Maskable- 64bit+
                 Address: 0000000000000000  Data: 0000
         Capabilities: [40] Express (v2) Root Complex Integrated 
Endpoint, IntMsgNum 0
                 DevCap: MaxPayload 128 bytes, PhantFunc 0
                         ExtTag- RBE- FLReset+ TEE-IO-
                 DevCtl: CorrErr- NonFatalErr- FatalErr- UnsupReq-
                         RlxdOrd+ ExtTag- PhantFunc- AuxPwr+ NoSnoop+ 
FLReset-
                         MaxPayload 128 bytes, MaxReadReq 128 bytes
                 DevSta: CorrErr- NonFatalErr- FatalErr- UnsupReq- 
AuxPwr+ TransPend-
                 DevCap2: Completion Timeout: Range B, TimeoutDis+ 
NROPrPrP- LTR+
                          10BitTagComp- 10BitTagReq- OBFF Via WAKE#, 
ExtFmt- EETLPPrefix-
                          EmergencyPowerReduction Not Supported, 
EmergencyPowerReductionInit-
                          FRS-
                          AtomicOpsCap: 32bit- 64bit- 128bitCAS-
                 DevCtl2: Completion Timeout: 16ms to 55ms, TimeoutDis-
                          AtomicOpsCtl: ReqEn-
                          IDOReq- IDOCompl- LTR+ EmergencyPowerReductionReq-
                          10BitTagReq- OBFF Disabled, EETLPPrefixBlk-
         Capabilities: [80] MSI-X: Enable+ Count=16 Masked-
                 Vector table: BAR=0 offset=00002000
                 PBA: BAR=0 offset=00003000
         Capabilities: [100 v1] Latency Tolerance Reporting
                 Max snoop latency: 0ns
                 Max no snoop latency: 0ns
         Capabilities: [164 v1] Vendor Specific Information: ID=0010 
Rev=0 Len=014 <?>
         Kernel driver in use: iwlwifi
         Kernel modules: iwlwifi

0000:00:15.0 Serial bus controller: Intel Corporation Raptor Lake Serial 
IO I2C Host Controller #0 (rev 11)
         Subsystem: Acer Incorporated [ALI] Device 170f
         Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- 
ParErr- Stepping- SERR- FastB2B- DisINTx-
         Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- 
<TAbort- <MAbort- >SERR- <PERR- INTx-
         Latency: 0, Cache Line Size: 64 bytes
         Interrupt: pin A routed to IRQ 27
         IOMMU group: 9
         Region 0: Memory at 4017000000 (64-bit, non-prefetchable) [size=4K]
         Capabilities: [80] Power Management version 3
                 Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA 
PME(D0-,D1-,D2-,D3hot-,D3cold-)
                 Status: D3 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
         Capabilities: [90] Vendor Specific Information: Intel <unknown>
         Kernel driver in use: intel-lpss

0000:00:15.3 Serial bus controller: Intel Corporation Device 7a4f (rev 11)
         Subsystem: Acer Incorporated [ALI] Device 170f
         Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- 
ParErr- Stepping- SERR- FastB2B- DisINTx-
         Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- 
<TAbort- <MAbort- >SERR- <PERR- INTx-
         Latency: 0, Cache Line Size: 64 bytes
         Interrupt: pin D routed to IRQ 43
         IOMMU group: 9
         Region 0: Memory at 4017001000 (64-bit, non-prefetchable) [size=4K]
         Capabilities: [80] Power Management version 3
                 Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA 
PME(D0-,D1-,D2-,D3hot-,D3cold-)
                 Status: D3 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
         Capabilities: [90] Vendor Specific Information: Intel <unknown>
         Kernel driver in use: intel-lpss

0000:00:16.0 Communication controller: Intel Corporation Raptor Lake 
CSME HECI #1 (rev 11)
         Subsystem: Acer Incorporated [ALI] Device 170f
         Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- 
ParErr- Stepping- SERR- FastB2B- DisINTx+
         Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- 
<TAbort- <MAbort- >SERR- <PERR- INTx-
         Latency: 0
         Interrupt: pin A routed to IRQ 197
         IOMMU group: 10
         Region 0: Memory at 620522f000 (64-bit, non-prefetchable) [size=4K]
         Capabilities: [50] Power Management version 3
                 Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA 
PME(D0-,D1-,D2-,D3hot+,D3cold-)
                 Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
         Capabilities: [8c] MSI: Enable+ Count=1/1 Maskable- 64bit+
                 Address: 00000000fee00838  Data: 0000
         Capabilities: [a4] Vendor Specific Information: Intel <unknown>
         Kernel driver in use: mei_me
         Kernel modules: mei_me

0000:00:1a.0 PCI bridge: Intel Corporation Raptor Lake PCI Express Root 
Port #25 (rev 11) (prog-if 00 [Normal decode])
         Subsystem: Acer Incorporated [ALI] Device 170f
         Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- 
ParErr- Stepping- SERR- FastB2B- DisINTx+
         Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- 
<TAbort- <MAbort- >SERR- <PERR- INTx-
         Latency: 0, Cache Line Size: 64 bytes
         Interrupt: pin A routed to IRQ 123
         IOMMU group: 11
         Bus: primary=00, secondary=02, subordinate=6b, sec-latency=0
         I/O behind bridge: 6000-8fff [size=12K] [16-bit]
         Memory behind bridge: 54000000-820fffff [size=737M] [32-bit]
         Prefetchable memory behind bridge: 6210000000-625a0fffff 
[size=1185M] [32-bit]
         Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=fast >TAbort- 
<TAbort- <MAbort+ <SERR- <PERR-
         BridgeCtl: Parity- SERR+ NoISA- VGA- VGA16- MAbort- >Reset- 
FastB2B-
                 PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-
         Capabilities: [40] Express (v2) Root Port (Slot+), IntMsgNum 0
                 DevCap: MaxPayload 256 bytes, PhantFunc 0
                         ExtTag- RBE+ TEE-IO-
                 DevCtl: CorrErr+ NonFatalErr+ FatalErr+ UnsupReq+
                         RlxdOrd- ExtTag- PhantFunc- AuxPwr- NoSnoop-
                         MaxPayload 128 bytes, MaxReadReq 128 bytes
                 DevSta: CorrErr- NonFatalErr- FatalErr- UnsupReq- 
AuxPwr+ TransPend-
                 LnkCap: Port #25, Speed 16GT/s, Width x4, ASPM L1, Exit 
Latency L1 <64us
                         ClockPM- Surprise- LLActRep+ BwNot+ ASPMOptComp+
                 LnkCtl: ASPM Disabled; RCB 64 bytes, LnkDisable- CommClk+
                         ExtSynch- ClockPM- AutWidDis- BWInt+ AutBWInt+ 
FltModeDis-
                 LnkSta: Speed 8GT/s, Width x4
                         TrErr- Train- SlotClk+ DLActive+ BWMgmt- ABWMgmt-
                 SltCap: AttnBtn- PwrCtrl- MRL- AttnInd- PwrInd- 
HotPlug+ Surprise+
                         Slot #24, PowerLimit 25W; Interlock- NoCompl+
                 SltCtl: Enable: AttnBtn- PwrFlt- MRL- PresDet+ CmdCplt- 
HPIrq+ LinkChg+
                         Control: AttnInd Unknown, PwrInd Unknown, 
Power- Interlock-
                 SltSta: Status: AttnBtn- PowerFlt- MRL- CmdCplt- 
PresDet+ Interlock-
                         Changed: MRL- PresDet- LinkState-
                 RootCap: CRSVisible-
                 RootCtl: ErrCorrectable- ErrNon-Fatal- ErrFatal- 
PMEIntEna+ CRSVisible-
                 RootSta: PME ReqID 0000, PMEStatus- PMEPending-
                 DevCap2: Completion Timeout: Range ABC, TimeoutDis+ 
NROPrPrP- LTR+
                          10BitTagComp- 10BitTagReq- OBFF Via WAKE#, 
ExtFmt+ EETLPPrefix+, MaxEETLPPrefixes 2
                          EmergencyPowerReduction Not Supported, 
EmergencyPowerReductionInit-
                          FRS- LN System CLS Not Supported, TPHComp- 
ExtTPHComp- ARIFwd+
                          AtomicOpsCap: Routing- 32bit- 64bit- 128bitCAS-
                 DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis- 
ARIFwd-
                          AtomicOpsCtl: ReqEn- EgressBlck-
                          IDOReq- IDOCompl- LTR+ EmergencyPowerReductionReq-
                          10BitTagReq- OBFF Disabled, EETLPPrefixBlk-
                 LnkCap2: Supported Link Speeds: 2.5-16GT/s, Crosslink- 
Retimer+ 2Retimers+ DRS-
                 LnkCtl2: Target Link Speed: 8GT/s, EnterCompliance- 
SpeedDis-
                          Transmit Margin: Normal Operating Range, 
EnterModifiedCompliance- ComplianceSOS-
                          Compliance Preset/De-emphasis: -6dB 
de-emphasis, 0dB preshoot
                 LnkSta2: Current De-emphasis Level: -3.5dB, 
EqualizationComplete+ EqualizationPhase1+
                          EqualizationPhase2+ EqualizationPhase3+ 
LinkEqualizationRequest-
                          Retimer- 2Retimers- CrosslinkRes: unsupported, 
FltMode-
         Capabilities: [80] MSI: Enable+ Count=1/1 Maskable- 64bit+
                 Address: 00000000fee00258  Data: 0000
         Capabilities: [98] Subsystem: Acer Incorporated [ALI] Device 170f
         Capabilities: [a0] Power Management version 3
                 Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA 
PME(D0+,D1-,D2-,D3hot+,D3cold+)
                 Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-
         Capabilities: [100 v1] Advanced Error Reporting
                 UESta:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- 
UnxCmplt- RxOF- MalfTLP-
                         ECRC- UnsupReq- ACSViol- UncorrIntErr- 
BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
                         PoisonTLPBlocked- DMWrReqBlocked- IDECheck- 
MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
                 UEMsk:  DLP- SDES- TLP- FCP- CmpltTO+ CmpltAbrt- 
UnxCmplt- RxOF- MalfTLP-
                         ECRC- UnsupReq- ACSViol- UncorrIntErr- 
BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
                         PoisonTLPBlocked- DMWrReqBlocked- IDECheck- 
MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
                 UESvrt: DLP+ SDES- TLP- FCP- CmpltTO- CmpltAbrt- 
UnxCmplt- RxOF+ MalfTLP+
                         ECRC- UnsupReq- ACSViol- UncorrIntErr- 
BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
                         PoisonTLPBlocked- DMWrReqBlocked- IDECheck- 
MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
                 CESta:  RxErr- BadTLP- BadDLLP- Rollover- Timeout- 
AdvNonFatalErr- CorrIntErr- HeaderOF-
                 CEMsk:  RxErr- BadTLP- BadDLLP- Rollover- Timeout- 
AdvNonFatalErr+ CorrIntErr- HeaderOF-
                 AERCap: First Error Pointer: 00, ECRCGenCap- ECRCGenEn- 
ECRCChkCap- ECRCChkEn-
                         MultHdrRecCap- MultHdrRecEn- TLPPfxPres- HdrLogCap-
                 HeaderLog: 00000000 00000000 00000000 00000000
                 RootCmd: CERptEn+ NFERptEn+ FERptEn+
                 RootSta: CERcvd- MultCERcvd- UERcvd- MultUERcvd-
                          FirstFatal- NonFatalMsg- FatalMsg- IntMsgNum 0
                 ErrorSrc: ERR_COR: 0000 ERR_FATAL/NONFATAL: 0000
         Capabilities: [220 v1] Access Control Services
                 ACSCap: SrcValid+ TransBlk+ ReqRedir+ CmpltRedir+ 
UpstreamFwd+ EgressCtrl- DirectTrans-
                 ACSCtl: SrcValid+ TransBlk+ ReqRedir+ CmpltRedir+ 
UpstreamFwd+ EgressCtrl- DirectTrans-
         Capabilities: [150 v1] Precision Time Measurement
                 PTMCap: Requester- Responder+ Root+
                 PTMClockGranularity: 4ns
                 PTMControl: Enabled+ RootSelected+
                 PTMEffectiveGranularity: Unknown
         Capabilities: [a30 v1] Secondary PCI Express
                 LnkCtl3: LnkEquIntrruptEn- PerformEqu-
                 LaneErrStat: 0
         Capabilities: [a90 v1] Data Link Feature <?>
         Capabilities: [a9c v1] Physical Layer 16.0 GT/s
                 Phy16Sta: EquComplete- EquPhase1- EquPhase2- EquPhase3- 
LinkEquRequest-
         Capabilities: [edc v1] Lane Margining at the Receiver
                 PortCap: Uses Driver-
                 PortSta: MargReady- MargSoftReady-
         Kernel driver in use: pcieport

0000:00:1c.0 PCI bridge: Intel Corporation Device 7a3c (rev 11) (prog-if 
00 [Normal decode])
         Subsystem: Acer Incorporated [ALI] Device 170f
         Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- 
ParErr- Stepping- SERR- FastB2B- DisINTx+
         Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- 
<TAbort- <MAbort- >SERR- <PERR- INTx-
         Latency: 0, Cache Line Size: 64 bytes
         Interrupt: pin A routed to IRQ 124
         IOMMU group: 12
         Bus: primary=00, secondary=6c, subordinate=6c, sec-latency=0
         I/O behind bridge: f000-0fff [disabled] [16-bit]
         Memory behind bridge: 82200000-822fffff [size=1M] [32-bit]
         Prefetchable memory behind bridge: 
00000000fff00000-00000000000fffff [disabled] [64-bit]
         Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=fast >TAbort- 
<TAbort- <MAbort- <SERR- <PERR-
         BridgeCtl: Parity- SERR+ NoISA- VGA- VGA16- MAbort- >Reset- 
FastB2B-
                 PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-
         Capabilities: [40] Express (v2) Root Port (Slot+), IntMsgNum 0
                 DevCap: MaxPayload 256 bytes, PhantFunc 0
                         ExtTag- RBE+ TEE-IO-
                 DevCtl: CorrErr+ NonFatalErr+ FatalErr+ UnsupReq+
                         RlxdOrd- ExtTag- PhantFunc- AuxPwr- NoSnoop-
                         MaxPayload 128 bytes, MaxReadReq 128 bytes
                 DevSta: CorrErr- NonFatalErr- FatalErr- UnsupReq- 
AuxPwr+ TransPend-
                 LnkCap: Port #5, Speed 8GT/s, Width x1, ASPM L1, Exit 
Latency L1 <64us
                         ClockPM- Surprise- LLActRep+ BwNot+ ASPMOptComp+
                 LnkCtl: ASPM L1 Enabled; RCB 64 bytes, LnkDisable- CommClk+
                         ExtSynch- ClockPM- AutWidDis- BWInt+ AutBWInt+ 
FltModeDis-
                 LnkSta: Speed 2.5GT/s, Width x1
                         TrErr- Train- SlotClk+ DLActive+ BWMgmt- ABWMgmt-
                 SltCap: AttnBtn- PwrCtrl- MRL- AttnInd- PwrInd- 
HotPlug- Surprise-
                         Slot #4, PowerLimit 10W; Interlock- NoCompl+
                 SltCtl: Enable: AttnBtn- PwrFlt- MRL- PresDet- CmdCplt- 
HPIrq- LinkChg-
                         Control: AttnInd Unknown, PwrInd Unknown, 
Power- Interlock-
                 SltSta: Status: AttnBtn- PowerFlt- MRL- CmdCplt- 
PresDet+ Interlock-
                         Changed: MRL- PresDet- LinkState+
                 RootCap: CRSVisible-
                 RootCtl: ErrCorrectable- ErrNon-Fatal- ErrFatal- 
PMEIntEna+ CRSVisible-
                 RootSta: PME ReqID 0000, PMEStatus- PMEPending-
                 DevCap2: Completion Timeout: Range ABC, TimeoutDis+ 
NROPrPrP- LTR+
                          10BitTagComp- 10BitTagReq- OBFF Via WAKE#, 
ExtFmt+ EETLPPrefix+, MaxEETLPPrefixes 2
                          EmergencyPowerReduction Not Supported, 
EmergencyPowerReductionInit-
                          FRS- LN System CLS Not Supported, TPHComp- 
ExtTPHComp- ARIFwd+
                          AtomicOpsCap: Routing- 32bit- 64bit- 128bitCAS-
                 DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis- 
ARIFwd-
                          AtomicOpsCtl: ReqEn- EgressBlck-
                          IDOReq- IDOCompl- LTR+ EmergencyPowerReductionReq-
                          10BitTagReq- OBFF Disabled, EETLPPrefixBlk-
                 LnkCap2: Supported Link Speeds: 2.5-8GT/s, Crosslink- 
Retimer+ 2Retimers+ DRS-
                 LnkCtl2: Target Link Speed: 2.5GT/s, EnterCompliance- 
SpeedDis-
                          Transmit Margin: Normal Operating Range, 
EnterModifiedCompliance- ComplianceSOS-
                          Compliance Preset/De-emphasis: -6dB 
de-emphasis, 0dB preshoot
                 LnkSta2: Current De-emphasis Level: -3.5dB, 
EqualizationComplete- EqualizationPhase1-
                          EqualizationPhase2- EqualizationPhase3- 
LinkEqualizationRequest-
                          Retimer- 2Retimers- CrosslinkRes: unsupported, 
FltMode-
         Capabilities: [80] MSI: Enable+ Count=1/1 Maskable- 64bit+
                 Address: 00000000fee00278  Data: 0000
         Capabilities: [98] Subsystem: Acer Incorporated [ALI] Device 170f
         Capabilities: [a0] Power Management version 3
                 Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA 
PME(D0+,D1-,D2-,D3hot+,D3cold+)
                 Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-
         Capabilities: [100 v1] Advanced Error Reporting
                 UESta:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- 
UnxCmplt- RxOF- MalfTLP-
                         ECRC- UnsupReq- ACSViol- UncorrIntErr- 
BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
                         PoisonTLPBlocked- DMWrReqBlocked- IDECheck- 
MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
                 UEMsk:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- 
UnxCmplt- RxOF- MalfTLP-
                         ECRC- UnsupReq- ACSViol- UncorrIntErr- 
BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
                         PoisonTLPBlocked- DMWrReqBlocked- IDECheck- 
MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
                 UESvrt: DLP+ SDES- TLP- FCP- CmpltTO- CmpltAbrt- 
UnxCmplt- RxOF+ MalfTLP+
                         ECRC- UnsupReq- ACSViol- UncorrIntErr- 
BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
                         PoisonTLPBlocked- DMWrReqBlocked- IDECheck- 
MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
                 CESta:  RxErr- BadTLP- BadDLLP- Rollover- Timeout- 
AdvNonFatalErr- CorrIntErr- HeaderOF-
                 CEMsk:  RxErr- BadTLP- BadDLLP- Rollover- Timeout- 
AdvNonFatalErr+ CorrIntErr- HeaderOF-
                 AERCap: First Error Pointer: 00, ECRCGenCap- ECRCGenEn- 
ECRCChkCap- ECRCChkEn-
                         MultHdrRecCap- MultHdrRecEn- TLPPfxPres- HdrLogCap-
                 HeaderLog: 00000000 00000000 00000000 00000000
                 RootCmd: CERptEn+ NFERptEn+ FERptEn+
                 RootSta: CERcvd- MultCERcvd- UERcvd- MultUERcvd-
                          FirstFatal- NonFatalMsg- FatalMsg- IntMsgNum 0
                 ErrorSrc: ERR_COR: 0000 ERR_FATAL/NONFATAL: 0000
         Capabilities: [220 v1] Access Control Services
                 ACSCap: SrcValid+ TransBlk+ ReqRedir+ CmpltRedir+ 
UpstreamFwd+ EgressCtrl- DirectTrans-
                 ACSCtl: SrcValid+ TransBlk- ReqRedir+ CmpltRedir+ 
UpstreamFwd+ EgressCtrl- DirectTrans-
         Capabilities: [200 v1] L1 PM Substates
                 L1SubCap: PCI-PM_L1.2+ PCI-PM_L1.1+ ASPM_L1.2+ 
ASPM_L1.1+ L1_PM_Substates+
                           PortCommonModeRestoreTime=60us 
PortTPowerOnTime=42us
                 L1SubCtl1: PCI-PM_L1.2+ PCI-PM_L1.1+ ASPM_L1.2+ ASPM_L1.1+
                            T_CommonMode=60us LTR1.2_Threshold=126976ns
                 L1SubCtl2: T_PwrOn=60us
         Capabilities: [150 v1] Precision Time Measurement
                 PTMCap: Requester- Responder+ Root+
                 PTMClockGranularity: 4ns
                 PTMControl: Enabled+ RootSelected+
                 PTMEffectiveGranularity: Unknown
         Capabilities: [a30 v1] Secondary PCI Express
                 LnkCtl3: LnkEquIntrruptEn- PerformEqu-
                 LaneErrStat: 0
         Capabilities: [a90 v1] Data Link Feature <?>
         Kernel driver in use: pcieport

0000:00:1c.6 PCI bridge: Intel Corporation Device 7a3e (rev 11) (prog-if 
00 [Normal decode])
         Subsystem: Acer Incorporated [ALI] Device 170f
         Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- 
ParErr- Stepping- SERR- FastB2B- DisINTx+
         Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- 
<TAbort- <MAbort- >SERR- <PERR- INTx-
         Latency: 0, Cache Line Size: 64 bytes
         Interrupt: pin C routed to IRQ 125
         IOMMU group: 13
         Bus: primary=00, secondary=6d, subordinate=6d, sec-latency=0
         I/O behind bridge: 3000-3fff [size=4K] [16-bit]
         Memory behind bridge: 82100000-821fffff [size=1M] [32-bit]
         Prefetchable memory behind bridge: 
00000000fff00000-00000000000fffff [disabled] [64-bit]
         Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=fast >TAbort- 
<TAbort- <MAbort- <SERR- <PERR-
         BridgeCtl: Parity- SERR+ NoISA- VGA- VGA16- MAbort- >Reset- 
FastB2B-
                 PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-
         Capabilities: [40] Express (v2) Root Port (Slot+), IntMsgNum 0
                 DevCap: MaxPayload 256 bytes, PhantFunc 0
                         ExtTag- RBE+ TEE-IO-
                 DevCtl: CorrErr+ NonFatalErr+ FatalErr+ UnsupReq+
                         RlxdOrd- ExtTag- PhantFunc- AuxPwr- NoSnoop-
                         MaxPayload 128 bytes, MaxReadReq 128 bytes
                 DevSta: CorrErr- NonFatalErr- FatalErr- UnsupReq- 
AuxPwr+ TransPend-
                 LnkCap: Port #7, Speed 8GT/s, Width x1, ASPM L1, Exit 
Latency L1 <64us
                         ClockPM- Surprise- LLActRep+ BwNot+ ASPMOptComp+
                 LnkCtl: ASPM Disabled; RCB 64 bytes, LnkDisable- CommClk+
                         ExtSynch- ClockPM- AutWidDis- BWInt+ AutBWInt+ 
FltModeDis-
                 LnkSta: Speed 2.5GT/s, Width x1
                         TrErr- Train- SlotClk+ DLActive+ BWMgmt- ABWMgmt-
                 SltCap: AttnBtn- PwrCtrl- MRL- AttnInd- PwrInd- 
HotPlug- Surprise-
                         Slot #6, PowerLimit 10W; Interlock- NoCompl+
                 SltCtl: Enable: AttnBtn- PwrFlt- MRL- PresDet- CmdCplt- 
HPIrq- LinkChg-
                         Control: AttnInd Unknown, PwrInd Unknown, 
Power- Interlock-
                 SltSta: Status: AttnBtn- PowerFlt- MRL- CmdCplt- 
PresDet+ Interlock-
                         Changed: MRL- PresDet- LinkState+
                 RootCap: CRSVisible-
                 RootCtl: ErrCorrectable- ErrNon-Fatal- ErrFatal- 
PMEIntEna+ CRSVisible-
                 RootSta: PME ReqID 0000, PMEStatus- PMEPending-
                 DevCap2: Completion Timeout: Range ABC, TimeoutDis+ 
NROPrPrP- LTR+
                          10BitTagComp- 10BitTagReq- OBFF Via WAKE#, 
ExtFmt+ EETLPPrefix+, MaxEETLPPrefixes 2
                          EmergencyPowerReduction Not Supported, 
EmergencyPowerReductionInit-
                          FRS- LN System CLS Not Supported, TPHComp- 
ExtTPHComp- ARIFwd+
                          AtomicOpsCap: Routing- 32bit- 64bit- 128bitCAS-
                 DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis- 
ARIFwd-
                          AtomicOpsCtl: ReqEn- EgressBlck-
                          IDOReq- IDOCompl- LTR+ EmergencyPowerReductionReq-
                          10BitTagReq- OBFF Disabled, EETLPPrefixBlk-
                 LnkCap2: Supported Link Speeds: 2.5-8GT/s, Crosslink- 
Retimer+ 2Retimers+ DRS-
                 LnkCtl2: Target Link Speed: 2.5GT/s, EnterCompliance- 
SpeedDis-
                          Transmit Margin: Normal Operating Range, 
EnterModifiedCompliance- ComplianceSOS-
                          Compliance Preset/De-emphasis: -6dB 
de-emphasis, 0dB preshoot
                 LnkSta2: Current De-emphasis Level: -3.5dB, 
EqualizationComplete- EqualizationPhase1-
                          EqualizationPhase2- EqualizationPhase3- 
LinkEqualizationRequest-
                          Retimer- 2Retimers- CrosslinkRes: unsupported, 
FltMode-
         Capabilities: [80] MSI: Enable+ Count=1/1 Maskable- 64bit+
                 Address: 00000000fee00298  Data: 0000
         Capabilities: [98] Subsystem: Acer Incorporated [ALI] Device 170f
         Capabilities: [a0] Power Management version 3
                 Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA 
PME(D0+,D1-,D2-,D3hot+,D3cold+)
                 Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-
         Capabilities: [100 v1] Advanced Error Reporting
                 UESta:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- 
UnxCmplt- RxOF- MalfTLP-
                         ECRC- UnsupReq- ACSViol- UncorrIntErr- 
BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
                         PoisonTLPBlocked- DMWrReqBlocked- IDECheck- 
MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
                 UEMsk:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- 
UnxCmplt- RxOF- MalfTLP-
                         ECRC- UnsupReq- ACSViol- UncorrIntErr- 
BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
                         PoisonTLPBlocked- DMWrReqBlocked- IDECheck- 
MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
                 UESvrt: DLP+ SDES- TLP- FCP- CmpltTO- CmpltAbrt- 
UnxCmplt- RxOF+ MalfTLP+
                         ECRC- UnsupReq- ACSViol- UncorrIntErr- 
BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
                         PoisonTLPBlocked- DMWrReqBlocked- IDECheck- 
MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
                 CESta:  RxErr- BadTLP- BadDLLP- Rollover- Timeout- 
AdvNonFatalErr- CorrIntErr- HeaderOF-
                 CEMsk:  RxErr- BadTLP- BadDLLP- Rollover- Timeout- 
AdvNonFatalErr+ CorrIntErr- HeaderOF-
                 AERCap: First Error Pointer: 00, ECRCGenCap- ECRCGenEn- 
ECRCChkCap- ECRCChkEn-
                         MultHdrRecCap- MultHdrRecEn- TLPPfxPres- HdrLogCap-
                 HeaderLog: 00000000 00000000 00000000 00000000
                 RootCmd: CERptEn+ NFERptEn+ FERptEn+
                 RootSta: CERcvd- MultCERcvd- UERcvd- MultUERcvd-
                          FirstFatal- NonFatalMsg- FatalMsg- IntMsgNum 0
                 ErrorSrc: ERR_COR: 0000 ERR_FATAL/NONFATAL: 0000
         Capabilities: [220 v1] Access Control Services
                 ACSCap: SrcValid+ TransBlk+ ReqRedir+ CmpltRedir+ 
UpstreamFwd+ EgressCtrl- DirectTrans-
                 ACSCtl: SrcValid+ TransBlk- ReqRedir+ CmpltRedir+ 
UpstreamFwd+ EgressCtrl- DirectTrans-
         Capabilities: [150 v1] Precision Time Measurement
                 PTMCap: Requester- Responder+ Root+
                 PTMClockGranularity: 4ns
                 PTMControl: Enabled+ RootSelected+
                 PTMEffectiveGranularity: Unknown
         Capabilities: [a30 v1] Secondary PCI Express
                 LnkCtl3: LnkEquIntrruptEn- PerformEqu-
                 LaneErrStat: 0
         Capabilities: [a90 v1] Data Link Feature <?>
         Kernel driver in use: pcieport

0000:00:1e.0 Communication controller: Intel Corporation Device 7a28 
(rev 11)
         Subsystem: Acer Incorporated [ALI] Device 170f
         Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- 
ParErr- Stepping- SERR- FastB2B- DisINTx-
         Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- 
<TAbort- <MAbort- >SERR- <PERR- INTx-
         Latency: 0, Cache Line Size: 64 bytes
         Interrupt: pin A routed to IRQ 16
         IOMMU group: 14
         Region 0: Memory at 4017002000 (64-bit, non-prefetchable) [size=4K]
         Capabilities: [80] Power Management version 3
                 Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA 
PME(D0-,D1-,D2-,D3hot-,D3cold-)
                 Status: D3 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
         Capabilities: [90] Vendor Specific Information: Intel <unknown>
         Kernel driver in use: intel-lpss

0000:00:1e.3 Serial bus controller: Intel Corporation Device 7a2b (rev 11)
         Subsystem: Acer Incorporated [ALI] Device 170f
         Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- 
ParErr- Stepping- SERR- FastB2B- DisINTx-
         Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- 
<TAbort- <MAbort- >SERR- <PERR- INTx-
         Latency: 0, Cache Line Size: 64 bytes
         Interrupt: pin D routed to IRQ 37
         IOMMU group: 14
         Region 0: Memory at 4017003000 (64-bit, non-prefetchable) [size=4K]
         Capabilities: [80] Power Management version 3
                 Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA 
PME(D0-,D1-,D2-,D3hot-,D3cold-)
                 Status: D3 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
         Capabilities: [90] Vendor Specific Information: Intel <unknown>
         Kernel driver in use: intel-lpss

0000:00:1f.0 ISA bridge: Intel Corporation Device 7a0c (rev 11)
         Subsystem: Acer Incorporated [ALI] Device 170f
         Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- 
ParErr- Stepping- SERR- FastB2B- DisINTx+
         Status: Cap- 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- 
<TAbort- <MAbort- >SERR- <PERR- INTx-
         Latency: 0
         IOMMU group: 15

0000:00:1f.3 Multimedia audio controller: Intel Corporation Raptor Lake 
High Definition Audio Controller (rev 11)
         Subsystem: Acer Incorporated [ALI] Device 170f
         Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- 
ParErr- Stepping- SERR- FastB2B- DisINTx+
         Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- 
<TAbort- <MAbort- >SERR- <PERR- INTx-
         Latency: 32, Cache Line Size: 64 bytes
         Interrupt: pin B routed to IRQ 231
         IOMMU group: 15
         Region 0: Memory at 6205220000 (64-bit, non-prefetchable) 
[size=16K]
         Region 4: Memory at 6205000000 (64-bit, non-prefetchable) [size=1M]
         Capabilities: [50] Power Management version 3
                 Flags: PMEClk- DSI- D1- D2- AuxCurrent=55mA 
PME(D0-,D1-,D2-,D3hot+,D3cold+)
                 Status: D3 NoSoftRst+ PME-Enable+ DSel=0 DScale=0 PME-
         Capabilities: [80] Vendor Specific Information: Intel <unknown>
         Capabilities: [60] MSI: Enable+ Count=1/1 Maskable- 64bit+
                 Address: 00000000fee00c78  Data: 0000
         Kernel driver in use: sof-audio-pci-intel-tgl
         Kernel modules: snd_hda_intel, snd_soc_avs, snd_sof_pci_intel_tgl

0000:00:1f.4 SMBus: Intel Corporation Raptor Lake-S PCH SMBus Controller 
(rev 11)
         Subsystem: Acer Incorporated [ALI] Device 170f
         Control: I/O+ Mem+ BusMaster- SpecCycle- MemWINV- VGASnoop- 
ParErr- Stepping- SERR- FastB2B- DisINTx-
         Status: Cap- 66MHz- UDF- FastB2B+ ParErr- DEVSEL=medium 
 >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
         Interrupt: pin C routed to IRQ 18
         IOMMU group: 15
         Region 0: Memory at 620522c000 (64-bit, non-prefetchable) 
[size=256]
         Region 4: I/O ports at efa0 [size=32]
         Kernel driver in use: i801_smbus
         Kernel modules: i2c_i801

0000:00:1f.5 Serial bus controller: Intel Corporation Raptor Lake SPI 
(flash) Controller (rev 11)
         Subsystem: Acer Incorporated [ALI] Device 170f
         Control: I/O- Mem+ BusMaster- SpecCycle- MemWINV- VGASnoop- 
ParErr- Stepping- SERR- FastB2B- DisINTx+
         Status: Cap- 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- 
<TAbort- <MAbort- >SERR- <PERR- INTx-
         IOMMU group: 15
         Region 0: Memory at 52800000 (32-bit, non-prefetchable) [size=4K]
         Kernel driver in use: intel-spi
         Kernel modules: spi_intel_pci

0000:01:00.0 VGA compatible controller: NVIDIA Corporation AD106M 
[GeForce RTX 4070 Max-Q / Mobile] (rev a1) (prog-if 00 [VGA controller])
         Subsystem: Acer Incorporated [ALI] Device 170f
         Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- 
ParErr- Stepping- SERR- FastB2B- DisINTx+
         Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- 
<TAbort- <MAbort- >SERR- <PERR- INTx-
         Latency: 0
         Interrupt: pin A routed to IRQ 230
         IOMMU group: 16
         Region 0: Memory at 86000000 (32-bit, non-prefetchable) [size=16M]
         Region 1: Memory at 6000000000 (64-bit, prefetchable) [size=8G]
         Region 3: Memory at 6200000000 (64-bit, prefetchable) [size=32M]
         Region 5: I/O ports at 4000 [size=128]
         Expansion ROM at 87080000 [virtual] [disabled] [size=512K]
         Capabilities: [60] Power Management version 3
                 Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA 
PME(D0+,D1-,D2-,D3hot+,D3cold-)
                 Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
         Capabilities: [68] MSI: Enable+ Count=1/1 Maskable- 64bit+
                 Address: 00000000fee00c58  Data: 0000
         Capabilities: [78] Express (v2) Legacy Endpoint, IntMsgNum 0
                 DevCap: MaxPayload 256 bytes, PhantFunc 0, Latency L0s 
unlimited, L1 <64us
                         ExtTag+ AttnBtn- AttnInd- PwrInd- RBE+ FLReset+ 
TEE-IO-
                 DevCtl: CorrErr+ NonFatalErr+ FatalErr+ UnsupReq+
                         RlxdOrd+ ExtTag+ PhantFunc- AuxPwr- NoSnoop+ 
FLReset-
                         MaxPayload 256 bytes, MaxReadReq 512 bytes
                 DevSta: CorrErr- NonFatalErr- FatalErr- UnsupReq- 
AuxPwr- TransPend-
                 LnkCap: Port #0, Speed 16GT/s, Width x8, ASPM L1, Exit 
Latency L1 <4us
                         ClockPM+ Surprise- LLActRep- BwNot- ASPMOptComp+
                 LnkCtl: ASPM Disabled; RCB 64 bytes, LnkDisable- CommClk+
                         ExtSynch- ClockPM+ AutWidDis- BWInt- AutBWInt- 
FltModeDis-
                 LnkSta: Speed 16GT/s, Width x8
                         TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
                 DevCap2: Completion Timeout: Range AB, TimeoutDis+ 
NROPrPrP- LTR+
                          10BitTagComp+ 10BitTagReq+ OBFF Via message, 
ExtFmt- EETLPPrefix-
                          EmergencyPowerReduction Not Supported, 
EmergencyPowerReductionInit-
                          FRS-
                          AtomicOpsCap: 32bit- 64bit- 128bitCAS-
                 DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-
                          AtomicOpsCtl: ReqEn-
                          IDOReq- IDOCompl- LTR+ EmergencyPowerReductionReq-
                          10BitTagReq- OBFF Disabled, EETLPPrefixBlk-
                 LnkCap2: Supported Link Speeds: 2.5-16GT/s, Crosslink- 
Retimer+ 2Retimers+ DRS-
                 LnkCtl2: Target Link Speed: 16GT/s, EnterCompliance- 
SpeedDis-
                          Transmit Margin: Normal Operating Range, 
EnterModifiedCompliance- ComplianceSOS-
                          Compliance Preset/De-emphasis: -6dB 
de-emphasis, 0dB preshoot
                 LnkSta2: Current De-emphasis Level: -6dB, 
EqualizationComplete+ EqualizationPhase1+
                          EqualizationPhase2+ EqualizationPhase3+ 
LinkEqualizationRequest-
                          Retimer- 2Retimers- CrosslinkRes: unsupported, 
FltMode-
         Capabilities: [b4] Vendor Specific Information: Len=14 <?>
         Capabilities: [100 v1] Virtual Channel
                 Caps:   LPEVC=0 RefClk=100ns PATEntryBits=1
                 Arb:    Fixed- WRR32- WRR64- WRR128-
                 Ctrl:   ArbSelect=Fixed
                 Status: InProgress-
                 VC0:    Caps:   PATOffset=00 MaxTimeSlots=1 RejSnoopTrans-
                         Arb:    Fixed- WRR32- WRR64- WRR128- TWRR128- 
WRR256-
                         Ctrl:   Enable+ ID=0 ArbSelect=Fixed TC/VC=ff
                         Status: NegoPending- InProgress-
         Capabilities: [250 v1] Latency Tolerance Reporting
                 Max snoop latency: 34326183936ns
                 Max no snoop latency: 34326183936ns
         Capabilities: [258 v1] L1 PM Substates
                 L1SubCap: PCI-PM_L1.2+ PCI-PM_L1.1+ ASPM_L1.2+ 
ASPM_L1.1+ L1_PM_Substates+
                           PortCommonModeRestoreTime=255us 
PortTPowerOnTime=10us
                 L1SubCtl1: PCI-PM_L1.2- PCI-PM_L1.1- ASPM_L1.2- ASPM_L1.1-
                            T_CommonMode=0us LTR1.2_Threshold=0ns
                 L1SubCtl2: T_PwrOn=10us
         Capabilities: [128 v1] Power Budgeting <?>
         Capabilities: [420 v2] Advanced Error Reporting
                 UESta:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- 
UnxCmplt- RxOF- MalfTLP-
                         ECRC- UnsupReq- ACSViol- UncorrIntErr- 
BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
                         PoisonTLPBlocked- DMWrReqBlocked- IDECheck- 
MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
                 UEMsk:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- 
UnxCmplt- RxOF- MalfTLP-
                         ECRC- UnsupReq- ACSViol- UncorrIntErr- 
BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
                         PoisonTLPBlocked- DMWrReqBlocked- IDECheck- 
MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
                 UESvrt: DLP+ SDES+ TLP- FCP+ CmpltTO- CmpltAbrt- 
UnxCmplt- RxOF+ MalfTLP+
                         ECRC- UnsupReq- ACSViol- UncorrIntErr+ 
BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
                         PoisonTLPBlocked- DMWrReqBlocked- IDECheck- 
MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
                 CESta:  RxErr- BadTLP- BadDLLP- Rollover- Timeout- 
AdvNonFatalErr- CorrIntErr- HeaderOF-
                 CEMsk:  RxErr- BadTLP- BadDLLP- Rollover- Timeout- 
AdvNonFatalErr+ CorrIntErr- HeaderOF+
                 AERCap: First Error Pointer: 00, ECRCGenCap- ECRCGenEn- 
ECRCChkCap- ECRCChkEn-
                         MultHdrRecCap- MultHdrRecEn- TLPPfxPres- HdrLogCap-
                 HeaderLog: 00000000 00000000 00000000 00000000
         Capabilities: [600 v1] Vendor Specific Information: ID=0001 
Rev=1 Len=024 <?>
         Capabilities: [900 v1] Secondary PCI Express
                 LnkCtl3: LnkEquIntrruptEn- PerformEqu-
                 LaneErrStat: 0
         Capabilities: [bb0 v1] Physical Resizable BAR
                 BAR 0: current size: 16MB, supported: 16MB
                 BAR 1: current size: 8GB, supported: 64MB 128MB 256MB 
512MB 1GB 2GB 4GB 8GB
                 BAR 3: current size: 32MB, supported: 32MB
         Capabilities: [c1c v1] Physical Layer 16.0 GT/s
                 Phy16Sta: EquComplete+ EquPhase1+ EquPhase2+ EquPhase3+ 
LinkEquRequest-
         Capabilities: [d00 v1] Lane Margining at the Receiver
                 PortCap: Uses Driver+
                 PortSta: MargReady- MargSoftReady-
         Capabilities: [e00 v1] Data Link Feature <?>
         Kernel driver in use: nvidia
         Kernel modules: nouveau, nova_core, nvidia_drm, nvidia

0000:01:00.1 Audio device: NVIDIA Corporation AD106M High Definition 
Audio Controller (rev a1)
         Subsystem: Acer Incorporated [ALI] Device 170f
         Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- 
ParErr- Stepping- SERR- FastB2B- DisINTx-
         Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- 
<TAbort- <MAbort- >SERR- <PERR- INTx-
         Latency: 0, Cache Line Size: 64 bytes
         Interrupt: pin B routed to IRQ 17
         IOMMU group: 16
         Region 0: Memory at 87000000 (32-bit, non-prefetchable) [size=16K]
         Capabilities: [60] Power Management version 3
                 Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA 
PME(D0-,D1-,D2-,D3hot-,D3cold-)
                 Status: D3 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
         Capabilities: [68] MSI: Enable- Count=1/1 Maskable- 64bit+
                 Address: 0000000000000000  Data: 0000
         Capabilities: [78] Express (v2) Endpoint, IntMsgNum 0
                 DevCap: MaxPayload 256 bytes, PhantFunc 0, Latency L0s 
unlimited, L1 <64us
                         ExtTag+ AttnBtn- AttnInd- PwrInd- RBE+ FLReset- 
SlotPowerLimit 75W TEE-IO-
                 DevCtl: CorrErr+ NonFatalErr+ FatalErr+ UnsupReq+
                         RlxdOrd+ ExtTag+ PhantFunc- AuxPwr- NoSnoop+
                         MaxPayload 256 bytes, MaxReadReq 512 bytes
                 DevSta: CorrErr- NonFatalErr- FatalErr- UnsupReq- 
AuxPwr- TransPend-
                 LnkCap: Port #0, Speed 16GT/s, Width x8, ASPM L1, Exit 
Latency L1 <4us
                         ClockPM+ Surprise- LLActRep- BwNot- ASPMOptComp+
                 LnkCtl: ASPM Disabled; RCB 64 bytes, LnkDisable- CommClk+
                         ExtSynch- ClockPM+ AutWidDis- BWInt- AutBWInt- 
FltModeDis-
                 LnkSta: Speed 16GT/s, Width x8
                         TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
                 DevCap2: Completion Timeout: Range AB, TimeoutDis+ 
NROPrPrP- LTR+
                          10BitTagComp+ 10BitTagReq+ OBFF Via message, 
ExtFmt- EETLPPrefix-
                          EmergencyPowerReduction Not Supported, 
EmergencyPowerReductionInit-
                          FRS- TPHComp- ExtTPHComp-
                          AtomicOpsCap: 32bit- 64bit- 128bitCAS-
                 DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-
                          AtomicOpsCtl: ReqEn-
                          IDOReq- IDOCompl- LTR- EmergencyPowerReductionReq-
                          10BitTagReq- OBFF Disabled, EETLPPrefixBlk-
                 LnkSta2: Current De-emphasis Level: -6dB, 
EqualizationComplete- EqualizationPhase1-
                          EqualizationPhase2- EqualizationPhase3- 
LinkEqualizationRequest-
                          Retimer- 2Retimers- CrosslinkRes: unsupported, 
FltMode-
         Capabilities: [100 v2] Advanced Error Reporting
                 UESta:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- 
UnxCmplt- RxOF- MalfTLP-
                         ECRC- UnsupReq- ACSViol- UncorrIntErr- 
BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
                         PoisonTLPBlocked- DMWrReqBlocked- IDECheck- 
MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
                 UEMsk:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- 
UnxCmplt- RxOF- MalfTLP-
                         ECRC- UnsupReq- ACSViol- UncorrIntErr- 
BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
                         PoisonTLPBlocked- DMWrReqBlocked- IDECheck- 
MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
                 UESvrt: DLP+ SDES+ TLP- FCP+ CmpltTO- CmpltAbrt- 
UnxCmplt- RxOF+ MalfTLP+
                         ECRC- UnsupReq- ACSViol- UncorrIntErr+ 
BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
                         PoisonTLPBlocked- DMWrReqBlocked- IDECheck- 
MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
                 CESta:  RxErr- BadTLP- BadDLLP- Rollover- Timeout- 
AdvNonFatalErr- CorrIntErr- HeaderOF-
                 CEMsk:  RxErr- BadTLP- BadDLLP- Rollover- Timeout- 
AdvNonFatalErr+ CorrIntErr- HeaderOF+
                 AERCap: First Error Pointer: 00, ECRCGenCap- ECRCGenEn- 
ECRCChkCap- ECRCChkEn-
                         MultHdrRecCap- MultHdrRecEn- TLPPfxPres- HdrLogCap-
                 HeaderLog: 00000000 00000000 00000000 00000000
         Capabilities: [160 v1] Data Link Feature <?>
         Kernel driver in use: snd_hda_intel
         Kernel modules: nova_core, snd_hda_intel

0000:02:00.0 PCI bridge: Intel Corporation Thunderbolt 4 Bridge [Maple 
Ridge 4C 2020] (rev 02) (prog-if 00 [Normal decode])
         Subsystem: Acer Incorporated [ALI] Device 166e
         Physical Slot: 24
         Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- 
ParErr- Stepping- SERR- FastB2B- DisINTx-
         Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- 
<TAbort- <MAbort- >SERR- <PERR- INTx-
         Latency: 0, Cache Line Size: 64 bytes
         Interrupt: pin A routed to IRQ 16
         IOMMU group: 17
         Bus: primary=02, secondary=03, subordinate=6b, sec-latency=0
         I/O behind bridge: 6000-7fff [size=8K] [16-bit]
         Memory behind bridge: 54000000-81efffff [size=735M] [32-bit]
         Prefetchable memory behind bridge: 6210000000-625a0fffff 
[size=1185M] [32-bit]
         Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=fast >TAbort- 
<TAbort- <MAbort- <SERR- <PERR-
         BridgeCtl: Parity- SERR+ NoISA- VGA- VGA16- MAbort- >Reset- 
FastB2B-
                 PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-
         Capabilities: [80] Power Management version 3
                 Flags: PMEClk- DSI- D1+ D2+ AuxCurrent=375mA 
PME(D0+,D1+,D2+,D3hot+,D3cold+)
                 Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
         Capabilities: [88] MSI: Enable- Count=1/1 Maskable- 64bit+
                 Address: 0000000000000000  Data: 0000
         Capabilities: [ac] Subsystem: Acer Incorporated [ALI] Device 166e
         Capabilities: [c0] Express (v2) Upstream Port, IntMsgNum 0
                 DevCap: MaxPayload 128 bytes, PhantFunc 0
                         ExtTag+ AttnBtn- AttnInd- PwrInd- RBE+ 
SlotPowerLimit 25W TEE-IO-
                 DevCtl: CorrErr+ NonFatalErr+ FatalErr+ UnsupReq+
                         RlxdOrd+ ExtTag+ PhantFunc- AuxPwr- NoSnoop+
                         MaxPayload 128 bytes, MaxReadReq 512 bytes
                 DevSta: CorrErr- NonFatalErr- FatalErr- UnsupReq- 
AuxPwr+ TransPend-
                 LnkCap: Port #0, Speed 8GT/s, Width x4, ASPM L0s L1, 
Exit Latency L0s <2us, L1 <4us
                         ClockPM+ Surprise- LLActRep- BwNot- ASPMOptComp+
                 LnkCtl: ASPM Disabled; LnkDisable- CommClk+
                         ExtSynch- ClockPM+ AutWidDis- BWInt- AutBWInt- 
FltModeDis-
                 LnkSta: Speed 8GT/s, Width x4
                         TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
                 DevCap2: Completion Timeout: Not Supported, TimeoutDis- 
NROPrPrP- LTR+
                          10BitTagComp- 10BitTagReq- OBFF Not Supported, 
ExtFmt- EETLPPrefix-
                          EmergencyPowerReduction Not Supported, 
EmergencyPowerReductionInit-
                          FRS-
                          AtomicOpsCap: Routing-
                 DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-
                          AtomicOpsCtl: EgressBlck-
                          IDOReq- IDOCompl- LTR+ EmergencyPowerReductionReq-
                          10BitTagReq- OBFF Disabled, EETLPPrefixBlk-
                 LnkCap2: Supported Link Speeds: 2.5-8GT/s, Crosslink- 
Retimer- 2Retimers- DRS-
                 LnkCtl2: Target Link Speed: 8GT/s, EnterCompliance- 
SpeedDis-
                          Transmit Margin: Normal Operating Range, 
EnterModifiedCompliance- ComplianceSOS-
                          Compliance Preset/De-emphasis: -6dB 
de-emphasis, 0dB preshoot
                 LnkSta2: Current De-emphasis Level: -6dB, 
EqualizationComplete+ EqualizationPhase1+
                          EqualizationPhase2+ EqualizationPhase3+ 
LinkEqualizationRequest-
                          Retimer- 2Retimers- CrosslinkRes: unsupported, 
FltMode-
         Capabilities: [50] Capability ID 0x15 [0000]
         Capabilities: [100 v1] Device Serial Number fd-6a-a4-69-46-e9-07-00
         Capabilities: [200 v1] Advanced Error Reporting
                 UESta:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- 
UnxCmplt- RxOF- MalfTLP-
                         ECRC- UnsupReq- ACSViol- UncorrIntErr- 
BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
                         PoisonTLPBlocked- DMWrReqBlocked- IDECheck- 
MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
                 UEMsk:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- 
UnxCmplt- RxOF- MalfTLP-
                         ECRC- UnsupReq- ACSViol- UncorrIntErr- 
BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
                         PoisonTLPBlocked- DMWrReqBlocked- IDECheck- 
MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
                 UESvrt: DLP+ SDES- TLP- FCP+ CmpltTO- CmpltAbrt- 
UnxCmplt- RxOF+ MalfTLP+
                         ECRC- UnsupReq- ACSViol- UncorrIntErr+ 
BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
                         PoisonTLPBlocked- DMWrReqBlocked- IDECheck- 
MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
                 CESta:  RxErr- BadTLP- BadDLLP- Rollover- Timeout- 
AdvNonFatalErr- CorrIntErr- HeaderOF-
                 CEMsk:  RxErr- BadTLP- BadDLLP- Rollover- Timeout- 
AdvNonFatalErr+ CorrIntErr- HeaderOF-
                 AERCap: First Error Pointer: 00, ECRCGenCap- ECRCGenEn- 
ECRCChkCap- ECRCChkEn-
                         MultHdrRecCap- MultHdrRecEn- TLPPfxPres- HdrLogCap-
                 HeaderLog: 00000000 00000000 00000000 00000000
         Capabilities: [300 v1] Virtual Channel
                 Caps:   LPEVC=0 RefClk=100ns PATEntryBits=1
                 Arb:    Fixed- WRR32- WRR64- WRR128-
                 Ctrl:   ArbSelect=Fixed
                 Status: InProgress-
                 VC0:    Caps:   PATOffset=00 MaxTimeSlots=1 RejSnoopTrans-
                         Arb:    Fixed+ WRR32- WRR64- WRR128- TWRR128- 
WRR256-
                         Ctrl:   Enable+ ID=0 ArbSelect=Fixed TC/VC=ff
                         Status: NegoPending- InProgress-
         Capabilities: [400 v1] Power Budgeting <?>
         Capabilities: [500 v1] Vendor Specific Information: ID=1234 
Rev=1 Len=100 <?>
         Capabilities: [600 v1] Vendor Specific Information: ID=8086 
Rev=2 Len=064 <?>
         Capabilities: [700 v1] Secondary PCI Express
                 LnkCtl3: LnkEquIntrruptEn- PerformEqu-
                 LaneErrStat: 0
         Capabilities: [800 v1] Latency Tolerance Reporting
                 Max snoop latency: 3145728ns
                 Max no snoop latency: 3145728ns
         Capabilities: [a00 v1] L1 PM Substates
                 L1SubCap: PCI-PM_L1.2+ PCI-PM_L1.1+ ASPM_L1.2+ 
ASPM_L1.1+ L1_PM_Substates+
                           PortCommonModeRestoreTime=0us 
PortTPowerOnTime=10us
                 L1SubCtl1: PCI-PM_L1.2- PCI-PM_L1.1- ASPM_L1.2- ASPM_L1.1-
                            T_CommonMode=0us LTR1.2_Threshold=0ns
                 L1SubCtl2: T_PwrOn=10us
         Capabilities: [b00 v2] Precision Time Measurement
                 PTMCap: Requester+ Responder+ Root-
                 PTMClockGranularity: Unimplemented
                 PTMControl: Enabled+ RootSelected-
                 PTMEffectiveGranularity: 4ns
         Kernel driver in use: pcieport

0000:03:00.0 PCI bridge: Intel Corporation Thunderbolt 4 Bridge [Maple 
Ridge 4C 2020] (rev 02) (prog-if 00 [Normal decode])
         Subsystem: Acer Incorporated [ALI] Device 166e
         Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- 
ParErr- Stepping- SERR- FastB2B- DisINTx-
         Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- 
<TAbort- <MAbort- >SERR- <PERR- INTx-
         Latency: 0, Cache Line Size: 64 bytes
         Interrupt: pin A routed to IRQ 16
         IOMMU group: 18
         Bus: primary=03, secondary=04, subordinate=04, sec-latency=0
         I/O behind bridge: 0000f000-00000fff [disabled] [32-bit]
         Memory behind bridge: fff00000-000fffff [disabled] [32-bit]
         Prefetchable memory behind bridge: 625a000000-625a0fffff 
[size=1M] [32-bit]
         Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=fast >TAbort- 
<TAbort- <MAbort- <SERR- <PERR-
         BridgeCtl: Parity- SERR+ NoISA- VGA- VGA16- MAbort- >Reset- 
FastB2B-
                 PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-
         Capabilities: [80] Power Management version 3
                 Flags: PMEClk- DSI- D1+ D2+ AuxCurrent=375mA 
PME(D0+,D1+,D2+,D3hot+,D3cold+)
                 Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
         Capabilities: [88] MSI: Enable- Count=1/1 Maskable- 64bit+
                 Address: 0000000000000000  Data: 0000
         Capabilities: [ac] Subsystem: Acer Incorporated [ALI] Device 166e
         Capabilities: [c0] Express (v2) Downstream Port (Slot+), 
IntMsgNum 0
                 DevCap: MaxPayload 128 bytes, PhantFunc 0
                         ExtTag+ RBE+ TEE-IO-
                 DevCtl: CorrErr+ NonFatalErr+ FatalErr+ UnsupReq+
                         RlxdOrd+ ExtTag+ PhantFunc- AuxPwr- NoSnoop+
                         MaxPayload 128 bytes, MaxReadReq 512 bytes
                 DevSta: CorrErr- NonFatalErr- FatalErr- UnsupReq- 
AuxPwr+ TransPend-
                 LnkCap: Port #0, Speed 2.5GT/s, Width x4, ASPM L0s L1, 
Exit Latency L0s <2us, L1 <4us
                         ClockPM- Surprise- LLActRep- BwNot+ ASPMOptComp+
                 LnkCtl: ASPM L1 Enabled; LnkDisable- CommClk+
                         ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt- 
FltModeDis-
                 LnkSta: Speed 2.5GT/s, Width x4
                         TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
                 SltCap: AttnBtn- PwrCtrl- MRL- AttnInd- PwrInd- 
HotPlug- Surprise-
                         Slot #0, PowerLimit 0W; Interlock- NoCompl+
                 SltCtl: Enable: AttnBtn- PwrFlt- MRL- PresDet- CmdCplt- 
HPIrq- LinkChg-
                         Control: AttnInd Unknown, PwrInd Unknown, 
Power- Interlock-
                 SltSta: Status: AttnBtn- PowerFlt- MRL- CmdCplt- 
PresDet+ Interlock-
                         Changed: MRL- PresDet+ LinkState-
                 DevCap2: Completion Timeout: Not Supported, TimeoutDis- 
NROPrPrP- LTR+
                          10BitTagComp- 10BitTagReq- OBFF Not Supported, 
ExtFmt- EETLPPrefix-
                          EmergencyPowerReduction Not Supported, 
EmergencyPowerReductionInit-
                          FRS- ARIFwd-
                          AtomicOpsCap: Routing-
                 DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis- 
ARIFwd-
                          AtomicOpsCtl: EgressBlck-
                          IDOReq- IDOCompl- LTR+ EmergencyPowerReductionReq-
                          10BitTagReq- OBFF Disabled, EETLPPrefixBlk-
                 LnkCap2: Supported Link Speeds: 2.5GT/s, Crosslink- 
Retimer- 2Retimers- DRS-
                 LnkCtl2: Target Link Speed: 2.5GT/s, EnterCompliance- 
SpeedDis-, Selectable De-emphasis: -6dB
                          Transmit Margin: Normal Operating Range, 
EnterModifiedCompliance- ComplianceSOS-
                          Compliance Preset/De-emphasis: -6dB 
de-emphasis, 0dB preshoot
                 LnkSta2: Current De-emphasis Level: -3.5dB, 
EqualizationComplete- EqualizationPhase1-
                          EqualizationPhase2- EqualizationPhase3- 
LinkEqualizationRequest-
                          Retimer- 2Retimers- CrosslinkRes: unsupported, 
FltMode-
         Capabilities: [50] Capability ID 0x15 [0000]
         Capabilities: [100 v1] Device Serial Number fd-6a-a4-69-46-e9-07-00
         Capabilities: [200 v1] Advanced Error Reporting
                 UESta:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- 
UnxCmplt- RxOF- MalfTLP-
                         ECRC- UnsupReq- ACSViol- UncorrIntErr- 
BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
                         PoisonTLPBlocked- DMWrReqBlocked- IDECheck- 
MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
                 UEMsk:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- 
UnxCmplt- RxOF- MalfTLP-
                         ECRC- UnsupReq- ACSViol- UncorrIntErr- 
BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
                         PoisonTLPBlocked- DMWrReqBlocked- IDECheck- 
MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
                 UESvrt: DLP+ SDES- TLP- FCP+ CmpltTO- CmpltAbrt- 
UnxCmplt- RxOF+ MalfTLP+
                         ECRC- UnsupReq- ACSViol- UncorrIntErr+ 
BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
                         PoisonTLPBlocked- DMWrReqBlocked- IDECheck- 
MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
                 CESta:  RxErr- BadTLP- BadDLLP- Rollover- Timeout- 
AdvNonFatalErr- CorrIntErr- HeaderOF-
                 CEMsk:  RxErr- BadTLP- BadDLLP- Rollover- Timeout- 
AdvNonFatalErr+ CorrIntErr- HeaderOF-
                 AERCap: First Error Pointer: 00, ECRCGenCap- ECRCGenEn- 
ECRCChkCap- ECRCChkEn-
                         MultHdrRecCap- MultHdrRecEn- TLPPfxPres- HdrLogCap-
                 HeaderLog: 00000000 00000000 00000000 00000000
         Capabilities: [300 v1] Virtual Channel
                 Caps:   LPEVC=1 RefClk=100ns PATEntryBits=1
                 Arb:    Fixed+ WRR32- WRR64- WRR128-
                 Ctrl:   ArbSelect=Fixed
                 Status: InProgress-
                 VC0:    Caps:   PATOffset=00 MaxTimeSlots=1 RejSnoopTrans-
                         Arb:    Fixed+ WRR32- WRR64- WRR128- TWRR128- 
WRR256-
                         Ctrl:   Enable+ ID=0 ArbSelect=Fixed TC/VC=ff
                         Status: NegoPending- InProgress-
                 VC1:    Caps:   PATOffset=00 MaxTimeSlots=1 RejSnoopTrans-
                         Arb:    Fixed+ WRR32- WRR64- WRR128- TWRR128- 
WRR256-
                         Ctrl:   Enable- ID=1 ArbSelect=Fixed TC/VC=00
                         Status: NegoPending+ InProgress-
         Capabilities: [400 v1] Power Budgeting <?>
         Capabilities: [500 v1] Vendor Specific Information: ID=1234 
Rev=1 Len=100 <?>
         Capabilities: [600 v1] Vendor Specific Information: ID=8086 
Rev=2 Len=064 <?>
         Capabilities: [900 v1] Access Control Services
                 ACSCap: SrcValid+ TransBlk+ ReqRedir+ CmpltRedir+ 
UpstreamFwd+ EgressCtrl+ DirectTrans+
                 ACSCtl: SrcValid+ TransBlk- ReqRedir+ CmpltRedir+ 
UpstreamFwd+ EgressCtrl- DirectTrans-
         Capabilities: [c00 v1] Designated Vendor-Specific: Vendor=8086 
ID=0006 Rev=0 Len=16 <?>
         Kernel driver in use: pcieport

0000:03:01.0 PCI bridge: Intel Corporation Thunderbolt 4 Bridge [Maple 
Ridge 4C 2020] (rev 02) (prog-if 00 [Normal decode])
         Subsystem: Acer Incorporated [ALI] Device 166e
         Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- 
ParErr- Stepping- SERR- FastB2B- DisINTx+
         Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- 
<TAbort- <MAbort- >SERR- <PERR- INTx-
         Latency: 0, Cache Line Size: 64 bytes
         Interrupt: pin A routed to IRQ 126
         IOMMU group: 19
         Bus: primary=03, secondary=05, subordinate=37, sec-latency=0
         I/O behind bridge: 6000-6fff [size=4K] [16-bit]
         Memory behind bridge: 6b000000-81efffff [size=367M] [32-bit]
         Prefetchable memory behind bridge: 6235000000-6259ffffff 
[size=592M] [32-bit]
         Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=fast >TAbort- 
<TAbort- <MAbort- <SERR- <PERR-
         BridgeCtl: Parity- SERR+ NoISA- VGA- VGA16- MAbort- >Reset- 
FastB2B-
                 PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-
         Capabilities: [80] Power Management version 3
                 Flags: PMEClk- DSI- D1+ D2+ AuxCurrent=375mA 
PME(D0+,D1+,D2+,D3hot+,D3cold+)
                 Status: D3 NoSoftRst+ PME-Enable+ DSel=0 DScale=0 PME-
         Capabilities: [88] MSI: Enable+ Count=1/1 Maskable- 64bit+
                 Address: 00000000fee002d8  Data: 0000
         Capabilities: [ac] Subsystem: Acer Incorporated [ALI] Device 166e
         Capabilities: [c0] Express (v2) Downstream Port (Slot+), 
IntMsgNum 0
                 DevCap: MaxPayload 128 bytes, PhantFunc 0
                         ExtTag+ RBE+ TEE-IO-
                 DevCtl: CorrErr+ NonFatalErr+ FatalErr+ UnsupReq+
                         RlxdOrd+ ExtTag+ PhantFunc- AuxPwr- NoSnoop+
                         MaxPayload 128 bytes, MaxReadReq 512 bytes
                 DevSta: CorrErr- NonFatalErr- FatalErr- UnsupReq- 
AuxPwr+ TransPend-
                 LnkCap: Port #1, Speed 2.5GT/s, Width x4, ASPM L1, Exit 
Latency L1 <4us
                         ClockPM- Surprise- LLActRep+ BwNot+ ASPMOptComp+
                 LnkCtl: ASPM L1 Enabled; LnkDisable- CommClk-
                         ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt- 
FltModeDis-
                 LnkSta: Speed 2.5GT/s, Width x4
                         TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
                 SltCap: AttnBtn- PwrCtrl- MRL- AttnInd- PwrInd- 
HotPlug+ Surprise+
                         Slot #1, PowerLimit 0W; Interlock- NoCompl+
                 SltCtl: Enable: AttnBtn- PwrFlt- MRL- PresDet+ CmdCplt- 
HPIrq- LinkChg-
                         Control: AttnInd Unknown, PwrInd Unknown, 
Power- Interlock-
                 SltSta: Status: AttnBtn- PowerFlt- MRL- CmdCplt- 
PresDet- Interlock-
                         Changed: MRL- PresDet- LinkState-
                 DevCap2: Completion Timeout: Not Supported, TimeoutDis- 
NROPrPrP- LTR+
                          10BitTagComp- 10BitTagReq- OBFF Not Supported, 
ExtFmt- EETLPPrefix-
                          EmergencyPowerReduction Not Supported, 
EmergencyPowerReductionInit-
                          FRS- ARIFwd-
                          AtomicOpsCap: Routing-
                 DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis- 
ARIFwd-
                          AtomicOpsCtl: EgressBlck-
                          IDOReq- IDOCompl- LTR- EmergencyPowerReductionReq-
                          10BitTagReq- OBFF Disabled, EETLPPrefixBlk-
                 LnkCap2: Supported Link Speeds: 2.5GT/s, Crosslink- 
Retimer- 2Retimers- DRS-
                 LnkCtl2: Target Link Speed: 2.5GT/s, EnterCompliance- 
SpeedDis-, Selectable De-emphasis: -6dB
                          Transmit Margin: Normal Operating Range, 
EnterModifiedCompliance- ComplianceSOS-
                          Compliance Preset/De-emphasis: -6dB 
de-emphasis, 0dB preshoot
                 LnkSta2: Current De-emphasis Level: -3.5dB, 
EqualizationComplete- EqualizationPhase1-
                          EqualizationPhase2- EqualizationPhase3- 
LinkEqualizationRequest-
                          Retimer- 2Retimers- CrosslinkRes: unsupported, 
FltMode-
         Capabilities: [50] Capability ID 0x15 [0000]
         Capabilities: [100 v1] Device Serial Number fd-6a-a4-69-46-e9-07-00
         Capabilities: [200 v1] Advanced Error Reporting
                 UESta:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- 
UnxCmplt- RxOF- MalfTLP-
                         ECRC- UnsupReq- ACSViol- UncorrIntErr- 
BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
                         PoisonTLPBlocked- DMWrReqBlocked- IDECheck- 
MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
                 UEMsk:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- 
UnxCmplt- RxOF- MalfTLP-
                         ECRC- UnsupReq- ACSViol- UncorrIntErr- 
BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
                         PoisonTLPBlocked- DMWrReqBlocked- IDECheck- 
MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
                 UESvrt: DLP+ SDES- TLP- FCP+ CmpltTO- CmpltAbrt- 
UnxCmplt- RxOF+ MalfTLP+
                         ECRC- UnsupReq- ACSViol- UncorrIntErr+ 
BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
                         PoisonTLPBlocked- DMWrReqBlocked- IDECheck- 
MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
                 CESta:  RxErr- BadTLP- BadDLLP- Rollover- Timeout- 
AdvNonFatalErr- CorrIntErr- HeaderOF-
                 CEMsk:  RxErr- BadTLP- BadDLLP- Rollover- Timeout- 
AdvNonFatalErr+ CorrIntErr- HeaderOF-
                 AERCap: First Error Pointer: 00, ECRCGenCap- ECRCGenEn- 
ECRCChkCap- ECRCChkEn-
                         MultHdrRecCap- MultHdrRecEn- TLPPfxPres- HdrLogCap-
                 HeaderLog: 00000000 00000000 00000000 00000000
         Capabilities: [300 v1] Virtual Channel
                 Caps:   LPEVC=0 RefClk=100ns PATEntryBits=1
                 Arb:    Fixed- WRR32- WRR64- WRR128-
                 Ctrl:   ArbSelect=Fixed
                 Status: InProgress-
                 VC0:    Caps:   PATOffset=00 MaxTimeSlots=1 RejSnoopTrans-
                         Arb:    Fixed+ WRR32- WRR64- WRR128- TWRR128- 
WRR256-
                         Ctrl:   Enable+ ID=0 ArbSelect=Fixed TC/VC=ff
                         Status: NegoPending+ InProgress-
         Capabilities: [400 v1] Power Budgeting <?>
         Capabilities: [500 v1] Vendor Specific Information: ID=1234 
Rev=1 Len=100 <?>
         Capabilities: [600 v1] Vendor Specific Information: ID=8086 
Rev=2 Len=064 <?>
         Capabilities: [900 v1] Access Control Services
                 ACSCap: SrcValid+ TransBlk+ ReqRedir+ CmpltRedir+ 
UpstreamFwd+ EgressCtrl+ DirectTrans+
                 ACSCtl: SrcValid+ TransBlk- ReqRedir+ CmpltRedir+ 
UpstreamFwd+ EgressCtrl- DirectTrans-
         Capabilities: [c00 v1] Designated Vendor-Specific: Vendor=8086 
ID=0006 Rev=0 Len=16 <?>
         Kernel driver in use: pcieport

0000:03:02.0 PCI bridge: Intel Corporation Thunderbolt 4 Bridge [Maple 
Ridge 4C 2020] (rev 02) (prog-if 00 [Normal decode])
         Subsystem: Acer Incorporated [ALI] Device 166e
         Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- 
ParErr- Stepping- SERR- FastB2B- DisINTx-
         Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- 
<TAbort- <MAbort- >SERR- <PERR- INTx-
         Latency: 0, Cache Line Size: 64 bytes
         Interrupt: pin A routed to IRQ 18
         IOMMU group: 20
         Bus: primary=03, secondary=38, subordinate=38, sec-latency=0
         I/O behind bridge: 0000f000-00000fff [disabled] [32-bit]
         Memory behind bridge: 6af00000-6affffff [size=1M] [32-bit]
         Prefetchable memory behind bridge: 
00000000fff00000-00000000000fffff [disabled] [64-bit]
         Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=fast >TAbort- 
<TAbort- <MAbort- <SERR- <PERR-
         BridgeCtl: Parity- SERR+ NoISA- VGA- VGA16- MAbort- >Reset- 
FastB2B-
                 PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-
         Capabilities: [80] Power Management version 3
                 Flags: PMEClk- DSI- D1+ D2+ AuxCurrent=375mA 
PME(D0+,D1+,D2+,D3hot+,D3cold+)
                 Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
         Capabilities: [88] MSI: Enable- Count=1/1 Maskable- 64bit+
                 Address: 0000000000000000  Data: 0000
         Capabilities: [ac] Subsystem: Acer Incorporated [ALI] Device 166e
         Capabilities: [c0] Express (v2) Downstream Port (Slot+), 
IntMsgNum 0
                 DevCap: MaxPayload 128 bytes, PhantFunc 0
                         ExtTag+ RBE+ TEE-IO-
                 DevCtl: CorrErr+ NonFatalErr+ FatalErr+ UnsupReq+
                         RlxdOrd+ ExtTag+ PhantFunc- AuxPwr- NoSnoop+
                         MaxPayload 128 bytes, MaxReadReq 512 bytes
                 DevSta: CorrErr- NonFatalErr- FatalErr- UnsupReq- 
AuxPwr+ TransPend-
                 LnkCap: Port #2, Speed 2.5GT/s, Width x4, ASPM L0s L1, 
Exit Latency L0s <2us, L1 <4us
                         ClockPM- Surprise- LLActRep- BwNot+ ASPMOptComp+
                 LnkCtl: ASPM L1 Enabled; LnkDisable- CommClk+
                         ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt- 
FltModeDis-
                 LnkSta: Speed unknown, Width x4
                         TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
                 SltCap: AttnBtn- PwrCtrl- MRL- AttnInd- PwrInd- 
HotPlug- Surprise-
                         Slot #0, PowerLimit 0W; Interlock- NoCompl+
                 SltCtl: Enable: AttnBtn- PwrFlt- MRL- PresDet- CmdCplt- 
HPIrq- LinkChg-
                         Control: AttnInd Unknown, PwrInd Unknown, 
Power- Interlock-
                 SltSta: Status: AttnBtn- PowerFlt- MRL- CmdCplt- 
PresDet+ Interlock-
                         Changed: MRL- PresDet+ LinkState-
                 DevCap2: Completion Timeout: Not Supported, TimeoutDis- 
NROPrPrP- LTR+
                          10BitTagComp- 10BitTagReq- OBFF Not Supported, 
ExtFmt- EETLPPrefix-
                          EmergencyPowerReduction Not Supported, 
EmergencyPowerReductionInit-
                          FRS- ARIFwd-
                          AtomicOpsCap: Routing-
                 DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis- 
ARIFwd-
                          AtomicOpsCtl: EgressBlck-
                          IDOReq- IDOCompl- LTR+ EmergencyPowerReductionReq-
                          10BitTagReq- OBFF Disabled, EETLPPrefixBlk-
                 LnkCap2: Supported Link Speeds: 2.5GT/s, Crosslink- 
Retimer- 2Retimers- DRS-
                 LnkCtl2: Target Link Speed: 2.5GT/s, EnterCompliance- 
SpeedDis-, Selectable De-emphasis: -6dB
                          Transmit Margin: Normal Operating Range, 
EnterModifiedCompliance- ComplianceSOS-
                          Compliance Preset/De-emphasis: -6dB 
de-emphasis, 0dB preshoot
                 LnkSta2: Current De-emphasis Level: -6dB, 
EqualizationComplete- EqualizationPhase1-
                          EqualizationPhase2- EqualizationPhase3- 
LinkEqualizationRequest-
                          Retimer- 2Retimers- CrosslinkRes: unsupported, 
FltMode-
         Capabilities: [50] Capability ID 0x15 [0000]
         Capabilities: [100 v1] Device Serial Number fd-6a-a4-69-46-e9-07-00
         Capabilities: [200 v1] Advanced Error Reporting
                 UESta:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- 
UnxCmplt- RxOF- MalfTLP-
                         ECRC- UnsupReq- ACSViol- UncorrIntErr- 
BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
                         PoisonTLPBlocked- DMWrReqBlocked- IDECheck- 
MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
                 UEMsk:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- 
UnxCmplt- RxOF- MalfTLP-
                         ECRC- UnsupReq- ACSViol- UncorrIntErr- 
BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
                         PoisonTLPBlocked- DMWrReqBlocked- IDECheck- 
MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
                 UESvrt: DLP+ SDES- TLP- FCP+ CmpltTO- CmpltAbrt- 
UnxCmplt- RxOF+ MalfTLP+
                         ECRC- UnsupReq- ACSViol- UncorrIntErr+ 
BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
                         PoisonTLPBlocked- DMWrReqBlocked- IDECheck- 
MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
                 CESta:  RxErr- BadTLP- BadDLLP- Rollover- Timeout- 
AdvNonFatalErr- CorrIntErr- HeaderOF-
                 CEMsk:  RxErr- BadTLP- BadDLLP- Rollover- Timeout- 
AdvNonFatalErr+ CorrIntErr- HeaderOF-
                 AERCap: First Error Pointer: 00, ECRCGenCap- ECRCGenEn- 
ECRCChkCap- ECRCChkEn-
                         MultHdrRecCap- MultHdrRecEn- TLPPfxPres- HdrLogCap-
                 HeaderLog: 00000000 00000000 00000000 00000000
         Capabilities: [300 v1] Virtual Channel
                 Caps:   LPEVC=0 RefClk=100ns PATEntryBits=1
                 Arb:    Fixed- WRR32- WRR64- WRR128-
                 Ctrl:   ArbSelect=Fixed
                 Status: InProgress-
                 VC0:    Caps:   PATOffset=00 MaxTimeSlots=1 RejSnoopTrans-
                         Arb:    Fixed+ WRR32- WRR64- WRR128- TWRR128- 
WRR256-
                         Ctrl:   Enable+ ID=0 ArbSelect=Fixed TC/VC=ff
                         Status: NegoPending- InProgress-
         Capabilities: [400 v1] Power Budgeting <?>
         Capabilities: [500 v1] Vendor Specific Information: ID=1234 
Rev=1 Len=100 <?>
         Capabilities: [900 v1] Access Control Services
                 ACSCap: SrcValid+ TransBlk+ ReqRedir+ CmpltRedir+ 
UpstreamFwd+ EgressCtrl+ DirectTrans+
                 ACSCtl: SrcValid+ TransBlk- ReqRedir+ CmpltRedir+ 
UpstreamFwd+ EgressCtrl- DirectTrans-
         Capabilities: [c00 v1] Designated Vendor-Specific: Vendor=8086 
ID=0006 Rev=0 Len=16 <?>
         Kernel driver in use: pcieport

0000:03:03.0 PCI bridge: Intel Corporation Thunderbolt 4 Bridge [Maple 
Ridge 4C 2020] (rev 02) (prog-if 00 [Normal decode])
         Subsystem: Acer Incorporated [ALI] Device 166e
         Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- 
ParErr- Stepping- SERR- FastB2B- DisINTx+
         Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- 
<TAbort- <MAbort- >SERR- <PERR- INTx-
         Latency: 0, Cache Line Size: 64 bytes
         Interrupt: pin A routed to IRQ 127
         IOMMU group: 21
         Bus: primary=03, secondary=39, subordinate=6b, sec-latency=0
         I/O behind bridge: 7000-7fff [size=4K] [16-bit]
         Memory behind bridge: 54000000-6aefffff [size=367M] [32-bit]
         Prefetchable memory behind bridge: 6210000000-6234ffffff 
[size=592M] [32-bit]
         Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=fast >TAbort- 
<TAbort- <MAbort- <SERR- <PERR-
         BridgeCtl: Parity- SERR+ NoISA- VGA- VGA16- MAbort- >Reset- 
FastB2B-
                 PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-
         Capabilities: [80] Power Management version 3
                 Flags: PMEClk- DSI- D1+ D2+ AuxCurrent=375mA 
PME(D0+,D1+,D2+,D3hot+,D3cold+)
                 Status: D3 NoSoftRst+ PME-Enable+ DSel=0 DScale=0 PME-
         Capabilities: [88] MSI: Enable+ Count=1/1 Maskable- 64bit+
                 Address: 00000000fee00318  Data: 0000
         Capabilities: [ac] Subsystem: Acer Incorporated [ALI] Device 166e
         Capabilities: [c0] Express (v2) Downstream Port (Slot+), 
IntMsgNum 0
                 DevCap: MaxPayload 128 bytes, PhantFunc 0
                         ExtTag+ RBE+ TEE-IO-
                 DevCtl: CorrErr+ NonFatalErr+ FatalErr+ UnsupReq+
                         RlxdOrd+ ExtTag+ PhantFunc- AuxPwr- NoSnoop+
                         MaxPayload 128 bytes, MaxReadReq 512 bytes
                 DevSta: CorrErr- NonFatalErr- FatalErr- UnsupReq- 
AuxPwr+ TransPend-
                 LnkCap: Port #3, Speed 2.5GT/s, Width x4, ASPM L1, Exit 
Latency L1 <4us
                         ClockPM- Surprise- LLActRep+ BwNot+ ASPMOptComp+
                 LnkCtl: ASPM L1 Enabled; LnkDisable- CommClk-
                         ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt- 
FltModeDis-
                 LnkSta: Speed 2.5GT/s, Width x4
                         TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
                 SltCap: AttnBtn- PwrCtrl- MRL- AttnInd- PwrInd- 
HotPlug+ Surprise+
                         Slot #3, PowerLimit 0W; Interlock- NoCompl+
                 SltCtl: Enable: AttnBtn- PwrFlt- MRL- PresDet+ CmdCplt- 
HPIrq- LinkChg-
                         Control: AttnInd Unknown, PwrInd Unknown, 
Power- Interlock-
                 SltSta: Status: AttnBtn- PowerFlt- MRL- CmdCplt- 
PresDet- Interlock-
                         Changed: MRL- PresDet- LinkState-
                 DevCap2: Completion Timeout: Not Supported, TimeoutDis- 
NROPrPrP- LTR+
                          10BitTagComp- 10BitTagReq- OBFF Not Supported, 
ExtFmt- EETLPPrefix-
                          EmergencyPowerReduction Not Supported, 
EmergencyPowerReductionInit-
                          FRS- ARIFwd-
                          AtomicOpsCap: Routing-
                 DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis- 
ARIFwd-
                          AtomicOpsCtl: EgressBlck-
                          IDOReq- IDOCompl- LTR- EmergencyPowerReductionReq-
                          10BitTagReq- OBFF Disabled, EETLPPrefixBlk-
                 LnkCap2: Supported Link Speeds: 2.5GT/s, Crosslink- 
Retimer- 2Retimers- DRS-
                 LnkCtl2: Target Link Speed: 2.5GT/s, EnterCompliance- 
SpeedDis-, Selectable De-emphasis: -6dB
                          Transmit Margin: Normal Operating Range, 
EnterModifiedCompliance- ComplianceSOS-
                          Compliance Preset/De-emphasis: -6dB 
de-emphasis, 0dB preshoot
                 LnkSta2: Current De-emphasis Level: -3.5dB, 
EqualizationComplete- EqualizationPhase1-
                          EqualizationPhase2- EqualizationPhase3- 
LinkEqualizationRequest-
                          Retimer- 2Retimers- CrosslinkRes: unsupported, 
FltMode-
         Capabilities: [50] Capability ID 0x15 [0000]
         Capabilities: [100 v1] Device Serial Number fd-6a-a4-69-46-e9-07-00
         Capabilities: [200 v1] Advanced Error Reporting
                 UESta:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- 
UnxCmplt- RxOF- MalfTLP-
                         ECRC- UnsupReq- ACSViol- UncorrIntErr- 
BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
                         PoisonTLPBlocked- DMWrReqBlocked- IDECheck- 
MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
                 UEMsk:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- 
UnxCmplt- RxOF- MalfTLP-
                         ECRC- UnsupReq- ACSViol- UncorrIntErr- 
BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
                         PoisonTLPBlocked- DMWrReqBlocked- IDECheck- 
MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
                 UESvrt: DLP+ SDES- TLP- FCP+ CmpltTO- CmpltAbrt- 
UnxCmplt- RxOF+ MalfTLP+
                         ECRC- UnsupReq- ACSViol- UncorrIntErr+ 
BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
                         PoisonTLPBlocked- DMWrReqBlocked- IDECheck- 
MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
                 CESta:  RxErr- BadTLP- BadDLLP- Rollover- Timeout- 
AdvNonFatalErr- CorrIntErr- HeaderOF-
                 CEMsk:  RxErr- BadTLP- BadDLLP- Rollover- Timeout- 
AdvNonFatalErr+ CorrIntErr- HeaderOF-
                 AERCap: First Error Pointer: 00, ECRCGenCap- ECRCGenEn- 
ECRCChkCap- ECRCChkEn-
                         MultHdrRecCap- MultHdrRecEn- TLPPfxPres- HdrLogCap-
                 HeaderLog: 00000000 00000000 00000000 00000000
         Capabilities: [300 v1] Virtual Channel
                 Caps:   LPEVC=0 RefClk=100ns PATEntryBits=1
                 Arb:    Fixed- WRR32- WRR64- WRR128-
                 Ctrl:   ArbSelect=Fixed
                 Status: InProgress-
                 VC0:    Caps:   PATOffset=00 MaxTimeSlots=1 RejSnoopTrans-
                         Arb:    Fixed+ WRR32- WRR64- WRR128- TWRR128- 
WRR256-
                         Ctrl:   Enable+ ID=0 ArbSelect=Fixed TC/VC=ff
                         Status: NegoPending+ InProgress-
         Capabilities: [400 v1] Power Budgeting <?>
         Capabilities: [500 v1] Vendor Specific Information: ID=1234 
Rev=1 Len=100 <?>
         Capabilities: [600 v1] Vendor Specific Information: ID=8086 
Rev=2 Len=064 <?>
         Capabilities: [900 v1] Access Control Services
                 ACSCap: SrcValid+ TransBlk+ ReqRedir+ CmpltRedir+ 
UpstreamFwd+ EgressCtrl+ DirectTrans+
                 ACSCtl: SrcValid+ TransBlk- ReqRedir+ CmpltRedir+ 
UpstreamFwd+ EgressCtrl- DirectTrans-
         Capabilities: [c00 v1] Designated Vendor-Specific: Vendor=8086 
ID=0006 Rev=0 Len=16 <?>
         Kernel driver in use: pcieport

0000:04:00.0 USB controller: Intel Corporation Thunderbolt 4 NHI [Maple 
Ridge 4C 2020] (prog-if 40 [USB4 Host Interface])
         Subsystem: Acer Incorporated [ALI] Device 166e
         Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- 
ParErr- Stepping- SERR- FastB2B- DisINTx+
         Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- 
<TAbort- <MAbort- >SERR- <PERR- INTx-
         Latency: 0, Cache Line Size: 64 bytes
         Interrupt: pin A routed to IRQ 16
         IOMMU group: 22
         Region 0: Memory at 625a000000 (64-bit, prefetchable) [size=256K]
         Region 2: Memory at 625a040000 (64-bit, prefetchable) [size=4K]
         Capabilities: [80] Power Management version 3
                 Flags: PMEClk- DSI- D1+ D2+ AuxCurrent=375mA 
PME(D0+,D1+,D2+,D3hot+,D3cold+)
                 Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
         Capabilities: [88] MSI: Enable- Count=1/1 Maskable- 64bit+
                 Address: 0000000000000000  Data: 0000
         Capabilities: [c0] Express (v2) Endpoint, IntMsgNum 0
                 DevCap: MaxPayload 128 bytes, PhantFunc 0, Latency L0s 
unlimited, L1 unlimited
                         ExtTag+ AttnBtn- AttnInd- PwrInd- RBE+ FLReset- 
SlotPowerLimit 0W TEE-IO-
                 DevCtl: CorrErr+ NonFatalErr+ FatalErr+ UnsupReq+
                         RlxdOrd+ ExtTag+ PhantFunc- AuxPwr- NoSnoop+
                         MaxPayload 128 bytes, MaxReadReq 512 bytes
                 DevSta: CorrErr- NonFatalErr- FatalErr- UnsupReq- 
AuxPwr+ TransPend-
                 LnkCap: Port #0, Speed 2.5GT/s, Width x4, ASPM L1, Exit 
Latency L1 <1us
                         ClockPM+ Surprise- LLActRep- BwNot- ASPMOptComp-
                 LnkCtl: ASPM L1 Enabled; RCB 64 bytes, LnkDisable- CommClk+
                         ExtSynch- ClockPM+ AutWidDis- BWInt- AutBWInt- 
FltModeDis-
                 LnkSta: Speed 2.5GT/s, Width x4
                         TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
                 DevCap2: Completion Timeout: Range B, TimeoutDis+ 
NROPrPrP- LTR+
                          10BitTagComp- 10BitTagReq- OBFF Not Supported, 
ExtFmt- EETLPPrefix-
                          EmergencyPowerReduction Not Supported, 
EmergencyPowerReductionInit-
                          FRS- TPHComp- ExtTPHComp-
                          AtomicOpsCap: 32bit- 64bit- 128bitCAS-
                 DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-
                          AtomicOpsCtl: ReqEn-
                          IDOReq- IDOCompl- LTR+ EmergencyPowerReductionReq-
                          10BitTagReq- OBFF Disabled, EETLPPrefixBlk-
                 LnkCtl2: Target Link Speed: 2.5GT/s, EnterCompliance- 
SpeedDis-
                          Transmit Margin: Normal Operating Range, 
EnterModifiedCompliance- ComplianceSOS-
                          Compliance Preset/De-emphasis: -6dB 
de-emphasis, 0dB preshoot
                 LnkSta2: Current De-emphasis Level: -3.5dB, 
EqualizationComplete- EqualizationPhase1-
                          EqualizationPhase2- EqualizationPhase3- 
LinkEqualizationRequest-
                          Retimer- 2Retimers- CrosslinkRes: unsupported, 
FltMode-
         Capabilities: [a0] MSI-X: Enable+ Count=16 Masked-
                 Vector table: BAR=2 offset=00000000
                 PBA: BAR=2 offset=00000fa0
         Capabilities: [100 v1] Device Serial Number fd-6a-a4-69-46-e9-07-00
         Capabilities: [200 v1] Advanced Error Reporting
                 UESta:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- 
UnxCmplt- RxOF- MalfTLP-
                         ECRC- UnsupReq- ACSViol- UncorrIntErr- 
BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
                         PoisonTLPBlocked- DMWrReqBlocked- IDECheck- 
MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
                 UEMsk:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- 
UnxCmplt- RxOF- MalfTLP-
                         ECRC- UnsupReq- ACSViol- UncorrIntErr- 
BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
                         PoisonTLPBlocked- DMWrReqBlocked- IDECheck- 
MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
                 UESvrt: DLP+ SDES+ TLP- FCP+ CmpltTO- CmpltAbrt- 
UnxCmplt- RxOF+ MalfTLP+
                         ECRC- UnsupReq- ACSViol- UncorrIntErr- 
BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
                         PoisonTLPBlocked- DMWrReqBlocked- IDECheck- 
MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
                 CESta:  RxErr- BadTLP- BadDLLP- Rollover- Timeout- 
AdvNonFatalErr- CorrIntErr- HeaderOF-
                 CEMsk:  RxErr- BadTLP- BadDLLP- Rollover- Timeout- 
AdvNonFatalErr+ CorrIntErr- HeaderOF-
                 AERCap: First Error Pointer: 00, ECRCGenCap- ECRCGenEn- 
ECRCChkCap- ECRCChkEn-
                         MultHdrRecCap- MultHdrRecEn- TLPPfxPres- HdrLogCap-
                 HeaderLog: 00000000 00000000 00000000 00000000
         Capabilities: [300 v1] Virtual Channel
                 Caps:   LPEVC=0 RefClk=100ns PATEntryBits=1
                 Arb:    Fixed- WRR32- WRR64- WRR128-
                 Ctrl:   ArbSelect=Fixed
                 Status: InProgress-
                 VC0:    Caps:   PATOffset=00 MaxTimeSlots=1 RejSnoopTrans-
                         Arb:    Fixed- WRR32- WRR64- WRR128- TWRR128- 
WRR256-
                         Ctrl:   Enable+ ID=0 ArbSelect=Fixed TC/VC=ff
                         Status: NegoPending- InProgress-
         Capabilities: [400 v1] Power Budgeting <?>
         Capabilities: [500 v1] Vendor Specific Information: ID=1234 
Rev=1 Len=100 <?>
         Capabilities: [600 v1] Latency Tolerance Reporting
                 Max snoop latency: 3145728ns
                 Max no snoop latency: 3145728ns
         Kernel driver in use: thunderbolt
         Kernel modules: thunderbolt

0000:38:00.0 USB controller: Intel Corporation Thunderbolt 4 USB 
Controller [Maple Ridge 4C 2020] (prog-if 30 [XHCI])
         Control: I/O- Mem+ BusMaster- SpecCycle- MemWINV- VGASnoop- 
ParErr- Stepping- SERR- FastB2B- DisINTx+
         Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- 
<TAbort- <MAbort- >SERR- <PERR- INTx-
         Interrupt: pin ? routed to IRQ 136
         IOMMU group: 23
         Region 0: Memory at 6af00000 (64-bit, non-prefetchable) [size=64K]
         Capabilities: [70] Power Management version 3
                 Flags: PMEClk- DSI- D1- D2- AuxCurrent=375mA 
PME(D0-,D1-,D2-,D3hot+,D3cold+)
                 Status: D3 NoSoftRst+ PME-Enable+ DSel=0 DScale=0 PME-
         Capabilities: [80] MSI: Enable+ Count=8/8 Maskable- 64bit+
                 Address: 00000000fee00518  Data: 0000
         Capabilities: [90] Vendor Specific Information: Intel <unknown>
         Capabilities: [b0] Vendor Specific Information: Intel 
Capabilities v1
         Capabilities: [bc] Express (v2) Endpoint, IntMsgNum 0
                 DevCap: MaxPayload 256 bytes, PhantFunc 0, Latency L0s 
<2us, L1 <8us
                         ExtTag+ AttnBtn- AttnInd- PwrInd- RBE+ FLReset- 
SlotPowerLimit 0W TEE-IO-
                 DevCtl: CorrErr- NonFatalErr- FatalErr- UnsupReq-
                         RlxdOrd+ ExtTag+ PhantFunc- AuxPwr- NoSnoop+
                         MaxPayload 128 bytes, MaxReadReq 512 bytes
                 DevSta: CorrErr- NonFatalErr- FatalErr- UnsupReq- 
AuxPwr+ TransPend-
                 LnkCap: Port #0, Speed 2.5GT/s, Width x4, ASPM L1, Exit 
Latency L1 <1us
                         ClockPM+ Surprise- LLActRep- BwNot- ASPMOptComp+
                 LnkCtl: ASPM L1 Enabled; RCB 64 bytes, LnkDisable- CommClk+
                         ExtSynch- ClockPM+ AutWidDis- BWInt- AutBWInt- 
FltModeDis-
                 LnkSta: Speed 2.5GT/s, Width x4
                         TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
                 DevCap2: Completion Timeout: Not Supported, TimeoutDis+ 
NROPrPrP- LTR+
                          10BitTagComp- 10BitTagReq- OBFF Not Supported, 
ExtFmt- EETLPPrefix-
                          EmergencyPowerReduction Not Supported, 
EmergencyPowerReductionInit-
                          FRS- TPHComp- ExtTPHComp-
                          AtomicOpsCap: 32bit- 64bit- 128bitCAS-
                 DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-
                          AtomicOpsCtl: ReqEn-
                          IDOReq- IDOCompl- LTR+ EmergencyPowerReductionReq-
                          10BitTagReq- OBFF Disabled, EETLPPrefixBlk-
                 LnkCap2: Supported Link Speeds: 2.5-8GT/s, Crosslink- 
Retimer- 2Retimers- DRS-
                 LnkCtl2: Target Link Speed: 2.5GT/s, EnterCompliance- 
SpeedDis-
                          Transmit Margin: Normal Operating Range, 
EnterModifiedCompliance- ComplianceSOS-
                          Compliance Preset/De-emphasis: -6dB 
de-emphasis, 0dB preshoot
                 LnkSta2: Current De-emphasis Level: -6dB, 
EqualizationComplete- EqualizationPhase1-
                          EqualizationPhase2- EqualizationPhase3- 
LinkEqualizationRequest-
                          Retimer- 2Retimers- CrosslinkRes: unsupported, 
FltMode-
         Capabilities: [100 v1] Latency Tolerance Reporting
                 Max snoop latency: 3145728ns
                 Max no snoop latency: 3145728ns
         Kernel driver in use: xhci_hcd

0000:6c:00.0 Unassigned class [ff00]: Realtek Semiconductor Co., Ltd. 
RTS522A PCI Express Card Reader (rev 01)
         Subsystem: Acer Incorporated [ALI] Device 170f
         Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- 
ParErr- Stepping- SERR- FastB2B- DisINTx+
         Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- 
<TAbort- <MAbort- >SERR- <PERR- INTx-
         Latency: 0, Cache Line Size: 64 bytes
         Interrupt: pin A routed to IRQ 163
         IOMMU group: 24
         Region 0: Memory at 82200000 (32-bit, non-prefetchable) [size=4K]
         Capabilities: [40] Power Management version 3
                 Flags: PMEClk- DSI- D1+ D2+ AuxCurrent=375mA 
PME(D0-,D1+,D2+,D3hot+,D3cold+)
                 Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-
         Capabilities: [50] MSI: Enable+ Count=1/1 Maskable- 64bit+
                 Address: 00000000fee007f8  Data: 0000
         Capabilities: [70] Express (v2) Endpoint, IntMsgNum 0
                 DevCap: MaxPayload 128 bytes, PhantFunc 0, Latency L0s 
unlimited, L1 unlimited
                         ExtTag- AttnBtn- AttnInd- PwrInd- RBE+ FLReset- 
SlotPowerLimit 10W TEE-IO-
                 DevCtl: CorrErr+ NonFatalErr+ FatalErr+ UnsupReq+
                         RlxdOrd+ ExtTag- PhantFunc- AuxPwr- NoSnoop-
                         MaxPayload 128 bytes, MaxReadReq 512 bytes
                 DevSta: CorrErr- NonFatalErr- FatalErr- UnsupReq- 
AuxPwr+ TransPend-
                 LnkCap: Port #0, Speed 2.5GT/s, Width x1, ASPM L0s L1, 
Exit Latency L0s unlimited, L1 <64us
                         ClockPM+ Surprise- LLActRep- BwNot- ASPMOptComp+
                 LnkCtl: ASPM L1 Enabled; RCB 64 bytes, LnkDisable- CommClk+
                         ExtSynch- ClockPM+ AutWidDis- BWInt- AutBWInt- 
FltModeDis-
                 LnkSta: Speed 2.5GT/s, Width x1
                         TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
                 DevCap2: Completion Timeout: Not Supported, TimeoutDis+ 
NROPrPrP- LTR+
                          10BitTagComp- 10BitTagReq- OBFF Via 
message/WAKE#, ExtFmt- EETLPPrefix-
                          EmergencyPowerReduction Not Supported, 
EmergencyPowerReductionInit-
                          FRS- TPHComp- ExtTPHComp-
                          AtomicOpsCap: 32bit- 64bit- 128bitCAS-
                 DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-
                          AtomicOpsCtl: ReqEn-
                          IDOReq- IDOCompl- LTR+ EmergencyPowerReductionReq-
                          10BitTagReq- OBFF Disabled, EETLPPrefixBlk-
                 LnkCtl2: Target Link Speed: 2.5GT/s, EnterCompliance- 
SpeedDis-
                          Transmit Margin: Normal Operating Range, 
EnterModifiedCompliance- ComplianceSOS-
                          Compliance Preset/De-emphasis: -6dB 
de-emphasis, 0dB preshoot
                 LnkSta2: Current De-emphasis Level: -3.5dB, 
EqualizationComplete- EqualizationPhase1-
                          EqualizationPhase2- EqualizationPhase3- 
LinkEqualizationRequest-
                          Retimer- 2Retimers- CrosslinkRes: unsupported, 
FltMode-
         Capabilities: [100 v2] Advanced Error Reporting
                 UESta:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- 
UnxCmplt- RxOF- MalfTLP-
                         ECRC- UnsupReq- ACSViol- UncorrIntErr- 
BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
                         PoisonTLPBlocked- DMWrReqBlocked- IDECheck- 
MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
                 UEMsk:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- 
UnxCmplt- RxOF- MalfTLP-
                         ECRC- UnsupReq- ACSViol- UncorrIntErr+ 
BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
                         PoisonTLPBlocked- DMWrReqBlocked- IDECheck- 
MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
                 UESvrt: DLP+ SDES+ TLP- FCP+ CmpltTO- CmpltAbrt- 
UnxCmplt- RxOF+ MalfTLP+
                         ECRC- UnsupReq- ACSViol- UncorrIntErr+ 
BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
                         PoisonTLPBlocked- DMWrReqBlocked- IDECheck- 
MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
                 CESta:  RxErr- BadTLP- BadDLLP- Rollover- Timeout- 
AdvNonFatalErr- CorrIntErr- HeaderOF-
                 CEMsk:  RxErr- BadTLP- BadDLLP- Rollover- Timeout- 
AdvNonFatalErr+ CorrIntErr+ HeaderOF-
                 AERCap: First Error Pointer: 00, ECRCGenCap+ ECRCGenEn- 
ECRCChkCap+ ECRCChkEn-
                         MultHdrRecCap- MultHdrRecEn- TLPPfxPres- HdrLogCap-
                 HeaderLog: 00000000 00000000 00000000 00000000
         Capabilities: [140 v1] Device Serial Number 00-00-00-01-00-4c-e0-00
         Capabilities: [150 v1] Latency Tolerance Reporting
                 Max snoop latency: 3145728ns
                 Max no snoop latency: 3145728ns
         Capabilities: [158 v1] L1 PM Substates
                 L1SubCap: PCI-PM_L1.2+ PCI-PM_L1.1+ ASPM_L1.2+ 
ASPM_L1.1+ L1_PM_Substates+
                           PortCommonModeRestoreTime=60us 
PortTPowerOnTime=60us
                 L1SubCtl1: PCI-PM_L1.2+ PCI-PM_L1.1+ ASPM_L1.2+ ASPM_L1.1+
                            T_CommonMode=0us LTR1.2_Threshold=126976ns
                 L1SubCtl2: T_PwrOn=60us
         Kernel driver in use: rtsx_pci
         Kernel modules: rtsx_pci

0000:6d:00.0 Ethernet controller: Realtek Semiconductor Co., Ltd. Killer 
E2600 GbE Controller (rev 21)
         Subsystem: Acer Incorporated [ALI] Device 170f
         Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- 
ParErr- Stepping- SERR- FastB2B- DisINTx+
         Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- 
<TAbort- <MAbort- >SERR- <PERR- INTx-
         Latency: 0, Cache Line Size: 64 bytes
         Interrupt: pin A routed to IRQ 18
         IOMMU group: 25
         Region 0: I/O ports at 3000 [size=256]
         Region 2: Memory at 82104000 (64-bit, non-prefetchable) [size=4K]
         Region 4: Memory at 82100000 (64-bit, non-prefetchable) [size=16K]
         Capabilities: [40] Power Management version 3
                 Flags: PMEClk- DSI- D1+ D2+ AuxCurrent=375mA 
PME(D0+,D1+,D2+,D3hot+,D3cold+)
                 Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
         Capabilities: [50] MSI: Enable- Count=1/1 Maskable- 64bit+
                 Address: 0000000000000000  Data: 0000
         Capabilities: [70] Express (v2) Endpoint, IntMsgNum 1
                 DevCap: MaxPayload 128 bytes, PhantFunc 0, Latency L0s 
<512ns, L1 <64us
                         ExtTag- AttnBtn- AttnInd- PwrInd- RBE+ FLReset- 
SlotPowerLimit 10W TEE-IO-
                 DevCtl: CorrErr+ NonFatalErr+ FatalErr+ UnsupReq+
                         RlxdOrd+ ExtTag- PhantFunc- AuxPwr- NoSnoop-
                         MaxPayload 128 bytes, MaxReadReq 4096 bytes
                 DevSta: CorrErr- NonFatalErr- FatalErr- UnsupReq- 
AuxPwr+ TransPend-
                 LnkCap: Port #0, Speed 2.5GT/s, Width x1, ASPM L0s L1, 
Exit Latency L0s unlimited, L1 <64us
                         ClockPM+ Surprise- LLActRep- BwNot- ASPMOptComp+
                 LnkCtl: ASPM Disabled; RCB 64 bytes, LnkDisable- CommClk+
                         ExtSynch- ClockPM+ AutWidDis- BWInt- AutBWInt- 
FltModeDis-
                 LnkSta: Speed 2.5GT/s, Width x1
                         TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
                 DevCap2: Completion Timeout: Range ABCD, TimeoutDis+ 
NROPrPrP- LTR+
                          10BitTagComp- 10BitTagReq- OBFF Via 
message/WAKE#, ExtFmt- EETLPPrefix-
                          EmergencyPowerReduction Not Supported, 
EmergencyPowerReductionInit-
                          FRS- TPHComp- ExtTPHComp-
                          AtomicOpsCap: 32bit- 64bit- 128bitCAS-
                 DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-
                          AtomicOpsCtl: ReqEn-
                          IDOReq- IDOCompl- LTR+ EmergencyPowerReductionReq-
                          10BitTagReq- OBFF Disabled, EETLPPrefixBlk-
                 LnkCap2: Supported Link Speeds: 2.5GT/s, Crosslink- 
Retimer- 2Retimers- DRS-
                 LnkCtl2: Target Link Speed: 2.5GT/s, EnterCompliance- 
SpeedDis-
                          Transmit Margin: Normal Operating Range, 
EnterModifiedCompliance- ComplianceSOS-
                          Compliance Preset/De-emphasis: -6dB 
de-emphasis, 0dB preshoot
                 LnkSta2: Current De-emphasis Level: -6dB, 
EqualizationComplete- EqualizationPhase1-
                          EqualizationPhase2- EqualizationPhase3- 
LinkEqualizationRequest-
                          Retimer- 2Retimers- CrosslinkRes: unsupported, 
FltMode-
         Capabilities: [b0] MSI-X: Enable+ Count=4 Masked-
                 Vector table: BAR=4 offset=00000000
                 PBA: BAR=4 offset=00000800
         Capabilities: [100 v2] Advanced Error Reporting
                 UESta:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- 
UnxCmplt- RxOF- MalfTLP-
                         ECRC- UnsupReq- ACSViol- UncorrIntErr- 
BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
                         PoisonTLPBlocked- DMWrReqBlocked- IDECheck- 
MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
                 UEMsk:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- 
UnxCmplt- RxOF- MalfTLP-
                         ECRC- UnsupReq- ACSViol- UncorrIntErr+ 
BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
                         PoisonTLPBlocked- DMWrReqBlocked- IDECheck- 
MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
                 UESvrt: DLP+ SDES+ TLP- FCP+ CmpltTO- CmpltAbrt- 
UnxCmplt- RxOF+ MalfTLP+
                         ECRC- UnsupReq- ACSViol- UncorrIntErr+ 
BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
                         PoisonTLPBlocked- DMWrReqBlocked- IDECheck- 
MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
                 CESta:  RxErr- BadTLP- BadDLLP- Rollover- Timeout- 
AdvNonFatalErr- CorrIntErr- HeaderOF-
                 CEMsk:  RxErr- BadTLP- BadDLLP- Rollover- Timeout- 
AdvNonFatalErr+ CorrIntErr+ HeaderOF-
                 AERCap: First Error Pointer: 00, ECRCGenCap+ ECRCGenEn- 
ECRCChkCap+ ECRCChkEn-
                         MultHdrRecCap- MultHdrRecEn- TLPPfxPres- HdrLogCap-
                 HeaderLog: 00000000 00000000 00000000 00000000
         Capabilities: [140 v1] Virtual Channel
                 Caps:   LPEVC=0 RefClk=100ns PATEntryBits=1
                 Arb:    Fixed- WRR32- WRR64- WRR128-
                 Ctrl:   ArbSelect=Fixed
                 Status: InProgress-
                 VC0:    Caps:   PATOffset=00 MaxTimeSlots=1 RejSnoopTrans-
                         Arb:    Fixed- WRR32- WRR64- WRR128- TWRR128- 
WRR256-
                         Ctrl:   Enable+ ID=0 ArbSelect=Fixed TC/VC=ff
                         Status: NegoPending- InProgress-
         Capabilities: [160 v1] Device Serial Number 00-00-00-00-00-00-00-00
         Capabilities: [170 v1] Latency Tolerance Reporting
                 Max snoop latency: 3145728ns
                 Max no snoop latency: 3145728ns
         Capabilities: [178 v1] L1 PM Substates
                 L1SubCap: PCI-PM_L1.2+ PCI-PM_L1.1+ ASPM_L1.2+ 
ASPM_L1.1+ L1_PM_Substates+
                           PortCommonModeRestoreTime=150us 
PortTPowerOnTime=150us
                 L1SubCtl1: PCI-PM_L1.2- PCI-PM_L1.1- ASPM_L1.2- ASPM_L1.1-
                            T_CommonMode=0us LTR1.2_Threshold=317440ns
                 L1SubCtl2: T_PwrOn=150us
         Kernel driver in use: r8169
         Kernel modules: r8169

10000:e0:01.0 System peripheral: Intel Corporation RST VMD Managed 
Controller
         Subsystem: Acer Incorporated [ALI] Device 170f
         Control: I/O- Mem- BusMaster- SpecCycle- MemWINV- VGASnoop- 
ParErr- Stepping- SERR- FastB2B- DisINTx-
         Status: Cap- 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- 
<TAbort- <MAbort- >SERR- <PERR- INTx-
         IOMMU group: 6

10000:e0:01.1 PCI bridge: Intel Corporation Device 462d (rev 02) 
(prog-if 00 [Normal decode])
         Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- 
ParErr- Stepping- SERR+ FastB2B- DisINTx+
         Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- 
<TAbort- <MAbort- >SERR- <PERR- INTx-
         Latency: 0
         Interrupt: pin B routed to IRQ 165
         IOMMU group: 6
         Bus: primary=00, secondary=e1, subordinate=e1, sec-latency=0
         I/O behind bridge: f000-0fff [disabled] [16-bit]
         Memory behind bridge: 84000000-840fffff [size=1M] [32-bit]
         Prefetchable memory behind bridge: 
00000000fff00000-00000000000fffff [disabled] [64-bit]
         Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=fast >TAbort- 
<TAbort- <MAbort- <SERR- <PERR-
         BridgeCtl: Parity- SERR+ NoISA- VGA- VGA16- MAbort- >Reset- 
FastB2B-
                 PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-
         Capabilities: [40] Express (v2) Root Port (Slot+), IntMsgNum 0
                 DevCap: MaxPayload 256 bytes, PhantFunc 0
                         ExtTag- RBE+ TEE-IO-
                 DevCtl: CorrErr+ NonFatalErr+ FatalErr+ UnsupReq+
                         RlxdOrd- ExtTag- PhantFunc- AuxPwr- NoSnoop-
                         MaxPayload 256 bytes, MaxReadReq 128 bytes
                 DevSta: CorrErr- NonFatalErr- FatalErr- UnsupReq- 
AuxPwr+ TransPend-
                 LnkCap: Port #4, Speed 32GT/s, Width x8, ASPM L1, Exit 
Latency L1 <16us
                         ClockPM- Surprise- LLActRep+ BwNot+ ASPMOptComp+
                 LnkCtl: ASPM L1 Enabled; RCB 64 bytes, LnkDisable- CommClk+
                         ExtSynch- ClockPM- AutWidDis- BWInt+ AutBWInt+ 
FltModeDis-
                 LnkSta: Speed 16GT/s, Width x4
                         TrErr- Train- SlotClk+ DLActive+ BWMgmt- ABWMgmt-
                 SltCap: AttnBtn- PwrCtrl- MRL- AttnInd- PwrInd- 
HotPlug- Surprise-
                         Slot #2, PowerLimit 75W; Interlock- NoCompl+
                 SltCtl: Enable: AttnBtn- PwrFlt- MRL- PresDet- CmdCplt- 
HPIrq- LinkChg-
                         Control: AttnInd Unknown, PwrInd Unknown, 
Power- Interlock-
                 SltSta: Status: AttnBtn- PowerFlt- MRL- CmdCplt- 
PresDet+ Interlock-
                         Changed: MRL- PresDet+ LinkState+
                 RootCap: CRSVisible-
                 RootCtl: ErrCorrectable- ErrNon-Fatal- ErrFatal- 
PMEIntEna+ CRSVisible-
                 RootSta: PME ReqID 0000, PMEStatus- PMEPending-
                 DevCap2: Completion Timeout: Range ABC, TimeoutDis+ 
NROPrPrP- LTR+
                          10BitTagComp+ 10BitTagReq+ OBFF Not Supported, 
ExtFmt+ EETLPPrefix+, MaxEETLPPrefixes 2
                          EmergencyPowerReduction Not Supported, 
EmergencyPowerReductionInit-
                          FRS- LN System CLS Not Supported, TPHComp- 
ExtTPHComp- ARIFwd+
                          AtomicOpsCap: Routing+ 32bit+ 64bit+ 128bitCAS+
                 DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis- 
ARIFwd-
                          AtomicOpsCtl: ReqEn+ EgressBlck-
                          IDOReq- IDOCompl- LTR+ EmergencyPowerReductionReq-
                          10BitTagReq- OBFF Disabled, EETLPPrefixBlk-
                 LnkCap2: Supported Link Speeds: 2.5-32GT/s, Crosslink- 
Retimer+ 2Retimers+ DRS-
                 LnkCtl2: Target Link Speed: 16GT/s, EnterCompliance- 
SpeedDis-
                          Transmit Margin: Normal Operating Range, 
EnterModifiedCompliance- ComplianceSOS-
                          Compliance Preset/De-emphasis: -6dB 
de-emphasis, 0dB preshoot
                 LnkSta2: Current De-emphasis Level: -3.5dB, 
EqualizationComplete+ EqualizationPhase1+
                          EqualizationPhase2+ EqualizationPhase3+ 
LinkEqualizationRequest-
                          Retimer- 2Retimers- CrosslinkRes: unsupported, 
FltMode-
         Capabilities: [80] MSI: Enable+ Count=1/1 Maskable- 64bit+
                 Address: 00000000fee01000  Data: 0000
         Capabilities: [98] Subsystem: Device 0000:0000
         Capabilities: [a0] Power Management version 3
                 Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA 
PME(D0+,D1-,D2-,D3hot+,D3cold+)
                 Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-
         Capabilities: [100 v1] Advanced Error Reporting
                 UESta:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- 
UnxCmplt- RxOF- MalfTLP-
                         ECRC- UnsupReq- ACSViol- UncorrIntErr- 
BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
                         PoisonTLPBlocked- DMWrReqBlocked- IDECheck- 
MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
                 UEMsk:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- 
UnxCmplt+ RxOF- MalfTLP-
                         ECRC- UnsupReq- ACSViol- UncorrIntErr- 
BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
                         PoisonTLPBlocked- DMWrReqBlocked- IDECheck- 
MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
                 UESvrt: DLP+ SDES- TLP- FCP- CmpltTO- CmpltAbrt- 
UnxCmplt- RxOF+ MalfTLP+
                         ECRC- UnsupReq- ACSViol- UncorrIntErr- 
BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
                         PoisonTLPBlocked- DMWrReqBlocked- IDECheck- 
MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
                 CESta:  RxErr- BadTLP- BadDLLP- Rollover- Timeout- 
AdvNonFatalErr- CorrIntErr- HeaderOF-
                 CEMsk:  RxErr- BadTLP- BadDLLP- Rollover- Timeout- 
AdvNonFatalErr+ CorrIntErr- HeaderOF-
                 AERCap: First Error Pointer: 00, ECRCGenCap- ECRCGenEn- 
ECRCChkCap- ECRCChkEn-
                         MultHdrRecCap- MultHdrRecEn- TLPPfxPres- HdrLogCap-
                 HeaderLog: 00000000 00000000 00000000 00000000
                 RootCmd: CERptEn+ NFERptEn+ FERptEn+
                 RootSta: CERcvd- MultCERcvd- UERcvd- MultUERcvd-
                          FirstFatal- NonFatalMsg- FatalMsg- IntMsgNum 0
                 ErrorSrc: ERR_COR: 0000 ERR_FATAL/NONFATAL: 0000
         Capabilities: [220 v1] Access Control Services
                 ACSCap: SrcValid+ TransBlk+ ReqRedir+ CmpltRedir+ 
UpstreamFwd+ EgressCtrl- DirectTrans-
                 ACSCtl: SrcValid+ TransBlk- ReqRedir+ CmpltRedir+ 
UpstreamFwd+ EgressCtrl- DirectTrans-
         Capabilities: [200 v1] L1 PM Substates
                 L1SubCap: PCI-PM_L1.2+ PCI-PM_L1.1+ ASPM_L1.2+ 
ASPM_L1.1+ L1_PM_Substates+
                           PortCommonModeRestoreTime=110us 
PortTPowerOnTime=500us
                 L1SubCtl1: PCI-PM_L1.2+ PCI-PM_L1.1+ ASPM_L1.2+ ASPM_L1.1+
                            T_CommonMode=110us LTR1.2_Threshold=616448ns
                 L1SubCtl2: T_PwrOn=500us
         Capabilities: [150 v1] Precision Time Measurement
                 PTMCap: Requester- Responder+ Root+
                 PTMClockGranularity: 4ns
                 PTMControl: Enabled+ RootSelected+
                 PTMEffectiveGranularity: Unknown
         Capabilities: [a30 v1] Secondary PCI Express
                 LnkCtl3: LnkEquIntrruptEn- PerformEqu-
                 LaneErrStat: 0
         Capabilities: [a90 v1] Data Link Feature <?>
         Capabilities: [a9c v1] Physical Layer 16.0 GT/s
                 Phy16Sta: EquComplete+ EquPhase1+ EquPhase2+ EquPhase3+ 
LinkEquRequest-
         Capabilities: [edc v1] Lane Margining at the Receiver
                 PortCap: Uses Driver-
                 PortSta: MargReady+ MargSoftReady-
         Capabilities: [adc v1] Physical Layer 32.0 GT/s
                 Phy32Cap: EqualizationBypass- NoEqualizationNeeded-
                           ModTsMode0+ ModTsMode1- ModTsMode2-
                 Phy32Ctl: EqualizationBypassDis- NoEqualizationNeededDis+
                           Modified TS Usage Mode: PCI Express
                 Phy32Sta: EquComplete- EquPhase1- EquPhase2- EquPhase3- 
LinkEquRequest-
                           Received Enhanced Link Behavior Control: Full 
Equalization required
                           ModTsRecv- TxPrecodeOn- TxPrecodeReq- 
NoEqualizationNeededRecv-
         Kernel driver in use: pcieport

10000:e0:06.0 PCI bridge: Intel Corporation 12th Gen Core Processor PCI 
Express x4 Controller #0 (rev 02) (prog-if 00 [Normal decode])
         Subsystem: Acer Incorporated [ALI] Device 170f
         Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- 
ParErr- Stepping- SERR+ FastB2B- DisINTx+
         Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- 
<TAbort- <MAbort- >SERR- <PERR- INTx-
         Latency: 0
         Interrupt: pin D routed to IRQ 166
         IOMMU group: 6
         Bus: primary=00, secondary=e2, subordinate=e2, sec-latency=0
         I/O behind bridge: f000-0fff [disabled] [16-bit]
         Memory behind bridge: 84100000-841fffff [size=1M] [32-bit]
         Prefetchable memory behind bridge: 
00000000fff00000-00000000000fffff [disabled] [64-bit]
         Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=fast >TAbort- 
<TAbort- <MAbort+ <SERR- <PERR-
         BridgeCtl: Parity- SERR+ NoISA- VGA- VGA16- MAbort- >Reset- 
FastB2B-
                 PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-
         Capabilities: [40] Express (v2) Root Port (Slot+), IntMsgNum 0
                 DevCap: MaxPayload 256 bytes, PhantFunc 0
                         ExtTag- RBE+ TEE-IO-
                 DevCtl: CorrErr+ NonFatalErr+ FatalErr+ UnsupReq+
                         RlxdOrd- ExtTag- PhantFunc- AuxPwr- NoSnoop-
                         MaxPayload 256 bytes, MaxReadReq 128 bytes
                 DevSta: CorrErr- NonFatalErr- FatalErr- UnsupReq- 
AuxPwr+ TransPend-
                 LnkCap: Port #5, Speed 16GT/s, Width x4, ASPM L1, Exit 
Latency L1 <16us
                         ClockPM- Surprise- LLActRep+ BwNot+ ASPMOptComp+
                 LnkCtl: ASPM Disabled; RCB 64 bytes, LnkDisable- CommClk+
                         ExtSynch- ClockPM- AutWidDis- BWInt+ AutBWInt+ 
FltModeDis-
                 LnkSta: Speed 8GT/s, Width x4
                         TrErr- Train- SlotClk+ DLActive+ BWMgmt- ABWMgmt-
                 SltCap: AttnBtn- PwrCtrl- MRL- AttnInd- PwrInd- 
HotPlug- Surprise-
                         Slot #0, PowerLimit 75W; Interlock- NoCompl+
                 SltCtl: Enable: AttnBtn- PwrFlt- MRL- PresDet- CmdCplt- 
HPIrq- LinkChg-
                         Control: AttnInd Unknown, PwrInd Unknown, 
Power- Interlock-
                 SltSta: Status: AttnBtn- PowerFlt- MRL- CmdCplt- 
PresDet+ Interlock-
                         Changed: MRL- PresDet+ LinkState+
                 RootCap: CRSVisible-
                 RootCtl: ErrCorrectable- ErrNon-Fatal- ErrFatal- 
PMEIntEna+ CRSVisible-
                 RootSta: PME ReqID 0000, PMEStatus- PMEPending-
                 DevCap2: Completion Timeout: Range ABC, TimeoutDis+ 
NROPrPrP- LTR+
                          10BitTagComp+ 10BitTagReq+ OBFF Not Supported, 
ExtFmt- EETLPPrefix-
                          EmergencyPowerReduction Not Supported, 
EmergencyPowerReductionInit-
                          FRS- LN System CLS Not Supported, TPHComp- 
ExtTPHComp- ARIFwd+
                          AtomicOpsCap: Routing+ 32bit+ 64bit+ 128bitCAS+
                 DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis- 
ARIFwd+
                          AtomicOpsCtl: ReqEn+ EgressBlck+
                          IDOReq- IDOCompl- LTR+ EmergencyPowerReductionReq-
                          10BitTagReq- OBFF Disabled, EETLPPrefixBlk-
                 LnkCap2: Supported Link Speeds: 2.5-16GT/s, Crosslink- 
Retimer+ 2Retimers+ DRS-
                 LnkCtl2: Target Link Speed: 8GT/s, EnterCompliance- 
SpeedDis-
                          Transmit Margin: Normal Operating Range, 
EnterModifiedCompliance- ComplianceSOS-
                          Compliance Preset/De-emphasis: -6dB 
de-emphasis, 0dB preshoot
                 LnkSta2: Current De-emphasis Level: -3.5dB, 
EqualizationComplete+ EqualizationPhase1+
                          EqualizationPhase2+ EqualizationPhase3+ 
LinkEqualizationRequest-
                          Retimer- 2Retimers- CrosslinkRes: unsupported, 
FltMode-
         Capabilities: [80] MSI: Enable+ Count=1/1 Maskable- 64bit-
                 Address: fee01000  Data: 0000
         Capabilities: [90] Subsystem: Acer Incorporated [ALI] Device 170f
         Capabilities: [a0] Power Management version 3
                 Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA 
PME(D0+,D1-,D2-,D3hot+,D3cold+)
                 Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-
         Capabilities: [100 v1] Advanced Error Reporting
                 UESta:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- 
UnxCmplt- RxOF- MalfTLP-
                         ECRC- UnsupReq- ACSViol- UncorrIntErr- 
BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
                         PoisonTLPBlocked- DMWrReqBlocked- IDECheck- 
MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
                 UEMsk:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- 
UnxCmplt+ RxOF- MalfTLP-
                         ECRC- UnsupReq- ACSViol- UncorrIntErr- 
BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
                         PoisonTLPBlocked- DMWrReqBlocked- IDECheck- 
MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
                 UESvrt: DLP+ SDES- TLP- FCP- CmpltTO- CmpltAbrt- 
UnxCmplt- RxOF+ MalfTLP+
                         ECRC- UnsupReq- ACSViol- UncorrIntErr- 
BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
                         PoisonTLPBlocked- DMWrReqBlocked- IDECheck- 
MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
                 CESta:  RxErr- BadTLP- BadDLLP- Rollover- Timeout- 
AdvNonFatalErr- CorrIntErr- HeaderOF-
                 CEMsk:  RxErr- BadTLP- BadDLLP- Rollover- Timeout- 
AdvNonFatalErr+ CorrIntErr- HeaderOF-
                 AERCap: First Error Pointer: 00, ECRCGenCap- ECRCGenEn- 
ECRCChkCap- ECRCChkEn-
                         MultHdrRecCap- MultHdrRecEn- TLPPfxPres- HdrLogCap-
                 HeaderLog: 00000000 00000000 00000000 00000000
                 RootCmd: CERptEn+ NFERptEn+ FERptEn+
                 RootSta: CERcvd- MultCERcvd- UERcvd- MultUERcvd-
                          FirstFatal- NonFatalMsg- FatalMsg- IntMsgNum 0
                 ErrorSrc: ERR_COR: 0000 ERR_FATAL/NONFATAL: 0000
         Capabilities: [220 v1] Access Control Services
                 ACSCap: SrcValid+ TransBlk+ ReqRedir+ CmpltRedir+ 
UpstreamFwd+ EgressCtrl- DirectTrans-
                 ACSCtl: SrcValid+ TransBlk- ReqRedir+ CmpltRedir+ 
UpstreamFwd+ EgressCtrl- DirectTrans-
         Capabilities: [200 v1] L1 PM Substates
                 L1SubCap: PCI-PM_L1.2+ PCI-PM_L1.1+ ASPM_L1.2+ 
ASPM_L1.1+ L1_PM_Substates+
                           PortCommonModeRestoreTime=110us 
PortTPowerOnTime=500us
                 L1SubCtl1: PCI-PM_L1.2- PCI-PM_L1.1- ASPM_L1.2- ASPM_L1.1-
                            T_CommonMode=110us LTR1.2_Threshold=0ns
                 L1SubCtl2: T_PwrOn=700us
         Capabilities: [150 v1] Precision Time Measurement
                 PTMCap: Requester- Responder+ Root+
                 PTMClockGranularity: 4ns
                 PTMControl: Enabled+ RootSelected+
                 PTMEffectiveGranularity: Unknown
         Capabilities: [280 v1] Virtual Channel
                 Caps:   LPEVC=0 RefClk=100ns PATEntryBits=1
                 Arb:    Fixed- WRR32- WRR64- WRR128-
                 Ctrl:   ArbSelect=Fixed
                 Status: InProgress-
                 VC0:    Caps:   PATOffset=00 MaxTimeSlots=1 RejSnoopTrans-
                         Arb:    Fixed- WRR32- WRR64- WRR128- TWRR128- 
WRR256-
                         Ctrl:   Enable+ ID=0 ArbSelect=Fixed TC/VC=ff
                         Status: NegoPending- InProgress-
                 VC1:    Caps:   PATOffset=00 MaxTimeSlots=1 RejSnoopTrans-
                         Arb:    Fixed- WRR32- WRR64- WRR128- TWRR128- 
WRR256-
                         Ctrl:   Enable- ID=1 ArbSelect=Fixed TC/VC=00
                         Status: NegoPending- InProgress-
         Capabilities: [a30 v1] Secondary PCI Express
                 LnkCtl3: LnkEquIntrruptEn- PerformEqu-
                 LaneErrStat: 0
         Capabilities: [a90 v1] Data Link Feature <?>
         Capabilities: [a9c v1] Physical Layer 16.0 GT/s
                 Phy16Sta: EquComplete- EquPhase1- EquPhase2- EquPhase3- 
LinkEquRequest-
         Capabilities: [edc v1] Lane Margining at the Receiver
                 PortCap: Uses Driver-
                 PortSta: MargReady- MargSoftReady-
         Kernel driver in use: pcieport

10000:e1:00.0 Non-Volatile memory controller: SK hynix Platinum 
P41/PC801 NVMe Solid State Drive (prog-if 02 [NVM Express])
         Subsystem: SK hynix Platinum P41/PC801 NVMe Solid State Drive
         Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- 
ParErr- Stepping- SERR- FastB2B- DisINTx+
         Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- 
<TAbort- <MAbort- >SERR- <PERR- INTx-
         Latency: 0
         Interrupt: pin A routed to IRQ -2147483648
         IOMMU group: 6
         Region 0: Memory at 84000000 (64-bit, non-prefetchable) [size=16K]
         Capabilities: [80] Power Management version 3
                 Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA 
PME(D0-,D1-,D2-,D3hot-,D3cold-)
                 Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
         Capabilities: [90] MSI: Enable- Count=1/32 Maskable- 64bit+
                 Address: 0000000000000000  Data: 0000
         Capabilities: [b0] MSI-X: Enable+ Count=33 Masked-
                 Vector table: BAR=0 offset=00002000
                 PBA: BAR=0 offset=00003000
         Capabilities: [c0] Express (v2) Endpoint, IntMsgNum 0
                 DevCap: MaxPayload 512 bytes, PhantFunc 0, Latency L0s 
unlimited, L1 unlimited
                         ExtTag+ AttnBtn- AttnInd- PwrInd- RBE+ FLReset+ 
SlotPowerLimit 75W TEE-IO-
                 DevCtl: CorrErr+ NonFatalErr+ FatalErr+ UnsupReq+
                         RlxdOrd+ ExtTag+ PhantFunc- AuxPwr- NoSnoop+ 
FLReset-
                         MaxPayload 256 bytes, MaxReadReq 512 bytes
                 DevSta: CorrErr- NonFatalErr- FatalErr- UnsupReq- 
AuxPwr- TransPend-
                 LnkCap: Port #0, Speed 16GT/s, Width x4, ASPM L1, Exit 
Latency L1 <64us
                         ClockPM+ Surprise- LLActRep- BwNot- ASPMOptComp+
                 LnkCtl: ASPM L1 Enabled; RCB 64 bytes, LnkDisable- CommClk+
                         ExtSynch- ClockPM+ AutWidDis- BWInt- AutBWInt- 
FltModeDis-
                 LnkSta: Speed 16GT/s, Width x4
                         TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
                 DevCap2: Completion Timeout: Not Supported, TimeoutDis+ 
NROPrPrP- LTR+
                          10BitTagComp+ 10BitTagReq- OBFF Not Supported, 
ExtFmt+ EETLPPrefix-
                          EmergencyPowerReduction Not Supported, 
EmergencyPowerReductionInit-
                          FRS+ TPHComp- ExtTPHComp-
                          AtomicOpsCap: 32bit- 64bit- 128bitCAS-
                 DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-
                          AtomicOpsCtl: ReqEn-
                          IDOReq- IDOCompl- LTR+ EmergencyPowerReductionReq-
                          10BitTagReq- OBFF Disabled, EETLPPrefixBlk-
                 LnkCap2: Supported Link Speeds: 2.5-16GT/s, Crosslink- 
Retimer+ 2Retimers+ DRS+
                 LnkCtl2: Target Link Speed: 16GT/s, EnterCompliance- 
SpeedDis-
                          Transmit Margin: Normal Operating Range, 
EnterModifiedCompliance- ComplianceSOS-
                          Compliance Preset/De-emphasis: -6dB 
de-emphasis, 0dB preshoot
                 LnkSta2: Current De-emphasis Level: -6dB, 
EqualizationComplete+ EqualizationPhase1+
                          EqualizationPhase2+ EqualizationPhase3+ 
LinkEqualizationRequest-
                          Retimer- 2Retimers- CrosslinkRes: unsupported, 
FltMode-
         Capabilities: [100 v2] Advanced Error Reporting
                 UESta:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- 
UnxCmplt- RxOF- MalfTLP-
                         ECRC- UnsupReq- ACSViol- UncorrIntErr- 
BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
                         PoisonTLPBlocked- DMWrReqBlocked- IDECheck- 
MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
                 UEMsk:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- 
UnxCmplt- RxOF- MalfTLP-
                         ECRC- UnsupReq- ACSViol- UncorrIntErr+ 
BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
                         PoisonTLPBlocked- DMWrReqBlocked- IDECheck- 
MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
                 UESvrt: DLP+ SDES+ TLP- FCP+ CmpltTO- CmpltAbrt- 
UnxCmplt- RxOF+ MalfTLP+
                         ECRC- UnsupReq- ACSViol- UncorrIntErr+ 
BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
                         PoisonTLPBlocked- DMWrReqBlocked- IDECheck- 
MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
                 CESta:  RxErr- BadTLP- BadDLLP- Rollover- Timeout- 
AdvNonFatalErr- CorrIntErr- HeaderOF-
                 CEMsk:  RxErr- BadTLP- BadDLLP- Rollover- Timeout- 
AdvNonFatalErr+ CorrIntErr+ HeaderOF+
                 AERCap: First Error Pointer: 00, ECRCGenCap+ ECRCGenEn- 
ECRCChkCap+ ECRCChkEn-
                         MultHdrRecCap- MultHdrRecEn- TLPPfxPres- HdrLogCap-
                 HeaderLog: 00000000 00000000 00000000 00000000
         Capabilities: [1b8 v1] Latency Tolerance Reporting
                 Max snoop latency: 3145728ns
                 Max no snoop latency: 3145728ns
         Capabilities: [300 v1] Secondary PCI Express
                 LnkCtl3: LnkEquIntrruptEn- PerformEqu-
                 LaneErrStat: 0
         Capabilities: [900 v1] L1 PM Substates
                 L1SubCap: PCI-PM_L1.2+ PCI-PM_L1.1+ ASPM_L1.2+ 
ASPM_L1.1+ L1_PM_Substates+
                           PortCommonModeRestoreTime=24us 
PortTPowerOnTime=50us
                 L1SubCtl1: PCI-PM_L1.2+ PCI-PM_L1.1+ ASPM_L1.2+ ASPM_L1.1+
                            T_CommonMode=0us LTR1.2_Threshold=616448ns
                 L1SubCtl2: T_PwrOn=500us
         Capabilities: [910 v1] Data Link Feature <?>
         Capabilities: [920 v1] Lane Margining at the Receiver
                 PortCap: Uses Driver+
                 PortSta: MargReady+ MargSoftReady+
         Capabilities: [9c0 v1] Physical Layer 16.0 GT/s
                 Phy16Sta: EquComplete+ EquPhase1+ EquPhase2+ EquPhase3+ 
LinkEquRequest-
         Kernel driver in use: nvme
         Kernel modules: nvme

10000:e2:00.0 Non-Volatile memory controller: MAXIO Technology 
(Hangzhou) Ltd. NVMe SSD Controller MAP1202 (DRAM-less) (rev 01) 
(prog-if 02 [NVM Express])
         Subsystem: MAXIO Technology (Hangzhou) Ltd. NVMe SSD Controller 
MAP1202 (DRAM-less)
         Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- 
ParErr- Stepping- SERR- FastB2B- DisINTx+
         Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- 
<TAbort- <MAbort- >SERR- <PERR- INTx-
         Latency: 0
         Interrupt: pin A routed to IRQ -2147483648
         IOMMU group: 6
         Region 0: Memory at 84100000 (64-bit, non-prefetchable) [size=16K]
         Capabilities: [40] Power Management version 3
                 Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA 
PME(D0+,D1-,D2-,D3hot+,D3cold+)
                 Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
         Capabilities: [50] MSI: Enable- Count=1/32 Maskable+ 64bit+
                 Address: 0000000000000000  Data: 0000
                 Masking: 00000000  Pending: 00000000
         Capabilities: [70] Express (v2) Endpoint, IntMsgNum 31
                 DevCap: MaxPayload 512 bytes, PhantFunc 0, Latency L0s 
unlimited, L1 unlimited
                         ExtTag- AttnBtn- AttnInd- PwrInd- RBE+ FLReset+ 
SlotPowerLimit 75W TEE-IO-
                 DevCtl: CorrErr+ NonFatalErr+ FatalErr+ UnsupReq+
                         RlxdOrd+ ExtTag- PhantFunc- AuxPwr- NoSnoop+ 
FLReset-
                         MaxPayload 256 bytes, MaxReadReq 512 bytes
                 DevSta: CorrErr+ NonFatalErr- FatalErr- UnsupReq+ 
AuxPwr+ TransPend-
                 LnkCap: Port #0, Speed 8GT/s, Width x4, ASPM not supported
                         ClockPM+ Surprise- LLActRep- BwNot- ASPMOptComp+
                 LnkCtl: ASPM Disabled; RCB 64 bytes, LnkDisable- CommClk+
                         ExtSynch- ClockPM+ AutWidDis- BWInt- AutBWInt- 
FltModeDis-
                 LnkSta: Speed 8GT/s, Width x4
                         TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
                 DevCap2: Completion Timeout: Range ABCD, TimeoutDis+ 
NROPrPrP- LTR+
                          10BitTagComp- 10BitTagReq- OBFF Via message, 
ExtFmt- EETLPPrefix-
                          EmergencyPowerReduction Not Supported, 
EmergencyPowerReductionInit-
                          FRS- TPHComp- ExtTPHComp-
                          AtomicOpsCap: 32bit- 64bit- 128bitCAS-
                 DevCtl2: Completion Timeout: 16ms to 55ms, TimeoutDis-
                          AtomicOpsCtl: ReqEn-
                          IDOReq- IDOCompl- LTR+ EmergencyPowerReductionReq-
                          10BitTagReq- OBFF Disabled, EETLPPrefixBlk-
                 LnkCap2: Supported Link Speeds: 2.5-8GT/s, Crosslink- 
Retimer- 2Retimers- DRS-
                 LnkCtl2: Target Link Speed: 8GT/s, EnterCompliance- 
SpeedDis-
                          Transmit Margin: Normal Operating Range, 
EnterModifiedCompliance- ComplianceSOS-
                          Compliance Preset/De-emphasis: -6dB 
de-emphasis, 0dB preshoot
                 LnkSta2: Current De-emphasis Level: -6dB, 
EqualizationComplete+ EqualizationPhase1+
                          EqualizationPhase2+ EqualizationPhase3+ 
LinkEqualizationRequest-
                          Retimer- 2Retimers- CrosslinkRes: unsupported, 
FltMode-
         Capabilities: [b0] MSI-X: Enable+ Count=9 Masked-
                 Vector table: BAR=0 offset=00003000
                 PBA: BAR=0 offset=00002000
         Capabilities: [100 v2] Advanced Error Reporting
                 UESta:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- 
UnxCmplt- RxOF- MalfTLP-
                         ECRC- UnsupReq- ACSViol- UncorrIntErr- 
BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
                         PoisonTLPBlocked- DMWrReqBlocked- IDECheck- 
MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
                 UEMsk:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- 
UnxCmplt- RxOF- MalfTLP-
                         ECRC- UnsupReq- ACSViol- UncorrIntErr+ 
BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
                         PoisonTLPBlocked- DMWrReqBlocked- IDECheck- 
MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
                 UESvrt: DLP+ SDES+ TLP- FCP+ CmpltTO- CmpltAbrt- 
UnxCmplt- RxOF+ MalfTLP+
                         ECRC- UnsupReq- ACSViol- UncorrIntErr+ 
BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
                         PoisonTLPBlocked- DMWrReqBlocked- IDECheck- 
MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
                 CESta:  RxErr- BadTLP- BadDLLP- Rollover- Timeout- 
AdvNonFatalErr+ CorrIntErr- HeaderOF-
                 CEMsk:  RxErr- BadTLP- BadDLLP- Rollover- Timeout- 
AdvNonFatalErr+ CorrIntErr+ HeaderOF+
                 AERCap: First Error Pointer: 00, ECRCGenCap+ ECRCGenEn- 
ECRCChkCap+ ECRCChkEn-
                         MultHdrRecCap- MultHdrRecEn- TLPPfxPres- HdrLogCap-
                 HeaderLog: 00000000 00000000 00000000 00000000
         Capabilities: [148 v1] Device Serial Number 00-00-00-00-00-00-00-00
         Capabilities: [158 v1] Alternative Routing-ID Interpretation (ARI)
                 ARICap: MFVC- ACS+, Next Function: 0
                 ARICtl: MFVC- ACS-, Function Group: 0
         Capabilities: [168 v1] Secondary PCI Express
                 LnkCtl3: LnkEquIntrruptEn- PerformEqu-
                 LaneErrStat: 0
         Capabilities: [1d4 v1] Latency Tolerance Reporting
                 Max snoop latency: 3145728ns
                 Max no snoop latency: 3145728ns
         Capabilities: [1dc v1] L1 PM Substates
                 L1SubCap: PCI-PM_L1.2+ PCI-PM_L1.1+ ASPM_L1.2- 
ASPM_L1.1- L1_PM_Substates+
                           PortCommonModeRestoreTime=10us 
PortTPowerOnTime=14us
                 L1SubCtl1: PCI-PM_L1.2- PCI-PM_L1.1- ASPM_L1.2- ASPM_L1.1-
                            T_CommonMode=0us
                 L1SubCtl2: T_PwrOn=0us
         Capabilities: [1ec v1] Vendor Specific Information: ID=0002 
Rev=4 Len=100 <?>
         Capabilities: [2ec v1] Vendor Specific Information: ID=0001 
Rev=1 Len=038 <?>
         Kernel driver in use: nvme
         Kernel modules: nvme

[8.6.] SCSI information (from /proc/scsi/scsi)
N/A

[8.7.] Other information that might be relevant to the problem
        (please look in /proc and include all information that you
        think to be relevant):
N/A

[X.] Other notes, patches, fixes, workarounds:
N/A

