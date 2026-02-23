Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4412B301486
	for <platform-driver-x86@vger.kernel.org>; Mon, 23 Feb 2026 15:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771861732; cv=none; b=dpI7erFdstFNsvwJu600dNogspuq8cWpVUHASSjr/oSwRivxXfNAAQCKDLZrEn7nzlUXE5IgQu8Bq1YFj6BkuQMn8iqoKe73YiZD8YNkYKbBzydlYLuR8kajVbvfcb7jQTAGZBEIe2F7I2JuVKOqJ0FTLDMY7+XTZGLvbJ+Fk3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771861732; c=relaxed/simple;
	bh=9DEaIvqNXX4yAM+g0wL/sy+Mh1AMJuvgqz+19GFcfsM=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=AQZORR5u69Di1kz3Ghp6kO5Ql/VmomvEmno0acP/7Xvf+1Tm4Y5fShq8XBDkouRPDvMAdP8FcFoGWUzWKUz/CvLSD3hUrqaKfDyKtNHUTRHcb8HOJWCS86e1tN+BhiKJQyOZlJyZLLUfTz43eWVlj3UmVgKywdNbs8HcJVQCsQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e6SjLAew; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e6SjLAew"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771861731; x=1803397731;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version:content-id;
  bh=9DEaIvqNXX4yAM+g0wL/sy+Mh1AMJuvgqz+19GFcfsM=;
  b=e6SjLAewbSV72te40kIDHpDwa7rtKbWD0U/pYOd7ufRcD7nvoRhv6WJ7
   otG9an3bLxd2L3tHnIVKiM3ayC67TEiCI2XjPFao8F9qn9qnfmUZ6h1M/
   xSEoeg1PPUgeH06Vl9WJd49Ppig8in5VJX/pWMZ+CfTaDDwI1TFvSLu2F
   HjFSrWYvMyEeXVCVkMkdLkX9wlRZzNyoVVVZyCqWhClF2P54ifZo0SHR2
   CN0Y4huBN60p8r2307cZVWNKG3S61xMPK3YQZj4cySmr9Tx25Z8yAqBIV
   Jfg7FG2orPKaxqHlFQ+pr7wR+WFMeUrKkOhP92TdAq4mWEUQPjKE9sMIY
   A==;
X-CSE-ConnectionGUID: QExpi4v/S16rgLv9Fm9wtQ==
X-CSE-MsgGUID: sXyBKhcaQM6CNNUjUQypcg==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="76690096"
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; 
   d="scan'208";a="76690096"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2026 07:48:50 -0800
X-CSE-ConnectionGUID: +wiJ/OdcRYaSP6LV/HXf2g==
X-CSE-MsgGUID: SnMgCEOPQyGylnfm0Y+wXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; 
   d="scan'208";a="246191921"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.30])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2026 07:48:47 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 23 Feb 2026 17:48:44 +0200 (EET)
To: Daniel Kamil Kozar <dkk089@gmail.com>, 
    PDx86 ML <platform-driver-x86@vger.kernel.org>, 
    Mario Limonciello <mario.limonciello@amd.com>
cc: Jorge Lopez <jorge.lopez2@hp.com>, Hans de Goede <hansg@kernel.org>
Subject: Re: [hp-bioscfg] warning from kobject on module load, OmniBook 7
 14-fr0220
In-Reply-To: <20260222162949.5237-1-dkk089@gmail.com>
Message-ID: <42962490-6817-d7b2-c6ae-a300676a001a@linux.intel.com>
References: <20260222162949.5237-1-dkk089@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323328-1700577081-1771847822=:1095"
Content-ID: <9beb593a-18b4-5f15-4f51-a6a6e6894465@linux.intel.com>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1700577081-1771847822=:1095
Content-Type: text/plain; CHARSET=US-ASCII
Content-Transfer-Encoding: QUOTED-PRINTABLE
Content-ID: <edf62084-cf83-1f23-0309-07f7939e0a2e@linux.intel.com>

On Sun, 22 Feb 2026, Daniel Kamil Kozar wrote:

> Hello.
> When hp-bioscfg is automatically loaded on this hardware, it causes a war=
ning
> message from kobject saying that it "attempted to be registered with empt=
y
> name". Here's the full message :
>=20
> kobject: (0000000030f8f66b): attempted to be registered with empty name!
> WARNING: CPU: 1 PID: 596 at lib/kobject.c:219 kobject_add_internal+0x231/=
0x260
> Modules linked in: intel_powerclamp(+) soundwire_bus(+) coretemp processo=
r_thermal_device_pci snd_soc_sdca mac80211(+) snd_usb_audio(+) processor_th=
ermal_device snd_usbmidi_lib processor_thermal_wt_hint snd_soc_core snd_hwd=
ep kvm_intel platform_temperature_control ptp uvcvideo(+) snd_compress proc=
essor_thermal_soc_slider btusb snd_ump snd_hda_scodec_cs35l41_spi pps_core =
videobuf2_vmalloc uvc snd_hda_scodec_cs35l41_i2c ac97_bus libarc4 btmtk int=
el_rapl_msr mei_gsc_proxy processor_thermal_rfim hid_sensor_prox snd_rawmid=
i snd_hda_scodec_cs35l41 iTCO_wdt videobuf2_memops snd_pcm_dmaengine snd_se=
q_device hid_sensor_trigger kvm btrtl snd_soc_cs_amp_lib processor_thermal_=
rapl ucsi_acpi hp_bioscfg(+) snd_pcm videobuf2_v4l2 r8152(+) intel_pmc_bxt =
snd_soc_cs35l41_lib iwlwifi btbcm nls_iso8859_1 iTCO_vendor_support intel_r=
apl_common industrialio_triggered_buffer typec_ucsi mii cs_dsp videobuf2_co=
mmon irqbypass snd_timer btintel kfifo_buf vfat processor_thermal_wt_req fi=
rmware_attributes_class fat hid_multitouch
>  cfg80211 bluetooth spi_nor videodev i2c_i801 typec hid_sensor_iio_common=
 hp_wmi rapl libphy processor_thermal_power_floor snd mei_me i2c_smbus plat=
form_profile roles intel_cstate intel_uncore pcspkr industrialio sparse_key=
map wmi_bmof mtd mdio_bus intel_pmc_core mc soundcore mei crc8 i2c_mux rfki=
ll thunderbolt intel_vpu processor_thermal_mbox igen6_edac pmt_telemetry i2=
c_hid_acpi joydev int3403_thermal pmt_discovery mousedev i2c_hid serial_mul=
ti_instantiate int340x_thermal_zone pmt_class int3400_thermal acpi_tad pinc=
trl_meteorlake intel_pmc_ssram_telemetry acpi_thermal_rel acpi_pad mac_hid =
ntsync i2c_dev crypto_user sg nfnetlink dm_crypt encrypted_keys trusted asn=
1_encoder tee dm_mod hid_logitech_hidpp hid_logitech_dj hid_sensor_hub xe n=
vme drm_ttm_helper polyval_clmulni drm_suballoc_helper ghash_clmulni_intel =
nvme_core gpu_sched aesni_intel serio_raw intel_lpss_pci drm_gpuvm nvme_key=
ring nvme_auth intel_lpss spi_intel_pci drm_exec hkdf spi_intel idma64 inte=
l_vsec drm_gpusvm_helper i915 i2c_algo_bit
>  drm_buddy video wmi ttm intel_gtt drm_display_helper cec
> CPU: 1 UID: 0 PID: 596 Comm: (udev-worker) Not tainted 6.18.9-arch1-2 #1 =
PREEMPT(full)  acc0345693780c55f83aaf9a0c9efd10d8da358f
> Hardware name: HP HP OmniBook 7 Laptop 14-fr0xxx/8E3B, BIOS F.10 11/17/20=
25
> RIP: 0010:kobject_add_internal+0x231/0x260
> Code: c5 f7 ff ff 48 8b 7b 20 49 89 c4 48 85 ff 0f 84 87 fe ff ff e9 29 f=
e ff ff 0f 0b 48 89 de 48 c7 c7 28 22 e4 a0 e8 bf 24 fc fe <0f> 0b bd ea ff=
 ff ff e9 30 ff ff ff 0f 0b 0f 0b e9 1c ff ff ff 0f
