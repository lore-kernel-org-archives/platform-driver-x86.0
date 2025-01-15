Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55CC31DCB09
	for <platform-driver-x86@vger.kernel.org>; Wed, 15 Jan 2025 22:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736979792; cv=none; b=QfauGH0UE6ty+RupB3+Ecb6JG1pnxQ0yKimyaVOby+zArPQbpqb/GvbMPFTGKPai9xYt9O/f0J1Yr2ezWVGczaeGLwomiitCVmvOuKAVMN3XD1XKbgGsGXWNgX+UtgnEwgvC4DfCI/rIHQtME3i7OYhr7zuJ3Og7zT3DnQkxero=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736979792; c=relaxed/simple;
	bh=AeopueVkVDYf5UnDjUJQ3vz8JYYbJEb0S30mcNCGcAE=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=ezOadvxrud5NboURBa5FzUQrlK4FEjaZ3Z4SuTGH6hGgsPRUhNS+hEDkLaq/ZjGdP9fWpXX5IWS90IHxyrRC5HTnpFBS097Ci+88mpNc3XFEZdxvc+Pk+iCLuJczNI8qQFfSKvPSpdh1snuuBAhG/UTaCC4iNiQxgrKTISBznUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tFfyTwmT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tFfyTwmT"
Received: by smtp.kernel.org (Postfix) with ESMTPS id D905FC4CEE1
	for <platform-driver-x86@vger.kernel.org>; Wed, 15 Jan 2025 22:23:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736979791;
	bh=AeopueVkVDYf5UnDjUJQ3vz8JYYbJEb0S30mcNCGcAE=;
	h=From:To:Subject:Date:From;
	b=tFfyTwmTCB6jn3oOU0dGQqt4K5IEkiBC6vFXTpvJn06ISCx/4FErlRnhF+rb2ej12
	 9mrSrCI8Lt6ohqQE7rU2s+UvrTBHpbRcpPpjQoBQ/DUyJ/XmkAyYZVlnCeLm5mUesW
	 SXhqC12wx6JtUZT4Suweb6xeiLjWczZi1uN8QvyQpEC96wihW/CcI9qQHNdstg/89m
	 VNwChCtNA/x0+IEC4jA6zOVLdvU9ynzJpnu8rZ/Ipd4J7fD/32K9LHf5MLAER3KGDx
	 XTh/KRBoZL05tD+KrO4YzfbrXCKzOtncEkMH7fcqomBn/LLHLpeQq4lg9+pirMcUOs
	 qX63LZXiIM/0g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id CBE20C41614; Wed, 15 Jan 2025 22:23:11 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 219696] New: touchscreen (i2c) stop working after hibernation
 (Lenovo YB1-X91F)
Date: Wed, 15 Jan 2025 22:23:11 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: lakostis@altlinux.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression
Message-ID: <bug-219696-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219696

            Bug ID: 219696
           Summary: touchscreen (i2c) stop working after hibernation
                    (Lenovo YB1-X91F)
           Product: Drivers
           Version: 2.5
          Hardware: Intel
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: Platform_x86
          Assignee: drivers_platform_x86@kernel-bugs.osdl.org
          Reporter: lakostis@altlinux.org
        Regression: No

Hello!

Trying to get hibernation working on my Lenovo YB1-X91F but getting kernel
WARNING after resume and touchscreen doesn't work until suspend or reboot:

On first attempt WARNING is generated:

