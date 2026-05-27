Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 862433EFFD0
	for <platform-driver-x86@vger.kernel.org>; Wed, 27 May 2026 10:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779879134; cv=none; b=Zftn7Pdmuc+RgYUZexr8DL90O25p9uxTfZ2L2CFKWjKZ/cXBRCz8HmsLN3+iw3dL8mGkTLW9BTY+QBBMoKlX5rbmCem7hXhEsUxEp38Qu3zyfs1PcTkNTU4ISj1xIW7OPGEAs7fJWTi8972axaeRPA7HEc2srjVjU507zpFKjFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779879134; c=relaxed/simple;
	bh=Yt26xeu96xVfJSaDvwSQwLjqDbi68kvjokqLf+3Waqc=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=g9tgg2uLbsQxdtmtUuBXSWGfNd643Iy/6OKWEkiBfhiNAOgSGRsUftm4OZHvlHEbwIjS2YV3MNziPyAVQCrvM59EjRuFRSXr1LK7vO6qhog0aVHI6m1MaVptntEIj8OBZmbl8WkHLOmMytAGizMKxPyFHZI6a4RysYUwMJLK6A4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D8rXX9U9; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D8rXX9U9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779879132; x=1811415132;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=Yt26xeu96xVfJSaDvwSQwLjqDbi68kvjokqLf+3Waqc=;
  b=D8rXX9U9CaiZD0iBOM3txEN0cBMhqIzozxNrqFVV+gwI1ZUeBXFuNCgo
   xxE65I0XpcGRgSeMhL0ogUUNkhYImFaeRZ13ETDKxu4zixq4MwduFuAdO
   C6TDr18UzwAhR0gjnQDizYwNiTmKDds7xJXBAsusNihRmPkz4xYYtp6hZ
   nfDA9QE+uUQNoEMZwEi0LGZAiTU7zUOjDWS7LW/8jx3WliVJ5105FIZ1k
   RWvbPenScw8OYCdx8FNdpG95mxvfJ9DwvxUOEmyn9tr+0ZYxk4/qB+mUj
   UeTxWXS62z1idcqK1JjiyUcNfvHH1MU9GAjbCi61adDuIiaq1/XtsUDV0
   g==;
X-CSE-ConnectionGUID: 569E8LlHQNSDqjDQhT0PjQ==
X-CSE-MsgGUID: qLaQ9lITSdmojFyp85Pxxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11798"; a="98127015"
X-IronPort-AV: E=Sophos;i="6.24,171,1774335600"; 
   d="scan'208";a="98127015"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2026 03:52:11 -0700
X-CSE-ConnectionGUID: 6FJSRlwmRmWQTeg4XYFGkg==
X-CSE-MsgGUID: NsPl7Eo4RKuyvuGE5p7zww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,171,1774335600"; 
   d="scan'208";a="237769070"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.51])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2026 03:52:08 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 27 May 2026 13:52:05 +0300 (EEST)
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
cc: Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org, 
    mario.limonciello@amd.com, Sanket.Goswami@amd.com
Subject: Re: [PATCH 2/5] platform/x86/amd/pmc: Add SMU mailbox offset retrieval
 for different CPU families
