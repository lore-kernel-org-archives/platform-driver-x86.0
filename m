Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AD4F3EA951
	for <platform-driver-x86@vger.kernel.org>; Tue,  9 Jun 2026 08:13:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780992793; cv=none; b=fwbgkXO9tbqZwR22+wdP9vPKwi4/gs+xnPwfn+ArH2FnjTSEMYBrBj5uL1ZXqa4Zq6qaRXFUmkLt2Z5e0nCv1SgNqxCFkOLT8zasE15Z49SU+d9OBRWr0Z9SWdYhp7l5cS9N6mOzG9IBfR2CZXeeEgnWz8i2FwpZ1y4LVzOgLws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780992793; c=relaxed/simple;
	bh=IYdH+7y3bXxb/EvTrWdQatNXLZGbVuZ4KkaWEvFGm3Y=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=ZfU0lRM42PQUAcFMkbAjWHlZcTEYx7S0Pkhopiql05Nepv3n4VSx7kAAb8XZr17jj+sthvWWEP7uPS5uzqc1kAb8w9tAJk+VUHL5eYb9UUz20WCmvpTc91kUsNN0ASLqv8uLoub/6BqTzTBbS0o5s7hpoXL90wo3jMlm2jcHmMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TD3wA8+h; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TD3wA8+h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780992791; x=1812528791;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=IYdH+7y3bXxb/EvTrWdQatNXLZGbVuZ4KkaWEvFGm3Y=;
  b=TD3wA8+hHSuzxUV4gDiYGFfmOOEwdPGoXnDk0zANkVLHjyEEKmO/qkc2
   lQPCqaI//J23Ctv2PHPUPqMutkTAsfkmD9VstvEChKy9PwMl27645oZNZ
   CYOdgbgsyzdCS13s1XkqG+pwOqherq5b8ybo0KQMoMWpC10ilvdE5OThq
   V/4h9OpSkizjDoTqMCU7sz4PJoKJLc1L+OCVk82dFin3R1qW3xv+eizoc
   FZxOJ8J6er2clSKsZr4XIlzwhkCUkBe/zjILlUTzJ1x8mfwaHi1VTFc+Y
   TaS4lnGKpLnzNY61DG52cn4aTEMNVdilRAabT550tmeiZVRPTRSGLPv6r
   w==;
X-CSE-ConnectionGUID: 3ed6cq50The0jU65shWqQQ==
X-CSE-MsgGUID: 3p+50nbMRA+mG+4z8PBzqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11811"; a="80878694"
X-IronPort-AV: E=Sophos;i="6.24,195,1774335600"; 
   d="scan'208";a="80878694"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2026 01:13:11 -0700
X-CSE-ConnectionGUID: e67d3+JLRB6WRP8EPDySUw==
X-CSE-MsgGUID: 8ke578uNSsCvr+cw2O+iXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,195,1774335600"; 
   d="scan'208";a="247659558"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.81])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2026 01:13:08 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 9 Jun 2026 11:13:05 +0300 (EEST)
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
cc: Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org, 
    mario.limonciello@amd.com, Sanket.Goswami@amd.com
Subject: Re: [PATCH v2 1/2] platform/x86/amd/pmc: Use per-SoC cpu_info struct
 for SMU mailbox and IP info
