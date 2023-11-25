Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFC0E29432
	for <platform-driver-x86@vger.kernel.org>; Sat, 25 Nov 2023 22:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wlk5mLje"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 36CA7C433C7
	for <platform-driver-x86@vger.kernel.org>; Sat, 25 Nov 2023 22:07:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700950075;
	bh=fccjLOo81WhMhJWKPcGbtkwFe6Yxtm+/ZhjNu5d8AAU=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Wlk5mLje0TOxP3Be7yfAISVRFoJATRCYjO5IehfyCOr77sbDspotRYO1McgBjtBmB
	 CF7JbCjupLHvYiYTwEpBCvkG5o97IzMFMmXTs1D+r5fx2sbQ3eo8qR2gCBtwuLexbv
	 SwOa59x7GYgNMRVsvrpmB8ruVeHBTGRxyC1E2V03he4FkF2hQxlbMdw90WWYr3h2Ai
	 N5Dhh+ghcUIcwuK2d1KelMC6C/LJIyqGntd13yQtqwWlbKVMmOQ5v2Lw+4Lm4igggB
	 TYaH4wpPcNxp39PR+ExlWWn4t45qN7ruTk0Qm8qERLnzZ8gRO89jrUdPtvkf28aSDS
	 pEtn0Rmquwm+w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 192FDC4332E; Sat, 25 Nov 2023 22:07:55 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218188] hp_wmi_sensors: probe of
 8F1F6435-9F42-42C8-BADC-0E9424F20C9A failed with error -61
Date: Sat, 25 Nov 2023 22:07:54 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: alexbelm48@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218188-215701-pVsk4UHkwi@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218188-215701@https.bugzilla.kernel.org/>
References: <bug-218188-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

https://bugzilla.kernel.org/show_bug.cgi?id=3D218188

--- Comment #10 from Alexis Belmonte (alexbelm48@gmail.com) ---
I'm okay with that -- as I've said I've also added my board to the list of
supported omen power profiles, here's my patch if you are OK integrating it=
 in
your submit:

From 0236139ee5d239cb90b6d1ec8bff2fe6ace4cca3 Mon Sep 17 00:00:00 2001
From: Alexis Belmonte <alexbelm48@gmail.com>
Date: Wed, 22 Nov 2023 20:41:08 +0100
Subject: [PATCH] hp-wmi: Add identification support for ck2xxx/8BAD boards

This modification adds identification support for ck2xxx boards, also known=
 as
8BAD from an ACPI/WMI standpoint.

This allows the CPU to go higher than the artificial 55W TDP barrier caused
by the embedded controller not receiving commands to allow higher power
usage.
---
 drivers/platform/x86/hp/hp-wmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/hp/hp-wmi.c
