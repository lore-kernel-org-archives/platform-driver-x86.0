Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BDEF2690F9
	for <platform-driver-x86@vger.kernel.org>; Tue,  8 Apr 2025 11:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744113363; cv=none; b=PeoxT986Dx9q79ZLjV/JTgr5GqRqoCd0M+3FYvKZY647C8YNBHkzHtpxwbgnw8Lwltk9XD+O+rvuM2Va0ollS37UPESas91k7XW7G4Blg+ELsnqlO41v+RPVgHLSF9M3C1hl4wLvbatT5fFYwbdz5ey+5qJ9jNUdRus2g7YkZrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744113363; c=relaxed/simple;
	bh=jE2Nwy15ZDuY6TJgBcQREp7HTQcvQBzrFxX+lVFv384=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=CDtEB1VlmAW2Px7610U2xM2kf/mmCBBiuqknkLmvLrLYFg1Hk1kqP0CMfyWvgaOTLVXSHG/PCJEtBUt8bWxxmRNKIAckurZYf1UpH90aDpY6ygaWMPPUlAWr0XXzNOhcTITqU1DrtAMKZHOgbV48msW79GNADYzHtVYvpJfp1gA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Fux3SAqG; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Fux3SAqG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744113362; x=1775649362;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version:content-id;
  bh=jE2Nwy15ZDuY6TJgBcQREp7HTQcvQBzrFxX+lVFv384=;
  b=Fux3SAqGSJbTHrNrzKql5tmWL2b69fYjT3onlxjHgBy4XLDpcbxrDaMK
   +b7F/yygiMoP7xh3Syfmz5ER/PJmGnYmO0LQ12g5ToIBLSNve+xo7UNGm
   5g6isLBnf1rWq/CTHT+8xAPfB7e9wX17/8tvPNZc93gpZiXdyayHCsE3f
   yWb2Hv/au2b6RPWefMpUhWAaxi1B+qInoWQFy38qnRgevaXwHHlf/6foZ
   cmAc+DZ2Zvm4nUdeN9kXtCS8hJAMSV4WklkBN7gJvEsEC3ImMR8FbUwjw
   ck/oQIRCWOVwdBjIYUVsGs5nFqMqClr3Ul0CmwCCYer+PXCzkF14jPHqG
   A==;
X-CSE-ConnectionGUID: QrZScwfGTmajwPJp4/sJ9w==
X-CSE-MsgGUID: P3K2KfW0QBOJOkRF7X/fhw==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="49337579"
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; 
   d="scan'208";a="49337579"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2025 04:56:01 -0700
X-CSE-ConnectionGUID: 7SBURMocTpK//AWWFLz9tQ==
X-CSE-MsgGUID: l5ewH7uiRK+XJXIkJK2B6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; 
   d="scan'208";a="128757686"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO localhost) ([10.245.244.125])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2025 04:55:58 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 8 Apr 2025 14:55:55 +0300 (EEST)
To: Vadim Pasternak <vadimp@nvidia.com>
cc: Hans de Goede <hdegoede@redhat.com>, Michael Shych <michaelsh@nvidia.com>, 
    Ciju Rajan K <crajank@nvidia.com>, Felix Radensky <fradensky@nvidia.com>, 
    Oleksandr Shamray <oleksandrs@nvidia.com>, 
    "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>
Subject: RE: [PATCH platform-next v7 1/8] platform/mellanox mlxreg-hotplug:
 Add support for new flavor of capability registers
In-Reply-To: <PH7PR12MB6668F830AED259DC278122C2AFA02@PH7PR12MB6668.namprd12.prod.outlook.com>
Message-ID: <34fb9d19-0a4c-aafd-971d-80ba4c8e6f0b@linux.intel.com>
References: <20250327163855.48294-1-vadimp@nvidia.com> <20250327163855.48294-2-vadimp@nvidia.com> <beaf923c-c637-aa84-c102-f5a9f2605715@linux.intel.com> <PH7PR12MB6668F830AED259DC278122C2AFA02@PH7PR12MB6668.namprd12.prod.outlook.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323328-628838978-1744112998=:930"
Content-ID: <231e67cb-5262-686b-6db5-156a4c32ea06@linux.intel.com>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-628838978-1744112998=:930
Content-Type: text/plain; CHARSET=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Content-ID: <7e787589-2c4b-cb15-9c01-03eefc43b61f@linux.intel.com>