Jan 15 11:20:46 localhost.localdomain kernel: ACPI: PM: Waking up from syst=
em
sleep state S4
Jan 15 11:20:46 localhost.localdomain kernel: ------------[ cut here
]------------
Jan 15 11:20:46 localhost.localdomain kernel: i2c i2c-5: Transfer while
suspended
Jan 15 11:20:46 localhost.localdomain kernel: WARNING: CPU: 0 PID: 3010 at
drivers/i2c/i2c-core.h:56 __i2c_smbus_xfer+0x1ce/0x1e0
Jan 15 11:20:46 localhost.localdomain kernel: Modules linked in:
brcmfmac_wcc(E) rfcomm(E) snd_seq_dummy(E) snd_hrtimer(E) qrtr(E) cmac(E)
algif_hash(E) algif_skcipher(E) af_alg(E) bnep(E) uinput(E)
hid_sensor_custom_intel_hinge(E) hid_sensor_als(E) hid_sensor_accel_3d(E)
hid_sensor_trigger(E) hid_sensor_iio_common(E) hid_sensor_custom(E) coretem=
p(E)
intel_powerclamp(E) kvm_intel(E) hid_sensor_hub(E) kvm(E)
snd_soc_sst_cht_yogabook(E) bq27xxx_battery_i2c(E) bq27xxx_battery(E)
mei_hdcp(E) snd_soc_ts3a227e(E) intel_ishtp_hid(E) mei_pxp(E) intel_rapl_ms=
r(E)
crct10dif_pclmul(E) ledtrig_pattern(E) atomisp(CE) iTCO_wdt(E)
iTCO_vendor_support(E) spi_intel_platform(E) polyval_generic(E) spi_intel(E)
ghash_clmulni_intel(E) atomisp_gmin_platform(CE) gpio_keys(E) ipu_bridge(E)
sha512_ssse3(E) v4l2_fwnode(E) x86_android_tablets(E) sha256_ssse3(E)
v4l2_async(E) sha1_ssse3(E) videobuf2_vmalloc(E)
processor_thermal_device_pci_legacy(E) videobuf2_memops(E) aesni_intel(E)
processor_thermal_device(E) videobuf2_v4l2(E) snd_intel_sst_acpi(E)
crypto_simd(E)
Jan 15 11:20:46 localhost.localdomain kernel:  processor_thermal_wt_hint(E)
cryptd(E) snd_soc_acpi_intel_match(E) intel_cstate(E) snd_soc_rt5677(E)
snd_soc_acpi(E) processor_thermal_rfim(E) pcspkr(E) lenovo_yogabook(E)
snd_intel_sst_core(E) hci_uart(E) nls_utf8(E) processor_thermal_rapl(E)
videodev(E) snd_soc_sst_atom_hifi2_platform(E) snd_soc_rt5677_spi(E) btqca(=
E)
brcmfmac(E) wacom(E) nls_cp866(E) snd_soc_rl6231(E) intel_rapl_common(E)
wmi_bmof(E) snd_soc_core(E) processor_thermal_wt_req(E) pwrseq_core(E)
usbhid(E) videobuf2_common(E) processor_thermal_power_floor(E) mei_txe(E)
xhci_pci(E) vfat(E) btrtl(E) brcmutil(E) processor_thermal_mbox(E) mc(E)
cfg80211(E) leds_cht_wcove(E) fat(E) xhci_hcd(E) intel_soc_dts_iosf(E)
snd_hdmi_lpe_audio(E) btintel(E) snd_intel_dspcfg(E) usbcore(E)
intel_ish_ipc(E) snd_compress(E) lpc_ich(E) btbcm(E) mei(E)
snd_pcm_dmaengine(E) sx9310(E) intel_ishtp(E) ac97_bus(E) sx_common(E)
bluetooth(E) industrialio_triggered_buffer(E) kfifo_buf(E) snd_pcm(E)
industrialio(E) usb_common(E) thermal(E) intel_hid(E)
Jan 15 11:20:46 localhost.localdomain kernel:  int3400_thermal(E)
int3403_thermal(E) acpi_thermal_rel(E) int340x_thermal_zone(E) sparse_keyma=
p(E)
intel_int0002_vgpio(E) int3406_thermal(E) spi_pxa2xx_platform(E) tpm_crb(E)
spi_pxa2xx_core(E) rfkill_gpio(E) rfkill(E) drv260x(E) tpm_tis(E)
tiny_power_button(E) tpm_tis_core(E) soc_button_array(E) acpi_pad(E) button=
(E)
sch_fq_codel(E) snd_seq_midi(E) snd_seq_midi_event(E) snd_seq(E) snd_rawmid=
i(E)
snd_seq_device(E) snd_timer(E) snd(E) soundcore(E) msr(E) binder_linux(OE)
fuse(E) loop(E) efi_pstore(E) dm_mod(E) configfs(E) nfnetlink(E) efivarfs(E)
tpm(E) libaescfb(E) ecdh_generic(E) ecc(E) ip_tables(E) x_tables(E) autofs4=
(E)
f2fs(E) crc32_generic(E) lz4hc_compress(E) lz4_compress(E) i915(E) hwmon(E)
i2c_algo_bit(E) drm_buddy(E) ttm(E) intel_gtt(E) drm_display_helper(E)
mmc_block(E) cec(E) evdev(E) video(E) hid_multitouch(E) hid_generic(E)
joydev(E) crc32_pclmul(E) crc32c_intel(E) rc_core(E) sdhci_acpi(E) sdhci(E)
i2c_hid_acpi(E) i2c_hid(E) hid(E) mmc_core(E) goodix_ts(E) wmi(E)
Jan 15 11:20:46 localhost.localdomain kernel: Unloaded tainted modules:
polyval_clmulni(E):1 snd_pcsp(E):1 acpi_cpufreq(E):1 ac(E):2
Jan 15 11:20:46 localhost.localdomain kernel: CPU: 0 UID: 0 PID: 3010 Comm:
systemd-sleep Tainted: G         C OE      6.12.0-yogabook-alt1.9 #1
Jan 15 11:20:46 localhost.localdomain kernel: Tainted: [C]=3DCRAP,
[O]=3DOOT_MODULE, [E]=3DUNSIGNED_MODULE
Jan 15 11:20:46 localhost.localdomain kernel: Hardware name: LENOVO Lenovo
YB1-X91F/Lenovo YB1-X91F, BIOS 04WT23WW 01/17/2018
Jan 15 11:20:46 localhost.localdomain kernel: RIP:
0010:__i2c_smbus_xfer+0x1ce/0x1e0
Jan 15 11:20:46 localhost.localdomain kernel: Code: af c0 00 00 00 48 85 ed=
 75
