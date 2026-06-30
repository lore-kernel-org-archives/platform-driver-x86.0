Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1EBB3DF018;
	Tue, 30 Jun 2026 18:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782842837; cv=none; b=UA8jWXrqhlApMQ/tcGCluCmCxdd/JRzZQQuHMPLFGfVZ9gpT5c3Z11YBrBQ5PvS4g4SIOJmGVbpWvPqc5KkYoHht1B3Vvg2dTLYTG4dEYr6hCIhq8rQNXUnksqHgyjvMYmeBPTUZwUpFQnReY2X6eKfJN4LsM26FcWrNufavv/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782842837; c=relaxed/simple;
	bh=Wnll7AfVDxjKrVe/Xq2HSwvWhvd98a6ymrAlNUFpL4w=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=cYEsiGvidvVihX7vAQvI5nDyO+JRhWdvyf1FZTyPoIR2ASpOFvYwz9v6tJVqyExm0mXfLALMLJ+UTmv20FIweZ47k5acbTB2izJ8jrYXr0aBnabAfaJ4PaVcgiFlfS/P6rJVy5yXwgWRuptWgXxbQIBlYqRsmi28XJzbbXHuxss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hBckP+nX; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hBckP+nX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782842835; x=1814378835;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=Wnll7AfVDxjKrVe/Xq2HSwvWhvd98a6ymrAlNUFpL4w=;
  b=hBckP+nXCu1bFEfP/2iPb+g/WtzwGP3359xeoqGHa9U92PAwhmCicC1d
   f1BaIf8Sw+Do+Y/pehxYS0bbcia8l3TVFJoh2pmLSqtXFl3n5nIAlLfYu
   lViKgr1nwYQyppoxoHAyOlFSMCNccYRchtiASeb0VmYKteN3wC7lNmG+x
   CDvfJR99NkvUelXVpbPscnG859LOIWhJM19e7TBjk4Tvm6wTWs1zpR30a
   Eni5Agl9gWiA2EJrGuy23vCLp2KrHeA/dckaRItS8bHzpe0zfnNT1FKB2
   1jAKNh13FX1U8qSEts/80v1kSJHVlpNRme6ecBXWzsV3/xv5iAFQab9qM
   w==;
X-CSE-ConnectionGUID: GPOQoumIRpKXz9l0ZK9Myw==
X-CSE-MsgGUID: /OoeibstQEuidA4uInrHTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11833"; a="87401855"
X-IronPort-AV: E=Sophos;i="6.24,234,1774335600"; 
   d="scan'208";a="87401855"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2026 11:07:14 -0700
X-CSE-ConnectionGUID: plzT4jtIRyq/MfGNvnUeAw==
X-CSE-MsgGUID: nPay4jx0TQqo3a4XeXcCLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,234,1774335600"; 
   d="scan'208";a="276628740"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.230])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2026 11:07:12 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 30 Jun 2026 21:07:08 +0300 (EEST)
To: =?ISO-8859-15?Q?Uwe_Kleine-K=F6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
cc: Linus Torvalds <torvalds@linux-foundation.org>, 
    Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
    Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>, Danilo Krummrich <dakr@kernel.org>
Subject: Re: [PATCH v3 09/16] platform/x86: x86-android-tablets: Add include
 defining struct dmi_system_id
In-Reply-To: <akP5FKsnsdzx8pMk@monoceros>
Message-ID: <2548547c-bbdd-3aed-7550-fecdba4180ac@linux.intel.com>
References: <cover.1782682124.git.ukleinek@kernel.org> <ad0c801eb9c5814bd2430f1e8c370fee82742897.1782682124.git.ukleinek@kernel.org> <3bcb32f8-00d2-905c-3dc1-e8730611fb6a@linux.intel.com> <akJzYlHHcvPCl0HW@monoceros> <32255bd6-4015-e945-2ee2-4bc3ca0c3a9c@linux.intel.com>
 <akP5FKsnsdzx8pMk@monoceros>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1225316032-1782842828=:1167"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1225316032-1782842828=:1167
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Tue, 30 Jun 2026, Uwe Kleine-K=F6nig (The Capable Hub) wrote:
> On Tue, Jun 30, 2026 at 05:58:54PM +0300, Ilpo J=E4rvinen wrote:
> > On Mon, 29 Jun 2026, Uwe Kleine-K=F6nig (The Capable Hub) wrote:
> > > On Mon, Jun 29, 2026 at 02:38:35PM +0300, Ilpo J=E4rvinen wrote:
> > > > On Sun, 28 Jun 2026, Uwe Kleine-K=F6nig (The Capable Hub) wrote:
> > > >=20
> > > > > Currently <linux/i2c.h> includes <linux/mod_devicetable.h> transi=
tively
> > > > > which ensures that struct dmi_system_id is defined in
> > > > > drivers/platform/x86/x86-android-tablets/x86-android-tablets.h. H=
owever
> > > > > this include in <linux/i2c.h> will be replaced by one for i2c_dev=
ice_id
> > > > > only. To ensure that dmi_system_id is available add the include f=
or that
> > > > > explicitly.
> > > > >=20
> > > > > Acked-by: Danilo Krummrich <dakr@kernel.org>
> > > > > Signed-off-by: Uwe Kleine-K=F6nig (The Capable Hub) <u.kleine-koe=
nig@baylibre.com>
> > > > > ---
> > > > >  drivers/platform/x86/x86-android-tablets/x86-android-tablets.h |=
 1 +