On Fri, 28 Mar 2025, Vadim Pasternak wrote:
>=20
> > -----Original Message-----
> > From: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>
> > Sent: Friday, 28 March 2025 15:45
> > To: Vadim Pasternak <vadimp@nvidia.com>
> > Cc: Hans de Goede <hdegoede@redhat.com>; Michael Shych
> > <michaelsh@nvidia.com>; Ciju Rajan K <crajank@nvidia.com>; Felix Radens=
ky
> > <fradensky@nvidia.com>; Oleksandr Shamray <oleksandrs@nvidia.com>;
> > platform-driver-x86@vger.kernel.org
> > Subject: Re: [PATCH platform-next v7 1/8] platform/mellanox mlxreg-hotp=
lug:
> > Add support for new flavor of capability registers
> >=20
> > On Thu, 27 Mar 2025, Vadim Pasternak wrote:
> >=20
> > > The hotplug platform data is common across various systems, but the
> > > hotplug driver should only configure instances relevant to specific
> > > systems.
> > >
> > > For example, platform hotplug data might contain descriptions for
> > > fan1, fan2, ..., fan{n}, while some systems are equipped with all 'n'
> > > fans, others with less. This applies to power controllers, ASICs, and
> > > other components as well.
> > >
> > > The 'capability' register in 'mlxreg_core_item' structure specifies
> > > the total number of elements. All registers are 8 bits wide. When the
> > > number of attributes exceeds 8 bits, they are distributed across
> > > multiple hotplug register sets. The 'capability' register provides th=
e
> > > total count across all sets.
> > > Example for 20 attributes:
> > > - Set 1: attributes 1-8.
> > > - Set 2: attributes 9-16.
> > > - Set 3: attributes 17-20.
> > >
> > > The content of the 'capability' register in 'mlxreg_core_data'
> > > structure depends on presence of the 'slot' field in this structure:
> > > - If both 'capability' and 'slot' fields are provided: register conta=
ins
> > >   count of elements.
> > > - Otherwise: register contains bitmask.
> > >
> > > Use slot parameter to determine whether capability register contains
> > > bitmask or counter.
> >=20
> > Thanks, this is much more understandable now that you updated this, how=
ever, I
> > still find it in mismatch with the code.
> >=20
> > > This change reduces unnecessary duplication of hotplug structures
> > > between different systems - the same structure can be used for system=
s
> > > equipped with 4, 12, or 18 fans.
> > >
> > > Reviewed-by: Felix Radensky <fradensky@nvidia.com>
> > > Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
> > > ---
> > > v6->v7
> > > Revised after comment pointed out by Ilpo:
> > > - Renove capability_mask field.
> > > - Modify comments and commit text.
> > > v5->v6
> > > Revised after comments pointed out by Ilpo:
> > > - Drop 'capability_bit' from structure 'mlxreg_core_data', since it i=
s
> > >   not used.
> > > ---
> > >  drivers/platform/mellanox/mlxreg-hotplug.c | 29
> > > +++++++++++++++++++---
> > >  1 file changed, 26 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/drivers/platform/mellanox/mlxreg-hotplug.c
> > > b/drivers/platform/mellanox/mlxreg-hotplug.c
> > > index 0ce9fff1f7d4..bec12bc73e67 100644
> > > --- a/drivers/platform/mellanox/mlxreg-hotplug.c
> > > +++ b/drivers/platform/mellanox/mlxreg-hotplug.c
> > > @@ -274,7 +274,22 @@ static int mlxreg_hotplug_attr_init(struct
> > mlxreg_hotplug_priv_data *priv)
> > >  =09=09=09if (ret)
> > >  =09=09=09=09return ret;
> > >
> > > -=09=09=09item->mask =3D GENMASK((regval & item->mask) - 1, 0);
> > > +=09=09=09if (!regval)
> > > +=09=09=09=09continue;
> > > +
> > > +=09=09=09/*
> > > +=09=09=09 * The 'regval' contains a bitmask or count of attributes
> > to be handled.
> > > +=09=09=09 * When the 'capability' register is configured, for 'item'
> > it specifies the
> > > +=09=09=09 * total number of elements. All registers are 8 bits
> > wide. If the number of
> > > +=09=09=09 * attributes exceeds 8 bits, they are distributed across
> > multiple hotplug
> > > +=09=09=09 * register sets. The 'capability' register provides the
> > total count across
> > > +=09=09=09 * all sets.
> > > +=09=09=09 * Example for 20 attributes:
> > > +=09=09=09 * - Set 1: attributes 1-8.
> > > +=09=09=09 * - Set 2: attributes 9-16.
> > > +=09=09=09 * - Set 3: attributes 17-20.
> > > +=09=09=09 */
> > > +=09=09=09item->mask =3D GENMASK(((regval % 8) & item->mask) -
> > 1, 0);
> >=20
> > Okay so this matches the case for Set 3 but what code handles Set 1 & 2=
 that
