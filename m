Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 001502ED860;
	Wed,  3 Dec 2025 10:39:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764758377; cv=none; b=NggI3qJn6Wo+6yOBKwrQJjRl0ZhMGApLQrYZbnmwGEwzDeZSn2kXY/bwGRaqpZ9ffKyV732BMmO3KLmegIoVcv5B0S28p5FkgALIB8ViGsmTGkw3ulhpwTnecfsr9rMWHcFpPIE5OMgVR5lOHWDbP4bElGK//2l/cd6T2it3Q2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764758377; c=relaxed/simple;
	bh=SWHDyMyBBh69b28S1gl5mIjs54pf5S7KuD0wdpTJ0Nk=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=qp16sg58ajee250XdQWLrcBO2rvPMRaOhbSF3HlrCQndBsZ4hH31RdYwD3x1F/egapdd30hJzxIQMvvrZZBncYDBUZMFvECxJi05l39TW1gAMiY6RPGIz0XpVgAfVeOTs4cnxCIkwsLjmFQff3HEU9L25G7D2GDyW+vd9GbRulE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mpOsilLt; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mpOsilLt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764758376; x=1796294376;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=SWHDyMyBBh69b28S1gl5mIjs54pf5S7KuD0wdpTJ0Nk=;
  b=mpOsilLt97uD2KXr/oF+v4FdnlTUtH2ukuWGs7lhd5gYj3/1lu5CwLAb
   s8O6PoHP8gmi0xfWQlEFGupqoVvg7wBuA/GS8cXw1Ajn5isSJjMCZNpgH
   R+jJKBPYc6Vc0OlKCHezHd1Cpb6nyu7HFOJ/VsIsGe7w6qVBA4QTN/GPA
   J/cXRPTlwHXxKKZ8axdaKcucvnwGcRJbKfWh5L8qCdEeCBWbaSifGldRe
   HRoBnAGv4lK4gMakydl+d02QpiVeHAI1Os5k/6Xm5OjQTbweZtzOtJyyg
   LywdiIFT4z69cyigKVlJXEVWxh3zTdyhxQltihKy0+6R2XGHFUp//iBUy
   Q==;
X-CSE-ConnectionGUID: qe7HOHiGT1SX7qQdHKuSig==
X-CSE-MsgGUID: 1M2NTw31T0WdbJ2hTGT4FA==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="69341260"
X-IronPort-AV: E=Sophos;i="6.20,245,1758610800"; 
   d="scan'208";a="69341260"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2025 02:39:35 -0800
X-CSE-ConnectionGUID: Uemf3GIsS7Oa+QK58U553A==
X-CSE-MsgGUID: rEzbdYGQTeCWlsvYhUs0lw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,245,1758610800"; 
   d="scan'208";a="194545229"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.57])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2025 02:39:33 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 3 Dec 2025 12:39:29 +0200 (EET)
To: Nitin <nitjoshi@gmail.com>
cc: Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>, njoshi1@lenovo.com, 
    Mark Pearson <mpearson-lenovo@squebb.ca>
Subject: Re: [PATCH] platform/x86: thinkpad_acpi: Add support to detect
 hardware damage detection capability.
In-Reply-To: <2f94f4bb-c0e5-40c0-9cf3-7ba31fefbc2b@gmail.com>
Message-ID: <e53819ec-ab6b-a036-245b-c2da26d5d411@linux.intel.com>
References: <20251203034032.6018-1-nitjoshi@gmail.com> <22f766d6-9010-3e87-f05b-bfd9b5888881@linux.intel.com> <2f94f4bb-c0e5-40c0-9cf3-7ba31fefbc2b@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-834648465-1764758369=:986"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-834648465-1764758369=:986
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Wed, 3 Dec 2025, Nitin wrote:

