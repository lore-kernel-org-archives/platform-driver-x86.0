Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D6253FA5E9
	for <platform-driver-x86@vger.kernel.org>; Wed,  1 Jul 2026 09:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782899536; cv=none; b=cOe1+3Omq86APcInZnnFGh3rMGAfb6mW9zSy/jiYFnJ2ER84QSGIxC0X6FGuLEKi2CSHaNO9Adk6+rK/6QG0hvJyqipRS/nbTlRPP6hx59IbkiL1/tvMmYDK3X2rLFWNeco9oQUnXqYqcm/Sd7epKwDLfgROfSALzVC5IyXWUlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782899536; c=relaxed/simple;
	bh=uA8/r7N3SMgs6AKM8WUv6/IZQrSmbfK2p1YQ6I5Knbo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SyYEyv57vp2ApoBde0lHgwGGR2LylYdf6f8P3QsAlxM1d3pD6X7UCYlbfv0Fp8Dz0ouAco4JK8Ze0uIWmnId3ETepvkroL0v7+OGTIxEOr+J1dBbJK0BPaedaOxRC2eRrE/OKp7hN4toDny7D3pOpy4yj5G8omVZjtgolo/lywI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=pkvx9xy6; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="pkvx9xy6"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-493b6f1b14bso1805115e9.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 01 Jul 2026 02:52:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782899532; x=1783504332; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=c2bN/3BMIAegpR8a1sxSjF2NDNbqFkgJGtIrrrGa4Bc=;
        b=pkvx9xy61FHn9GM+thQygI7ar9U0paVNZ1CPccLi5/AOG9YfdyxvNJXNKsN2XDP7dQ
         dFhPmaQDdqyr0EVcv1OmMjV848P3gPD+UOLux3CiW9ftg2G1CjX+G5A9I9L9xsdFNSxs
         wITQIMXLqtbS6PnPDxpoODZLBI7b8fuDOrSPPYPfVr59sjg3eBJuGgNwOb+tl9qbkqlK
         by4OOwWXnhDvUoEWw+I5wkZlZyaiWrRZMy3xeScmGdPXadzqnqqu7JzT0XHKMQsGhIKg
         jFElv8+apwer5w6fg+kTc6VXjP5oxy6TXFEpgvV2aUeIWt+kt5ZOHn8cgF9txYjRi1aP
         9TrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782899532; x=1783504332;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c2bN/3BMIAegpR8a1sxSjF2NDNbqFkgJGtIrrrGa4Bc=;
        b=qw8yH7db8NU7O8EFJfR0Ha61S5di9C5yOJ2BKrvMwlb/w1Q7K8Y/ZnpI6CeYRRGALu
         FHG35rMJ6CbJ6mxqLbfjDuorXnlRjZzOQ85nsnMc8JH9q1ja0WcKSsXZRUKwsNqjdKQI
         1teohzpXWnKiI8/KoLujVEqVrwa06RPuDh18I2wW3emItK8f2tpnVl30pydVnAhL0B3M
         baN6HCaTrVVwvpQJo/Oeki6fkX3xbcsMykWqKyAzF8CHjtwuBmMTsqoEbkrfImeOhAWG
         Z8IpUB0vrRYPz7CziCYAC/LpyYS3P/XYWXL1ecWpCfkPm7B+FVSP+MSZwpWh41CLCxDv
         UeaQ==
X-Forwarded-Encrypted: i=1; AFNElJ9eSwAqSZCLIx1Dy2uFKGtdUUJ7py6NTrKYffgFmsFvyF3bCgvx7Z2Dp16g+6gxGOlYB7BhNzMbbdZpsq+MTj0p9UZZ@vger.kernel.org
X-Gm-Message-State: AOJu0Yzn/W6ZXLU+ujG3+b67F8u/7Q5CJ479+mn3B7fth2QTkJOS8alT
	rD1wjwhiaSZmTDKoyjNM6NeVWpE5wqhmbsUF6LfnRYGVq1tMJSukt7xeUKyoq2c1wdo=