04 48 8b 6f 70 48 8d 7b 70 e8 65 12 f1 ff 48 8d 30 48 8d 55 00 48 c7 c7 38 =
b8
4c 8a e8 52 99 7a ff <0f> 0b b8 94 ff ff ff e9 46 ff ff ff 66 0f 1f 44 00 0=
0 90
90 90 90
Jan 15 11:20:46 localhost.localdomain kernel: RSP: 0018:ffffbaf94055b360
EFLAGS: 00010246
Jan 15 11:20:46 localhost.localdomain kernel: RAX: 0000000000000000 RBX:
ffff9fcf810b70e8 RCX: 0000000000000000
Jan 15 11:20:46 localhost.localdomain kernel: RDX: 0000000000000000 RSI:
0000000000000000 RDI: 0000000000000000
Jan 15 11:20:46 localhost.localdomain kernel: RBP: ffff9fcf803bc8c0 R08:
0000000000000000 R09: 0000000000000000
Jan 15 11:20:46 localhost.localdomain kernel: R10: 0000000000000000 R11:
0000000000000000 R12: ffffbaf94055b3fe
Jan 15 11:20:46 localhost.localdomain kernel: R13: 0000000000000001 R14:
0000000000000057 R15: 0000000000000002
Jan 15 11:20:46 localhost.localdomain kernel: FS:  00007fc466a05600(0000)
GS:ffff9fcffbc00000(0000) knlGS:0000000000000000
Jan 15 11:20:46 localhost.localdomain kernel: CS:  0010 DS: 0000 ES: 0000 C=
R0:
0000000080050033
Jan 15 11:20:46 localhost.localdomain kernel: CR2: 00005596c8b42596 CR3:
000000013344c000 CR4: 00000000001026f0
Jan 15 11:20:46 localhost.localdomain kernel: Call Trace:
Jan 15 11:20:46 localhost.localdomain kernel:  <TASK>
Jan 15 11:20:46 localhost.localdomain kernel:  ? __warn.cold+0x93/0xaf
Jan 15 11:20:46 localhost.localdomain kernel:  ? __i2c_smbus_xfer+0x1ce/0x1=
e0
Jan 15 11:20:46 localhost.localdomain kernel:  ? report_bug+0xfb/0x180
Jan 15 11:20:46 localhost.localdomain kernel:  ? handle_bug+0x66/0xa0
Jan 15 11:20:46 localhost.localdomain kernel:  ? exc_invalid_op+0x18/0x80
Jan 15 11:20:46 localhost.localdomain kernel:  ? asm_exc_invalid_op+0x16/0x=
20
Jan 15 11:20:46 localhost.localdomain kernel:  ? __i2c_smbus_xfer+0x1ce/0x1=
e0
Jan 15 11:20:46 localhost.localdomain kernel:  i2c_smbus_xfer+0x8d/0x130
Jan 15 11:20:46 localhost.localdomain kernel:=20
i2c_smbus_read_byte_data+0x3e/0x80
Jan 15 11:20:46 localhost.localdomain kernel:  ? __pfx_kvm_resume+0x10/0x10
[kvm]
Jan 15 11:20:46 localhost.localdomain kernel:  ? sprintf+0x58/0x90
Jan 15 11:20:46 localhost.localdomain kernel:  cht_wc_byte_reg_read+0x2e/0x=
50
Jan 15 11:20:46 localhost.localdomain kernel:  _regmap_read+0x57/0xd0
Jan 15 11:20:46 localhost.localdomain kernel:  _regmap_update_bits+0xc8/0x1=
20
Jan 15 11:20:46 localhost.localdomain kernel:  ?
acpi_rs_convert_aml_to_resource+0x150/0x870
Jan 15 11:20:46 localhost.localdomain kernel:=20
regmap_update_bits_base+0x5a/0xa0
Jan 15 11:20:46 localhost.localdomain kernel:=20
intel_cht_wc_pmic_update_power+0x1a/0x40
Jan 15 11:20:46 localhost.localdomain kernel:=20
intel_pmic_power_handler+0xa6/0x140
Jan 15 11:20:46 localhost.localdomain kernel:=20
acpi_ev_address_space_dispatch+0x179/0x4e0
Jan 15 11:20:46 localhost.localdomain kernel:  ? chv_gpio_set+0x1d/0xa0
Jan 15 11:20:46 localhost.localdomain kernel:  ?
_raw_spin_unlock_irqrestore+0x22/0x60
Jan 15 11:20:46 localhost.localdomain kernel:  ?
__pfx_intel_pmic_power_handler+0x10/0x10
Jan 15 11:20:46 localhost.localdomain kernel:=20
acpi_ex_access_region+0x2a0/0x540
Jan 15 11:20:46 localhost.localdomain kernel:  ?
acpi_ut_acquire_mutex+0x98/0x270
Jan 15 11:20:46 localhost.localdomain kernel:  ? up+0xe/0x60
Jan 15 11:20:46 localhost.localdomain kernel:=20
acpi_ex_field_datum_io+0x9a/0x650
Jan 15 11:20:46 localhost.localdomain kernel:=20
acpi_ex_write_with_update_rule+0xdd/0x260
Jan 15 11:20:46 localhost.localdomain kernel:  ?
acpi_ns_search_one_scope+0xbb/0x290
Jan 15 11:20:46 localhost.localdomain kernel:  ?
acpi_ex_field_datum_io+0xe1/0x650
Jan 15 11:20:46 localhost.localdomain kernel:  ? acpi_ut_repair_name+0x2b/0=
x100
Jan 15 11:20:46 localhost.localdomain kernel:=20
acpi_ex_insert_into_field+0x347/0x410
Jan 15 11:20:46 localhost.localdomain kernel:=20
acpi_ex_write_data_to_field+0xd3/0x3d0
Jan 15 11:20:46 localhost.localdomain kernel:  ?
acpi_ut_allocate_object_desc_dbg+0x8e/0x130
Jan 15 11:20:46 localhost.localdomain kernel:  ? kfree+0x15b/0x300
Jan 15 11:20:46 localhost.localdomain kernel:=20
acpi_ex_store_object_to_node+0x1cc/0x3d0
Jan 15 11:20:46 localhost.localdomain kernel:  ?
acpi_ds_create_operand+0xd7/0x4e0
Jan 15 11:20:46 localhost.localdomain kernel:  acpi_ex_store+0x23d/0x4c0
Jan 15 11:20:46 localhost.localdomain kernel:=20
acpi_ex_opcode_1A_1T_1R+0xf5/0x690
Jan 15 11:20:46 localhost.localdomain kernel:  acpi_ds_exec_end_op+0x1a0/0x=
910
Jan 15 11:20:46 localhost.localdomain kernel:  ?
acpi_ps_get_next_arg+0x173/0x9f0
Jan 15 11:20:46 localhost.localdomain kernel:  ?
acpi_ps_complete_op+0x151/0x500
Jan 15 11:20:46 localhost.localdomain kernel:  acpi_ps_parse_loop+0x132/0xa=
50
Jan 15 11:20:46 localhost.localdomain kernel:  ?
kmem_cache_alloc_noprof+0x1c6/0x250
Jan 15 11:20:46 localhost.localdomain kernel:  acpi_ps_parse_aml+0xba/0x610
Jan 15 11:20:46 localhost.localdomain kernel:  ?
acpi_ut_create_internal_object_dbg+0xba/0x130
Jan 15 11:20:46 localhost.localdomain kernel:=20
acpi_ps_execute_method+0x170/0x3e0
Jan 15 11:20:46 localhost.localdomain kernel:  ?
acpi_ns_get_normalized_pathname+0xbe/0x190
Jan 15 11:20:46 localhost.localdomain kernel:  acpi_ns_evaluate+0x171/0x5e0
Jan 15 11:20:46 localhost.localdomain kernel:  acpi_evaluate_object+0x1d9/0=
x470
Jan 15 11:20:46 localhost.localdomain kernel:  __acpi_power_on+0x1e/0x100
Jan 15 11:20:46 localhost.localdomain kernel:=20
acpi_resume_power_resources+0x71/0xc0
Jan 15 11:20:46 localhost.localdomain kernel:  acpi_pm_finish.cold+0x35/0x83
Jan 15 11:20:46 localhost.localdomain kernel:  hibernation_snapshot+0x2bf/0=
x4b0
Jan 15 11:20:46 localhost.localdomain kernel:  hibernate.cold+0xa3/0x342
Jan 15 11:20:46 localhost.localdomain kernel:  state_store+0x8e/0xa0
Jan 15 11:20:46 localhost.localdomain kernel:=20
kernfs_fop_write_iter+0x14a/0x210
Jan 15 11:20:46 localhost.localdomain kernel:  vfs_write+0x27d/0x450
Jan 15 11:20:46 localhost.localdomain kernel:  ksys_write+0x61/0xf0
Jan 15 11:20:46 localhost.localdomain kernel:  do_syscall_64+0x83/0x1b0
Jan 15 11:20:46 localhost.localdomain kernel:  ?
syscall_exit_to_user_mode+0xe6/0x120
Jan 15 11:20:46 localhost.localdomain kernel:  ? do_syscall_64+0x8f/0x1b0
Jan 15 11:20:46 localhost.localdomain kernel:  ?
ptep_set_access_flags+0x3d/0x60
Jan 15 11:20:46 localhost.localdomain kernel:  ? _raw_spin_unlock+0x10/0x40
Jan 15 11:20:46 localhost.localdomain kernel:  ? wp_page_reuse.isra.0+0x7b/=
0xa0
Jan 15 11:20:46 localhost.localdomain kernel:  ? do_wp_page+0x75e/0xca0
Jan 15 11:20:46 localhost.localdomain kernel:  ? kmem_cache_free+0x1fc/0x3e0
Jan 15 11:20:46 localhost.localdomain kernel:  ? __pte_offset_map+0x12/0x140
Jan 15 11:20:46 localhost.localdomain kernel:  ? __handle_mm_fault+0x805/0x=
840
Jan 15 11:20:46 localhost.localdomain kernel:  ?
__count_memcg_events+0x83/0x120
Jan 15 11:20:46 localhost.localdomain kernel:  ?
count_memcg_events.constprop.0+0x26/0x50
Jan 15 11:20:46 localhost.localdomain kernel:  ? handle_mm_fault+0x1bd/0x2c0
Jan 15 11:20:46 localhost.localdomain kernel:  ? __ct_user_enter+0x92/0xd0
Jan 15 11:20:46 localhost.localdomain kernel:=20
entry_SYSCALL_64_after_hwframe+0x71/0x79
Jan 15 11:20:46 localhost.localdomain kernel: RIP: 0033:0x7fc4675948c0
Jan 15 11:20:46 localhost.localdomain kernel: Code: 85 0d 00 64 c7 00 16 00=
 00
