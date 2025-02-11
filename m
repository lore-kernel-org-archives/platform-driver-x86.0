Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D5DA250C0F
	for <platform-driver-x86@vger.kernel.org>; Tue, 11 Feb 2025 14:48:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739285302; cv=none; b=ooSW44vAG0yOffixZGQW/emI7f7RUQRpNe/piHwdXZ/HHqLhF+UULBokDoRnUwpqVLYRjqCFBE9vjh/2dEMvgwAWI2piyNR+a4MrOFkdQD5WNHI7be6NG/A7bUOm9Lvp1b/+hidAzbok2CFqJJ4CbTXd3csQpVHb6W/9M8r7nzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739285302; c=relaxed/simple;
	bh=eXztKWQnLo6ohExyL1kgCCUjmld7DsD3Y2yCxB94ouc=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=r8b1IoLLumvToGlknUDb/eFOllm60sGSO0BGrm5JJVJA7hozDWayYW8f1bEl1RI8wgkq4lQdAUYATPcvNckO6xd8Ffy2eGPCT0XdYPKItEY9GvLtG0ibDRKy4IxqZUqkQsSjoXqT4LIGDYoZI02Ju+3+U+T6yxshL9/hX2rc/mk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M2rEXjNd; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M2rEXjNd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739285299; x=1770821299;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version:content-id;
  bh=eXztKWQnLo6ohExyL1kgCCUjmld7DsD3Y2yCxB94ouc=;
  b=M2rEXjNdtgfpfUcSnGEZiXOtG+COu8Qr2D0C+BbAFoZO5e04oKyEa8Cq
   GTsaILDRCaCfss7GRfKSGjzX98onkhuiIYX2i69l8W0beuqrZDgADFxOB
   8QagxsTQc1mGRoMmtG4Ap0jAo6p/bU/5vzdeJ6y0nhyGpxnbDF9AE2pQO
   KL8uP2unX38CAyDOp207blKkzKOGgJFcIZ9vgYUnTfhGjDSty8L8SWEYa
   UCkV/A2/rS/gI68A6FUarWy+sOTAncXdjYBqS4Ta6S7efFGZFIRndU0y6
   jxmF11BMrHg27XWb9utSsyfvNNXGuf7e24ok+ymKLWFs27/PShy6wEL3F
   w==;
X-CSE-ConnectionGUID: 4wgL/kmLQf+ZMJrdLe2jBQ==
X-CSE-MsgGUID: AIjBcuiVR/eD4RdKi5LDWQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11342"; a="43834870"
X-IronPort-AV: E=Sophos;i="6.13,277,1732608000"; 
   d="scan'208";a="43834870"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2025 06:48:18 -0800
X-CSE-ConnectionGUID: MGH+7mNrSVWh5PnE+AZdkw==
X-CSE-MsgGUID: g14g0V+fR928qasZh6Yj6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="117452246"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.14])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2025 06:48:16 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 11 Feb 2025 16:48:13 +0200 (EET)
To: Vadim Pasternak <vadimp@nvidia.com>
cc: Hans de Goede <hdegoede@redhat.com>, Michael Shych <michaelsh@nvidia.com>, 
    Ciju Rajan K <crajank@nvidia.com>, Felix Radensky <fradensky@nvidia.com>, 
    Oleksandr Shamray <oleksandrs@nvidia.com>, 
    "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>
Subject: RE: [PATCH v5 05/12] platform/mellanox: mlxreg-hotplug: Add support
 for new flavor of capability registers
In-Reply-To: <PH7PR12MB66687E5512AB0A506A411C70AFF22@PH7PR12MB6668.namprd12.prod.outlook.com>
Message-ID: <c1d2e2d7-7189-3d77-7887-ed0a2e1c8709@linux.intel.com>
References: <20250124172632.22437-1-vadimp@nvidia.com> <20250124172632.22437-6-vadimp@nvidia.com> <13c4d945-a9e3-05ec-a805-573980505f3f@linux.intel.com> <PH7PR12MB66687E5512AB0A506A411C70AFF22@PH7PR12MB6668.namprd12.prod.outlook.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323328-1822500184-1739285172=:4237"
Content-ID: <ea415251-2b5a-12fd-3cea-6ec627e63eae@linux.intel.com>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1822500184-1739285172=:4237
Content-Type: text/plain; CHARSET=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Content-ID: <d349ddef-d0e6-61a5-3fda-58b7ec9065d7@linux.intel.com>

