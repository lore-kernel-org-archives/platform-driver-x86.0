Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1900F481233
	for <platform-driver-x86@vger.kernel.org>; Wed, 21 Jan 2026 12:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768998697; cv=none; b=bmSDMkwNcw1MTk+TEoReIqdlslWUtCAEVpWZj2Qdgv2ypswuIZIU1eslSImzMKznmjQmf852NhtssBbdJZK0MnAAvQltssH5LG6YL9IZG3r4w26YwFfMCppG5JlZnUAujeRgXRaAB9w9RJGgSbLqEzTFYBKyssG4r9pXU3N+iX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768998697; c=relaxed/simple;
	bh=f+ztrpU9q+ag8su0AyuCcZrnH51rKwxZKWj9TxJs46s=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=a8lQkhfCGBxFvIK5Wqmbud9hwj51No8YRFu/Cz44a1mqvH3hbcaY8dNUol51fJiQAgBcVViK9GHvY/xDjE6TjDokhAeguUx967EVa1hSVzfuY2rWMhAFuqGR45R38xx1+bayidXfLqWlElWUtGZvnjQrup2ZugWJbjYkLl88y7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bndfKd2b; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bndfKd2b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768998695; x=1800534695;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=f+ztrpU9q+ag8su0AyuCcZrnH51rKwxZKWj9TxJs46s=;
  b=bndfKd2bcbfZnBm+EsjuTJU6y3h03jtZ2Vk1/o6m+kbam5hDnL4ifmfK
   slYwGwVw9OVA+W3JMN0+91IpN6KyRLAZWBJufps7ZKy63YTu7SvJAKKwJ
   Zpe3ttEIkqWkRBQ+khcKDqKJ3eaPyEQzFchN/x6ECqvE4Z6++3pqQW8UJ
   8UoL/YXuptAfX0vuKvaKXQRSsgYoU2Sjk+iZz4ZfBKyEnsZ0IGbIago7r
   PF5dvrbgtFB25NL/jrIppUH2KZTh18zIdVOZMzdnSMexUNeHu8Jamgk5d
   POWf2GcMKmsUImXkdoDMhmMok2RANpgXzgfne0rlYo6IzDSr1bEsFaatz
   g==;
X-CSE-ConnectionGUID: RRSa+pxCTZWTq1GfLtkRBg==
X-CSE-MsgGUID: lUnZEdMLRG+zELaz6N6y4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="80941613"
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; 
   d="scan'208";a="80941613"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2026 04:31:34 -0800
X-CSE-ConnectionGUID: NAOuUGnoROu95vv1iL+xPw==
X-CSE-MsgGUID: mwXQKwO1Qou1JlXLV1YT/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; 
   d="scan'208";a="206496238"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.108])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2026 04:31:32 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 21 Jan 2026 14:31:29 +0200 (EET)
To: Oleksandr Shamray <oleksandrs@nvidia.com>
cc: "hdegoede@redhat.com" <hdegoede@redhat.com>, 
    Vadim Pasternak <vadimp@nvidia.com>, 
    "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>
Subject: RE: [PATCH 1/2] platform: mellanox: mlx-platform: Add support for
 new Nvidia DGX system based on class VMOD0010
In-Reply-To: <IA1PR12MB6236E7A4B8C4D487F25F4993BC96A@IA1PR12MB6236.namprd12.prod.outlook.com>
Message-ID: <87b3dde1-a01c-0dec-14ee-fd26a9175b4e@linux.intel.com>
References: <20260107141417.913935-1-oleksandrs@nvidia.com> <20260107141417.913935-2-oleksandrs@nvidia.com> <3b9b8a5e-2f51-2fe4-5af7-d617eadb8742@linux.intel.com> <IA1PR12MB6236E7A4B8C4D487F25F4993BC96A@IA1PR12MB6236.namprd12.prod.outlook.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1051370590-1768998689=:1033"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1051370590-1768998689=:1033
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Wed, 21 Jan 2026, Oleksandr Shamray wrote:

> Hi Ilpo.
>=20
> Thanks for your review.
> I'm not sure which header you believe is missing. Are you suggesting that=
 we should explicitly include <linux/bits.h> and <linux/array_size.h>?
> Could you please clarify?

Yes. (Indirect includes through some other header do not count, we try=20
include what is used by the C file itself.)

--
 i.

> Thanks.
>=20
> Best regards
> Oleksandr Shamray
> Mellanox | Software engineer
> e-mail :=A0=A0=A0oleksandrs@nvidia.com
> NVIDIA=A0Corporation=A0
>=20
> -----Original Message-----
> From: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>=20
> Sent: Thursday, January 15, 2026 2:47 PM
> To: Oleksandr Shamray <oleksandrs@nvidia.com>
> Cc: hdegoede@redhat.com; Vadim Pasternak <vadimp@nvidia.com>; platform-dr=
iver-x86@vger.kernel.org
> Subject: Re: [PATCH 1/2] platform: mellanox: mlx-platform: Add support fo=
r new Nvidia DGX system based on class VMOD0010
>=20
> On Wed, 7 Jan 2026, Oleksandr Shamray wrote:
>=20
> > This system is based on Nvidia QM9700 64x400G QTM-2 switch, with the=20
> > following key changes:
> >=20
> > Key changes:
> >   1.Power Supply: Rack busbar input power ORv3 DC 48V-54V
> >   2.Dimensions MGX/DGX 1U compliance
> >=20
> > Signed-off-by: Oleksandr Shamray <oleksandrs@nvidia.com>
> > Reviewed-by: Vadim Pasternak <vadimp@nvidia.com>
> > ---
> >  drivers/platform/mellanox/mlx-platform.c | 454=20
> > +++++++++++++++++++++++
> >  1 file changed, 454 insertions(+)
> >=20
> > diff --git a/drivers/platform/mellanox/mlx-platform.c=20
> > b/drivers/platform/mellanox/mlx-platform.c
> > index d0df18be93c7..14b3adf870e7 100644
> > --- a/drivers/platform/mellanox/mlx-platform.c
> > +++ b/drivers/platform/mellanox/mlx-platform.c
> > @@ -727,6 +727,16 @@ static struct mlxreg_core_data mlxplat_mlxcpld_def=
ault_psu_items_data[] =3D {
> >  =09},
> >  };
> > =20
> > +/* Platform hotplug dgx data */
> > +static struct mlxreg_core_data mlxplat_mlxcpld_dgx_pdb_items_data[] =
=3D {
> > +=09{
> > +=09=09.label =3D "pdb1",
> > +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_PSU_OFFSET,
> > +=09=09.mask =3D BIT(0),
>=20
> + include.
>=20
> There seems to some missing includes in this file (a pre-existing problem=
, I know). Please go through what you add and make sure you've the required=
 header included directly by this file, thanks.
>=20
> > +=09=09.hpdev.nr =3D MLXPLAT_CPLD_NR_NONE,
> > +=09},
> > +};
> > +
> >  static struct mlxreg_core_data mlxplat_mlxcpld_default_pwr_items_data[=
] =3D {
> >  =09{
> >  =09=09.label =3D "pwr1",
> > @@ -776,6 +786,15 @@ static struct mlxreg_core_data mlxplat_mlxcpld_def=
ault_pwr_ng800_items_data[] =3D
> >  =09},
> >  };
> > =20
> > +static struct mlxreg_core_data mlxplat_mlxcpld_dgx_pwr_items_data[] =
=3D {
> > +=09{
> > +=09=09.label =3D "pwr1",
> > +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_PWR_OFFSET,
> > +=09=09.mask =3D BIT(0),
> > +=09=09.hpdev.nr =3D MLXPLAT_CPLD_NR_NONE,
> > +=09},
> > +};
> > +
> >  static struct mlxreg_core_data mlxplat_mlxcpld_default_fan_items_data[=
] =3D {
> >  =09{
> >  =09=09.label =3D "fan1",
> > @@ -1399,6 +1418,45 @@ static struct mlxreg_core_item mlxplat_mlxcpld_e=
xt_items[] =3D {
> >  =09}
> >  };
> > =20
> > +static struct mlxreg_core_item mlxplat_mlxcpld_ext_dgx_items[] =3D {
> > +=09{
> > +=09=09.data =3D mlxplat_mlxcpld_dgx_pdb_items_data,
> > +=09=09.aggr_mask =3D MLXPLAT_CPLD_AGGR_PSU_MASK_DEF,
> > +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_PSU_OFFSET,
> > +=09=09.mask =3D MLXPLAT_CPLD_PSU_MASK,
> > +=09=09.count =3D ARRAY_SIZE(mlxplat_mlxcpld_dgx_pdb_items_data),
>=20
> + include.
>=20
> > +=09=09.inversed =3D 1,
> > +=09=09.health =3D false,
> > +=09},
> > +=09{
> > +=09=09.data =3D mlxplat_mlxcpld_dgx_pwr_items_data,
> > +=09=09.aggr_mask =3D MLXPLAT_CPLD_AGGR_PWR_MASK_DEF,
> > +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_PWR_OFFSET,
> > +=09=09.mask =3D MLXPLAT_CPLD_PWR_MASK,
> > +=09=09.count =3D ARRAY_SIZE(mlxplat_mlxcpld_dgx_pwr_items_data),
> > +=09=09.inversed =3D 0,
> > +=09=09.health =3D false,
> > +=09},
> > +=09{
> > +=09=09.data =3D mlxplat_mlxcpld_default_ng_fan_items_data,
> > +=09=09.aggr_mask =3D MLXPLAT_CPLD_AGGR_MASK_NG_DEF,
> > +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_FAN_OFFSET,
> > +=09=09.mask =3D MLXPLAT_CPLD_FAN_NG_MASK,
> > +=09=09.count =3D ARRAY_SIZE(mlxplat_mlxcpld_default_ng_fan_items_data)=
,
> > +=09=09.inversed =3D 1,
> > +=09=09.health =3D false,
> > +=09},
> > +=09{
> > +=09=09.data =3D mlxplat_mlxcpld_default_asic_items_data,
> > +=09=09.aggr_mask =3D MLXPLAT_CPLD_AGGR_MASK_NG_DEF,
> > +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_ASIC_HEALTH_OFFSET,
> > +=09=09.mask =3D MLXPLAT_CPLD_ASIC_MASK,
> > +=09=09.count =3D ARRAY_SIZE(mlxplat_mlxcpld_default_asic_items_data),
> > +=09=09.inversed =3D 0,
> > +=09=09.health =3D true,
> > +=09},
> > +};
> > +
> >  static struct mlxreg_core_item mlxplat_mlxcpld_ng800_items[] =3D {
> >  =09{
> >  =09=09.data =3D mlxplat_mlxcpld_default_ng_psu_items_data,
> > @@ -1450,6 +1508,16 @@ struct mlxreg_core_hotplug_platform_data mlxplat=
_mlxcpld_ext_data =3D {
> >  =09.mask_low =3D MLXPLAT_CPLD_LOW_AGGR_MASK_LOW |=20
> > MLXPLAT_CPLD_LOW_AGGR_MASK_ASIC2,  };
> > =20
> > +static
> > +struct mlxreg_core_hotplug_platform_data mlxplat_mlxcpld_dgx_ext_data =
=3D {
> > +=09.items =3D mlxplat_mlxcpld_ext_dgx_items,
> > +=09.count =3D ARRAY_SIZE(mlxplat_mlxcpld_ext_dgx_items),
> > +=09.cell =3D MLXPLAT_CPLD_LPC_REG_AGGR_OFFSET,
> > +=09.mask =3D MLXPLAT_CPLD_AGGR_MASK_NG_DEF | MLXPLAT_CPLD_AGGR_MASK_CO=
MEX,
> > +=09.cell_low =3D MLXPLAT_CPLD_LPC_REG_AGGRLO_OFFSET,
> > +=09.mask_low =3D MLXPLAT_CPLD_LOW_AGGR_MASK_LOW |=20
> > +MLXPLAT_CPLD_LOW_AGGR_MASK_ASIC2, };
> > +
> >  static
> >  struct mlxreg_core_hotplug_platform_data mlxplat_mlxcpld_ng800_data =
=3D {
> >  =09.items =3D mlxplat_mlxcpld_ng800_items, @@ -4625,6 +4693,359 @@ sta=
tic=20
> > struct mlxreg_core_platform_data mlxplat_default_ng_regs_io_data =3D {
> >  =09=09.counter =3D ARRAY_SIZE(mlxplat_mlxcpld_default_ng_regs_io_data)=
,
> >  };
> > =20
> > +/* Platform register access for next generation systems families data=
=20
> > +*/ static struct mlxreg_core_data mlxplat_mlxcpld_dgx_ng_regs_io_data[=
] =3D {
> > +=09{
> > +=09=09.label =3D "cpld1_version",
> > +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_CPLD1_VER_OFFSET,
> > +=09=09.bit =3D GENMASK(7, 0),
>=20
> This include too is missing but it will be the same as for BIT().
>=20
> --
>  i.
>=20
> > +=09=09.mode =3D 0444,
> > +=09},
> > +=09{
> > +=09=09.label =3D "cpld2_version",
> > +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_CPLD2_VER_OFFSET,
> > +=09=09.bit =3D GENMASK(7, 0),
> > +=09=09.mode =3D 0444,
> > +=09},
> > +=09{
> > +=09=09.label =3D "cpld3_version",
> > +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_CPLD3_VER_OFFSET,
> > +=09=09.bit =3D GENMASK(7, 0),
> > +=09=09.mode =3D 0444,
> > +=09},
> > +=09{
> > +=09=09.label =3D "cpld4_version",
> > +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_CPLD4_VER_OFFSET,
> > +=09=09.bit =3D GENMASK(7, 0),
> > +=09=09.mode =3D 0444,
> > +=09},
> > +=09{
> > +=09=09.label =3D "cpld1_pn",
> > +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_CPLD1_PN_OFFSET,
> > +=09=09.bit =3D GENMASK(15, 0),
> > +=09=09.mode =3D 0444,
> > +=09=09.regnum =3D 2,
> > +=09},
> > +=09{
> > +=09=09.label =3D "cpld2_pn",
> > +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_CPLD2_PN_OFFSET,
> > +=09=09.bit =3D GENMASK(15, 0),
> > +=09=09.mode =3D 0444,
> > +=09=09.regnum =3D 2,
> > +=09},
> > +=09{
> > +=09=09.label =3D "cpld3_pn",
> > +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_CPLD3_PN_OFFSET,
> > +=09=09.bit =3D GENMASK(15, 0),
> > +=09=09.mode =3D 0444,
> > +=09=09.regnum =3D 2,
> > +=09},
> > +=09{
> > +=09=09.label =3D "cpld4_pn",
> > +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_CPLD4_PN_OFFSET,
> > +=09=09.bit =3D GENMASK(15, 0),
> > +=09=09.mode =3D 0444,
> > +=09=09.regnum =3D 2,
> > +=09},
> > +=09{
> > +=09=09.label =3D "cpld1_version_min",
> > +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_CPLD1_MVER_OFFSET,
> > +=09=09.bit =3D GENMASK(7, 0),
> > +=09=09.mode =3D 0444,
> > +=09},
> > +=09{
> > +=09=09.label =3D "cpld2_version_min",
> > +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_CPLD2_MVER_OFFSET,
> > +=09=09.bit =3D GENMASK(7, 0),
> > +=09=09.mode =3D 0444,
> > +=09},
> > +=09{
> > +=09=09.label =3D "cpld3_version_min",
> > +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_CPLD3_MVER_OFFSET,
> > +=09=09.bit =3D GENMASK(7, 0),
> > +=09=09.mode =3D 0444,
> > +=09},
> > +=09{
> > +=09=09.label =3D "cpld4_version_min",
> > +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_CPLD4_MVER_OFFSET,
> > +=09=09.bit =3D GENMASK(7, 0),
> > +=09=09.mode =3D 0444,
> > +=09},
> > +=09{
> > +=09=09.label =3D "asic_reset",
> > +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_RESET_GP2_OFFSET,
> > +=09=09.mask =3D GENMASK(7, 0) & ~BIT(3),
> > +=09=09.mode =3D 0200,
> > +=09},
> > +=09{
> > +=09=09.label =3D "reset_long_pb",
> > +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_RESET_CAUSE_OFFSET,
> > +=09=09.mask =3D GENMASK(7, 0) & ~BIT(0),
> > +=09=09.mode =3D 0444,
> > +=09},
> > +=09{
> > +=09=09.label =3D "reset_short_pb",
> > +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_RESET_CAUSE_OFFSET,
> > +=09=09.mask =3D GENMASK(7, 0) & ~BIT(1),
> > +=09=09.mode =3D 0444,
> > +=09},
> > +=09{
> > +=09=09.label =3D "reset_aux_pwr_or_ref",
> > +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_RESET_CAUSE_OFFSET,
> > +=09=09.mask =3D GENMASK(7, 0) & ~BIT(2),
> > +=09=09.mode =3D 0444,
> > +=09},
> > +=09{
> > +=09=09.label =3D "reset_swb_dc_dc_pwr_fail",
> > +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_RESET_CAUSE_OFFSET,
> > +=09=09.mask =3D GENMASK(7, 0) & ~BIT(3),
> > +=09=09.mode =3D 0444,
> > +=09},
> > +=09{
> > +=09=09.label =3D "reset_from_asic",
> > +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_RESET_CAUSE_OFFSET,
> > +=09=09.mask =3D GENMASK(7, 0) & ~BIT(5),
> > +=09=09.mode =3D 0444,
> > +=09},
> > +=09{
> > +=09=09.label =3D "reset_swb_wd",
> > +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_RESET_CAUSE_OFFSET,
> > +=09=09.mask =3D GENMASK(7, 0) & ~BIT(6),
> > +=09=09.mode =3D 0444,
> > +=09},
> > +=09{
> > +=09=09.label =3D "reset_asic_thermal",
> > +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_RESET_CAUSE_OFFSET,
> > +=09=09.mask =3D GENMASK(7, 0) & ~BIT(7),
> > +=09=09.mode =3D 0444,
> > +=09},
> > +=09{
> > +=09=09.label =3D "reset_sw_reset",
> > +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_RST_CAUSE1_OFFSET,
> > +=09=09.mask =3D GENMASK(7, 0) & ~BIT(0),
> > +=09=09.mode =3D 0444,
> > +=09},
> > +=09{
> > +=09=09.label =3D "reset_comex_pwr_fail",
> > +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_RST_CAUSE1_OFFSET,
> > +=09=09.mask =3D GENMASK(7, 0) & ~BIT(3),
> > +=09=09.mode =3D 0444,
> > +=09},
> > +=09{
> > +=09=09.label =3D "reset_platform",
> > +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_RST_CAUSE1_OFFSET,
> > +=09=09.mask =3D GENMASK(7, 0) & ~BIT(4),
> > +=09=09.mode =3D 0444,
> > +=09},
> > +=09{
> > +=09=09.label =3D "reset_soc",
> > +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_RST_CAUSE1_OFFSET,
> > +=09=09.mask =3D GENMASK(7, 0) & ~BIT(5),
> > +=09=09.mode =3D 0444,
> > +=09},
> > +=09{
> > +=09=09.label =3D "reset_comex_wd",
> > +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_RST_CAUSE1_OFFSET,
> > +=09=09.mask =3D GENMASK(7, 0) & ~BIT(6),
> > +=09=09.mode =3D 0444,
> > +=09},
> > +=09{
> > +=09=09.label =3D "reset_system",
> > +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_RST_CAUSE2_OFFSET,
> > +=09=09.mask =3D GENMASK(7, 0) & ~BIT(1),
> > +=09=09.mode =3D 0444,
> > +=09},
> > +=09{
> > +=09=09.label =3D "reset_sw_pwr_off",
> > +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_RST_CAUSE2_OFFSET,
> > +=09=09.mask =3D GENMASK(7, 0) & ~BIT(2),
> > +=09=09.mode =3D 0444,
> > +=09},
> > +=09{
> > +=09=09.label =3D "reset_comex_thermal",
> > +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_RST_CAUSE2_OFFSET,
> > +=09=09.mask =3D GENMASK(7, 0) & ~BIT(3),
> > +=09=09.mode =3D 0444,
> > +=09},
> > +=09{
> > +=09=09.label =3D "reset_reload_bios",
> > +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_RST_CAUSE2_OFFSET,
> > +=09=09.mask =3D GENMASK(7, 0) & ~BIT(5),
> > +=09=09.mode =3D 0444,
> > +=09},
> > +=09{
> > +=09=09.label =3D "reset_pdb_pwr_fail",
> > +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_RST_CAUSE2_OFFSET,
> > +=09=09.mask =3D GENMASK(7, 0) & ~BIT(6),
> > +=09=09.mode =3D 0444,
> > +=09},
> > +=09{
> > +=09=09.label =3D "pdb_reset_stby",
> > +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_GP1_OFFSET,
> > +=09=09.mask =3D GENMASK(7, 0) & ~BIT(0),
> > +=09=09.mode =3D 0200,
> > +=09},
> > +=09{
> > +=09=09.label =3D "pwr_cycle",
> > +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_GP1_OFFSET,
> > +=09=09.mask =3D GENMASK(7, 0) & ~BIT(2),
> > +=09=09.mode =3D 0200,
> > +=09},
> > +=09{
> > +=09=09.label =3D "pwr_down",
> > +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_GP1_OFFSET,
> > +=09=09.mask =3D GENMASK(7, 0) & ~BIT(3),
> > +=09=09.mode =3D 0200,
> > +=09},
> > +=09{
> > +=09=09.label =3D "deep_pwr_cycle",
> > +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_GP1_OFFSET,
> > +=09=09.mask =3D GENMASK(7, 0) & ~BIT(5),
> > +=09=09.mode =3D 0200,
> > +=09},
> > +=09{
> > +=09=09.label =3D "latch_reset",
> > +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_GP1_OFFSET,
> > +=09=09.mask =3D GENMASK(7, 0) & ~BIT(6),
> > +=09=09.mode =3D 0200,
> > +=09},
> > +=09{
> > +=09=09.label =3D "jtag_cap",
> > +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_FU_CAP_OFFSET,
> > +=09=09.mask =3D MLXPLAT_CPLD_FU_CAP_MASK,
> > +=09=09.bit =3D 1,
> > +=09=09.mode =3D 0444,
> > +=09},
> > +=09{
> > +=09=09.label =3D "jtag_enable",
> > +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_GP2_OFFSET,
> > +=09=09.mask =3D GENMASK(7, 0) & ~BIT(4),
> > +=09=09.mode =3D 0644,
> > +=09},
> > +=09{
> > +=09=09.label =3D "dbg1",
> > +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_DBG1_OFFSET,
> > +=09=09.bit =3D GENMASK(7, 0),
> > +=09=09.mode =3D 0644,
> > +=09},
> > +=09{
> > +=09=09.label =3D "dbg2",
> > +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_DBG2_OFFSET,
> > +=09=09.bit =3D GENMASK(7, 0),
> > +=09=09.mode =3D 0644,
> > +=09},
> > +=09{
> > +=09=09.label =3D "dbg3",
> > +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_DBG3_OFFSET,
> > +=09=09.bit =3D GENMASK(7, 0),
> > +=09=09.mode =3D 0644,
> > +=09},
> > +=09{
> > +=09=09.label =3D "dbg4",
> > +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_DBG4_OFFSET,
> > +=09=09.bit =3D GENMASK(7, 0),
> > +=09=09.mode =3D 0644,
> > +=09},
> > +=09{
> > +=09=09.label =3D "asic_health",
> > +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_ASIC_HEALTH_OFFSET,
> > +=09=09.mask =3D MLXPLAT_CPLD_ASIC_MASK,
> > +=09=09.bit =3D 1,
> > +=09=09.mode =3D 0444,
> > +=09},
> > +=09{
> > +=09=09.label =3D "fan_dir",
> > +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_FAN_DIRECTION,
> > +=09=09.bit =3D GENMASK(7, 0),
> > +=09=09.mode =3D 0444,
> > +=09},
> > +=09{
> > +=09=09.label =3D "bios_safe_mode",
> > +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_GPCOM0_OFFSET,
> > +=09=09.mask =3D GENMASK(7, 0) & ~BIT(4),
> > +=09=09.mode =3D 0444,
> > +=09},
> > +=09{
> > +=09=09.label =3D "bios_active_image",
> > +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_GPCOM0_OFFSET,
> > +=09=09.mask =3D GENMASK(7, 0) & ~BIT(5),
> > +=09=09.mode =3D 0444,
> > +=09},
> > +=09{
> > +=09=09.label =3D "bios_auth_fail",
> > +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_GPCOM0_OFFSET,
> > +=09=09.mask =3D GENMASK(7, 0) & ~BIT(6),
> > +=09=09.mode =3D 0444,
> > +=09},
> > +=09{
> > +=09=09.label =3D "bios_upgrade_fail",
> > +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_GPCOM0_OFFSET,
> > +=09=09.mask =3D GENMASK(7, 0) & ~BIT(7),
> > +=09=09.mode =3D 0444,
> > +=09},
> > +=09{
> > +=09=09.label =3D "voltreg_update_status",
> > +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_GP0_RO_OFFSET,
> > +=09=09.mask =3D MLXPLAT_CPLD_VOLTREG_UPD_MASK,
> > +=09=09.bit =3D 5,
> > +=09=09.mode =3D 0444,
> > +=09},
> > +=09{
> > +=09=09.label =3D "pwr_converter_prog_en",
> > +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_GP0_OFFSET,
> > +=09=09.mask =3D GENMASK(7, 0) & ~BIT(0),
> > +=09=09.mode =3D 0644,
> > +=09=09.secured =3D 1,
> > +=09},
> > +=09{
> > +=09=09.label =3D "vpd_wp",
> > +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_GP0_OFFSET,
> > +=09=09.mask =3D GENMASK(7, 0) & ~BIT(3),
> > +=09=09.mode =3D 0644,
> > +=09},
> > +=09{
> > +=09=09.label =3D "pcie_asic_reset_dis",
> > +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_GP0_OFFSET,
> > +=09=09.mask =3D GENMASK(7, 0) & ~BIT(4),
> > +=09=09.mode =3D 0644,
> > +=09},
> > +=09{
> > +=09=09.label =3D "shutdown_unlock",
> > +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_GP0_OFFSET,
> > +=09=09.mask =3D GENMASK(7, 0) & ~BIT(5),
> > +=09=09.mode =3D 0644,
> > +=09},
> > +=09{
> > +=09=09.label =3D "config1",
> > +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_CONFIG1_OFFSET,
> > +=09=09.bit =3D GENMASK(7, 0),
> > +=09=09.mode =3D 0444,
> > +=09},
> > +=09{
> > +=09=09.label =3D "config2",
> > +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_CONFIG2_OFFSET,
> > +=09=09.bit =3D GENMASK(7, 0),
> > +=09=09.mode =3D 0444,
> > +=09},
> > +=09{
> > +=09=09.label =3D "config3",
> > +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_CONFIG3_OFFSET,
> > +=09=09.bit =3D GENMASK(7, 0),
> > +=09=09.mode =3D 0444,
> > +=09},
> > +=09{
> > +=09=09.label =3D "ufm_version",
> > +=09=09.reg =3D MLXPLAT_CPLD_LPC_REG_UFM_VERSION_OFFSET,
> > +=09=09.bit =3D GENMASK(7, 0),
> > +=09=09.mode =3D 0444,
> > +=09},
> > +};
> > +
> > +static struct mlxreg_core_platform_data mlxplat_dgx_ng_regs_io_data =
=3D {
> > +=09=09.data =3D mlxplat_mlxcpld_dgx_ng_regs_io_data,
> > +=09=09.counter =3D ARRAY_SIZE(mlxplat_mlxcpld_dgx_ng_regs_io_data),
> > +};
> > +
> >  /* Platform register access for modular systems families data */ =20
> > static struct mlxreg_core_data mlxplat_mlxcpld_modular_regs_io_data[] =
=3D {
> >  =09{
> > @@ -7239,6 +7660,32 @@ static int __init mlxplat_dmi_ng400_matched(cons=
t struct dmi_system_id *dmi)
> >  =09return mlxplat_register_platform_device();
> >  }
> > =20
> > +static int __init mlxplat_dmi_ng400_dgx_matched(const struct=20
> > +dmi_system_id *dmi) {
> > +=09int i;
> > +
> > +=09mlxplat_max_adap_num =3D MLXPLAT_CPLD_MAX_PHYS_ADAPTER_NUM;
> > +=09mlxplat_mux_num =3D ARRAY_SIZE(mlxplat_default_mux_data);
> > +=09mlxplat_mux_data =3D mlxplat_default_mux_data;
> > +=09for (i =3D 0; i < mlxplat_mux_num; i++) {
> > +=09=09mlxplat_mux_data[i].values =3D mlxplat_msn21xx_channels;
> > +=09=09mlxplat_mux_data[i].n_values =3D
> > +=09=09=09=09ARRAY_SIZE(mlxplat_msn21xx_channels);
> > +=09}
> > +=09mlxplat_hotplug =3D &mlxplat_mlxcpld_dgx_ext_data;
> > +=09mlxplat_hotplug->deferred_nr =3D
> > +=09=09mlxplat_msn21xx_channels[MLXPLAT_CPLD_GRP_CHNL_NUM - 1];
> > +=09mlxplat_led =3D &mlxplat_default_ng_led_data;
> > +=09mlxplat_regs_io =3D &mlxplat_dgx_ng_regs_io_data;
> > +=09mlxplat_fan =3D &mlxplat_default_fan_data;
> > +=09for (i =3D 0; i < ARRAY_SIZE(mlxplat_mlxcpld_wd_set_type2); i++)
> > +=09=09mlxplat_wd_data[i] =3D &mlxplat_mlxcpld_wd_set_type2[i];
> > +=09mlxplat_i2c =3D &mlxplat_mlxcpld_i2c_ng_data;
> > +=09mlxplat_regmap_config =3D &mlxplat_mlxcpld_regmap_config_ng400;
> > +
> > +=09return mlxplat_register_platform_device();
> > +}
> > +
> >  static int __init mlxplat_dmi_modular_matched(const struct=20
> > dmi_system_id *dmi)  {
> >  =09int i;
> > @@ -7458,6 +7905,13 @@ static const struct dmi_system_id mlxplat_dmi_ta=
ble[] __initconst =3D {
> >  =09=09=09DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "HI142"),
> >  =09=09},
> >  =09},
> > +=09{
> > +=09=09.callback =3D mlxplat_dmi_ng400_dgx_matched,
> > +=09=09.matches =3D {
> > +=09=09=09DMI_MATCH(DMI_BOARD_NAME, "VMOD0010"),
> > +=09=09=09DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "HI173"),
> > +=09=09},
> > +=09},
> >  =09{
> >  =09=09.callback =3D mlxplat_dmi_ng400_matched,
> >  =09=09.matches =3D {
> >=20
>=20
k
--8323328-1051370590-1768998689=:1033--
