Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A803846F
	for <platform-driver-x86@vger.kernel.org>; Mon,  1 Jun 2026 07:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780300451; cv=none; b=BQ9WhMFXaHHjx7Ws9chqFCj4zky4eCCLTkaErxLN3aQifXUVEJO50UxG2bh9T2hS+p6L13MnumGILlD7vnu+uza4EIzHheZTIGIqaH7uYqgWEg6tFBbLdk8DwRz1mrsTGa56V1Z8EmQV1ngRLxqkKlnFLI4fvh3vk1DyIPEPvZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780300451; c=relaxed/simple;
	bh=9VEx8fTJLG44yFdPaz10DSlbk1qFnnFYpLtE1Md4+yc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=BW9pDX90nvXaUX9XnsvmwfF7TFMbnNa+wqRlN1basDJXxP9NVnMZmogy0FsNoaZSoMRur1ii14kp6oLpCZzwqU7SssG+8Mz020SazAQINHvDfNd91+N1h0W+hOW6X0TfYoiERRTWq62xFoErm5qjY9IG/BAniLucPcPyfs/y70k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BQD19T/s; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BQD19T/s"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 21448C2BCC7
	for <platform-driver-x86@vger.kernel.org>; Mon,  1 Jun 2026 07:54:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780300451;
	bh=9VEx8fTJLG44yFdPaz10DSlbk1qFnnFYpLtE1Md4+yc=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=BQD19T/sc72DNn3s5bHXMZU75u3B6xJs8yiRk6voXl2Ztj+xu3NqXgliHtdwHoFPK
	 Zd/MXHYox+MfxD+NmfLBNsUduk8NEYPjgtCpMScb4hSxqqxo7AWZRVb9WamkAWBW7A
	 DIy7CrSk9EMXw5gq5vmCdA3gOEnPOvQhH/HeD+5U7LHQwQA/3n+63Z8ywmsLVYex17
	 rxLgHv3w47DyP+qYg49Xmw65sOr6+pKPfdcQDTPIy6C3BrjMUsFa2DydkuLAwmtBpw
	 K7eNQOcBgfDviGVPgH3cFY/YHlPLuM2bCqVe8nWijkih23acA4iWwuBS6S5LbLjA7E
	 0c5sgymhs7WCQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 01883C3279F; Mon,  1 Jun 2026 07:54:10 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221569] Laptop fan too loud (spinning nearly always) hp-wmi
 7.1-rc4 kerenel
Date: Mon, 01 Jun 2026 07:54:10 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: moravec@ukf.sk
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221569-215701-CGGXhSnm8e@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221569-215701@https.bugzilla.kernel.org/>
References: <bug-221569-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221569

--- Comment #9 from Milan Oravec (moravec@ukf.sk) ---
Yes, you can. I've tried do switch Power mode to Powersave (via Gnome menu)=
 to
lower/disable FAN RPMs and got this error in dmsg:

j=C3=BAn 01 09:34:30 migo-HP kernel: platform_profile: Failed to get profil=
e for
handler hp-wmi

but this is error is present in 7.0 too, so this is not new in 7.1 tree.

load is low:

migo@migo-HP:~$ w
 09:47:38 up  1:55,  1 user,  load average: 0,42, 0,39, 0,35

sensors output:

hp-isa-0000
Adapter: ISA adapter
fan1:           0 RPM
fan2:           0 RPM
pwm1:             N/A

k10temp-pci-00c3
Adapter: PCI adapter
Tctl:         +40.0=C2=B0C=20=20

ucsi_source_psy_USBC000:002-isa-0000
Adapter: ISA adapter
in0:           0.00 V  (min =3D  +0.00 V, max =3D  +0.00 V)
curr1:         0.00 A  (max =3D  +0.00 A)

nvme-pci-6000
Adapter: PCI adapter
Composite:    +37.9=C2=B0C  (low  =3D -273.1=C2=B0C, high =3D +81.8=C2=B0C)
                       (crit =3D +84.8=C2=B0C)
Sensor 1:     +37.9=C2=B0C  (low  =3D -273.1=C2=B0C, high =3D +65261.8=C2=
=B0C)
Sensor 2:     +38.9=C2=B0C  (low  =3D -273.1=C2=B0C, high =3D +65261.8=C2=
=B0C)