On Mon, 10 Feb 2025, Vadim Pasternak wrote:
> > -----Original Message-----
> > From: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>
> > Sent: Monday, 3 February 2025 15:47
> > To: Vadim Pasternak <vadimp@nvidia.com>
> > Cc: Hans de Goede <hdegoede@redhat.com>; Michael Shych
> > <michaelsh@nvidia.com>; Ciju Rajan K <crajank@nvidia.com>; Felix Radens=
ky
> > <fradensky@nvidia.com>; Oleksandr Shamray <oleksandrs@nvidia.com>;
> > platform-driver-x86@vger.kernel.org
> > Subject: Re: [PATCH v5 05/12] platform/mellanox: mlxreg-hotplug: Add
> > support for new flavor of capability registers
> >=20
> > On Fri, 24 Jan 2025, Vadim Pasternak wrote:
> >=20
> > > Hotplug platform data is common across the various systems, while
> > > hotplug driver should be able to configure only the instances relevan=
t
> > > to specific system.
> > >
> > > For example, platform hoptplug data might contain descriptions for
> > > fan1, fan2, ..., fan{n}, while some systems equipped with all 'n'
> > > fans, others with less.
> > > Same for power units, power controllers, ASICs and so on.
> > >
> > > For detection of the real number of equipped devices capability
> > > registers are used.
> > > These registers used to indicate presence of hotplug devices through
> > > the bitmap.
> >=20
> > Hi,
> >=20
> > Don't leave non-full lines in middle of a paragraph.
> >=20
> > > For some new big modular systems, these registers will provide
> > > presence by counters.
> > >
> > > Use slot parameter to determine whether capability register contains
> > > bitmask or counter.
> > >
> > > Some 'capability' registers can be shared between different resources=
=2E
> > > Use fields 'capability_bit' and 'capability_mask' for getting only
> > > relevant capability bits.
> > >
> > > Reviewed-by: Felix Radensky <fradensky@nvidia.com>
> > > Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
> > > ---
> > > v2->v3
> > > Comments pointed out by Ilpo:
> > > - Change rol32() to shift left.
> > > ---
> > >  drivers/platform/mellanox/mlxreg-hotplug.c | 22
> > > ++++++++++++++++++++--
> > >  1 file changed, 20 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/drivers/platform/mellanox/mlxreg-hotplug.c
> > > b/drivers/platform/mellanox/mlxreg-hotplug.c
> > > index 0ce9fff1f7d4..c525b8754d48 100644
> > > --- a/drivers/platform/mellanox/mlxreg-hotplug.c
> > > +++ b/drivers/platform/mellanox/mlxreg-hotplug.c
> > > @@ -274,6 +274,12 @@ static int mlxreg_hotplug_attr_init(struct
> > mlxreg_hotplug_priv_data *priv)
> > >  =09=09=09if (ret)
> > >  =09=09=09=09return ret;
> > >
> > > +=09=09=09if (!regval)
> > > +=09=09=09=09continue;
> > > +
> > > +=09=09=09/* Remove non-relevant bits. */
> > > +=09=09=09if (item->capability_mask)
> > > +=09=09=09=09regval =3D (regval & item->capability_mask) <<
> > > +item->capability_bit;
>=20
> After dropping 'capability_bit', it'll be just masking of unused bits:
>=20
> =09=09=09/* Remove non-relevant bits. */
> =09=09=09if (item->capability_mask)
> =09=09=09=09regval =3D (regval & item->capability_mask);
>=20
> >=20
> > What's in regval at this point? What it was before this patch?
> >=20
> > >  =09=09=09item->mask =3D GENMASK((regval & item->mask) - 1, 0);
> >=20
> > I'm sorry but that comment didn't really help me understand what's goin=
g on
> > here with the double field mask generation.

This does not address all my concerns. Before this change, GENMASK() was=20
calculated from regval directly. After this change, it is calculated from=
=20
the value that is subset of bits. Why were the bits relevant before this=20
change?

Your patch 1 says "Register contains bitmask of attributes or number of
attributtes, which should be handled." So if it's the first case, bitmask=
=20
of attributes, how can this code be correct since that value is passed to=
=20
GENMASK()??

TBH, even that pre-existing item->mask recalculation looks really odd.

> > Is the code correct both before the addition of the extra step and afte=
r it?
> > Because I cannot wrap my head around what this code attempts to do and
> > how could it be correct both pre and post this change.


--=20
 i.
--8323328-1822500184-1739285172=:4237--
