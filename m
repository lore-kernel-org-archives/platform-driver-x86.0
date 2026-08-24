Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D179B39DBE5;
	Mon, 24 Aug 2026 07:43:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787557403; cv=none; b=f40o93+3Z5QVTsxLoHb7/raOgaITMbQIxvSACskaOXDuQVUxRxNRFa2qXliP/HeqJZmqXJjXEm6c5njakHd9yj8k9wSZ7/Q7CFpYm4AmqUUcL6QnUbzp+hzMHjoU9j03wNpJnL3iegVeW30VWgECPjEDvo8xxnNE1JcWzAFiikY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787557403; c=relaxed/simple;
	bh=h+dm8yw0JQ65muZZq5b7KcXNZJpZYcFJTbQQm1nqoY4=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=NouG4+FHspHi5zLTQtVTwrsDv5MJSpdh2bsarATcwFHxdntJOzBMH7Yu79Ivq0y0ymCKRAXLwYgJNDMYfGuRPALyLLCkPpOjD0sgRXBri7XJ/JRx5A447qa9tHcnS3dsuZfV5oO1mHpNiGU6mcwDnBhq1ih3ig8A9H9gCkk1f6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BREeE3JO; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BREeE3JO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787557401; x=1819093401;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=h+dm8yw0JQ65muZZq5b7KcXNZJpZYcFJTbQQm1nqoY4=;
  b=BREeE3JO7Qww6OaLKY4f53wJkFXqH7c4zlGxaRSK8GqPZRp+iqnXSHmf
   cR+5Xq3eLEgMj6Mvzl869d1IIW6iKp8oP0UD7MnWNYQyXCGCoHtRGlDu+
   74Qwj0C/9AzXrWspzRUr28+j+npPZ96kI95rH9DZinZndU7VGnqwPWUuJ
   koJyUKxjUN1zsHUZOi+fHubwmJcugJiEqdontElXo62Q75JSP3YXOYw5S
   j9OAL4TSyKwOULwpqpPJr3OEhglIzp2zG6WbdG+QRZobWBUXANmCOrDn2
   FcxPMfoERDpsQ9bYoOPOEC74YoNp/hSfnanBmTw6+/y+P7meFn3ilf2CO
   g==;
X-CSE-ConnectionGUID: VjyGvePtTp2EV6ZK7KsSfw==
X-CSE-MsgGUID: nRvK4Ks3Riu6MOs5yql6Sg==
X-IronPort-AV: E=McAfee;i="6800,10657,11884"; a="99528074"
X-IronPort-AV: E=Sophos;i="6.25,240,1779174000"; 
   d="scan'208";a="99528074"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 00:43:18 -0700
X-CSE-ConnectionGUID: MZ7rU8nWTS6BYGDJx1evKw==
X-CSE-MsgGUID: gZOVje48SFePdjcn666+uA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,240,1779174000"; 
   d="scan'208";a="263649748"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.154])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 00:43:15 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 24 Aug 2026 10:43:12 +0300 (EEST)
To: Sakari Ailus <sakari.ailus@linux.intel.com>
cc: linux-media@vger.kernel.org, Daniel Scally <dan.scally@ideasonboard.com>, 
    Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH 2/2] platform/x86: int3472: Fix uninitialised variable
 warning
In-Reply-To: <aoifU8ddCczzKHz4@kekkonen.localdomain>
Message-ID: <c3a8ff50-2288-1117-d2af-c2485bffbb9c@linux.intel.com>
References: <20260820205148.2910639-1-sakari.ailus@linux.intel.com> <20260820205148.2910639-3-sakari.ailus@linux.intel.com> <ca97b754-795e-e579-8705-9f2e3d66287b@linux.intel.com> <aoifU8ddCczzKHz4@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1745258645-1787557392=:1164"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1745258645-1787557392=:1164
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Fri, 21 Aug 2026, Sakari Ailus wrote:

> Moi,
>=20
> Thanks for the review.
>=20
> On Fri, Aug 21, 2026 at 11:34:06AM +0300, Ilpo J=E4rvinen wrote:
> > On Thu, 20 Aug 2026, Sakari Ailus wrote:
> >=20
> > > Fix a smatch warning about uninitialised err_msg variable, by printin=
g the
> > > error where it is handled.
> > >=20
> > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > ---
> > >  drivers/platform/x86/intel/int3472/discrete.c | 21 +++++++++--------=
--
> > >  1 file changed, 10 insertions(+), 11 deletions(-)
> > >=20
> > > diff --git a/drivers/platform/x86/intel/int3472/discrete.c b/drivers/=
platform/x86/intel/int3472/discrete.c
> > > index 6c729fcfce5d..cf8a58ef963b 100644
> > > --- a/drivers/platform/x86/intel/int3472/discrete.c
> > > +++ b/drivers/platform/x86/intel/int3472/discrete.c
> > > @@ -329,7 +329,6 @@ static int skl_int3472_handle_gpio_resources(stru=
ct acpi_resource *ares,
> > >  =09unsigned long gpio_flags;
> > >  =09union acpi_object *obj;
> > >  =09struct gpio_desc *gpio;
> > > -=09const char *err_msg;
> > >  =09const char *con_id;
> > >  =09int ret;
> > > =20
> > > @@ -375,7 +374,7 @@ static int skl_int3472_handle_gpio_resources(stru=
ct acpi_resource *ares,
> > >  =09case INT3472_GPIO_TYPE_HOTPLUG_DETECT:
> > >  =09=09ret =3D skl_int3472_map_gpio_to_sensor(int3472, agpio, con_id,=
 gpio_flags);
> > >  =09=09if (ret)
> > > -=09=09=09err_msg =3D "Failed to map GPIO pin to sensor\n";
> > > +=09=09=09dev_err(int3472->dev, "Failed to map GPIO pin to sensor\n")=
;
> > > =20
> > >  =09=09break;
> > >  =09case INT3472_GPIO_TYPE_CLK_ENABLE:
> > > @@ -387,7 +386,7 @@ static int skl_int3472_handle_gpio_resources(stru=
ct acpi_resource *ares,
> > >  =09=09gpio =3D skl_int3472_gpiod_get_from_temp_lookup(int3472, agpio=
, con_id, gpio_flags);
> > >  =09=09if (IS_ERR(gpio)) {
> > >  =09=09=09ret =3D PTR_ERR(gpio);
> > > -=09=09=09err_msg =3D "Failed to get GPIO\n";
> > > +=09=09=09dev_err(int3472->dev, "Failed to get GPIO\n");
> > >  =09=09=09break;
> > >  =09=09}
> > > =20
> >=20
> > ssahiko is not happy about dev_err_probe() -> dev_err() conversion.
>=20
> I was wondering, too, whether I should keep it, but then again returning
> the error won't help here (as of now at least) and it is probably not
> possible -EPROBE_DEFER would be returned in these cases. I can keep using
> dev_err_probe() though if you prefer that.

If sashiko is wrong and skl_int3472_gpiod_get_from_temp_lookup() cannot=20
ever return -EPROBE_DEFER, then it doesn't matter. (But it seems=20
reasonably good at tracking the callchains so you might want to check the=
=20
detailed log if it actually found how it can return that). If it does=20
return -EPROBE_DEFER, dev_err_probe() should be kept.

--=20
 i.

> > > @@ -395,14 +394,14 @@ static int skl_int3472_handle_gpio_resources(st=
ruct acpi_resource *ares,
> > >  =09=09case INT3472_GPIO_TYPE_CLK_ENABLE:
> > >  =09=09=09ret =3D skl_int3472_register_gpio_clock(int3472, gpio);
> > >  =09=09=09if (ret)
> > > -=09=09=09=09err_msg =3D "Failed to register clock\n";
> > > +=09=09=09=09dev_err(int3472->dev, "Failed to register clock\n");
> > > =20
> > >  =09=09=09break;
> > >  =09=09case INT3472_GPIO_TYPE_PRIVACY_LED:
> > >  =09=09case INT3472_GPIO_TYPE_STROBE:
> > >  =09=09=09ret =3D skl_int3472_register_led(int3472, gpio, con_id);
> > >  =09=09=09if (ret)
> > > -=09=09=09=09err_msg =3D "Failed to register LED\n";
> > > +=09=09=09=09dev_err(int3472->dev, "Failed to register LED\n");
> > > =20
> > >  =09=09=09break;
> > >  =09=09case INT3472_GPIO_TYPE_POWER_ENABLE:
> > > @@ -413,7 +412,7 @@ static int skl_int3472_handle_gpio_resources(stru=
ct acpi_resource *ares,
> > >  =09=09=09ret =3D skl_int3472_register_regulator(int3472, gpio, enabl=
e_time_us,
> > >  =09=09=09=09=09=09=09     con_id, second_sensor);
> > >  =09=09=09if (ret)
> > > -=09=09=09=09err_msg =3D "Failed to register regulator\n";
> > > +=09=09=09=09dev_err(int3472->dev, "Failed to register regulator\n");
> > > =20
> > >  =09=09=09break;
> > >  =09=09default: /* Never reached */
> > > @@ -436,11 +435,11 @@ static int skl_int3472_handle_gpio_resources(st=
ruct acpi_resource *ares,
> > >  =09int3472->ngpios++;
> > >  =09ACPI_FREE(obj);
> >=20
> > As a general comment to logic in this function, it would be preferrable=
 to=20
> > arrange code such that the error cases inside the switch could just ret=
urn=20
> > directly.
> >=20
> > To realize that, one would need to
> >=20
> > 1) use __free() for obj
> >=20
> > 2) handle that ngpios++ earlier; but I'm not even entire sure about ngp=
ios=20
> > correctness and function, it seems to be only used for indexing in
> > acpi_evaluate_dsm_typed() (successive calls into=20
> > skl_int3472_handle_gpio_resources()?) but then I don't understand why=
=20
> > the !obj early return does not increment ngpios too.
>=20
> "ngpios" is in fact an iterator. In case of an error incrementing it
> doesn't really matter and !obj signals the end.
>
> I'll see how to refactor this a little in another patch. The intent here
> was just to fix the smatch warning as we can't currently add int3472 to
> Media CI because of it.
>=20
> >=20
> > > -=09if (ret < 0)
> > > -=09=09return dev_err_probe(int3472->dev, ret, err_msg);
> > > -
> > > -=09/* Tell acpi_dev_get_resources() to not make a copy of the resour=
ce */
> > > -=09return 1;
> > > +=09/*
> > > +=09 * Either return an error or tell acpi_dev_get_resources() to not=
 make a
> > > +=09 * copy of the resource.
> > > +=09 */
> > > +=09return ret < 0 ? ret : 1;
> > >  }
> > > =20
> > >  int int3472_discrete_parse_crs(struct int3472_discrete_device *int34=
72)
> > >=20
> >=20
>=20
>=20

--8323328-1745258645-1787557392=:1164--