00 b8 ff ff ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 80 3d a9 0a 0e 00 00 74 =
17
b8 01 00 00 00 0f 05 <48> 3d 00 f0 ff ff 77 58 c3 0f 1f 80 00 00 00 00 48 8=
3 ec
28 48 89
Jan 15 11:20:46 localhost.localdomain kernel: RSP: 002b:00007ffd92533b88
EFLAGS: 00000202 ORIG_RAX: 0000000000000001
Jan 15 11:20:46 localhost.localdomain kernel: RAX: ffffffffffffffda RBX:
0000000000000005 RCX: 00007fc4675948c0
Jan 15 11:20:46 localhost.localdomain kernel: RDX: 0000000000000005 RSI:
0000563e2d56de70 RDI: 0000000000000005
Jan 15 11:20:46 localhost.localdomain kernel: RBP: 0000563e2d56de70 R08:
0000000000000000 R09: 0000000000000001
Jan 15 11:20:46 localhost.localdomain kernel: R10: 0000000000000004 R11:
0000000000000202 R12: 0000000000000005
Jan 15 11:20:46 localhost.localdomain kernel: R13: 0000563e2d5662d0 R14:
00007fc46766bf20 R15: 00000000fffffff7
Jan 15 11:20:46 localhost.localdomain kernel:  </TASK>
Jan 15 11:20:46 localhost.localdomain kernel: ---[ end trace 00000000000000=
00
]---
Jan 15 11:20:46 localhost.localdomain kernel: ACPI Error: AE_ERROR, Returne=
d by
Handler for [UserDefinedRegion] (20240827/evregion-301)
Jan 15 11:20:46 localhost.localdomain kernel:=20
Jan 15 11:20:46 localhost.localdomain kernel: No Local Variables are
initialized for Method [_ON_]
Jan 15 11:20:46 localhost.localdomain kernel:=20
Jan 15 11:20:46 localhost.localdomain kernel: No Arguments are initialized =
for
method [_ON_]
Jan 15 11:20:46 localhost.localdomain kernel:=20
Jan 15 11:20:46 localhost.localdomain kernel: ACPI Error: Aborting method
\_SB.P18W._ON due to previous error (AE_ERROR) (20240827/psparse-529)

next cycles only produce ACPI Errors in the logs without WARNING (but touch=
pad
still don't work).

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