X-Gm-Gg: AfdE7cnVup132N5Q4+OXLaXTm1rEsfsIp8eXDLSPbagirV//0dsxg/sQiT3iyOx5aIw
	9+BFiaQc6mKv6XJ6T0LIDxQcWP4njrvSCdbQe3S8f40jYO4RZqtLFDTmL3yaKuRHd0Xgijzu48e
	VbH/muVQTbmnHwer+IHMqAfFSyjW1/sUXSxlWcf61maCFrr7wUvcRhU7pBQpOft1LOw574Ecqwh
	NrNEBQB5uSXOcdE5XSLPIlnMKyVHeOHEdB/QaFONRBNbvadcxzsUwOyxdti23z55KrV/XQVNQRJ
	a49G4yiPMnvzmasabsqLpMFiHCs1/Ic1g3hZaPHHZaDnRZ5TSImeiruzu3odZHrE0emW2TS/wpQ
	I27zYubI4aJWqtqoijiMSE/z0BjZulVpmGuxyQOTQFvaTO+CWLd2pE+AzvBuRPq9XYyj1OAG6QI
	mZx3AWBBBTHdmORDd0Gf+Ej2v/5Kc3nzbltW0109MXrcOJhIMQCi/6hWqxJQB3ajSBt8/NV85ch
	4pz
X-Received: by 2002:a05:600d:8649:10b0:48a:5565:ec3d with SMTP id 5b1f17b1804b1-493c2b904e7mr11584625e9.22.1782899532360;
        Wed, 01 Jul 2026 02:52:12 -0700 (PDT)
Received: from localhost (p200300f65f47db046ba1718111b88cfd.dip0.t-ipconnect.de. [2003:f6:5f47:db04:6ba1:7181:11b8:8cfd])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-493be4bfdd5sm110660485e9.1.2026.07.01.02.52.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 02:52:11 -0700 (PDT)
Date: Wed, 1 Jul 2026 11:52:10 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
To: Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Hans de Goede <hansg@kernel.org>, 
	platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>
Subject: Re: [PATCH v3 09/16] platform/x86: x86-android-tablets: Add include
 defining struct dmi_system_id
Message-ID: <akSw3IDE-V7WDpah@monoceros>
References: <cover.1782682124.git.ukleinek@kernel.org>
 <ad0c801eb9c5814bd2430f1e8c370fee82742897.1782682124.git.ukleinek@kernel.org>
 <3bcb32f8-00d2-905c-3dc1-e8730611fb6a@linux.intel.com>
 <akJzYlHHcvPCl0HW@monoceros>
 <32255bd6-4015-e945-2ee2-4bc3ca0c3a9c@linux.intel.com>
 <akP5FKsnsdzx8pMk@monoceros>
 <2548547c-bbdd-3aed-7550-fecdba4180ac@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tnunarcj3ifdpdzf"
Content-Disposition: inline
In-Reply-To: <2548547c-bbdd-3aed-7550-fecdba4180ac@linux.intel.com>


--tnunarcj3ifdpdzf
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 09/16] platform/x86: x86-android-tablets: Add include
 defining struct dmi_system_id
MIME-Version: 1.0

Hello Ilpo,

On Tue, Jun 30, 2026 at 09:07:08PM +0300, Ilpo J=E4rvinen wrote:
> On Tue, 30 Jun 2026, Uwe Kleine-K=F6nig (The Capable Hub) wrote:
> > On Tue, Jun 30, 2026 at 05:58:54PM +0300, Ilpo J=E4rvinen wrote:
> > > On Mon, 29 Jun 2026, Uwe Kleine-K=F6nig (The Capable Hub) wrote:
> > > > On Mon, Jun 29, 2026 at 02:38:35PM +0300, Ilpo J=E4rvinen wrote:
> > > > > On Sun, 28 Jun 2026, Uwe Kleine-K=F6nig (The Capable Hub) wrote:
> > > > >=20
> > > > > > Currently <linux/i2c.h> includes <linux/mod_devicetable.h> tran=
sitively
> > > > > > which ensures that struct dmi_system_id is defined in
> > > > > > drivers/platform/x86/x86-android-tablets/x86-android-tablets.h.=
 However