In-Reply-To: <382cf3ea-1142-4044-a0ce-53a7cf56f313@amd.com>
Message-ID: <942aef05-7570-cb19-9467-5523df47bf01@linux.intel.com>
References: <20260601112103.1690951-1-Shyam-sundar.S-k@amd.com> <20260601112103.1690951-2-Shyam-sundar.S-k@amd.com> <d18cbafc-fd11-c3f9-db5f-4976ba26e711@linux.intel.com> <382cf3ea-1142-4044-a0ce-53a7cf56f313@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-2097158941-1780992785=:1206"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-2097158941-1780992785=:1206
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Tue, 9 Jun 2026, Shyam Sundar S K wrote:
> On 6/8/2026 14:38, Ilpo J=C3=A4rvinen wrote:
> > On Mon, 1 Jun 2026, Shyam Sundar S K wrote:
> >=20
> >> Replace the scattered per-field assignments in amd_pmc_get_ip_info() a=
nd
> >> amd_pmc_get_os_hint() with a single amd_pmc_cpu_info struct capturing =
all
> >> SoC-specific parameters such as SMU offsets, IP block table, and OS hi=
nt.
> >>
> >> Define static const instances per SoC variant and embed them as
> >> driver_data in the PCI ID table via PCI_DEVICE_DATA(), avoiding runtim=
e
> >> switch statements. Store a pointer in amd_pmc_dev replacing the indivi=
dual
> >> smu_msg, num_ips, and ips_ptr fields, SMU send/receive paths and debug=
fs
> >> iterator dereference through it. For the 1Ah M70 variant requiring
> >> boot_cpu_data.x86_model detection, fallback to amd_pmc_set_cpu_info().
> >>
> >> Also, rename AMD_CPU_ID_* to PCI_DEVICE_ID_AMD_CPU_ID_* with compatibi=
lity
> >> aliases.
> >>
> >> Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
> >> Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
> >> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> >> ---
> >>  drivers/platform/x86/amd/pmc/pmc.c | 161 +++++++++++++++++++---------=
-
> >>  drivers/platform/x86/amd/pmc/pmc.h |  69 +++++++++----
> >>  2 files changed, 156 insertions(+), 74 deletions(-)
> >>
> >> diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86=
/amd/pmc/pmc.c
> >> index cae3fcafd4d7..6c7fa80c7f09 100644
> >> --- a/drivers/platform/x86/amd/pmc/pmc.c
> >> +++ b/drivers/platform/x86/amd/pmc/pmc.c
> >> @@ -85,6 +85,52 @@ static const struct amd_pmc_bit_map soc15_ip_blk[] =
=3D {
> >>  =09{"VPE",=09=09BIT(21)},
> >>  };
> >> =20
> >> +/* CPU info structures for different SoC variants */
> >> +static const struct amd_pmc_cpu_info amd_pco_cpu_info =3D {
> >> +=09.smu_msg=09=3D AMD_PMC_REGISTER_MESSAGE,
> >> +=09.smu_arg=09=3D AMD_PMC_REGISTER_ARGUMENT,
> >> +=09.smu_rsp=09=3D AMD_PMC_REGISTER_RESPONSE,
> >> +=09.num_ips=09=3D 12,
> >> +=09.ips_ptr=09=3D soc15_ip_blk,
> >> +=09.os_hint=09=3D MSG_OS_HINT_PCO,
> >> +};
> >> +
> >> +static const struct amd_pmc_cpu_info amd_rn_cpu_info =3D {
> >> +=09.smu_msg=09=3D AMD_PMC_REGISTER_MESSAGE,
> >> +=09.smu_arg=09=3D AMD_PMC_REGISTER_ARGUMENT,
> >> +=09.smu_rsp=09=3D AMD_PMC_REGISTER_RESPONSE,
> >> +=09.num_ips=09=3D 12,
> >> +=09.ips_ptr=09=3D soc15_ip_blk,
> >> +=09.os_hint=09=3D MSG_OS_HINT_RN,
> >> +};
> >> +
> >> +static const struct amd_pmc_cpu_info amd_ps_cpu_info =3D {
> >> +=09.smu_msg=09=3D AMD_PMC_REGISTER_MESSAGE,
> >> +=09.smu_arg=09=3D AMD_PMC_REGISTER_ARGUMENT,
> >> +=09.smu_rsp=09=3D AMD_PMC_REGISTER_RESPONSE,
> >> +=09.num_ips=09=3D 21,
> >> +=09.ips_ptr=09=3D soc15_ip_blk,
> >> +=09.os_hint=09=3D MSG_OS_HINT_RN,
> >> +};
> >> +
> >> +static const struct amd_pmc_cpu_info amd_1ah_cpu_info =3D {
> >> +=09.smu_msg=09=3D AMD_PMC_REGISTER_MSG_1AH_20H,
> >> +=09.smu_arg=09=3D AMD_PMC_REGISTER_ARGUMENT,
> >> +=09.smu_rsp=09=3D AMD_PMC_REGISTER_RESPONSE,
> >> +=09.num_ips=09=3D ARRAY_SIZE(soc15_ip_blk),
> >> +=09.ips_ptr=09=3D soc15_ip_blk,
> >> +=09.os_hint=09=3D MSG_OS_HINT_RN,
> >> +};
> >> +
> >> +static const struct amd_pmc_cpu_info amd_1ah_m70_cpu_info =3D {
> >> +=09.smu_msg=09=3D AMD_PMC_REGISTER_MSG_1AH_20H,
> >> +=09.smu_arg=09=3D AMD_PMC_REGISTER_ARGUMENT,
> >> +=09.smu_rsp=09=3D AMD_PMC_REGISTER_RESPONSE,
> >> +=09.num_ips=09=3D ARRAY_SIZE(soc15_ip_blk_v2),
> >> +=09.ips_ptr=09=3D soc15_ip_blk_v2,
> >> +=09.os_hint=09=3D MSG_OS_HINT_RN,
> >> +};
> >> +
> >>  static bool disable_workarounds;
> >>  module_param(disable_workarounds, bool, 0644);
> >>  MODULE_PARM_DESC(disable_workarounds, "Disable workarounds for platfo=
rm bugs");
> >> @@ -101,35 +147,37 @@ static inline void amd_pmc_reg_write(struct amd_=
pmc_dev *dev, int reg_offset, u3
> >>  =09iowrite32(val, dev->regbase + reg_offset);
> >>  }
> >> =20
> >> -static void amd_pmc_get_ip_info(struct amd_pmc_dev *dev)
> >> +static void amd_pmc_set_cpu_info(struct amd_pmc_dev *dev)
> >>  {
> >> +=09const struct amd_pmc_cpu_info *info =3D NULL;
> >> +
> >>  =09switch (dev->cpu_id) {
> >>  =09case AMD_CPU_ID_PCO:
> >> +=09=09info =3D &amd_pco_cpu_info;
> >> +=09=09break;
> >>  =09case AMD_CPU_ID_RN:
> >>  =09case AMD_CPU_ID_VG:
> >>  =09case AMD_CPU_ID_YC:
> >>  =09case AMD_CPU_ID_CB:
> >> -=09=09dev->num_ips =3D 12;
> >> -=09=09dev->ips_ptr =3D soc15_ip_blk;
> >> -=09=09dev->smu_msg =3D 0x538;
> >> +=09=09info =3D &amd_rn_cpu_info;
> >>  =09=09break;
> >>  =09case AMD_CPU_ID_PS:
> >> -=09=09dev->num_ips =3D 21;
> >> -=09=09dev->ips_ptr =3D soc15_ip_blk;
> >> -=09=09dev->smu_msg =3D 0x538;
> >> +=09=09info =3D &amd_ps_cpu_info;
> >=20
> > Are these actually needed, can't the code be reorganized so here we do=
=20
> > only:
> >=20
> > =09id =3D pci_match_id(pmc_pci_ids, rdev);
> > =09if (!id)
> > =09=09return -ENODEV;
> >=20
> > =09if (id->driver_data) {
> > =09=09dev->cpu_info =3D id->driver_data;
> > =09=09return 0;
> > =09}
> >=20
> > =09switch (...) {
> >=20
> >>  =09case PCI_DEVICE_ID_AMD_1AH_M20H_ROOT:
> >>  =09case PCI_DEVICE_ID_AMD_1AH_M60H_ROOT:
> >> -=09=09if (boot_cpu_data.x86_model =3D=3D 0x70) {
> >> -=09=09=09dev->num_ips =3D ARRAY_SIZE(soc15_ip_blk_v2);
> >> -=09=09=09dev->ips_ptr =3D soc15_ip_blk_v2;
> >> -=09=09} else {
> >> -=09=09=09dev->num_ips =3D ARRAY_SIZE(soc15_ip_blk);
> >> -=09=09=09dev->ips_ptr =3D soc15_ip_blk;
> >> -=09=09}
> >> -=09=09dev->smu_msg =3D 0x938;
> >> +=09=09/* Special case: check x86_model for M70 variant */
> >> +=09=09if (boot_cpu_data.x86_model =3D=3D 0x70)
> >> +=09=09=09info =3D &amd_1ah_m70_cpu_info;
> >> +=09=09else
> >> +=09=09=09info =3D &amd_1ah_cpu_info;
> >=20
> > Just assign directly to dev->cpu_info.
> >=20
> >>  =09=09break;
> >> +=09default:
> >> +=09=09dev_err(dev->dev, "Unknown CPU ID: 0x%x\n", dev->cpu_id);
> >> +=09=09return;
> >>  =09}
> >> +
> >> +=09dev->cpu_info =3D info;
> >>  }
> >> =20
> >>  static int amd_pmc_setup_smu_logging(struct amd_pmc_dev *dev)
> >> @@ -296,9 +344,9 @@ static int smu_fw_info_show(struct seq_file *s, vo=
id *unused)
> >>  =09=09   table.timeto_resume_to_os_lastcapture);
> >> =20
> >>  =09seq_puts(s, "\n=3D=3D=3D Active time (in us) =3D=3D=3D\n");
> >> -=09for (idx =3D 0 ; idx < dev->num_ips ; idx++) {
> >> -=09=09if (dev->ips_ptr[idx].bit_mask & dev->active_ips)
> >> -=09=09=09seq_printf(s, "%-8s : %lld\n", dev->ips_ptr[idx].name,
> >> +=09for (idx =3D 0 ; idx < dev->cpu_info->num_ips ; idx++) {
> >> +=09=09if (dev->cpu_info->ips_ptr[idx].bit_mask & dev->active_ips)
> >> +=09=09=09seq_printf(s, "%-8s : %lld\n", dev->cpu_info->ips_ptr[idx].n=
ame,
> >>  =09=09=09=09   table.timecondition_notmet_lastcapture[idx]);
> >>  =09}
> >> =20
> >> @@ -425,9 +473,9 @@ static void amd_pmc_dump_registers(struct amd_pmc_=
dev *dev)
> >>  =09=09argument =3D dev->stb_arg.arg;
> >>  =09=09response =3D dev->stb_arg.resp;
> >>  =09} else {
> >> -=09=09message =3D dev->smu_msg;
> >> -=09=09argument =3D AMD_PMC_REGISTER_ARGUMENT;
> >> -=09=09response =3D AMD_PMC_REGISTER_RESPONSE;
> >> +=09=09message =3D dev->cpu_info->smu_msg;
> >> +=09=09argument =3D dev->cpu_info->smu_arg;
> >> +=09=09response =3D dev->cpu_info->smu_rsp;
> >>  =09}
> >> =20
> >>  =09value =3D amd_pmc_reg_read(dev, response);
> >> @@ -452,9 +500,9 @@ int amd_pmc_send_cmd(struct amd_pmc_dev *dev, u32 =
arg, u32 *data, u8 msg, bool r
> >>  =09=09argument =3D dev->stb_arg.arg;
> >>  =09=09response =3D dev->stb_arg.resp;
> >>  =09} else {
> >> -=09=09message =3D dev->smu_msg;
> >> -=09=09argument =3D AMD_PMC_REGISTER_ARGUMENT;
> >> -=09=09response =3D AMD_PMC_REGISTER_RESPONSE;
> >> +=09=09message =3D dev->cpu_info->smu_msg;
> >> +=09=09argument =3D dev->cpu_info->smu_arg;
> >> +=09=09response =3D dev->cpu_info->smu_rsp;
> >>  =09}
> >> =20
> >>  =09/* Wait until we get a valid response */
> >> @@ -514,19 +562,12 @@ int amd_pmc_send_cmd(struct amd_pmc_dev *dev, u3=
2 arg, u32 *data, u8 msg, bool r
> >> =20
> >>  static int amd_pmc_get_os_hint(struct amd_pmc_dev *dev)
> >>  {
> >> -=09switch (dev->cpu_id) {
> >> -=09case AMD_CPU_ID_PCO:
> >> -=09=09return MSG_OS_HINT_PCO;
> >> -=09case AMD_CPU_ID_RN:
> >> -=09case AMD_CPU_ID_VG:
> >> -=09case AMD_CPU_ID_YC:
> >> -=09case AMD_CPU_ID_CB:
> >> -=09case AMD_CPU_ID_PS:
> >> -=09case PCI_DEVICE_ID_AMD_1AH_M20H_ROOT:
> >> -=09case PCI_DEVICE_ID_AMD_1AH_M60H_ROOT:
> >> -=09=09return MSG_OS_HINT_RN;
> >> +=09if (!dev->cpu_info) {
> >> +=09=09dev_err(dev->dev, "CPU info not initialized\n");
> >> +=09=09return -EINVAL;
> >>  =09}
> >> -=09return -EINVAL;
> >> +
> >> +=09return dev->cpu_info->os_hint;
> >=20
> > If there's always a cpu_info struct (see below), the whole function can=
 be=20
> > removed and the caller just uses the ->cpu_info->os_hint directly.
> >=20
> >>  }
> >> =20
> >>  static int amd_pmc_wa_irq1(struct amd_pmc_dev *pdev)
> >> @@ -710,18 +751,18 @@ static const struct dev_pm_ops amd_pmc_pm =3D {
> >>  };
> >> =20
> >>  static const struct pci_device_id pmc_pci_ids[] =3D {
> >> -=09{ PCI_DEVICE(PCI_VENDOR_ID_AMD, AMD_CPU_ID_PS) },
> >> -=09{ PCI_DEVICE(PCI_VENDOR_ID_AMD, AMD_CPU_ID_CB) },
> >> -=09{ PCI_DEVICE(PCI_VENDOR_ID_AMD, AMD_CPU_ID_YC) },
> >> -=09{ PCI_DEVICE(PCI_VENDOR_ID_AMD, AMD_CPU_ID_CZN) },
> >> -=09{ PCI_DEVICE(PCI_VENDOR_ID_AMD, AMD_CPU_ID_RN) },
> >> -=09{ PCI_DEVICE(PCI_VENDOR_ID_AMD, AMD_CPU_ID_PCO) },
> >> -=09{ PCI_DEVICE(PCI_VENDOR_ID_AMD, AMD_CPU_ID_RV) },
> >> -=09{ PCI_DEVICE(PCI_VENDOR_ID_AMD, AMD_CPU_ID_SP) },
> >> -=09{ PCI_DEVICE(PCI_VENDOR_ID_AMD, AMD_CPU_ID_SHP) },
> >> -=09{ PCI_DEVICE(PCI_VENDOR_ID_AMD, AMD_CPU_ID_VG) },
> >> -=09{ PCI_DEVICE(PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_1AH_M20H_ROOT) }=
,
> >> -=09{ PCI_DEVICE(PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_1AH_M60H_ROOT) }=
,
> >> +=09{ PCI_DEVICE_DATA(AMD, CPU_ID_PCO, &amd_pco_cpu_info) },
> >> +=09{ PCI_DEVICE_DATA(AMD, CPU_ID_RV, &amd_pco_cpu_info) },
> >> +=09{ PCI_DEVICE_DATA(AMD, CPU_ID_RN, &amd_rn_cpu_info) },
> >> +=09{ PCI_DEVICE_DATA(AMD, CPU_ID_CZN, &amd_rn_cpu_info) },
> >> +=09{ PCI_DEVICE_DATA(AMD, CPU_ID_VG, &amd_rn_cpu_info) },
> >> +=09{ PCI_DEVICE_DATA(AMD, CPU_ID_YC, &amd_rn_cpu_info) },
> >> +=09{ PCI_DEVICE_DATA(AMD, CPU_ID_CB, &amd_rn_cpu_info) },
> >> +=09{ PCI_DEVICE_DATA(AMD, CPU_ID_PS, &amd_ps_cpu_info) },
> >> +=09{ PCI_DEVICE_DATA(AMD, CPU_ID_SP, NULL) },
> >> +=09{ PCI_DEVICE_DATA(AMD, CPU_ID_SHP, NULL) },
> >=20
> > I suggest you add a dummy entry for these two as well so we'll always=
=20
> > have a valid cpu_info struct.
>=20
> Ack to other comments quoted above. But, to the specific one here:
>=20
> There are certain platforms where s2idle is not supported; you can
> look at amd_pmc_probe()
>=20
> if (dev->cpu_id =3D=3D AMD_CPU_ID_SP || dev->cpu_id =3D=3D AMD_CPU_ID_SHP=
) {
>   dev_warn_once(dev->dev, "S0i3 is not supported on this hardware\n");
>   ..
> }
>=20
> Hence I had the intent to just pass NULL to driver data field of
> PCI_DEVICE_DATA().
>=20
> Since CPU_ID_SP and CPU_ID_SHP do not support s2idle, not thinking to
> add a dummy so that we don't add unnecessary code, something like below.
>=20
>=20
> +static const struct amd_pmc_cpu_info amd_sp_cpu_info =3D {
> +=09.smu_msg=09=3D AMD_PMC_REGISTER_MESSAGE,
> +=09.smu_arg=09=3D AMD_PMC_REGISTER_ARGUMENT,
> +=09.smu_rsp=09=3D AMD_PMC_REGISTER_RESPONSE,
> +=09.num_ips=09=3D 0,
> +=09.ips_ptr=09=3D NULL,
> +=09.os_hint=09=3D 0,
> +};
>=20
> ...
>=20
>=20
> +=09{ PCI_DEVICE_DATA(AMD, CPU_ID_SP, &amd_sp_cpu_info) },
> +=09{ PCI_DEVICE_DATA(AMD, CPU_ID_SHP, &amd_sp_cpu_info) },
>=20
> I have sent a new version without making the above change. But, if you
> think it makes sense to add the above dummy struct for the platforms
> that dont support also would be happy to respin again.

Thanks, I can live the NULLs there (the reason why I suggested it was=20
the NULL checks this version added into amd_pmc_get_os_hint(), etc. but=20
since those are now gone it seems okay for me).

--
 i.

> >> +=09{ PCI_DEVICE_DATA(AMD, 1AH_M20H_ROOT, NULL) },
> >> +=09{ PCI_DEVICE_DATA(AMD, 1AH_M60H_ROOT, NULL) },
> >>  =09{ }
> >>  };
> >> =20
> >> @@ -729,6 +770,7 @@ static int amd_pmc_probe(struct platform_device *p=
dev)
> >>  {
> >>  =09struct amd_pmc_dev *dev =3D &pmc;
> >>  =09struct pci_dev *rdev;
> >> +=09const struct pci_device_id *id;
> >>  =09u32 base_addr_lo, base_addr_hi;
> >>  =09u64 base_addr;
> >>  =09int err;
> >> @@ -736,7 +778,13 @@ static int amd_pmc_probe(struct platform_device *=
pdev)
> >> =20
> >>  =09dev->dev =3D &pdev->dev;
> >>  =09rdev =3D pci_get_domain_bus_and_slot(0, 0, PCI_DEVFN(0, 0));
> >> -=09if (!rdev || !pci_match_id(pmc_pci_ids, rdev)) {
> >> +=09if (!rdev) {
> >> +=09=09err =3D -ENODEV;
> >> +=09=09goto err_pci_dev_put;
> >=20
> > FYI, there's also __free(pci_dev_put) but then you'll need to handle=20
> > no_free_ptr() on the success path which will require some reorganizatio=
n=20
> > so my suggestion is to look at it after this series is done.
>=20
> Agree. Will make this change in the follow on series after this gets
> merged.
>=20
> Ack to the other comments below.
>=20
> Thanks,
> Shyam
>=20
> >=20
> >> +=09}
> >> +
> >> +=09id =3D pci_match_id(pmc_pci_ids, rdev);
> >> +=09if (!id) {
> >>  =09=09err =3D -ENODEV;
> >>  =09=09goto err_pci_dev_put;
> >>  =09}
> >> @@ -749,6 +797,18 @@ static int amd_pmc_probe(struct platform_device *=
pdev)
> >>  =09}
> >> =20
> >>  =09dev->rdev =3D rdev;
> >> +
> >> +=09if (id->driver_data)
> >> +=09=09dev->cpu_info =3D (const struct amd_pmc_cpu_info *)id->driver_d=
ata;
> >=20
> > IMO, this would be more logical to do inside amd_pmc_set_cpu_info().
> >=20
> >> +=09else
> >> +=09=09amd_pmc_set_cpu_info(dev);
> >=20
> > Perhaps this call can be moved earlier, so that pci_match_id() has to b=
e=20
> > done only once inside it?
> >=20
> >> +=09if (!dev->cpu_info) {
> >> +=09=09dev_err(dev->dev, "Failed to set CPU info\n");
> >> +=09=09err =3D -ENODEV;
> >> +=09=09goto err_pci_dev_put;
> >> +=09}
> >> +
> >>  =09err =3D amd_smn_read(0, AMD_PMC_BASE_ADDR_LO, &val);
> >>  =09if (err) {
> >>  =09=09dev_err(dev->dev, "error reading 0x%x\n", AMD_PMC_BASE_ADDR_LO)=
;
> >> @@ -778,9 +838,6 @@ static int amd_pmc_probe(struct platform_device *p=
dev)
> >>  =09if (err)
> >>  =09=09goto err_pci_dev_put;
> >> =20
> >> -=09/* Get num of IP blocks within the SoC */
> >> -=09amd_pmc_get_ip_info(dev);
> >> -
> >>  =09platform_set_drvdata(pdev, dev);
> >>  =09if (IS_ENABLED(CONFIG_SUSPEND)) {
> >>  =09=09err =3D acpi_register_lps0_dev(&amd_pmc_s2idle_dev_ops);
> >> diff --git a/drivers/platform/x86/amd/pmc/pmc.h b/drivers/platform/x86=
/amd/pmc/pmc.h
> >> index fe3f53eb5955..0fd0ced21831 100644
> >> --- a/drivers/platform/x86/amd/pmc/pmc.h
> >> +++ b/drivers/platform/x86/amd/pmc/pmc.h
> >> @@ -17,6 +17,10 @@
> >>  /* SMU communication registers */
> >>  #define AMD_PMC_REGISTER_RESPONSE=090x980
> >>  #define AMD_PMC_REGISTER_ARGUMENT=090x9BC
> >> +#define AMD_PMC_REGISTER_MESSAGE=090x538
> >> +
> >> +/* SMU communication registers for 1Ah 20h SoC */
> >> +#define AMD_PMC_REGISTER_MSG_1AH_20H=090x938
> >> =20
> >>  /* PMC Scratch Registers */
> >>  #define AMD_PMC_SCRATCH_REG_CZN=09=090x94
> >> @@ -90,6 +94,21 @@ struct stb_arg {
> >>  =09u32 resp;
> >>  };
> >> =20
> >> +struct amd_pmc_bit_map {
> >> +=09const char *name;
> >> +=09u32 bit_mask;
> >> +};
> >> +
> >> +/* SoC-specific information */
> >> +struct amd_pmc_cpu_info {
> >> +=09u32 smu_msg;
> >> +=09u32 smu_arg;
> >> +=09u32 smu_rsp;
> >> +=09u32 num_ips;
> >> +=09const struct amd_pmc_bit_map *ips_ptr;
> >> +=09int os_hint;
> >> +};
> >> +
> >>  struct amd_pmc_dev {
> >>  =09void __iomem *regbase;
> >>  =09void __iomem *smu_virt_addr;
> >> @@ -99,9 +118,6 @@ struct amd_pmc_dev {
> >>  =09u32 cpu_id;
> >>  =09u32 dram_size;
> >>  =09u32 active_ips;
> >> -=09const struct amd_pmc_bit_map *ips_ptr;
> >> -=09u32 num_ips;
> >> -=09u32 smu_msg;
> >>  /* SMU version information */
> >>  =09u8 smu_program;
> >>  =09u8 major;
> >> @@ -116,11 +132,7 @@ struct amd_pmc_dev {
> >>  =09bool disable_8042_wakeup;
> >>  =09struct amd_mp2_dev *mp2;
> >>  =09struct stb_arg stb_arg;
> >> -};
> >> -
> >> -struct amd_pmc_bit_map {
> >> -=09const char *name;
> >> -=09u32 bit_mask;
> >> +=09const struct amd_pmc_cpu_info *cpu_info;
> >>  };
> >> =20
> >>  struct smu_metrics {
> >> @@ -151,20 +163,33 @@ void amd_pmc_quirks_init(struct amd_pmc_dev *dev=
);
> >>  void amd_mp2_stb_init(struct amd_pmc_dev *dev);
> >>  void amd_mp2_stb_deinit(struct amd_pmc_dev *dev);
> >> =20
> >> -/* List of supported CPU ids */
> >> -#define AMD_CPU_ID_RV=09=09=090x15D0
> >> -#define AMD_CPU_ID_RN=09=09=090x1630
> >> -#define AMD_CPU_ID_PCO=09=09=09AMD_CPU_ID_RV
> >> -#define AMD_CPU_ID_CZN=09=09=09AMD_CPU_ID_RN
> >> -#define AMD_CPU_ID_VG=09=09=090x1645
> >> -#define AMD_CPU_ID_YC=09=09=090x14B5
> >> -#define AMD_CPU_ID_CB=09=09=090x14D8
> >> -#define AMD_CPU_ID_PS=09=09=090x14E8
> >> -#define AMD_CPU_ID_SP=09=09=090x14A4
> >> -#define AMD_CPU_ID_SHP=09=09=090x153A
> >> -#define PCI_DEVICE_ID_AMD_1AH_M20H_ROOT 0x1507
> >> -#define PCI_DEVICE_ID_AMD_1AH_M60H_ROOT 0x1122
> >> -#define PCI_DEVICE_ID_AMD_MP2_STB=090x172c
> >> +/* List of supported CPU/device IDs */
> >> +#define PCI_DEVICE_ID_AMD_CPU_ID_RV=090x15D0
> >> +#define PCI_DEVICE_ID_AMD_CPU_ID_RN=090x1630
> >> +#define PCI_DEVICE_ID_AMD_CPU_ID_PCO=09PCI_DEVICE_ID_AMD_CPU_ID_RV
> >> +#define PCI_DEVICE_ID_AMD_CPU_ID_CZN=09PCI_DEVICE_ID_AMD_CPU_ID_RN
> >> +#define PCI_DEVICE_ID_AMD_CPU_ID_VG=090x1645
> >> +#define PCI_DEVICE_ID_AMD_CPU_ID_YC=090x14B5
> >> +#define PCI_DEVICE_ID_AMD_CPU_ID_CB=090x14D8
> >> +#define PCI_DEVICE_ID_AMD_CPU_ID_PS=090x14E8
> >> +#define PCI_DEVICE_ID_AMD_CPU_ID_SP=090x14A4
> >> +#define PCI_DEVICE_ID_AMD_CPU_ID_SHP=090x153A
> >> +
> >> +/* Backward compatibility aliases */
> >> +#define AMD_CPU_ID_RV=09=09PCI_DEVICE_ID_AMD_CPU_ID_RV
> >> +#define AMD_CPU_ID_RN=09=09PCI_DEVICE_ID_AMD_CPU_ID_RN
> >> +#define AMD_CPU_ID_PCO=09=09PCI_DEVICE_ID_AMD_CPU_ID_PCO
> >> +#define AMD_CPU_ID_CZN=09=09PCI_DEVICE_ID_AMD_CPU_ID_CZN
> >> +#define AMD_CPU_ID_VG=09=09PCI_DEVICE_ID_AMD_CPU_ID_VG
> >> +#define AMD_CPU_ID_YC=09=09PCI_DEVICE_ID_AMD_CPU_ID_YC
> >> +#define AMD_CPU_ID_CB=09=09PCI_DEVICE_ID_AMD_CPU_ID_CB
> >> +#define AMD_CPU_ID_PS=09=09PCI_DEVICE_ID_AMD_CPU_ID_PS
> >> +#define AMD_CPU_ID_SP=09=09PCI_DEVICE_ID_AMD_CPU_ID_SP
> >> +#define AMD_CPU_ID_SHP=09=09PCI_DEVICE_ID_AMD_CPU_ID_SHP
> >> +
> >> +#define PCI_DEVICE_ID_AMD_1AH_M20H_ROOT=09=090x1507
> >> +#define PCI_DEVICE_ID_AMD_1AH_M60H_ROOT=09=090x1122
> >> +#define PCI_DEVICE_ID_AMD_MP2_STB=09=090x172c
> >> =20
> >>  int amd_stb_s2d_init(struct amd_pmc_dev *dev);
> >>  int amd_stb_read(struct amd_pmc_dev *dev, u32 *buf);
> >>
> >=20
>=20

--=20
 i.

--8323328-2097158941-1780992785=:1206--