acpitz-acpi-0
Adapter: ACPI interface
temp1:        +39.0=C2=B0C=20=20

mt7925_phy0-pci-6200
Adapter: PCI adapter
temp1:        +82.0=C2=B0C=20=20

ucsi_source_psy_USBC000:001-isa-0000
Adapter: ISA adapter
in0:           5.00 V  (min =3D  +5.00 V, max =3D +15.00 V)
curr1:         3.00 A  (max =3D  +5.00 A)

amdgpu-pci-6300
Adapter: PCI adapter
vddgfx:        0.00 V=20=20
vddnb:         0.00 V=20=20
edge:         +38.0=C2=B0C=20=20
PPT:           3.09 W  (avg =3D   3.09 W)
sclk:         682 MHz=20

BAT0-acpi-0
Adapter: ACPI interface
in0:           8.27 V=20=20
power1:        0.00 W=20=20

acpi_fan-isa-0000
Adapter: ISA adapter
fan1:        2100 RPM


All temperatures are low BUT wifi module reports: temp1: +82.0=C2=B0C, I do=
n't know
if it is real temperature reading. May be caused by this?

j=C3=BAn 01 08:00:38 migo-HP kernel:  slab kmalloc-8k start ffff8e49a878600=
0 pointer
offset 4176 size 8192
j=C3=BAn 01 08:00:38 migo-HP kernel: ------------[ cut here ]------------
j=C3=BAn 01 08:00:38 migo-HP kernel: list_add corruption. prev->next should=
 be next
(ffff8e485fd38918), but was ffff8e49a8787050. (prev=3Dffff8e49a8787050).
j=C3=BAn 01 08:00:38 migo-HP kernel: WARNING: lib/list_debug.c:32 at
__list_add_valid_or_report+0x71/0xc0, CPU#1: napi/phy0-0/632
j=C3=BAn 01 08:00:38 migo-HP kernel: Modules linked in: tun ovpn ip6_udp_tu=
nnel
udp_tunnel nft_limit xt_limit xt_conntrack xt_pkttype br_netfilter xt_LOG
nf_log_syslog xt_tcpudp nft_compat x_tables snd_seq_dummy snd_hrtimer snd_s=
eq
snd_seq_device nft_masq nft_ct nft_reject_ipv4 nf_reject_ipv4 nft_reject
act_csum cls_u32 sch_htb nft_chain_nat nf_nat nf_conntrack nf_defrag_ipv6
nf_defrag_ipv4 nf_tables nfnetlink bridge stp llc nls_utf8 cifs dns_resolver
nls_ucs2_utils netfs cifs_md4 ccm snd_ctl_led nls_ascii vfat fat joydev mt7=
925e
mt7925_common mt792x_lib snd_acp_legacy_mach mt76_connac_lib snd_acp_mach
snd_soc_nau8821 mt76 snd_acp3x_rn snd_acp70 snd_acp_i2s snd_acp_pdm
snd_soc_dmic snd_acp_pcm snd_sof_amd_acp70 snd_sof_amd_acp63 mac80211
snd_sof_amd_vangogh snd_sof_amd_rembrandt snd_sof_amd_renoir snd_sof_amd_acp
snd_sof_xtensa_dsp snd_sof_pci snd_sof snd_sof_utils snd_pci_ps
snd_soc_acpi_amd_match snd_soc_acpi_amd_sdca_quirks snd_amd_sdw_acpi btusb
soundwire_amd amd_atl soundwire_generic_allocation snd_hda_codec_alc269 btr=
tl
hp_bioscfg
j=C3=BAn 01 08:00:38 migo-HP kernel:  soundwire_bus snd_hda_scodec_componen=
t btintel
snd_hda_codec_realtek_lib snd_hda_scodec_cs35l41_spi intel_rapl_msr regmap_=
spi
snd_hda_codec_generic snd_soc_sdca btbcm intel_rapl_common
firmware_attributes_class snd_hda_intel btmtk cfg80211 uvcvideo snd_soc_core
snd_hda_codec videobuf2_vmalloc bluetooth videobuf2_memops uvc snd_compress
videobuf2_v4l2 snd_hwdep snd_acp_pci hid_multitouch snd_amd_acpi_mach
snd_hda_core spd5118 videodev snd_acp_legacy_common ucsi_acpi snd_intel_dsp=
cfg
snd_hda_scodec_cs35l41_i2c snd_pci_acp6x kvm_amd typec_ucsi
snd_hda_scodec_cs35l41 snd_pcm hp_wmi snd_soc_cs_amp_lib videobuf2_common
snd_pci_acp5x typec snd_timer sparse_keymap sp5100_tco snd_soc_cs35l41_lib
snd_rn_pci_acp3x kvm mc irqbypass pcspkr rapl wmi_bmof rfkill cs_dsp moused=
ev
k10temp libarc4 roles snd thunderbolt amdxdna regmap_i2c snd_acp_config
i2c_hid_acpi i2c_piix4 ccp amd_pmc snd_soc_acpi i2c_hid amd_sfh
serial_multi_instantiate soundcore i2c_smbus snd_pci_acp3x dm_mod sg
crypto_user ext4 mbcache jbd2
j=C3=BAn 01 08:00:38 migo-HP kernel:  hid_logitech_hidpp hid_logitech_dj am=
dgpu
hid_generic usbhid drm_buddy amdxcp i2c_algo_bit mfd_core drm_ttm_helper ttm
drm_exec drm_panel_backlight_quirks gpu_sched atkbd drm_suballoc_helper nvme
libps2 drm_display_helper vivaldi_fmap nvme_core i8042 video cec nvme_keyri=
ng
serio wmi nvme_auth crc16
j=C3=BAn 01 08:00:38 migo-HP kernel: CPU: 1 UID: 0 PID: 632 Comm: napi/phy0=
-0 Not
tainted 7.1.0-rc6 #46 PREEMPT(full)  de9cf86dc25a047cfc902454a5917cc7702f3b=
b2
j=C3=BAn 01 08:00:38 migo-HP kernel: Hardware name: HP HP OmniBook X Flip L=
aptop
16-ar0xxx/8DA8, BIOS F.11 11/03/2025
j=C3=BAn 01 08:00:38 migo-HP kernel: RIP: 0010:__list_add_valid_or_report+0=
x7a/0xc0
j=C3=BAn 01 08:00:38 migo-HP kernel: Code: 48 89 e9 48 89 de 67 48 0f b9 3a=
 eb ba 48