> > > > > > this include in <linux/i2c.h> will be replaced by one for i2c_d=
evice_id
> > > > > > only. To ensure that dmi_system_id is available add the include=
 for that
> > > > > > explicitly.
> > > > > >=20
> > > > > > Acked-by: Danilo Krummrich <dakr@kernel.org>
> > > > > > Signed-off-by: Uwe Kleine-K=F6nig (The Capable Hub) <u.kleine-k=
oenig@baylibre.com>
> > > > > > ---
> > > > > >  drivers/platform/x86/x86-android-tablets/x86-android-tablets.h=
 | 1 +
> > > > > >  1 file changed, 1 insertion(+)
> > > > > >=20
> > > > > > diff --git a/drivers/platform/x86/x86-android-tablets/x86-andro=
id-tablets.h b/drivers/platform/x86/x86-android-tablets/x86-android-tablets=
=2Eh
> > > > > > index 2498390958ad..c756961ae5fd 100644
> > > > > > --- a/drivers/platform/x86/x86-android-tablets/x86-android-tabl=
ets.h
> > > > > > +++ b/drivers/platform/x86/x86-android-tablets/x86-android-tabl=
ets.h
> > > > > > @@ -13,6 +13,7 @@
> > > > > >  #include <linux/gpio/consumer.h>
> > > > > >  #include <linux/i2c.h>
> > > > > >  #include <linux/irqdomain_defs.h>
> > > > > > +#include <linux/device-id/dmi.h>
> > > > > >  #include <linux/spi/spi.h>
> > > > > > =20
> > > > > >  struct gpio_desc;
> > > > >=20
> > > > > Indirect include patchs are never a good idea as it always makes =
header=20
> > > > > reorganizations minefield. So for this change,
> > > > >=20
> > > > > Acked-by: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>
> > > > >=20
> > > > >=20
> > > > > When it comes to the series, I certainly like the direction it go=
es very=20
> > > > > much (never have been fan of mod_devicetable.h) but I'd have pref=
erred=20
> > > > > stepwise approach over trying to introduce it to some mid-rc.
> > > >=20
> > > > The hurdle here is that at least the header part isn't easily
> > > > automateable.
> > >=20
> > > Patch 1?
> >=20
> > No, patch 15.
> >
> > > > (Well it is, but the script that I have now to check all
> > > > .c files already takes longer than an hour to run. I guess it's not=
 as
> > > > optimal as it could, but still.) And so getting this ready for incl=
usion
> > > > in next and keeping it up to date until the merge window opens is a
> > > > tough job.
>=20
> It looks to me more a problem with the chosen approach where you wanted=
=20
> to get it all quickly done in a single all-reaching series (which IMO=20
> would have been fine right after -rc1 but mid-rc cycle, I'm not so=20
> positive about it).

In my book we're still in the "right after -rc1" window. The patch set
was mostly ready at -rc1 (it just grew a patch to fix a build failure on
parisc and I added review tags) and assuming Linus doesn't oppose to my
timing it should go in before -rc2.

And yes, I admit to want it done, but that's not part of my
justification to get it in after -rc1.

> > > > The further downside is that each modification to one of the highly=
 used
