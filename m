Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCD963DDDDE
	for <platform-driver-x86@vger.kernel.org>; Tue, 30 Jun 2026 17:30:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782840652; cv=none; b=ZdbHlnXoxXiL0S/Z4GozUJMTX81lLx52Yj8K9RWoCSVwIO84BrZXfaYOMi2+MMY/dJ+XmaRAVToP5poyqFuGww0E6rC29glAgifyrWCiJHMeM+Zl5K6klkuLmMzmbAIEgeLkuonOViMW28Zgx8MIohcVHsPhpweFiMOKAG4ldrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782840652; c=relaxed/simple;
	bh=v8oucDYPdBj+yU5bLDJLs8q3W92I/N/TC7xzlrh8mlw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BSO7lrtFEWgMfrxC+0OZiHff9xkDylI8cXpMnn3KetuHaLFSSMhLGM/ucPClR4txYz+fT2BLAYlR18yIRpXxvzXJS8eJTyHFp1vJplTpYNPWqpSmiadYBR16XUjfWe7y7CyTUchJ1b1Ep273RD1SwMb+UTqGSxHYn53lk5mGAt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=TrHTOHqU; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="TrHTOHqU"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4924593f45dso60542495e9.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 30 Jun 2026 10:30:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782840648; x=1783445448; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BpXaNQ2LxDF0tw6kNWrqSrR3FCmC7pJGI8n/xYi1WH8=;
        b=TrHTOHqUnFfFbUQxjnzWAxGGeJBWHP0cKZ2TuMRBlzZ5Jm+Yoy5uSjaWnpOPk4ncgl
         xNC50nEkwXewoYk9xeaKampLfmaMNdHnztRWe7x77G6EpVAlQ2pa94r5Mpk+jH/4TJ/m
         UOH/whXuSzeu2bJvCJ6k33tvWyzQ8a49CI6bhNBqI42nJFJG0OdkKv1Xxp/f7D5ib6wF
         +T+oQbxq+0WEktsF3XdWzpR+cNaM4jSyCv6reGvwB0kkbE97AlloUR0/YfJoXtUklX7Y
         ocXGlyfkDL4dFvjlqftc4lDsxt2j5dhShJwNWYlst9PlvZEckDotuAf8faHzHlyYPVPs
         fgvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782840648; x=1783445448;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BpXaNQ2LxDF0tw6kNWrqSrR3FCmC7pJGI8n/xYi1WH8=;
        b=DUAznke7/3ebMXLG+RbjqTK+kl4xAlSMYSMZNCWqEy5/1fxHjClDy5xI+543NIg72Z
         7dM9Cq7FxsfJ6qzl78ZAu9Bea++aor6gG25hD/Equf//Ba8VIbBzKPs6o413RTz8f/o+
         +RyqiDsU0kFv+GKKweEwzuJRF9bJbtDaDz5NfoVZ+Wd17XzDxbqQYZG0To2mIVhnGo9Y
         C/ufAVNZyTJWGYIl61ojTB2nZfd2d0sy0KeaoL2aoB4MBV2iC6pN349y4AlXCif6OeHX
         Vfves+Ir0Bm7f/Bivt0HmF86Ey0rBDP1KPrZiWB4qsVSwNEEglwPnRdkEVJcIAF4LHqD
         4Wig==
X-Forwarded-Encrypted: i=1; AFNElJ/iofA7nDeuKV/xrZJB/ZUlUmNq7XRmhgdhtEbzjhEYrUQQw7aiTWxSyXUFcih7JoM1Wbg3giGoA87wB+58oQ4HPxOA@vger.kernel.org
X-Gm-Message-State: AOJu0YxVvIKbXUYdaqOiM7/CsjYOED0IRek/56y192d3SdfFUiiYWcJU
	rfyQ+eqKnxbZ4wennVrsuvqlIGYcilHMwNOyz60XXrhSIVPF7Xqkq3ObzBRjdWg0trs=
