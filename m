Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C7941D172A
	for <platform-driver-x86@vger.kernel.org>; Tue,  5 Nov 2024 09:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730800769; cv=none; b=A6C6CWOYiuwEybXh8BDwDSJMLE25zcd+M1L1zWM2fePOPu4cLyqG9//ktnQc7ZufZsXGnho5+qGtWaKqdEkorl4d0gnpezoEH07ZqYlQ+wbzmpR66r2jgZsSGn47dNeKmn0QiLEgl+NXHinQGdeAoO8x+eOvznteHFE1IiQyS6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730800769; c=relaxed/simple;
	bh=bSt+TphXHz4N1v/Ezy30iTZ7YxIztK1udx9EiClxMxo=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=G6C+S0HJiiO3nf1XI8wIJQ7Zm9/wCXNCRXSCH7bUjn7O77ETdKo3FCGFyMjWbmE7feJ+tK6LPEnWdtY9sSdPF0sNyyjHIyYaGtk7JisLXz+6JK1h2fXt7MxWDmaXLpjj+Fiyxg6MaiDg9baQgDNtRUeaWEAp+MIis3GgQe6Oj+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=czfDQQ01; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="czfDQQ01"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730800768; x=1762336768;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=bSt+TphXHz4N1v/Ezy30iTZ7YxIztK1udx9EiClxMxo=;
  b=czfDQQ01Hw9wQp1MHNVQGOU7XtRbyoS79JUBvIydS16ywqEzj4md7OYc
   qlDpWm1he9Y8E+O2cTceipp6jpX2uyLZNpakaF01G0Wlu7RSjb27d0T3w
   qK70bPJbd8oQTbvXlNPwq7I5zhmhUtbpEiGZVjGh+yy6zumy9A7CJu6DZ
   eRrG/YZ1zlPM7ptoUiN6Xyu/i5vE3BN+4yNyxgTSIdYP105tG7vPHdEng
   ZLhQ9s6OZ/utDjqov2OG8K7lQOIT/zK+tK/4BOU4eCeksH9Z39YsNLpAa
   b9CKRvBQTM1iygMYP6Rhnpkhpi9ZY3MifTIR+OV6kVXg8xSwzd5lRXmSv
   w==;
X-CSE-ConnectionGUID: zBNc3u5IShajsf7xH9+1tA==
X-CSE-MsgGUID: jLUhDLxkSG+kUzeJZ0dR1A==
X-IronPort-AV: E=McAfee;i="6700,10204,11246"; a="41909123"
X-IronPort-AV: E=Sophos;i="6.11,259,1725346800"; 
   d="scan'208";a="41909123"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2024 01:59:27 -0800
X-CSE-ConnectionGUID: q5bkJUyfR4aynsbhRgmlpQ==
X-CSE-MsgGUID: lInI2T4oQ1eJUwdGiLFgMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,259,1725346800"; 
   d="scan'208";a="87893480"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.201])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2024 01:59:25 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 5 Nov 2024 11:59:22 +0200 (EET)
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
cc: Hans de Goede <hdegoede@redhat.com>, Sanket.Goswami@amd.com, 
    platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v2 5/8] platform/x86/amd/pmc: Update IP information
 structure for newer SoCs