39 16 74 1f 48 89 f7 e8 a6 3e 43 00 48 8d 3d cf 99 49 02 48 8b 13 48 89 d9 =
48
89 ee <67> 48 0f b9 3a eb 96 48 39 fe 74 07 b0 01 48 39 fa 75 1d 48 8d 05
j=C3=BAn 01 08:00:38 migo-HP kernel: RSP: 0018:ffffd4af0bfcfc80 EFLAGS: 000=
10202
j=C3=BAn 01 08:00:38 migo-HP kernel: RAX: 0000000000000001 RBX: ffff8e49a87=
87050
RCX: ffff8e49a8787050
j=C3=BAn 01 08:00:38 migo-HP kernel: RDX: ffff8e49a8787050 RSI: ffff8e485fd=
38918
RDI: ffffffffabcd6880
j=C3=BAn 01 08:00:38 migo-HP kernel: RBP: ffff8e485fd38918 R08: 00000000000=
00000
R09: ffffffffaba783a0
j=C3=BAn 01 08:00:38 migo-HP kernel: R10: ffffd4af0bfcf9c8 R11: ffffd4af0bf=
cf9c0
R12: ffff8e4793caa840
j=C3=BAn 01 08:00:38 migo-HP kernel: R13: ffff8e485fd32120 R14: ffff8e4793c=
aa810
R15: ffff8e485fd321a0
j=C3=BAn 01 08:00:38 migo-HP kernel: FS:  0000000000000000(0000)
GS:ffff8e4fd20be000(0000) knlGS:0000000000000000
j=C3=BAn 01 08:00:38 migo-HP kernel: CS:  0010 DS: 0000 ES: 0000 CR0:
0000000080050033
j=C3=BAn 01 08:00:38 migo-HP kernel: CR2: 000055c4f118b300 CR3: 0000000156e=
a2000
CR4: 0000000000f50ef0
j=C3=BAn 01 08:00:38 migo-HP kernel: PKRU: 55555554
j=C3=BAn 01 08:00:38 migo-HP kernel: Call Trace:
j=C3=BAn 01 08:00:38 migo-HP kernel:  <TASK>
j=C3=BAn 01 08:00:38 migo-HP kernel:  mt76_wcid_add_poll.cold+0xc/0x15 [mt76
7cf6658b74d841c34fe483c94ee6b25083fc57fc]
j=C3=BAn 01 08:00:38 migo-HP kernel:  mt7925_mac_add_txs.part.0+0x8c/0xa0
[mt7925_common 1c2dd67f3597ac7800a7e155c7a2e0ae422e117e]
j=C3=BAn 01 08:00:38 migo-HP kernel:  mt7925_rx_check+0xba/0xf0 [mt7925_com=
mon
1c2dd67f3597ac7800a7e155c7a2e0ae422e117e]
j=C3=BAn 01 08:00:38 migo-HP kernel:  mt76_dma_rx_poll+0x53a/0x730 [mt76
7cf6658b74d841c34fe483c94ee6b25083fc57fc]
j=C3=BAn 01 08:00:38 migo-HP kernel:  mt792x_poll_rx+0x52/0xe0 [mt792x_lib
41a54850c296b2e02daa140b7c7bca773a3b828c]
j=C3=BAn 01 08:00:38 migo-HP kernel:  __napi_poll+0xd2/0x210
j=C3=BAn 01 08:00:38 migo-HP kernel:  napi_threaded_poll_loop+0x131/0x200
j=C3=BAn 01 08:00:38 migo-HP kernel:  ? __pfx_napi_threaded_poll+0x10/0x10
j=C3=BAn 01 08:00:38 migo-HP kernel:  napi_threaded_poll+0xe1/0x120
j=C3=BAn 01 08:00:38 migo-HP kernel:  kthread+0xe1/0x120
j=C3=BAn 01 08:00:38 migo-HP kernel:  ? __pfx_kthread+0x10/0x10
j=C3=BAn 01 08:00:38 migo-HP kernel:  ret_from_fork+0x2a7/0x330
j=C3=BAn 01 08:00:38 migo-HP kernel:  ? __pfx_kthread+0x10/0x10
j=C3=BAn 01 08:00:38 migo-HP kernel:  ret_from_fork_asm+0x1a/0x30
j=C3=BAn 01 08:00:38 migo-HP kernel:  </TASK>
j=C3=BAn 01 08:00:38 migo-HP kernel: ---[ end trace 0000000000000000 ]---
j=C3=BAn 01 08:00:38 migo-HP kernel:  slab kmalloc-8k start ffff8e49a878600=
0 pointer
offset 4176 size 8192
j=C3=BAn 01 08:00:38 migo-HP kernel: ------------[ cut here ]------------
j=C3=BAn 01 08:00:38 migo-HP kernel: list_add corruption. prev->next should=
 be next