> > should be set to 0xff ?
> >=20
> > How does it even determine which of those sets the item belongs to?
> >=20
> > I don't see those two things done anywhere in the code so please help m=
e, is my
> > understanding of the code lacking or is this code missing something?
>=20
> Hi Ilpo,
>=20
> Yes, you are right, it still not good - need identification of the set.
> Actually, we don't have such hardware yet, which requires extension which=
 I am trying
> to provide in this patch.
>=20
> The intension is to add common infrastructure for the case when system is=
 equipped is for
> example with 6, 12, 20, 24 fans.
> For covering 20 fans, register space should have 3 register sets (status/=
event/mask) for
> each eight. The 'capability' register value will be 20.
> The superset configuration will be like below.
>=20
> static struct mlxreg_core_data mlxplat_mlxcpld_xdr_fan_items_data[] =3D {
> =09{
> =09=09.label =3D "fan1",
> =09=09.reg =3D MLXPLAT_CPLD_LPC_REG_FAN_OFFSET,
> =09=09.mask =3D BIT(0),
> =09=09.slot =3D 1,
> =09=09.capability =3D MLXPLAT_CPLD_LPC_REG_FAN_DRW_CAP_OFFSET,
> =09=09.bit =3D BIT(0),
> =09=09.hpdev.nr =3D MLXPLAT_CPLD_NR_NONE,
> =09},
> ...
> =09{
> =09=09.label =3D "fan8",
> =09=09.reg =3D MLXPLAT_CPLD_LPC_REG_FAN_OFFSET,
> =09=09.mask =3D BIT(7),
> =09=09.slot =3D 8,
> =09=09.capability =3D MLXPLAT_CPLD_LPC_REG_FAN_DRW_CAP_OFFSET,
> =09=09.bit =3D BIT(7),
> =09=09.hpdev.nr =3D MLXPLAT_CPLD_NR_NONE,
> =09},
> };
>=20
> static struct mlxreg_core_data mlxplat_mlxcpld_xdr_fan2_items_data[] =3D =
{
> =09{
> =09=09.label =3D "fan9",
> =09=09.reg =3D MLXPLAT_CPLD_LPC_REG_FAN2_OFFSET,
> =09=09.mask =3D BIT(0),
> =09=09.slot =3D 9,
> =09=09.capability =3D MLXPLAT_CPLD_LPC_REG_FAN_DRW_CAP_OFFSET,
> =09=09.bit =3D BIT(0),
> =09=09.hpdev.nr =3D MLXPLAT_CPLD_NR_NONE,
> =09},
> ...
> =09{
> =09=09.label =3D "fan16",
> =09=09.reg =3D MLXPLAT_CPLD_LPC_REG_FAN2_OFFSET,
> =09=09.mask =3D BIT(7),
> =09=09.slot =3D 16,
> =09=09.capability =3D MLXPLAT_CPLD_LPC_REG_FAN_DRW_CAP_OFFSET,
> =09=09.bit =3D BIT(7),
> =09=09.hpdev.nr =3D MLXPLAT_CPLD_NR_NONE,
> =09},
> };
>=20
> static struct mlxreg_core_data mlxplat_mlxcpld_xdr_fan3_items_data[] =3D =
{
> =09{
> =09=09.label =3D "fan17",
> =09=09.reg =3D MLXPLAT_CPLD_LPC_REG_FAN2_OFFSET,
> =09=09.mask =3D BIT(0),
> =09=09.slot =3D 17,
> =09=09.capability =3D MLXPLAT_CPLD_LPC_REG_FAN_DRW_CAP_OFFSET,
> =09=09.bit =3D BIT(0),
> =09=09.hpdev.nr =3D MLXPLAT_CPLD_NR_NONE,
> =09},
> ...
> =09{
> =09=09.label =3D "fan24",
> =09=09.reg =3D MLXPLAT_CPLD_LPC_REG_FAN2_OFFSET,
> =09=09.mask =3D BIT(7),
> =09=09.slot =3D 24,
> =09=09.capability =3D MLXPLAT_CPLD_LPC_REG_FAN_DRW_CAP_OFFSET,
> =09=09.bit =3D BIT(7),
> =09=09.hpdev.nr =3D MLXPLAT_CPLD_NR_NONE,
> =09},
> };
>=20
> For 'item' structure need to add additional filed to identify the group.
> Let's say the filed 'last_slot' with the last slot number in this group.
>=20
> static struct mlxreg_core_item mlxplat_mlxcpld_xdr_items[] =3D {
> ...
> =09{
> =09=09.data =3D mlxplat_mlxcpld_xdr_fan_items_data,
> =09=09.aggr_mask =3D MLXPLAT_CPLD_AGGR_MASK_NG_DEF,
> =09=09.reg =3D MLXPLAT_CPLD_LPC_REG_FAN_OFFSET,
> =09=09.mask =3D MLXPLAT_CPLD_FAN_XDR_MASK,
> =09=09.capability =3D MLXPLAT_CPLD_LPC_REG_FAN_DRW_CAP_OFFSET,
> =09=09.last_slot =3D 8, -> need to add filed to identify the last slot in=
 item
> =09=09.count =3D ARRAY_SIZE(mlxplat_mlxcpld_xdr_fan_items_data),
> =09=09.inversed =3D 1,
> =09=09.health =3D false,
> =09},
> =09{
> =09=09.data =3D mlxplat_mlxcpld_xdr_fan2_items_data,
> =09=09.aggr_mask =3D MLXPLAT_CPLD_AGGR_MASK_NG_DEF,
> =09=09.reg =3D MLXPLAT_CPLD_LPC_REG_FAN2_OFFSET,
> =09=09.mask =3D MLXPLAT_CPLD_FAN_XDR_MASK,
> =09=09.capability =3D MLXPLAT_CPLD_LPC_REG_FAN_DRW_CAP_OFFSET,
> =09=09.last_slot =3D 16, -> need to add filed to identify the last slot i=
n item
> =09=09.count =3D ARRAY_SIZE(mlxplat_mlxcpld_xdr_fan2_items_data),
> =09=09.inversed =3D 1,
> =09=09.health =3D false,
> =09},
> =09{
> =09=09.data =3D mlxplat_mlxcpld_xdr_fan3_items_data,
> =09=09.aggr_mask =3D MLXPLAT_CPLD_AGGR_MASK_NG_DEF,
> =09=09.reg =3D MLXPLAT_CPLD_LPC_REG_FAN3_OFFSET,
> =09=09.mask =3D MLXPLAT_CPLD_FAN_XDR_MASK,
> =09=09.capability =3D MLXPLAT_CPLD_LPC_REG_FAN_DRW_CAP_OFFSET,
> =09=09.last_slot =3D 24, -> need to add filed to identify the last slot i=
n item
> =09=09.count =3D ARRAY_SIZE(mlxplat_mlxcpld_xdr_fan3_items_data),
> =09=09.inversed =3D 1,
> =09=09.health =3D false,
> =09},
>=20
> Then to treat it as:
> =09regval =3D regval >=3D item->last_slot ? 8 : item->last_slot - regval;
> =09item->mask =3D GENMASK((regval & item->mask) - 1, 0);
>=20
> So, for 20 elements, value of 'capability' is 20, 'item->mask' for all gr=
oups 0xff.
>=20
> For the 1-st group: 'regval' is set 8 and 'item->mask' 0xff.
> For the 2-nd group: 'regval' is set 8 and 'item->mask' 0xff.
> For the 3-rd group: 'regval' is set 24 - 20 and and 'item->mask' 0x0f.
>=20
> Probably I'll remove this patch from the current patch set and send this
> as a separate patch, including only the above change.
> What do you think?
>
> Thank you very much and sorry.

Hi,

What's the hurry with untested code for HW that isn't there yet to test=20
with? It's not like I'd expect it to take long time to get this series=20
finished and included once you actually can test it (assuming it won't=20
take many weeks to address simple comments and send updated version of
the series).

--=20
 i.

> Vadim.
>=20
> >=20
> > Note that I'm also a bit unsure if one iteration of the main for loop i=
n this
> > function handles one of those sets on each iteration or if there would =
be
> > additional loop required to handle the multi-set case within this if bl=
ock (you
> > don't call any variable "set" in this function so I'm not able to make =
the
> > connection fully between the description and the code).
> >=20
> >=20
> > (I'm really sorry I feel like I'm just dragging this on and on but I ca=
nnot shake the
> > feeling something is still wrong with this code).
> >=20
> > >  =09=09}
> > >
> > >  =09=09data =3D item->data;
> > > @@ -294,7 +309,15 @@ static int mlxreg_hotplug_attr_init(struct
> > mlxreg_hotplug_priv_data *priv)
> > >  =09=09=09=09if (ret)
> > >  =09=09=09=09=09return ret;
> > >
> > > -=09=09=09=09if (!(regval & data->bit)) {
> > > +=09=09=09=09/*
> > > +=09=09=09=09 * In case slot field is provided, capability
> > register contains
> > > +=09=09=09=09 * counter, otherwise bitmask. Skip non-
> > relevant entries if slot
> > > +=09=09=09=09 * is set and exceeds counter. Othewise validate
> > entry by matching
> > > +=09=09=09=09 * bitmask.
> > > +=09=09=09=09 */
> > > +=09=09=09=09if (data->slot > regval)
> > > +=09=09=09=09=09break;
> > > +=09=09=09=09if (!(regval & data->bit) && !data->slot) {
> > >  =09=09=09=09=09data++;
> > >  =09=09=09=09=09continue;
> > >  =09=09=09=09}
> > > @@ -611,7 +634,7 @@ static int mlxreg_hotplug_set_irq(struct
> > mlxreg_hotplug_priv_data *priv)
> > >  =09=09=09=09if (ret)
> > >  =09=09=09=09=09goto out;
> > >
> > > -=09=09=09=09if (!(regval & data->bit))
> > > +=09=09=09=09if (!(regval & data->bit) && !data->slot)
> > >  =09=09=09=09=09item->mask &=3D ~BIT(j);
> > >  =09=09=09}
> > >  =09=09}
> > >
--8323328-628838978-1744112998=:930--