In-Reply-To: <0bae20f4-7e20-4924-af16-df0906624294@amd.com>
Message-ID: <ce3a3661-86c9-fcd5-94c6-144db5093f9b@linux.intel.com>
References: <20241029155440.3499273-1-Shyam-sundar.S-k@amd.com> <20241029155440.3499273-6-Shyam-sundar.S-k@amd.com> <c31b8002-75bc-2d24-7a07-1bb7d8638e85@linux.intel.com> <0bae20f4-7e20-4924-af16-df0906624294@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-400713894-1730800762=:949"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-400713894-1730800762=:949
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Tue, 5 Nov 2024, Shyam Sundar S K wrote:
> On 11/1/2024 17:34, Ilpo J=C3=A4rvinen wrote:
> > On Tue, 29 Oct 2024, Shyam Sundar S K wrote:
> >=20
> >> The latest AMD processors include additional IP blocks that must be tu=
rned
> >> off before transitioning to low power. PMFW provides an interface to
> >> retrieve debug information from each IP block, which is useful for
> >> diagnosing issues if the system fails to enter or exit low power state=
s,
> >> or for profiling which IP block takes more time. Add support for using
> >> this information within the driver.
> >>
> >> Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
> >> Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
> >> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> >> ---
> >>  drivers/platform/x86/amd/pmc/pmc.c | 42 ++++++++++++++++++++++++++++-=
-
> >>  1 file changed, 40 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86=
/amd/pmc/pmc.c
> >> index f9900a03391a..0bf4065153da 100644
> >> --- a/drivers/platform/x86/amd/pmc/pmc.c
> >> +++ b/drivers/platform/x86/amd/pmc/pmc.c
> >> @@ -95,6 +95,35 @@ struct amd_pmc_bit_map {
> >>  =09u32 bit_mask;
> >>  };
> >> =20
> >> +static const struct amd_pmc_bit_map soc15_ip_blk_v2[] =3D {
> >> +=09{"DISPLAY",     BIT(0)},
> >> +=09{"CPU",         BIT(1)},
> >> +=09{"GFX",         BIT(2)},
> >> +=09{"VDD",         BIT(3)},
> >> +=09{"VDD_CCX",     BIT(4)},
> >> +=09{"ACP",         BIT(5)},
> >> +=09{"VCN_0",       BIT(6)},
> >> +=09{"VCN_1",       BIT(7)},
> >> +=09{"ISP",         BIT(8)},
> >> +=09{"NBIO",        BIT(9)},
> >> +=09{"DF",          BIT(10)},
> >> +=09{"USB3_0",      BIT(11)},
> >> +=09{"USB3_1",      BIT(12)},
> >> +=09{"LAPIC",       BIT(13)},
> >> +=09{"USB3_2",      BIT(14)},
> >> +=09{"USB4_RT0",=09BIT(15)},
> >> +=09{"USB4_RT1",=09BIT(16)},
> >> +=09{"USB4_0",      BIT(17)},
> >> +=09{"USB4_1",      BIT(18)},
> >> +=09{"MPM",         BIT(19)},
> >> +=09{"JPEG_0",      BIT(20)},
> >> +=09{"JPEG_1",      BIT(21)},
> >> +=09{"IPU",         BIT(22)},
> >> +=09{"UMSCH",       BIT(23)},
> >> +=09{"VPE",         BIT(24)},
> >> +=09{}
> >> +};
> >> +
> >>  static const struct amd_pmc_bit_map soc15_ip_blk[] =3D {
> >>  =09{"DISPLAY",=09BIT(0)},
> >>  =09{"CPU",=09=09BIT(1)},
> >> @@ -170,7 +199,10 @@ static void amd_pmc_get_ip_info(struct amd_pmc_de=
v *dev)
> >>  =09=09break;
> >>  =09case PCI_DEVICE_ID_AMD_1AH_M20H_ROOT:
> >>  =09case PCI_DEVICE_ID_AMD_1AH_M60H_ROOT:
> >> -=09=09dev->num_ips =3D 22;
> >> +=09=09if (boot_cpu_data.x86_model =3D=3D 0x70)
> >> +=09=09=09dev->num_ips =3D 25;
> >> +=09=09else
> >> +=09=09=09dev->num_ips =3D 22;
> >=20
> > Could these use ARRAY_SIZE()? They're related to that array, aren't the=
y?
>=20
> Yes, they are. ARRAY_SIZE() does return the number of elements in the
> array but there is a catch,
>=20
> both soc15_ip_blk[] and soc15_ip_blk_v2[] have a last empty element,
> so when ARRAY_SIZE() is used we end up getting n+1 element (i.e along
> with the last empty element). So, what would you advise?
>
> 1) remove the last empty element in the array? i.e. something like this?
>=20
> static const struct amd_pmc_bit_map soc15_ip_blk_v2[] =3D {
> =09{"DISPLAY",     BIT(0)},
> =09...
> =09{"VPE",         BIT(24)},
> -   {} /* remove this */
> };
>=20
> 2) or just do, `ARRAY_SIZE() - 1` so that we don't need to touch the
> existing soc15_ip_blk[] and soc15_ip_blk_v2[].

The iteration seems to always ->num_ips based so the terminator seems=20
superfluous. The cases with smaller num_ips cannot use terminator anyway=20
as they share the larger array.

I propose you make a separate change out removing the terminator and=20
migrating to use ARRAY_SIZE() in the existing code, don't forget to add=20
the #include for it. Then add just this new thing in this patch.

--=20
 i.


>=20
>=20
> I am inline with your comments on the other patches, will address them
> in v3.
>=20
> Thanks,
> Shyam
>=20
> >=20
> >>  =09=09dev->smu_msg =3D 0x938;
> >>  =09=09break;
> >>  =09}
> >> @@ -338,9 +370,15 @@ static int smu_fw_info_show(struct seq_file *s, v=
oid *unused)
> >> =20
> >>  =09seq_puts(s, "\n=3D=3D=3D Active time (in us) =3D=3D=3D\n");
> >>  =09for (idx =3D 0 ; idx < dev->num_ips ; idx++) {
> >> -=09=09if (soc15_ip_blk[idx].bit_mask & dev->active_ips)
> >> +=09=09if (dev->cpu_id =3D=3D PCI_DEVICE_ID_AMD_1AH_M20H_ROOT &&
> >> +=09=09    boot_cpu_data.x86_model =3D=3D 0x70) {
> >> +=09=09=09if (soc15_ip_blk_v2[idx].bit_mask & dev->active_ips)
> >> +=09=09=09=09seq_printf(s, "%-8s : %lld\n", soc15_ip_blk_v2[idx].name,
> >> +=09=09=09=09=09   table.timecondition_notmet_lastcapture[idx]);
> >> +=09=09} else if (soc15_ip_blk[idx].bit_mask & dev->active_ips) {
> >>  =09=09=09seq_printf(s, "%-8s : %lld\n", soc15_ip_blk[idx].name,
> >>  =09=09=09=09   table.timecondition_notmet_lastcapture[idx]);
> >> +=09=09}
> >=20
> > Why not have amd_pmc_get_ip_info() prepare a pointer into 'dev' to the=
=20
> > relevant soc15_ip_blk_v2/soc15_ip_blk rather than trying to pick one he=
re?
> >=20
>=20
> Makes sense. Ack.
>=20
> >>  =09}
> >> =20
> >>  =09return 0;
> >>
> >=20
>=20
--8323328-400713894-1730800762=:949--