X-Gm-Gg: AfdE7cm1blRc5if2dNd+9FNb6Wj2fgtaJQMy8eaXe8ISkCMxL14ED8UHJmEcYqnM76Z
	uGHqIzuGBVScyL85VtKOFyikuoTo7oPz8+LRk/T2Tq2Ap7iRXme9BliWRMjID94htO4e2JU86zW
	TwdwLSdGoUDvxbq8fjykY0izdAu4sJZZC28qCAwwoGI4t2Mejf9xx8NV1d3XBCxLK/3w+9TAcOn
	cUTx9dK+RvlA//Oitn+AUAq9Kws1vyeh4mMeHCkK+uA/aoF0yoXwB7jIPYoUNHaAZUXngLeqQMk
	e8a6rTxDIX5sZxECqUnDdvSiDMPrOXICdSAywLr0W8gLMjwc2yULVgCtwJAOwnfq96CBSKvAo7n
	nVyt0lj7QWs0L558JHf82tyvMngEo7/XPLOccJr25SwMWzIhGqRU7m94a/SyP8nwL5XOXpHI9Zy
	0JSX1V0BI93c42/QNwK1oFrgRU1GXaGkCH0wClBHTQwgV/gSqsolNzmqMvM2cCNVVNIRPcpoJOi
	W+M
X-Received: by 2002:a05:600c:870b:b0:485:9a50:3370 with SMTP id 5b1f17b1804b1-493bda382ebmr26685055e9.8.1782840648077;
        Tue, 30 Jun 2026 10:30:48 -0700 (PDT)
Received: from localhost (p200300f65f47db042a9b551def0a6b94.dip0.t-ipconnect.de. [2003:f6:5f47:db04:2a9b:551d:ef0a:6b94])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-493be81fca5sm11964125e9.14.2026.06.30.10.30.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 10:30:47 -0700 (PDT)
Date: Tue, 30 Jun 2026 19:30:46 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
To: Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Hans de Goede <hansg@kernel.org>, 
	platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>
Subject: Re: [PATCH v3 09/16] platform/x86: x86-android-tablets: Add include
 defining struct dmi_system_id
Message-ID: <akP5FKsnsdzx8pMk@monoceros>
References: <cover.1782682124.git.ukleinek@kernel.org>
 <ad0c801eb9c5814bd2430f1e8c370fee82742897.1782682124.git.ukleinek@kernel.org>
 <3bcb32f8-00d2-905c-3dc1-e8730611fb6a@linux.intel.com>
 <akJzYlHHcvPCl0HW@monoceros>
 <32255bd6-4015-e945-2ee2-4bc3ca0c3a9c@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wbjchwfvl6dsna4z"
Content-Disposition: inline
In-Reply-To: <32255bd6-4015-e945-2ee2-4bc3ca0c3a9c@linux.intel.com>


--wbjchwfvl6dsna4z
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 09/16] platform/x86: x86-android-tablets: Add include
 defining struct dmi_system_id
MIME-Version: 1.0

Hello Ilpo,

On Tue, Jun 30, 2026 at 05:58:54PM +0300, Ilpo J=E4rvinen wrote:
> On Mon, 29 Jun 2026, Uwe Kleine-K=F6nig (The Capable Hub) wrote:
> > On Mon, Jun 29, 2026 at 02:38:35PM +0300, Ilpo J=E4rvinen wrote:
> > > On Sun, 28 Jun 2026, Uwe Kleine-K=F6nig (The Capable Hub) wrote:
> > >=20
> > > > Currently <linux/i2c.h> includes <linux/mod_devicetable.h> transiti=
vely
> > > > which ensures that struct dmi_system_id is defined in
> > > > drivers/platform/x86/x86-android-tablets/x86-android-tablets.h. How=
ever
> > > > this include in <linux/i2c.h> will be replaced by one for i2c_devic=
e_id
> > > > only. To ensure that dmi_system_id is available add the include for=
 that
> > > > explicitly.
> > > >=20
> > > > Acked-by: Danilo Krummrich <dakr@kernel.org>
> > > > Signed-off-by: Uwe Kleine-K=F6nig (The Capable Hub) <u.kleine-koeni=
g@baylibre.com>
> > > > ---
> > > >  drivers/platform/x86/x86-android-tablets/x86-android-tablets.h | 1=
 +