> > > > headers is expensive (in rebuild time) when these are merged one af=
ter
> > > > another (or when bisecting). So getting these changes in in one bat=
ch is
> > > > beneficial.
> > > >=20
> > > > So while I agree with your preference, I don't think it's feasible.
> > >=20
> > > While I understand keeping it up-to-date must be a pain, I'm not enti=
rely=20
> > > convinced by the rebuild time argument as it has been the status quo =
so=20
> > > far too for anything touching mod_devicetable.h.
> >=20
> > Yes. I don't know about others, but big rebuilds annoy me regularily.
> > And with another quest that involves touching most struct *_device_id
> > this really gets a pain. And just because "we" endured something in the
> > past, doesn't mean we shouldn't improve.
> >=20
> > > If one commit would move all linux/device-id/* AND ADD them all into=
=20
> > > mod_devicetable.h as includes, that's just one rebuild more (and one=
=20
> > > rebuild will occur anyway whichever way you architect this).
> >=20
> > Yes, one rebuild isn't possible to prevent. You're talking about patch
> > #1, right?
> >=20
> > > Only if includes would be then removed one-by-one from mod_devicetabl=
e.h=20
> > > (e.g. per subsystem basis), I can see it causing n rebuilds (+conflic=
ts),=20
> > > but they could be removed in bulk as well.
> >=20
> > Removing those from mod_devicetable.h isn't part of the plan.
>=20
> It isn't because you're not doing this in steps so you didn't put them in=
=20
> there at all (which would have been fine at any time and only enforces=20
> one rebuild comparable to any other linux/mod_devicetable.h edit).

<linux/mod_devicetable.h> only consists of #includes of the new files
(well, plus struct cpu_feature). That's patch #1 and it enforces a
rebuild. So either "you didn't put them in there at all" is wrong or I
misunderstand you.

> > But
> > replacing `#include <linux/mod_devicetable.h>` by `#include
> > <linux/device-id/of.h>` in <linux/of.h> triggers again many rebuilds
> > when done separately.
>=20
> But this is not because you touch linux/mod_devicetable.h but linux/of.h.
> It certainly should cause rebuild of all the code depending on linux/of.h=
=20
> but I assume that is much less than what linux/mod_devicetable.h causes.

It's a subset, yes. In an ARCH=3Darm64 allmodconfig build of -rc1 + this
patch series I have:

	# number of object files:
	$ find -name \*.o.cmd -not -name \*mod.o.cmd | wc -l
	28590

	# these are the old users of <linux/mod_devicetable.h>:
	$ find -name \*.o.cmd -not -name \*mod.o.cmd | xargs grep -l /device-id/ |=
 wc -l
	23583

	$ find -name \*.o.cmd -not -name \*mod.o.cmd | xargs grep -l linux/of.h | =
wc -l
	12302

	$ find -name \*.o.cmd -not -name \*mod.o.cmd | xargs grep -l linux/platfor=
m_device.h | wc -l
	9255

	$ find -name \*.o.cmd -not -name \*mod.o.cmd | xargs grep -l linux/pci.h |=
 wc -l
	7747

	$ find -name \*.o.cmd -not -name \*mod.o.cmd | xargs grep -l linux/acpi.h =
| wc -l
	7233

	$ find -name \*.o.cmd -not -name \*mod.o.cmd | xargs grep -l linux/i2c.h |=
 wc -l
	5373

so it's a considerable subset. For x86_64 the numbers are similar:

	29655
	/device-id/: 24800
	linux/of.h: 12602
	linux/platform_device.h: 9344
	linux/pci.h: 8605
	linux/acpi.h: 7875
	linux/i2c.h: 5758

=2E

> > And then for <linux/pci.h> and again for <linux/platform_driver.h> and
> > .... That's why those are included here, too, to at least use the "one
> > rebuild needed" window for the high-impact follow up changes, and
> > trigger a rebuild only once (unless you happen to hit an inbetween
> > commit while bisecting).
>=20
> I disagree, it's a different set of files for each. But there could, of=
=20
> course, be some overlap. Maybe the overlaps is so significant it's=20
> nearly as same as linux/mod_devicetable.h, I don't know but is that what=
=20
> you're trying to imply?

Yes, these are all headers with many users. So modifying them in bulk
triggers less rebuilds than doing the modifications in separate series
that go in via separate trees.

> > > What you can achieve is preventing those "normal" mod_devicetable.h=
=20
> > > changes enforcing rebuilds right after this has been applied, but tha=
t is=20
> > > just the rebuilds as status quo would have without this series and no=
=20
> > > more.
> >=20
> > This is exactly the goal. I don't get the "just" part of your argument.
> > The point is that a modification to struct i2c_device_id should only
> > trigger a rebuild of i2c drivers, but not of pci, platform, spi and all
> > the others, too.
>=20
> With "just" I meant it's no worse than status quo. If that prolongs one o=
r=20
> two kernel versions more to avoid mid-rc cycle merge it doesn't really=20
> seem so high cost.
>=20
> And I understand where you want to end up, and you could end up there=20
> using steps as well:
>=20
> 1. add linux/device-id/* + include them from mod_devicetable.h

Done, that's patch #1.

> 2. convert stuff to use linux/device-id/* without removing includes from=
=20
> mod_devicetable.h

patch #15 and #16 are in that category, it's not complete yet, but I
catched the high-impact usages. Again on -rc1 + this patch set there are
1921 .o files left that make use of linux/mod_devicetable.h. Roughly
half of them via <linux/mdio.h>:

    ...
     49   drivers/net/wireless/intel/iwlwifi/iwl-config.h
    179   include/linux/mmc/card.h
    188   include/sound/soc-acpi.h
    231   include/linux/hid.h
    925   include/linux/mdio.h

In retrospect it would have been great to tackle <linux/mdio.h> as part
of this series, too, but I won't modify it for that any more now. I'll
address that for the next merge window.

> 3. bulk remove linux/device-id/* includes from mod_devicetable.h

This isn't done yet, in the end I want to remove that header, but that
is somehow "bulk remove linux/device-id/*". And that indeed is planned
to be done later. Each patch of type 2 reduces the impact of that
change, so postponing doesn't hurt a lot.

> 2 & 3 are chunkable/iteratable so they don't need to occur for all at onc=
e=20
> as long as 3 is not split per one linux/device-id/* its rebuild cost isn'=
t=20
> that huge compared with the status quo.

Each patch of type 2 is potentially expensive. Less than modifying
<linux/mod_devicetable.h> directly, and depending on which stuff it
touched the impact is high or not. For a .c file it's low, for the above
mentioned headers it's high.

So the justification to get the whole series in in one go is for the
high impact headers that they should be near (in git history) to patch
#1 to reduce rebuilds and for .c files that the automation that created
the changes is reliable and only breaks in corner cases (like a driver
using `of ## _device_id` which my script won't identify as a usage of
`of_device_id`). And if you say the justification for the .c files (i.e.
patch #16) is weak, I agree and we can postpone that. But please let's
keep #1 and #15 (and thus also #2 - #14) together.

Maybe the relevant difference between us, that makes us judge the
circumstances differently, is that I often do build tests on my laptop
and at Intel you might have a beefy server to do that?!

Best regards
Uwe

--tnunarcj3ifdpdzf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmpE40gACgkQj4D7WH0S
/k5Y/Qf7Brprg3cVqMhoMVH9zXWBdokfx0KbObVF2RJ2UBrNHZw46+9QUFJJs9n7
eDQa6C38IEJTFinY1W5VB7J9Q74hZEcKCesOfyMLr4UEup8OEEgoLBfJa7B3JTDQ
RNAdlKuQnKOPbYv0nmS8NxmKgQrlTaYd6c6GMt+me5/JzECr1308W4dgKTW3khD9
2YIC9gMI3AYpuxHBg0awcvuSePw+q8QFjNvqUGrak7PTEvGlTIPDWkzfLH2XsVCS
h3x6w/Hsitje4YOhMZh8/e165QYdnOwM0/A6nWG/AI8XDeCEU76hlnOTzFZWt2oD
x3C9RCUuznZE6emHosiwJJC+m71L/A==
=pCVf
-----END PGP SIGNATURE-----

--tnunarcj3ifdpdzf--