b/drivers/platform/x86/hp/hp-wmi.c
index 8ebb7be52ee7..c781d2f8140d 100644
--- a/drivers/platform/x86/hp/hp-wmi.c
+++ b/drivers/platform/x86/hp/hp-wmi.c
@@ -55,7 +55,7 @@ static const char * const omen_thermal_profile_boards[] =
=3D {
        "874A", "8603", "8604", "8748", "886B", "886C", "878A", "878B", "87=
8C",
        "88C8", "88CB", "8786", "8787", "8788", "88D1", "88D2", "88F4", "88=
FD",
        "88F5", "88F6", "88F7", "88FE", "88FF", "8900", "8901", "8902", "89=
12",
-       "8917", "8918", "8949", "894A", "89EB"
+       "8917", "8918", "8949", "894A", "89EB", "8BAD"
 };

 /* DMI Board names of Omen laptops that are specifically set to be thermal
--=20
2.43.0

As for lsmod:
Module                  Size  Used by
iwlmvm                712704  0
iwlwifi               573440  1 iwlmvm
ccm                    20480  6
uinput                 20480  1
rfcomm                102400  7
snd_seq_dummy          12288  0
snd_hrtimer            12288  1
snd_seq               131072  7 snd_seq_dummy
snd_seq_device         16384  1 snd_seq
cmac                   12288  3
algif_hash             12288  1
algif_skcipher         12288  1
af_alg                 36864  6 algif_hash,algif_skcipher
bnep                   36864  2
snd_ctl_led            24576  0
snd_soc_skl_hda_dsp    24576  5
snd_soc_hdac_hdmi      45056  1 snd_soc_skl_hda_dsp
snd_sof_probes         24576  0
snd_soc_intel_hda_dsp_common    16384  1 snd_soc_skl_hda_dsp
snd_hda_codec_realtek   196608  1
intel_uncore_frequency    12288  0
snd_hda_codec_generic   114688  1 snd_hda_codec_realtek
vfat                   20480  1
intel_uncore_frequency_common    16384  1 intel_uncore_frequency
fat                   106496  1 vfat
ledtrig_audio          12288  2 snd_ctl_led,snd_hda_codec_generic
snd_soc_dmic           12288  1
snd_sof_pci_intel_tgl    12288  2
snd_sof_intel_hda_common   249856  1 snd_sof_pci_intel_tgl
soundwire_intel        81920  1 snd_sof_intel_hda_common
x86_pkg_temp_thermal    16384  0
snd_sof_intel_hda_mlink    36864  2 soundwire_intel,snd_sof_intel_hda_common
intel_powerclamp       20480  0
soundwire_cadence      45056  1 soundwire_intel
mac80211             1568768  1 iwlmvm
mousedev               24576  0
joydev                 24576  0
snd_sof_intel_hda      24576  1 snd_sof_intel_hda_common
snd_sof_pci            24576  2 snd_sof_intel_hda_common,snd_sof_pci_intel_=
tgl
snd_sof_xtensa_dsp     16384  1 snd_sof_intel_hda_common
snd_sof               434176  4
snd_sof_pci,snd_sof_intel_hda_common,snd_sof_probes,snd_sof_intel_hda
coretemp               16384  0
kvm_intel             425984  0
snd_sof_utils          16384  1 snd_sof
snd_soc_hdac_hda       28672  1 snd_sof_intel_hda_common
btusb                  86016  0
snd_hda_ext_core       36864  5
snd_sof_intel_hda_common,snd_soc_hdac_hdmi,snd_soc_hdac_hda,snd_sof_intel_h=
da_mlink,snd_sof_intel_hda
btrtl                  32768  1 btusb
snd_soc_acpi_intel_match    98304  2
snd_sof_intel_hda_common,snd_sof_pci_intel_tgl
btintel                57344  1 btusb
btbcm                  24576  1 btusb
snd_soc_acpi           16384  2
snd_soc_acpi_intel_match,snd_sof_intel_hda_common
btmtk                  12288  1 btusb
soundwire_generic_allocation    12288  1 soundwire_intel
kvm                  1376256  1 kvm_intel
soundwire_bus         139264  3
soundwire_intel,soundwire_generic_allocation,soundwire_cadence
libarc4                12288  1 mac80211
bluetooth            1114112  42 btrtl,btmtk,btintel,btbcm,bnep,btusb,rfcomm
snd_soc_core          462848  8
soundwire_intel,snd_sof,snd_sof_intel_hda_common,snd_soc_hdac_hdmi,snd_soc_=
hdac_hda,snd_sof_probes,snd_soc_dmic,snd_soc_skl_hda_dsp
snd_hda_codec_hdmi     94208  2
snd_compress           28672  2 snd_soc_core,snd_sof_probes
ac97_bus               12288  1 snd_soc_core
snd_pcm_dmaengine      16384  1 snd_soc_core
irqbypass              12288  1 kvm
snd_hda_intel          65536  1
crct10dif_pclmul       12288  1
usbhid                 77824  0
snd_intel_dspcfg       40960  3 snd_hda_intel,snd_sof,snd_sof_intel_hda_com=
mon
crc32_pclmul           12288  0
ecdh_generic           16384  2 bluetooth
snd_intel_sdw_acpi     16384  2 snd_sof_intel_hda_common,snd_intel_dspcfg
polyval_clmulni        12288  0
polyval_generic        12288  1 polyval_clmulni
snd_hda_codec         225280  8
snd_hda_codec_generic,snd_hda_codec_hdmi,snd_hda_intel,snd_hda_codec_realte=
k,snd_soc_intel_hda_dsp_common,snd_soc_hdac_hda,snd_sof_intel_hda,snd_soc_s=
kl_hda_dsp
gf128mul               16384  1 polyval_generic
ghash_clmulni_intel    16384  0
uvcvideo              176128  0
sha512_ssse3           53248  0
sha256_ssse3           32768  0
snd_hda_core          151552  11
snd_hda_codec_generic,snd_hda_codec_hdmi,snd_hda_intel,snd_hda_ext_core,snd=
_hda_codec,snd_hda_codec_realtek,snd_soc_intel_hda_dsp_common,snd_sof_intel=
_hda_common,snd_soc_hdac_hdmi,snd_soc_hdac_hda,snd_sof_intel_hda
sha1_ssse3             32768  0
processor_thermal_device_pci    16384  0
aesni_intel           360448  8
processor_thermal_device    20480  1 processor_thermal_device_pci
videobuf2_vmalloc      20480  1 uvcvideo
crypto_simd            16384  1 aesni_intel
uvc                    12288  1 uvcvideo
cryptd                 28672  3 crypto_simd,ghash_clmulni_intel
snd_hwdep              20480  1 snd_hda_codec
processor_thermal_wt_hint    16384  2
processor_thermal_device_pci,processor_thermal_device
videobuf2_memops       16384  1 videobuf2_vmalloc
cfg80211             1335296  3 iwlmvm,iwlwifi,mac80211
processor_thermal_rfim    28672  1 processor_thermal_device
mei_hdcp               28672  0
videobuf2_v4l2         40960  1 uvcvideo
mei_pxp                20480  0
rapl                   20480  0
thunderbolt           532480  0
snd_pcm               204800  13
snd_hda_codec_hdmi,snd_hda_intel,snd_hda_codec,soundwire_intel,snd_sof,snd_=
sof_intel_hda_common,snd_soc_hdac_hdmi,snd_compress,snd_soc_core,snd_sof_ut=
ils,snd_hda_core,snd_pcm_dmaengine
r8169                 114688  0
intel_cstate           20480  0
videodev              393216  2 videobuf2_v4l2,uvcvideo
spi_nor               163840  0
processor_thermal_rapl    16384  1 processor_thermal_device
mei_me                 57344  2
intel_rapl_msr         20480  0
ucsi_acpi              12288  0
hp_wmi                 28672  0
snd_timer              53248  3 snd_seq,snd_hrtimer,snd_pcm
intel_rapl_common      40960  2 intel_rapl_msr,processor_thermal_rapl
typec_ucsi             65536  1 ucsi_acpi
realtek                40960  1
iTCO_wdt               16384  0
intel_lpss_pci         24576  0
mdio_devres            12288  1 r8169
intel_pmc_bxt          16384  1 iTCO_wdt
intel_uncore          258048  0
processor_thermal_wt_req    12288  1 processor_thermal_device
sparse_keymap          12288  1 hp_wmi
snd                   155648  28
snd_ctl_led,snd_hda_codec_generic,snd_seq,snd_seq_device,snd_hda_codec_hdmi=
,snd_hwdep,snd_hda_intel,snd_hda_codec,snd_hda_codec_realtek,snd_sof,snd_ti=
mer,snd_soc_hdac_hdmi,snd_compress,snd_soc_core,snd_pcm
iTCO_vendor_support    12288  1 iTCO_wdt
nvidia_drm            114688  4
mei                   204800  5 mei_hdcp,mei_pxp,mei_me
libphy                233472  3 r8169,mdio_devres,realtek
typec                 114688  1 typec_ucsi
intel_lpss             16384  1 intel_lpss_pci
processor_thermal_power_floor    12288  2
processor_thermal_device_pci,processor_thermal_device
platform_profile       12288  1 hp_wmi
i2c_i801               40960  0
mtd                   110592  3 spi_nor
nvidia_modeset       1585152  3 nvidia_drm
i2c_hid_acpi           12288  0
idma64                 20480  0
wmi_bmof               12288  0
pcspkr                 12288  0
rfkill                 40960  10 hp_wmi,iwlmvm,bluetooth,cfg80211
processor_thermal_mbox    12288  4
processor_thermal_power_floor,processor_thermal_wt_req,processor_thermal_rf=
im,processor_thermal_wt_hint
i2c_smbus              20480  1 i2c_i801
nvidia_wmi_ec_backlight    12288  0
soundcore              16384  2 snd_ctl_led,snd
roles                  16384  1 typec_ucsi
videobuf2_common       94208  4
videobuf2_vmalloc,videobuf2_v4l2,uvcvideo,videobuf2_memops
i2c_hid                40960  1 i2c_hid_acpi
int340x_thermal_zone    16384  1 processor_thermal_device
acpi_tad               20480  0
acpi_pad               24576  0
soc_button_array       20480  0
mc                     90112  4
videodev,videobuf2_v4l2,uvcvideo,videobuf2_common
mac_hid                12288  0
vmw_vmci              135168  0
nvidia_uvm           3506176  0
nvidia              62390272  47 nvidia_uvm,nvidia_modeset
dm_mod                225280  0
sg                     49152  0
fuse                  212992  7
crypto_user            20480  0
loop                   36864  0
ip_tables              36864  0
x_tables               69632  1 ip_tables
ext4                 1175552  2
crc32c_generic         12288  0
crc16                  12288  2 bluetooth,ext4
mbcache                16384  1 ext4
jbd2                  221184  1 ext4
rtsx_pci_sdmmc         32768  0
mmc_core              270336  1 rtsx_pci_sdmmc
serio_raw              16384  0
nvme                   65536  5
atkbd                  40960  0
nvme_core             217088  6 nvme
libps2                 20480  1 atkbd
rtsx_pci              131072  1 rtsx_pci_sdmmc
spi_intel_pci          12288  0
vivaldi_fmap           12288  1 atkbd
xhci_pci               28672  0
spi_intel              36864  1 spi_intel_pci
crc32c_intel           16384  4
xhci_pci_renesas       24576  1 xhci_pci
i8042                  53248  0
serio                  28672  4 serio_raw,atkbd,i8042
i915                 4202496  71
i2c_algo_bit           20480  1 i915
drm_buddy              20480  1 i915
video                  77824  3 nvidia_wmi_ec_backlight,i915,nvidia_modeset
wmi                    45056  4 hp_wmi,video,nvidia_wmi_ec_backlight,wmi_bm=
of
ttm                   110592  1 i915
intel_gtt              28672  1 i915
drm_display_helper    237568  1 i915
cec                    86016  2 drm_display_helper,i915

Thanks a lot for troubleshooting & fixing my issue, I really appreciate it =
:]

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