In-Reply-To: <76572ee3-a7f5-4b11-8cd3-bc4cf59c520a@amd.com>
Message-ID: <85245e4a-e258-ae7a-381f-6ba68075716d@linux.intel.com>
References: <20260520191149.773196-1-Shyam-sundar.S-k@amd.com> <20260520191149.773196-3-Shyam-sundar.S-k@amd.com> <ec3c0d30-f852-7329-c53b-e999776adf6b@linux.intel.com> <76572ee3-a7f5-4b11-8cd3-bc4cf59c520a@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1403319121-1779879125=:1189"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1403319121-1779879125=:1189
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Wed, 27 May 2026, Shyam Sundar S K wrote:
> On 5/22/2026 18:06, Ilpo J=C3=A4rvinen wrote:
> > On Thu, 21 May 2026, Shyam Sundar S K wrote:
> >=20
> >> Different AMD CPU families have different SMU mailbox register offsets=
=2E
> >> Add a helper function amd_pmc_get_smu_mb() to populate the appropriate
> >> SMU message offset based on the CPU ID during probe.
> >>
> >> This infrastructure will help support future features that require
> >> communication with the SMU through the correct mailbox address.
> >>
> >> Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
> >> Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
> >> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> >> ---
> >>  drivers/platform/x86/amd/pmc/pmc.c | 24 +++++++++++++++++++++---
> >>  1 file changed, 21 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86=
/amd/pmc/pmc.c
> >> index 7200f19088fe..7c80fb445138 100644
> >> --- a/drivers/platform/x86/amd/pmc/pmc.c
> >> +++ b/drivers/platform/x86/amd/pmc/pmc.c
> >> @@ -101,6 +101,24 @@ static inline void amd_pmc_reg_write(struct amd_p=
mc_dev *dev, int reg_offset, u3
> >>  =09iowrite32(val, dev->regbase + reg_offset);
> >>  }
> >> =20
> >> +static void amd_pmc_get_smu_mb(struct amd_pmc_dev *dev)
> >> +{
> >> +=09switch (dev->cpu_id) {
> >> +=09case AMD_CPU_ID_PCO:
> >> +=09case AMD_CPU_ID_RN:
> >> +=09case AMD_CPU_ID_VG:
> >> +=09case AMD_CPU_ID_YC:
> >> +=09case AMD_CPU_ID_CB:
> >> +=09case AMD_CPU_ID_PS:
> >> +=09=09dev->smu_msg =3D 0x538;
> >> +=09=09break;
> >> +=09case PCI_DEVICE_ID_AMD_1AH_M20H_ROOT:
> >> +=09case PCI_DEVICE_ID_AMD_1AH_M60H_ROOT:
> >> +=09=09dev->smu_msg =3D 0x938;
> >> +=09=09break;
> >> +=09}
> >> +}
> >> +
> >>  static void amd_pmc_get_ip_info(struct amd_pmc_dev *dev)
> >>  {
> >>  =09switch (dev->cpu_id) {
> >> @@ -111,12 +129,10 @@ static void amd_pmc_get_ip_info(struct amd_pmc_d=
ev *dev)
> >>  =09case AMD_CPU_ID_CB:
> >>  =09=09dev->num_ips =3D 12;
> >>  =09=09dev->ips_ptr =3D soc15_ip_blk;
> >> -=09=09dev->smu_msg =3D 0x538;
> >>  =09=09break;
> >>  =09case AMD_CPU_ID_PS:
> >>  =09=09dev->num_ips =3D 21;
> >>  =09=09dev->ips_ptr =3D soc15_ip_blk;
> >> -=09=09dev->smu_msg =3D 0x538;
> >>  =09=09break;
> >>  =09case PCI_DEVICE_ID_AMD_1AH_M20H_ROOT:
> >>  =09case PCI_DEVICE_ID_AMD_1AH_M60H_ROOT:
> >> @@ -127,7 +143,6 @@ static void amd_pmc_get_ip_info(struct amd_pmc_dev=
 *dev)
> >>  =09=09=09dev->num_ips =3D ARRAY_SIZE(soc15_ip_blk);
> >>  =09=09=09dev->ips_ptr =3D soc15_ip_blk;
> >>  =09=09}
> >> -=09=09dev->smu_msg =3D 0x938;
> >>  =09=09break;
> >>  =09}
> >>  }
> >> @@ -782,6 +797,9 @@ static int amd_pmc_probe(struct platform_device *p=
dev)
> >>  =09/* Get num of IP blocks within the SoC */
> >>  =09amd_pmc_get_ip_info(dev);
> >> =20
> >> +=09/* Populate SMU msg offset */
> >> +=09amd_pmc_get_smu_mb(dev);
> >> +
> >>  =09platform_set_drvdata(pdev, dev);
> >>  =09if (IS_ENABLED(CONFIG_SUSPEND)) {
> >>  =09=09err =3D acpi_register_lps0_dev(&amd_pmc_s2idle_dev_ops);
> >=20
> > Could these difference should be recorded into an info struct so we don=
't=20
> > need to make a function for each difference?
> >=20
>=20
> I could not understand your comment here, can you please elaborate
> what do you mean by info struct?
>=20
> Is it something like this?
>=20
> +static const struct amd_pmc_cpu_info amd_1ah_cpu_info =3D {
> +=09.smu_msg=09=3D 0x938,
> +=09.num_ips=09=3D ARRAY_SIZE(soc15_ip_blk),
> +=09.ips_ptr=09=3D soc15_ip_blk,
> +};
>=20
> +
>=20
> +static const struct amd_pmc_cpu_info amd_1ah_m70_cpu_info =3D {
> +=09.smu_msg=09=3D 0x938,
> +=09.num_ips=09=3D ARRAY_SIZE(soc15_ip_blk_v2),
> +=09.ips_ptr=09=3D soc15_ip_blk_v2,
> +};
>
> +static void amd_pmc_get_cpu_info(struct amd_pmc_dev *dev)
> {
> ...
>=20
> +=09case PCI_DEVICE_ID_AMD_1AH_M20H_ROOT:
> +=09case PCI_DEVICE_ID_AMD_1AH_M60H_ROOT:
> +=09=09if (boot_cpu_data.x86_model =3D=3D 0x70)
> +=09=09=09info =3D &amd_1ah_m70_cpu_info;
> +=09=09else
> +=09=09=09info =3D &amd_1ah_cpu_info;
> +=09=09break;
> +=09default:
> +=09=09return;
> +=09}
> +
> +=09dev->smu_msg =3D info->smu_msg;
> +=09dev->num_ips =3D info->num_ips;
> +=09dev->ips_ptr =3D info->ips_ptr;


Something alone the lines of above but you could also change PCI_DEVICE()=
=20
-> PCI_DEVICE_DATA(..., &xx_info) and get the struct from there per each=20
ID. The variations related to boot_cpu_data.x86_model =3D=3D 0x70 is a bit=
=20
problematic though so you'll need to handle that case separately from=20
getting rest directly from the id table.

There's also amd_pmc_get_os_hint() which could be covered using this=20
approach, I think.

If store the info pointer into dev, you don't need to have those fields=20
copied to dev anymore.

>=20
> ...
> }
>=20
> static int amd_pmc_probe(struct platform_device *pdev)
> {
>=20
> ...
>=20
> -=09amd_pmc_get_ip_info(dev);
>=20
> +=09amd_pmc_get_cpu_info(dev);
>=20
>=20
> ...
> }
>=20
>=20
> Thanks,
> Shyam
>=20

--=20
 i.

--8323328-1403319121-1779879125=:1189--