> Hi Ilpo,
>=20
> Thank you for reviewing the patch.
>=20
> On 12/3/25 18:44, Ilpo J=C3=A4rvinen wrote:
> > On Wed, 3 Dec 2025, Nitin Joshi wrote:
> >=20
> > > Thinkpads are adding the ability to detect and report hardware damage
> > > status. Add new sysfs interface to identify the impacted component
> > > with status.
> > > Initial support is available for the USB-C replaceable connector.
> > >=20
> > > Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
> > > Signed-off-by: Nitin Joshi<nitjoshi@gmail.com>
> > > ---
> > >   .../admin-guide/laptops/thinkpad-acpi.rst     |  26 +++
> > >   drivers/platform/x86/lenovo/thinkpad_acpi.c   | 179 +++++++++++++++=
+++
> > >   2 files changed, 205 insertions(+)
> > >=20
> > > diff --git a/Documentation/admin-guide/laptops/thinkpad-acpi.rst
> > > b/Documentation/admin-guide/laptops/thinkpad-acpi.rst
> > > index 4ab0fef7d440..4a3220529489 100644
> > > --- a/Documentation/admin-guide/laptops/thinkpad-acpi.rst
> > > +++ b/Documentation/admin-guide/laptops/thinkpad-acpi.rst
> > > @@ -54,6 +54,7 @@ detailed description):
> > >   =09- Setting keyboard language
> > >   =09- WWAN Antenna type
> > >   =09- Auxmac
> > > +=09- Hardware damage detection capability
> > >     A compatibility table by model and feature is maintained on the w=
eb
> > >   site, http://ibm-acpi.sf.net/. I appreciate any success or failure
> > > @@ -1576,6 +1577,31 @@ percentage level, above which charging will st=
op.
> > >   The exact semantics of the attributes may be found in
> > >   Documentation/ABI/testing/sysfs-class-power.
> > >   +Hardware damage detection capability
> > > +-----------------
> > > +
> > > +sysfs attributes: hwdd_status
> > > +
> > > +Thinkpads are adding the ability to detect and report hardware damag=
e.
> > > +Add new sysfs interface to identify the impacted component.
> > > +Initial support is available for the USB-C replaceable connector.
> > > +
> > > +The available commands are::
> > > +
> > > +        cat /sys/devices/platform/thinkpad_acpi/hwdd_status
> > > +
> > > +This value displays device type and location of device with damage
> > > status.
> > > +For example:
> > > +if no damage is detected:
> > > +  No damage detected
> > > +if damage detected:
> > > +  Damage detected:
> > > +  Device: TYPE-C
> > > +  Location: Base, Right side, Center port
> > > +
> > > +The property is read-only. If feature is not supported then sysfs
> > > +class is not created.
> > > +
> > >   Multiple Commands, Module Parameters
> > >   ------------------------------------
> > >   diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c
> > > b/drivers/platform/x86/lenovo/thinkpad_acpi.c
> > > index cc19fe520ea9..c3629bed9a8e 100644
> > > --- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
> > > +++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
> > > @@ -11080,6 +11080,180 @@ static const struct attribute_group
> > > auxmac_attr_group =3D {
> > >   =09.attrs =3D auxmac_attributes,
> > >   };
> > >   +/*****************************************************************=
********
> > > + * HWDD subdriver, for the Lenovo Hardware Damage Detection feature.
> > > + */
> > > +
> > > +#define HWDD_GET_DMG_USBC 0x80000001
> > > +#define HWDD_GET_CAP 0
> > > +#define HWDD_NOT_SUPPORTED BIT(31)
> > > +#define HWDD_SUPPORT_USBC BIT(0)
> > Align values.
>=20
> Ack, i will align values like below:
>=20
> #define HWDD_GET_CAP 0
> #define HWDD_GET_DMG_USBC 0x80000001
> #define HWDD_SUPPORT_USBC BIT(0)
> #define HWDD_NOT_SUPPORTED BIT(31)

These are not aligned as values starts from different columns. Please=20
put a tab char there in between so the values start at the same column (or=
=20
varying number of tabs depending on the length of the name).

There are plenty of good examples in the code, including in this file=20
you're modifying.

--=20
 i.

--8323328-834648465-1764758369=:986--