> > > > >  1 file changed, 1 insertion(+)
> > > > >=20
> > > > > diff --git a/drivers/platform/x86/x86-android-tablets/x86-android=
-tablets.h b/drivers/platform/x86/x86-android-tablets/x86-android-tablets.h
> > > > > index 2498390958ad..c756961ae5fd 100644
> > > > > --- a/drivers/platform/x86/x86-android-tablets/x86-android-tablet=
s.h
> > > > > +++ b/drivers/platform/x86/x86-android-tablets/x86-android-tablet=
s.h
> > > > > @@ -13,6 +13,7 @@
> > > > >  #include <linux/gpio/consumer.h>
> > > > >  #include <linux/i2c.h>
> > > > >  #include <linux/irqdomain_defs.h>
> > > > > +#include <linux/device-id/dmi.h>
> > > > >  #include <linux/spi/spi.h>
> > > > > =20
> > > > >  struct gpio_desc;
> > > >=20
> > > > Indirect include patchs are never a good idea as it always makes he=
ader=20
> > > > reorganizations minefield. So for this change,
> > > >=20
> > > > Acked-by: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>
> > > >=20
> > > >=20
> > > > When it comes to the series, I certainly like the direction it goes=
 very=20
> > > > much (never have been fan of mod_devicetable.h) but I'd have prefer=
red=20
> > > > stepwise approach over trying to introduce it to some mid-rc.
> > >=20
> > > The hurdle here is that at least the header part isn't easily
> > > automateable.
> >=20
> > Patch 1?
>=20
> No, patch 15.
>
> > > (Well it is, but the script that I have now to check all
> > > .c files already takes longer than an hour to run. I guess it's not a=
s
> > > optimal as it could, but still.) And so getting this ready for inclus=
ion
> > > in next and keeping it up to date until the merge window opens is a
> > > tough job.

It looks to me more a problem with the chosen approach where you wanted=20
to get it all quickly done in a single all-reaching series (which IMO=20
would have been fine right after -rc1 but mid-rc cycle, I'm not so=20
positive about it).

> > > The further downside is that each modification to one of the highly u=
sed
> > > headers is expensive (in rebuild time) when these are merged one afte=
r
> > > another (or when bisecting). So getting these changes in in one batch=
 is
> > > beneficial.
> > >=20
> > > So while I agree with your preference, I don't think it's feasible.
> >=20
> > While I understand keeping it up-to-date must be a pain, I'm not entire=
ly=20
> > convinced by the rebuild time argument as it has been the status quo so=
=20
> > far too for anything touching mod_devicetable.h.
>=20
> Yes. I don't know about others, but big rebuilds annoy me regularily.
> And with another quest that involves touching most struct *_device_id
> this really gets a pain. And just because "we" endured something in the
> past, doesn't mean we shouldn't improve.
>=20
> > If one commit would move all linux/device-id/* AND ADD them all into=20
> > mod_devicetable.h as includes, that's just one rebuild more (and one=20
> > rebuild will occur anyway whichever way you architect this).
>=20
> Yes, one rebuild isn't possible to prevent. You're talking about patch
> #1, right?
>=20
> > Only if includes would be then removed one-by-one from mod_devicetable.=
h=20
> > (e.g. per subsystem basis), I can see it causing n rebuilds (+conflicts=
),=20
> > but they could be removed in bulk as well.
>=20
> Removing those from mod_devicetable.h isn't part of the plan.

It isn't because you're not doing this in steps so you didn't put them in=
=20
there at all (which would have been fine at any time and only enforces=20
one rebuild comparable to any other linux/mod_devicetable.h edit).

> But
> replacing `#include <linux/mod_devicetable.h>` by `#include
> <linux/device-id/of.h>` in <linux/of.h> triggers again many rebuilds
> when done separately.

But this is not because you touch linux/mod_devicetable.h but linux/of.h.
It certainly should cause rebuild of all the code depending on linux/of.h=
=20
but I assume that is much less than what linux/mod_devicetable.h causes.

> And then for <linux/pci.h> and again for <linux/platform_driver.h> and
> .... That's why those are included here, too, to at least use the "one
> rebuild needed" window for the high-impact follow up changes, and
> trigger a rebuild only once (unless you happen to hit an inbetween
> commit while bisecting).

I disagree, it's a different set of files for each. But there could, of=20
course, be some overlap. Maybe the overlaps is so significant it's=20
nearly as same as linux/mod_devicetable.h, I don't know but is that what=20
you're trying to imply?

> > What you can achieve is preventing those "normal" mod_devicetable.h=20
> > changes enforcing rebuilds right after this has been applied, but that =
is=20
> > just the rebuilds as status quo would have without this series and no=
=20
> > more.
>=20
> This is exactly the goal. I don't get the "just" part of your argument.
> The point is that a modification to struct i2c_device_id should only
> trigger a rebuild of i2c drivers, but not of pci, platform, spi and all
> the others, too.

With "just" I meant it's no worse than status quo. If that prolongs one or=
=20
two kernel versions more to avoid mid-rc cycle merge it doesn't really=20
seem so high cost.

And I understand where you want to end up, and you could end up there=20
using steps as well:

1. add linux/device-id/* + include them from mod_devicetable.h
2. convert stuff to use linux/device-id/* without removing includes from=20
mod_devicetable.h
3. bulk remove linux/device-id/* includes from mod_devicetable.h

2 & 3 are chunkable/iteratable so they don't need to occur for all at once=
=20
as long as 3 is not split per one linux/device-id/* its rebuild cost isn't=
=20
that huge compared with the status quo.

--=20
 i.

--8323328-1225316032-1782842828=:1167--