> > > >  1 file changed, 1 insertion(+)
> > > >=20
> > > > diff --git a/drivers/platform/x86/x86-android-tablets/x86-android-t=
ablets.h b/drivers/platform/x86/x86-android-tablets/x86-android-tablets.h
> > > > index 2498390958ad..c756961ae5fd 100644
> > > > --- a/drivers/platform/x86/x86-android-tablets/x86-android-tablets.h
> > > > +++ b/drivers/platform/x86/x86-android-tablets/x86-android-tablets.h
> > > > @@ -13,6 +13,7 @@
> > > >  #include <linux/gpio/consumer.h>
> > > >  #include <linux/i2c.h>
> > > >  #include <linux/irqdomain_defs.h>
> > > > +#include <linux/device-id/dmi.h>
> > > >  #include <linux/spi/spi.h>
> > > > =20
> > > >  struct gpio_desc;
> > >=20
> > > Indirect include patchs are never a good idea as it always makes head=
er=20
> > > reorganizations minefield. So for this change,
> > >=20
> > > Acked-by: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>
> > >=20
> > >=20
> > > When it comes to the series, I certainly like the direction it goes v=
ery=20
> > > much (never have been fan of mod_devicetable.h) but I'd have preferre=
d=20
> > > stepwise approach over trying to introduce it to some mid-rc.
> >=20
> > The hurdle here is that at least the header part isn't easily
> > automateable.
>=20
> Patch 1?

No, patch 15.

> > (Well it is, but the script that I have now to check all
> > .c files already takes longer than an hour to run. I guess it's not as
> > optimal as it could, but still.) And so getting this ready for inclusion
> > in next and keeping it up to date until the merge window opens is a
> > tough job.
> >=20
> > The further downside is that each modification to one of the highly used
> > headers is expensive (in rebuild time) when these are merged one after
> > another (or when bisecting). So getting these changes in in one batch is
> > beneficial.
> >=20
> > So while I agree with your preference, I don't think it's feasible.
>=20
> While I understand keeping it up-to-date must be a pain, I'm not entirely=
=20
> convinced by the rebuild time argument as it has been the status quo so=
=20
> far too for anything touching mod_devicetable.h.

Yes. I don't know about others, but big rebuilds annoy me regularily.
And with another quest that involves touching most struct *_device_id
this really gets a pain. And just because "we" endured something in the
past, doesn't mean we shouldn't improve.

> If one commit would move all linux/device-id/* AND ADD them all into=20
> mod_devicetable.h as includes, that's just one rebuild more (and one=20
> rebuild will occur anyway whichever way you architect this).

Yes, one rebuild isn't possible to prevent. You're talking about patch
#1, right?

> Only if includes would be then removed one-by-one from mod_devicetable.h=
=20
> (e.g. per subsystem basis), I can see it causing n rebuilds (+conflicts),=
=20
> but they could be removed in bulk as well.

Removing those from mod_devicetable.h isn't part of the plan. But
replacing `#include <linux/mod_devicetable.h>` by `#include
<linux/device-id/of.h>` in <linux/of.h> triggers again many rebuilds
when done separately.
And then for <linux/pci.h> and again for <linux/platform_driver.h> and
=2E... That's why those are included here, too, to at least use the "one
rebuild needed" window for the high-impact follow up changes, and
trigger a rebuild only once (unless you happen to hit an inbetween
commit while bisecting).

> What you can achieve is preventing those "normal" mod_devicetable.h=20
> changes enforcing rebuilds right after this has been applied, but that is=
=20
> just the rebuilds as status quo would have without this series and no=20
> more.

This is exactly the goal. I don't get the "just" part of your argument.
The point is that a modification to struct i2c_device_id should only
trigger a rebuild of i2c drivers, but not of pci, platform, spi and all
the others, too.

Best regards
Uwe

--wbjchwfvl6dsna4z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmpD/UMACgkQj4D7WH0S
/k7EuAf/c8ODR+vs/8I+Md9COBD5E41jvh/kBoEwBnM+lb4ibQWdRmhjECkmay57
P+3+aTYph+O67WUz6zeDAndaECzZokxmM8okhJ0yaETUOo3wIdl/CzK3bQa/4Irb
k1WkhbtCq5mUrH/xToRedm9enaL8kZasTFMv0aRmf5P+jLsMPbzk8iUrLZmH+OR0
Ky7Fm2Ggw9GIt+IFFcpoh7gwYrJ6ioWeFWfaHPWA/pv4xE3ibf9bMNJOVZjmwINh
k8XzSZZok2jPWVcnbYj5IMqzMzaQ3VQtrizcBk3sWWmXI9lvX3SsoQELuYORmn9Z
QhJK6Ob9w754RDTOqAqLxo5nsjs8JQ==
=G13s
-----END PGP SIGNATURE-----

--wbjchwfvl6dsna4z--