> RSP: 0018:ffffcd6e81537988 EFLAGS: 00010246
> RAX: 0000000000000000 RBX: ffff89f9c837aa80 RCX: 0000000000000027
> RDX: ffff89fd3005d008 RSI: 0000000000000001 RDI: ffff89fd3005d000
> RBP: ffffcd6e81537a20 R08: 0000000000000000 R09: 00000000ffffefff
> R10: ffffffffa1661440 R11: ffffcd6e81537820 R12: 0000000000000000
> R13: ffffffffc1677333 R14: 00000000fffffff4 R15: ffff89f9c810fde0
> FS:  00007f2b3838e840(0000) GS:ffff89fd8dd2f000(0000) knlGS:0000000000000=
000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 000055dd52759060 CR3: 0000000106daa006 CR4: 0000000000f72ef0
> PKRU: 55555554
> Call Trace:
>  <TASK>
>  kobject_init_and_add+0x8e/0xc0
>  hp_init_bios_attributes+0x205/0x30e [hp_bioscfg c574c658bce9d823da6a359d=
e3b4753ff72740e8]
>  ? __pfx_hp_init+0x10/0x10 [hp_bioscfg c574c658bce9d823da6a359de3b4753ff7=
2740e8]
>  hp_init+0x155/0xff0 [hp_bioscfg c574c658bce9d823da6a359de3b4753ff72740e8=
]
>  do_one_initcall+0x5b/0x300
>  do_init_module+0x62/0x250
>  ? init_module_from_file+0x8a/0xe0
>  init_module_from_file+0x8a/0xe0
>  idempotent_init_module+0x114/0x310
>  __x64_sys_finit_module+0x6d/0xd0
>  ? syscall_trace_enter+0x8d/0x1d0
>  do_syscall_64+0x81/0x7f0
>  ? alloc_fd+0x12e/0x190
>  ? __rseq_handle_notify_resume+0xa6/0x490
>  ? switch_fpu_return+0x4e/0xd0
>  ? do_syscall_64+0x226/0x7f0
>  ? __rseq_handle_notify_resume+0xa6/0x490
>  ? switch_fpu_return+0x4e/0xd0
>  ? do_syscall_64+0x226/0x7f0
>  ? switch_fpu_return+0x4e/0xd0
>  entry_SYSCALL_64_after_hwframe+0x76/0x7e
> RIP: 0033:0x7f2b37d2706d
> Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 90 f3 0f 1e fa 48 89 f8 48 89 f=
7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff=
 ff 73 01 c3 48 8b 0d 73 ec 0c 00 f7 d8 64 89 01 48
> RSP: 002b:00007ffe1b58b888 EFLAGS: 00000246 ORIG_RAX: 0000000000000139
> RAX: ffffffffffffffda RBX: 000055fb9963cc20 RCX: 00007f2b37d2706d
> RDX: 0000000000000004 RSI: 00007f2b383452f2 RDI: 0000000000000057
> RBP: 00007ffe1b58b920 R08: 0000000000000000 R09: 000055fb99641af0
> R10: 0000000000000000 R11: 0000000000000246 R12: 00007f2b383452f2
> R13: 0000000000020000 R14: 000055fb9963e870 R15: 000055fb9963cc20
>  </TASK>
>=20
> Let me know if you need more information.

+ pdx86 ML and Mario.

This driver was only recently made functional due to fixing an=20
capitalization issue in its ID.  Mario has been fixing empty attribute=20
(and other) problems since then:

releases/6.18.4/platform-x86-hp-bioscfg-fix-out-of-bounds-array-acce.patch
releases/6.18.8/platform-x86-hp-bioscfg-fix-automatic-module-loading.patch
releases/6.18.8/platform-x86-hp-bioscfg-fix-kernel-panic-in-get_instance_id=
-macro.patch
releases/6.18.8/platform-x86-hp-bioscfg-fix-kobject-warnings-for-empty-attr=
ibute-names.patch
releases/6.18.10/platform-x86-hp-bioscfg-skip-empty-attribute-names.patch

It might be worth trying 6.18.10+ as 6.18.9 is missing that last empty=20
attribute fix.

--=20
 i.
--8323328-1700577081-1771847822=:1095--
