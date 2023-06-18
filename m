Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14376EB64D7
	for <platform-driver-x86@archiver.kernel.org>; Sun, 18 Jun 2023 14:52:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229650AbjFROwX (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 18 Jun 2023 10:52:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229470AbjFROwW (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 18 Jun 2023 10:52:22 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA8D9C5
        for <platform-driver-x86@vger.kernel.org>; Sun, 18 Jun 2023 07:52:20 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 729C160B2C
        for <platform-driver-x86@vger.kernel.org>; Sun, 18 Jun 2023 14:52:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D3D76C433C8
        for <platform-driver-x86@vger.kernel.org>; Sun, 18 Jun 2023 14:52:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1687099939;
        bh=BqYnJ9wYQUuCOgEZlQff0ss9GKzn2L2skA9EBUyDCpQ=;
        h=From:To:Subject:Date:From;
        b=MG4NPZIMxTgKz4UWrwUZNQf9ApL+O8IqtTOk5ltmy7dPrcanqJ0KhNSAVZknA6A1N
         lap7gn0JzsRUEZa+Jl88y7oQhlX6fYWcqBhbUc6Tdq/bdFsKLDqb0zLtBVQ0rU5+Kt
         BAPTUzYG3eT9eZyRvKOA3IUjxnvm9Pe1oa8W7YRVinxyUtG30pFv38SFe20QA2ugOh
         wlBLm7y2w5sPby06dXlQ3YeYM0vtseAbJ08dRbI0y6KJ88rHiaiHpSSjkvBcbZr/iO
         ilFkfnzbRPVRee7sMoyKv59pqeCdIzaSCePgebx6XM8dvBZgpfoNWw+WyfKQGdCg/A
         r6S+0tTg0C2pA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id B90DFC4332E; Sun, 18 Jun 2023 14:52:19 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 217571] New: amd_pmf: AMD 7840HS cpufreq locked at 400-544MHz
 after power unplugged
Date:   Sun, 18 Jun 2023 14:52:19 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: allen@atr.me
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression
Message-ID: <bug-217571-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D217571

            Bug ID: 217571
           Summary: amd_pmf: AMD 7840HS cpufreq locked at 400-544MHz after
                    power unplugged
           Product: Drivers
           Version: 2.5
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: Platform_x86
          Assignee: drivers_platform_x86@kernel-bugs.osdl.org
          Reporter: allen@atr.me
        Regression: No

I'm using the newly published HP EliteBook 845 14 inch G10 with AMD Ryzen 7=
 PRO
7840HS CPU.

The system boot normally, with CPU Freq up to ~5.1GHz, but every time if I
unplug the AC power supply, it drops to 400-544MHz and locked there.

I've tried using cpupower to set frequency, using ryzenadj to set
--max-performance, none worked, only rebooting the system with AC power
attached could reset it back to normal.

For several times, even warm reboot could not reset, I've had to change some
setting in BIOS to trigger a cold reboot to make the CPU freq be normal aga=
in.

I'm using amd_pstate=3Dactive but I also observed the same issue with
amd_pstate=3Dpassive and acpi-cpufreq.

When the freq is locked to 400-544MHz, I get a warning in dmesg:

[   22.592078] ------------[ cut here ]------------
[   22.592081] Voluntary context switch within RCU read-side critical secti=
on!
[   22.592083] WARNING: CPU: 0 PID: 9 at kernel/rcu/tree_plugin.h:318
rcu_note_context_switch+0x5e0/0x660
[   22.592089] Modules linked in: tun ccm rfcomm hid_sensor_als
hid_sensor_trigger industrialio_triggered_buffer kfifo_buf
hid_sensor_iio_common industrialio hid_sensor_hub cmac algif_hash
algif_skcipher af_alg bnep uvcvideo btusb videobuf2_vmalloc btrtl uvc btbcm
videobuf2_memops videobuf2_v4l2 btintel btmtk videodev bluetooth
videobuf2_common mc ecdh_generic tcp_diag inet_diag snd_sof_amd_rembrandt v=
fat
fat snd_sof_amd_renoir iwlmvm snd_sof_amd_acp snd_sof_pci snd_hda_codec_rea=
ltek
snd_sof_xtensa_dsp snd_hda_codec_generic snd_sof snd_hda_scodec_cs35l41_spi
ledtrig_audio joydev snd_sof_utils mac80211 snd_hda_codec_hdmi mousedev
snd_soc_core snd_compress intel_rapl_msr libarc4 snd_hda_intel ac97_bus
intel_rapl_common snd_pcm_dmaengine snd_intel_dspcfg snd_pci_ps edac_mce_amd
snd_rpl_pci_acp6x snd_intel_sdw_acpi ext4 snd_hda_codec snd_acp_pci
snd_pci_acp6x snd_hda_scodec_cs35l41_i2c crc16 kvm_amd snd_hda_core
snd_hda_scodec_cs35l41 mbcache iwlwifi snd_pci_acp5x snd_hwdep
snd_hda_cs_dsp_ctls jbd2 snd_rn_pci_acp3x kvm
[   22.592117]  snd_pcm cs_dsp ucsi_acpi cfg80211 snd_timer snd_soc_cs35l41=
_lib
irqbypass hp_wmi snd_acp_config hid_multitouch typec_ucsi snd_soc_acpi snd
sparse_keymap rapl thunderbolt typec wmi_bmof pcspkr amd_sfh k10temp soundc=
ore
snd_pci_acp3x rfkill i2c_piix4 roles i2c_hid_acpi amd_pmf amd_pmc i2c_hid
serial_multi_instantiate platform_profile wireless_hotkey mac_hid crypto_us=
er
loop fuse bpf_preload ip_tables x_tables btrfs blake2b_generic libcrc32c
crc32c_generic xor raid6_pq dm_crypt cbc encrypted_keys trusted asn1_encoder
tee dm_mod hid_logitech_hidpp hid_logitech_dj usbhid amdgpu serio_raw
i2c_algo_bit atkbd drm_ttm_helper libps2 ttm crct10dif_pclmul crc32_pclmul
crc32c_intel polyval_clmulni polyval_generic gf128mul drm_suballoc_helper
vivaldi_fmap ghash_clmulni_intel nvme sha512_ssse3 drm_buddy aesni_intel
gpu_sched nvme_core crypto_simd drm_display_helper xhci_pci cryptd video i8=
042
ccp cec xhci_pci_renesas nvme_common serio wmi
[   22.592149] CPU: 0 PID: 9 Comm: kworker/0:1 Not tainted 6.4.0-rc6-1-main=
line
#1 f389f89fcf30e775529b6bb0f192e37f43fa3079
[   22.592150] Hardware name: HP HP EliteBook 845 14 inch G10 Notebook PC/8=
B6E,
BIOS V82 Ver. 01.01.08 05/22/2023
[   22.592151] Workqueue: events power_supply_changed_work
[   22.592154] RIP: 0010:rcu_note_context_switch+0x5e0/0x660
[   22.592156] Code: 00 00 00 00 0f 85 07 fd ff ff 49 89 8c 24 a0 00 00 00 =
e9
fa fc ff ff 48 c7 c7 10 ec 63 ac c6 05 6e 95 e5 01 01 e8 90 4f f4 ff <0f> 0=
b e9
7b fa ff ff 49 83 bc 24 98 00 00 00 00 49 8b 84 24 a0 00
[   22.592157] RSP: 0018:ffffb60700187bc0 EFLAGS: 00010082
[   22.592158] RAX: 0000000000000000 RBX: ffff99783e834f40 RCX:
0000000000000027
[   22.592158] RDX: ffff99783e821688 RSI: 0000000000000001 RDI:
ffff99783e821680
[   22.592159] RBP: 0000000000000000 R08: 0000000000000000 R09:
ffffb60700187a50
[   22.592159] R10: 0000000000000003 R11: ffffffffaceca808 R12:
ffff99783e834040
[   22.592160] R13: ffff996900832700 R14: 0000000000000000 R15:
ffff996909fe9c50
[   22.592160] FS:  0000000000000000(0000) GS:ffff99783e800000(0000)
knlGS:0000000000000000
[   22.592161] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   22.592161] CR2: 0000563c72ba1018 CR3: 0000000e32a20000 CR4:
0000000000750ef0
[   22.592162] PKRU: 55555554
[   22.592162] Call Trace:
[   22.592164]  <TASK>
[   22.592164]  ? rcu_note_context_switch+0x5e0/0x660
[   22.592166]  ? __warn+0x81/0x130
[   22.592171]  ? rcu_note_context_switch+0x5e0/0x660
[   22.592172]  ? report_bug+0x171/0x1a0
[   22.592175]  ? prb_read_valid+0x1b/0x30
[   22.592177]  ? handle_bug+0x3c/0x80
[   22.592178]  ? exc_invalid_op+0x17/0x70
[   22.592179]  ? asm_exc_invalid_op+0x1a/0x20
[   22.592182]  ? rcu_note_context_switch+0x5e0/0x660
[   22.592183]  ? acpi_ut_delete_object_desc+0x86/0xb0
[   22.592186]  ? acpi_ut_update_ref_count.part.0+0x22d/0x930
[   22.592187]  __schedule+0xc0/0x1410
[   22.592189]  ? ktime_get+0x3c/0xa0
[   22.592191]  ? lapic_next_event+0x1d/0x30
[   22.592193]  ? hrtimer_start_range_ns+0x25b/0x350
[   22.592196]  schedule+0x5e/0xd0
[   22.592197]  schedule_hrtimeout_range_clock+0xbe/0x140
[   22.592199]  ? __pfx_hrtimer_wakeup+0x10/0x10
[   22.592200]  usleep_range_state+0x64/0x90
[   22.592203]  amd_pmf_send_cmd+0x106/0x2a0 [amd_pmf
bddfe0fe3712aaa99acce3d5487405c5213c6616]
[   22.592207]  amd_pmf_update_slider+0x56/0x1b0 [amd_pmf
bddfe0fe3712aaa99acce3d5487405c5213c6616]
[   22.592210]  amd_pmf_set_sps_power_limits+0x72/0x80 [amd_pmf
bddfe0fe3712aaa99acce3d5487405c5213c6616]
[   22.592213]  amd_pmf_pwr_src_notify_call+0x49/0x90 [amd_pmf
bddfe0fe3712aaa99acce3d5487405c5213c6616]
[   22.592216]  notifier_call_chain+0x5a/0xd0
[   22.592218]  atomic_notifier_call_chain+0x32/0x50
[   22.592219]  power_supply_changed_work+0x7c/0xe0
[   22.592220]  process_one_work+0x1c4/0x3d0
[   22.592223]  worker_thread+0x51/0x390
[   22.592225]  ? __pfx_worker_thread+0x10/0x10
[   22.592226]  kthread+0xe5/0x120
[   22.592228]  ? __pfx_kthread+0x10/0x10
[   22.592229]  ret_from_fork+0x29/0x50
[   22.592233]  </TASK>
[   22.592233] ---[ end trace 0000000000000000 ]---

This is also the case if I boot the system without AC supply plugged.

My boot parameters are:

root=3D/dev/mapper/vg-root rw rootflags=3Dsubvol=3D@ amdgpu.sg_display=3D0 =
amd_iommu=3Don
iommu=3Dpt amd_pstate=3Dactive loglevel=3D3 cryptdevice=3DUUID=3Dxxxx-xxxx:=
cryptdev
resume=3D/dev/vg/swap nowatchdog modprobe.blacklist=3Dsp5100_tco

I've tried with linux-6.3.8, linux-zen-6.3.8 from ArchLinux, my self compil=
ed
6.3.8 and mainline 6.4.0-rc6, 6.4.0-rc6-r269-g1b29d271614a without any luck,
they all behavior the same. It's a 100% reproducible issue for me.

With the help of FlyGoat I tried to blacklist amd_pmf as a workaround and it
works.=20

Without amd_pmf CPU freq is not locked at 400-544MHz after unplugging the
power, no warning in dmesg as well.

If modprobe amd_pmf without AC power, the CPU freq get locked at 400-544MHz=
 in
several seconds and the warning is printed to dmesg as described above,
modprobe -r amd_pmf does not fix it, only rebooting could reset.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
