Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF1B85A0AC5
	for <platform-driver-x86@vger.kernel.org>; Tue,  8 Sep 2026 19:04:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788894264; cv=none; b=rE4R826q3dY63VBslQLt20uLpAzCyVDELu134sq+Y8t/m+jJQNmyaS4QzvKCAmZPX7HIoTFP/07E8uR1e2mcX0jxpZ8A7QCoqciZjQtSwlCIip1LCNId9cG/lVxNq476c9PZ8J+0osCWD/qxA1h8+anXu2DWj0oEU2ZlK/4Quts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788894264; c=relaxed/simple;
	bh=A/sZbFZG7ENxecMSUsV5fQXR0pvr/b+FHLCqlVwFL/g=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=BXKCptHbu3RyoNZDuxQno5a/Y0ywq9EruA1UHaGnH/UT/JKSjmIHcaYbT3Kw5nKJcw0ptM5t/9NtDjcNt0jbF5//6GTQ96dsKI1T2+R7+1a16E/12ZSjO1TmQMaq4XzolGrslOZDQeOFBnv8NCWMOW9TUzJjU+1EuKQ4roGowr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H5DXKzXA; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H5DXKzXA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788894263; x=1820430263;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=A/sZbFZG7ENxecMSUsV5fQXR0pvr/b+FHLCqlVwFL/g=;
  b=H5DXKzXAy9zpYs1weDZeo+BqeqqIbc8IZ9TqsoNn0+Atb/7w5lEd9kcw
   Vy1R4tnSamlE7XDI0f6WUSdJymWTLHix4Rl1oara2tTda8+mYmMg9uaow
   ME8EfCX1/WDHcyoOTOg8v9dOj120X8Jqw1PrX5wMLOPmXCZR0j0qmfwnf
   1JpS6jwEg7Ff/j2OHgKODeDrWsnTGLTHsfOKCb8Aocs+2NUgTjzOHCpAI
   zdE70BiaUpxxFiywzEv7g7binjLxp04BVLAnaFyOBMUl06Qd6L3vOce6R
   nwiqSxB6RfHQ3cBGUUMFNL+qIDIhU7htBdzXHthHCUb7dYTLIABi0ruVK
   Q==;
X-CSE-ConnectionGUID: HlBo21xSTSOTPXISOVJB/w==
X-CSE-MsgGUID: r1a72Yn6RTqO5ZYRxYbuDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="93004742"
X-IronPort-AV: E=Sophos;i="6.25,269,1779174000"; 
   d="scan'208";a="93004742"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2026 12:04:23 -0700
X-CSE-ConnectionGUID: RDj14NFLRSGy+w28yZH1gw==
X-CSE-MsgGUID: BLvI4E9mQIGoGOrOFEBypg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,269,1779174000"; 
   d="scan'208";a="271591347"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.109])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2026 12:04:20 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 8 Sep 2026 22:04:16 +0300 (EEST)
To: Hans de Goede <johannes.goede@oss.qualcomm.com>
cc: Andy Shevchenko <andy@kernel.org>, 
    Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
    Bartosz Golaszewski <brgl@kernel.org>, Linus Walleij <linusw@kernel.org>, 
    "Rafael J . Wysocki" <rafael@kernel.org>, 
    platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH] platform/x86: x86-android-tablets: fix gpio_secondary_fwnode_init()
 not working
In-Reply-To: <2666d5fe-994b-4f5f-ae5a-60ce9fffb867@oss.qualcomm.com>
Message-ID: <1106cecc-3151-8fe5-e51b-b6c5816ae73a@linux.intel.com>
References: <20260831201157.36397-1-johannes.goede@oss.qualcomm.com> <apcRAvoHkh9blDwK@black.igk.intel.com> <74f149f6-caa8-db4e-9ef4-5c15b7a5845f@linux.intel.com> <2666d5fe-994b-4f5f-ae5a-60ce9fffb867@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1431978843-1788894256=:1164"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1431978843-1788894256=:1164
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Tue, 8 Sep 2026, Hans de Goede wrote:

> Hi Ilpo,
>=20
> On 3-Sep-26 13:54, Ilpo J=C3=A4rvinen wrote:
> > On Tue, 1 Sep 2026, Andy Shevchenko wrote:
> >=20
> >> On Mon, Aug 31, 2026 at 10:11:57PM +0200, Hans de Goede wrote:
> >>> acpi_bus_find_device_by_name() call returns a pointer to the device o=
bject
> >>> on the ACPI bus, aka the ACPI companion device.
> >>>
> >>> gpio_secondary_fwnode_init() then continues with setting the secondar=
y
> >>> fwnode on this device. But this is not the actual physical device for
> >>> the GPIO controller (e.g. the GPIO controller platform bus device).
> >>>
> >>> This mismatch is causing GPIO lookups by secondary fwnode to not work=
=2E
> >>>
> >>> Modify gpio_secondary_fwnode_init() to instead set the secondary fwno=
de
> >>> of the first physical device associated with the ACPI companion devic=
e.
> >>>
> >>> This fixes the GPIO lookups not working.
> >>
> >> ...
> >>
> >>> static int gpio_secondary_fwnode_init(struct device *parent,
> >>
> >>>  =09=09if (WARN_ON(!fwnode))
> >>>  =09=09=09return -ENOENT;
> >>> =20
> >>> -=09=09set_secondary_fwnode(dev, fwnode);
> >>> +=09=09struct device *phys_dev =3D acpi_get_first_physical_node(to_ac=
pi_device(dev));
> >>
> >> It doesn't look like an auto cleaning pointer, so let's make a declara=
tion
> >> outside of the code?
> >>
> >>> +=09=09if (!phys_dev)
> >>> +=09=09=09return dev_err_probe(parent,
> >>> +=09=09=09=09=09     -ENODEV, "No physical device for ACPI GPIO dev: =
%s\n",
> >>> +=09=09=09=09=09     (*swnode)->name);
> >>
> >> Hmm... Why not %pfwP?
> >=20
> > Hi Hans,
> >=20
> > I'm waiting for v2.
>=20
> I see, thank you for quoting Andy's email since it never made the list (1=
),
> nor did it reach me.
>=20
> I'll prepare a v2 addressing Andy's remarks.
>=20
> Regards,
>=20
>=20
> Hans
>=20
>=20
> 1) If you go to:
>=20
> https://lore.kernel.org/platform-driver-x86/20260831201157.36397-1-johann=
es.goede@oss.qualcomm.com/#r
>=20
> it shows a "not found" <apcRAvoHkh9blDwK@black.igk.intel.com> entry, whic=
h it
> only knows about because of this reply to it by you (Ilpo).

Yeah, I noticed it didn't end up into patchwork either but figured you'd=20
see the content from my reply if the original had failed to reach you.

I've applied v2 now, thanks.

--=20
 i.

--8323328-1431978843-1788894256=:1164--