(ffff8e485fd38918), but was ffff8e49a8787050. (prev=3Dffff8e49a8787050).
j=C3=BAn 01 08:00:38 migo-HP kernel: WARNING: lib/list_debug.c:32 at
__list_add_valid_or_report+0x71/0xc0, CPU#1: napi/phy0-0/632
j=C3=BAn 01 08:00:38 migo-HP kernel: Modules linked in: tun ovpn ip6_udp_tu=
nnel
udp_tunnel nft_limit xt_limit xt_conntrack xt_pkttype br_netfilter xt_LOG
nf_log_syslog xt_tcpudp nft_compat x_tables snd_seq_dummy snd_hrtimer snd_s=
eq
snd_seq_device nft_masq nft_ct nft_reject_ipv4 nf_reject_ipv4 nft_reject
act_csum cls_u32 sch_htb nft_chain_nat nf_nat nf_conntrack nf_defrag_ipv6
nf_defrag_ipv4 nf_tables nfnetlink bridge stp llc nls_utf8 cifs dns_resolver
nls_ucs2_utils netfs cifs_md4 ccm snd_ctl_led nls_ascii vfat fat joydev mt7=
925e
mt7925_common mt792x_lib snd_acp_legacy_mach mt76_connac_lib snd_acp_mach
snd_soc_nau8821 mt76 snd_acp3x_rn snd_acp70 snd_acp_i2s snd_acp_pdm
snd_soc_dmic snd_acp_pcm snd_sof_amd_acp70 snd_sof_amd_acp63 mac80211
snd_sof_amd_vangogh snd_sof_amd_rembrandt snd_sof_amd_renoir snd_sof_amd_acp
snd_sof_xtensa_dsp snd_sof_pci snd_sof snd_sof_utils snd_pci_ps
snd_soc_acpi_amd_match snd_soc_acpi_amd_sdca_quirks snd_amd_sdw_acpi btusb
soundwire_amd amd_atl soundwire_generic_allocation snd_hda_codec_alc269 btr=
tl
hp_bioscfg
j=C3=BAn 01 08:00:38 migo-HP kernel:  soundwire_bus snd_hda_scodec_componen=
t btintel
snd_hda_codec_realtek_lib snd_hda_scodec_cs35l41_spi intel_rapl_msr regmap_=
spi
snd_hda_codec_generic snd_soc_sdca btbcm intel_rapl_common
firmware_attributes_class snd_hda_intel btmtk cfg80211 uvcvideo snd_soc_core
snd_hda_codec videobuf2_vmalloc bluetooth videobuf2_memops uvc snd_compress
videobuf2_v4l2 snd_hwdep snd_acp_pci hid_multitouch snd_amd_acpi_mach
snd_hda_core spd5118 videodev snd_acp_legacy_common ucsi_acpi snd_intel_dsp=
cfg
snd_hda_scodec_cs35l41_i2c snd_pci_acp6x kvm_amd typec_ucsi
snd_hda_scodec_cs35l41 snd_pcm hp_wmi snd_soc_cs_amp_lib videobuf2_common
snd_pci_acp5x typec snd_timer sparse_keymap sp5100_tco snd_soc_cs35l41_lib
snd_rn_pci_acp3x kvm mc irqbypass pcspkr rapl wmi_bmof rfkill cs_dsp moused=
ev
k10temp libarc4 roles snd thunderbolt amdxdna regmap_i2c snd_acp_config
i2c_hid_acpi i2c_piix4 ccp amd_pmc snd_soc_acpi i2c_hid amd_sfh
serial_multi_instantiate soundcore i2c_smbus snd_pci_acp3x dm_mod sg
crypto_user ext4 mbcache jbd2
j=C3=BAn 01 08:00:38 migo-HP kernel:  hid_logitech_hidpp hid_logitech_dj am=
dgpu
hid_generic usbhid drm_buddy amdxcp i2c_algo_bit mfd_core drm_ttm_helper ttm
drm_exec drm_panel_backlight_quirks gpu_sched atkbd drm_suballoc_helper nvme
libps2 drm_display_helper vivaldi_fmap nvme_core i8042 video cec nvme_keyri=
ng
serio wmi nvme_auth crc16
j=C3=BAn 01 08:00:38 migo-HP kernel: CPU: 1 UID: 0 PID: 632 Comm: napi/phy0=
-0
Tainted: G        W           7.1.0-rc6 #46 PREEMPT(full)=20
de9cf86dc25a047cfc902454a5917cc7702f3bb2
j=C3=BAn 01 08:00:38 migo-HP kernel: Tainted: [W]=3DWARN
j=C3=BAn 01 08:00:38 migo-HP kernel: Hardware name: HP HP OmniBook X Flip L=
aptop
16-ar0xxx/8DA8, BIOS F.11 11/03/2025
j=C3=BAn 01 08:00:38 migo-HP kernel: RIP: 0010:__list_add_valid_or_report+0=
x7a/0xc0
j=C3=BAn 01 08:00:38 migo-HP kernel: Code: 48 89 e9 48 89 de 67 48 0f b9 3a=
 eb ba 48
39 16 74 1f 48 89 f7 e8 a6 3e 43 00 48 8d 3d cf 99 49 02 48 8b 13 48 89 d9 =
48
89 ee <67> 48 0f b9 3a eb 96 48 39 fe 74 07 b0 01 48 39 fa 75 1d 48 8d 05
j=C3=BAn 01 08:00:38 migo-HP kernel: RSP: 0018:ffffd4af0bfcfc38 EFLAGS: 000=
10202
j=C3=BAn 01 08:00:38 migo-HP kernel: RAX: 0000000000000001 RBX: ffff8e49a87=
87050
RCX: ffff8e49a8787050
j=C3=BAn 01 08:00:38 migo-HP kernel: RDX: ffff8e49a8787050 RSI: ffff8e485fd=
38918
RDI: ffffffffabcd6880
j=C3=BAn 01 08:00:38 migo-HP kernel: RBP: ffff8e485fd38918 R08: 00000000000=
00000
R09: ffffffffaba783a0
j=C3=BAn 01 08:00:38 migo-HP kernel: R10: ffffd4af0bfcf980 R11: ffffd4af0bf=
cf978
R12: ffff8e49a8786ae8
j=C3=BAn 01 08:00:38 migo-HP kernel: R13: ffff8e49a8786d40 R14: 00000000000=
00000
R15: ffff8e485fd32120
j=C3=BAn 01 08:00:38 migo-HP kernel: FS:  0000000000000000(0000)
GS:ffff8e4fd20be000(0000) knlGS:0000000000000000
j=C3=BAn 01 08:00:38 migo-HP kernel: CS:  0010 DS: 0000 ES: 0000 CR0:
0000000080050033
j=C3=BAn 01 08:00:38 migo-HP kernel: CR2: 000055c4f118b300 CR3: 0000000156e=
a2000
CR4: 0000000000f50ef0
j=C3=BAn 01 08:00:38 migo-HP kernel: PKRU: 55555554
j=C3=BAn 01 08:00:38 migo-HP kernel: Call Trace:
j=C3=BAn 01 08:00:38 migo-HP kernel:  <TASK>
j=C3=BAn 01 08:00:38 migo-HP kernel:  mt76_wcid_add_poll.cold+0xc/0x15 [mt76
7cf6658b74d841c34fe483c94ee6b25083fc57fc]
j=C3=BAn 01 08:00:38 migo-HP kernel:  mt7925_mac_tx_free+0x18a/0x350 [mt792=
5_common
1c2dd67f3597ac7800a7e155c7a2e0ae422e117e]
j=C3=BAn 01 08:00:38 migo-HP kernel:  mt7925_rx_check+0x63/0xf0 [mt7925_com=
mon
1c2dd67f3597ac7800a7e155c7a2e0ae422e117e]
j=C3=BAn 01 08:00:38 migo-HP kernel:  ? mt76_dma_rx_poll+0x18d/0x730 [mt76
7cf6658b74d841c34fe483c94ee6b25083fc57fc]
j=C3=BAn 01 08:00:38 migo-HP kernel:  mt76_dma_rx_poll+0x53a/0x730 [mt76
7cf6658b74d841c34fe483c94ee6b25083fc57fc]
j=C3=BAn 01 08:00:38 migo-HP kernel:  mt792x_poll_rx+0x52/0xe0 [mt792x_lib
41a54850c296b2e02daa140b7c7bca773a3b828c]
j=C3=BAn 01 08:00:38 migo-HP kernel:  __napi_poll+0xd2/0x210
j=C3=BAn 01 08:00:38 migo-HP kernel:  ? skb_defer_free_flush+0x9f/0xc0
j=C3=BAn 01 08:00:38 migo-HP kernel:  napi_threaded_poll_loop+0x131/0x200
j=C3=BAn 01 08:00:38 migo-HP kernel:  ? __pfx_napi_threaded_poll+0x10/0x10
j=C3=BAn 01 08:00:38 migo-HP kernel:  napi_threaded_poll+0xe1/0x120
j=C3=BAn 01 08:00:38 migo-HP kernel:  kthread+0xe1/0x120
j=C3=BAn 01 08:00:38 migo-HP kernel:  ? __pfx_kthread+0x10/0x10
j=C3=BAn 01 08:00:38 migo-HP kernel:  ret_from_fork+0x2a7/0x330
j=C3=BAn 01 08:00:38 migo-HP kernel:  ? __pfx_kthread+0x10/0x10
j=C3=BAn 01 08:00:38 migo-HP kernel:  ret_from_fork_asm+0x1a/0x30
j=C3=BAn 01 08:00:38 migo-HP kernel:  </TASK>
j=C3=BAn 01 08:00:38 migo-HP kernel: ---[ end trace 0000000000000000 ]---

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
