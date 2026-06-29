Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B3DC1ACEDE
	for <platform-driver-x86@vger.kernel.org>; Mon, 29 Jun 2026 13:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782740198; cv=none; b=YSa3N0BydCelvIZHJYe1wRavX/8hBS86smVrt3knXC/OzoQiXKOU8uRZMteiKv+2ZKCzZyLYyV+hAbCHBOMV/nKK0blNvPWArIchiGcRKAajdI2RbM37f+TIJiVBh41MvlR1pNG8Vdp5rub/zqU6uR9i2UMGW9fDGKKAUgIb7go=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782740198; c=relaxed/simple;
	bh=+1OwKV1dyxOCFDgRqLWV7JVciKZ94ymxEIolDxA6tg0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O9OWL8U9FQLg/MPt6NHJBqdju9wsg3rEjPIRKf5E2eoJBJ5xFm3yt78POw4E1EOdYbnmA2Khf9UKR+8WJZlmENrvsSjPW7CtPyVniZHGbduU0nfWprwjFNCumSqFzJbegBP6KHsa1XxrxYQvXfkNFc+ekJrqv5xyZcyGz2ESGHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=atjCtzkR; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="atjCtzkR"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-493a548fc99so6458165e9.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 29 Jun 2026 06:36:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782740195; x=1783344995; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6xxjjeNOvGN8eekdMLSiFo3jimcUTLIN7SVK1r32J0k=;
        b=atjCtzkR8CDlTctdsh10tW5QNcbLWwfCzIw1m6pXVm+cFWEAShF7zsqW2n0263uOfF
         LcDkcfdWf0Jz9pE+LHFh8qB5OdyXgM8uzhmfk0319JPJSinTws14zPB9NyG9zMoWPLz8
         RMKh20SoCrylioNR1gTnc/qjP4+h/Yh//F2Y0fal5uOLjYtEw5xP71wFwozOazKNfVJp
         C/D3mNwNNyFzKT507s9j8cGVKcbhgZhPwty2f92QcuS+f57/cx5kdufXGNG6wBMLCIAc
         NKgCACYnjw5lgy/0boo+QyYgFeRb3RwwmfIyIyBAP/6XaY3368zqlwSQCu5OBvPnrv3u
         Nl5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782740195; x=1783344995;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6xxjjeNOvGN8eekdMLSiFo3jimcUTLIN7SVK1r32J0k=;
        b=i7VN5IABEKzHe3nqZbuZgHsSETAoDfJ7uPS3eKPRyUvC0p6UhkoiXwfo2UT8xXJ/OH
         ByDyums4dTAchdlT+K8lWz0AScAutBHVy0SmPrMA2NHscEYWpPhaylr/KRvflaALfTXa
         COl7QOCem+qvfuPFSt77RqwgP5TtkbSfmIxtkpObOMRpaR6Wm1PMiwbLBs3Jum0RxOpZ
         VU9c0jLzfiX8BYZDvM2akF/VSlL1Ta9P/+v795dGNlHQ2ACv7YS6wtcuV/3B+YDJF/li
         0rSSpdQLht8QypPjqDjf/cvFEBY9ljmY5P/7xaTGzHgJ1XdEH0T2S0oDgre7qcU43sNO
         m04w==
X-Forwarded-Encrypted: i=1; AFNElJ9hqJxEW8aclJyguEXvysgejtlK5YKMZnhr29rSpblGaf4zawzgtamwGK+L5CjFu/a5IIUHNqXOsTrrB62TIrwn7yE+@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7k851LrOk2riQpuflX8tw8QOxd6E1JtC4FllHl1Vq0HJZVJcU
	5lRXdVx8lXA6J/xiv44FGasxRBRngXhRFOQyXkE3iVhENeWZMWaaCJ0x0VMh0/JoCQY=
X-Gm-Gg: AfdE7cmuixAHwGrMz7As/EddF8WotjmFbNL3EHtReI9NdZfAhkAG+k3LL0hOttCJJcu
	EwNza1HaApqX4UXRLqtbf65+xnHcwd9QgJNr9ZsvBCO9GGzaxC3jhuMrctMTLfCZDxLtTI/QF0W
	23Sa79V1akhjtMlxSVGrPz80cYaNZpmrE2BKvp+TedLbjXAHmBp2IPQ3hi1h8zEpks6H2Ct8Mgw
	jBf4zfy0mt/ZyuPnuF6VDVIlEh/gphmP5vdFDIdzEFbx+QLsNr4KMtEdkvrgmeisHhrvaoX91Bg
	7v3o07XPNv/hn/TvuK6kNW8TELWt/YCi0RJPK4H6ENVqjRIY/g58KS+7/DN9dtdt61YAl/suOA2
	RSgI1Cw6C2pdmPbjaehSRWr1dhhB5flOAX7DdbnXAEouokPdnmGYsSM79xV8UclYq4P+e48PxQp
	V5lImm5rVUGysH2YHRSjwXsjmZ4191iSHSLZKhDk0U92iMcbS4UUxH7gmhZEj6A93T41Wxc6tv7
	gjB
X-Received: by 2002:a05:600c:3b24:b0:490:bd66:db49 with SMTP id 5b1f17b1804b1-49266850100mr271074205e9.12.1782740194716;
        Mon, 29 Jun 2026 06:36:34 -0700 (PDT)
Received: from localhost (p200300f65f47db04294e5bd34a12a699.dip0.t-ipconnect.de. [2003:f6:5f47:db04:294e:5bd3:4a12:a699])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-493b729b5c3sm11139505e9.2.2026.06.29.06.36.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 06:36:33 -0700 (PDT)
Date: Mon, 29 Jun 2026 15:36:31 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
To: Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Hans de Goede <hansg@kernel.org>, 
	platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>
Subject: Re: [PATCH v3 09/16] platform/x86: x86-android-tablets: Add include
 defining struct dmi_system_id
Message-ID: <akJzYlHHcvPCl0HW@monoceros>
References: <cover.1782682124.git.ukleinek@kernel.org>
 <ad0c801eb9c5814bd2430f1e8c370fee82742897.1782682124.git.ukleinek@kernel.org>
 <3bcb32f8-00d2-905c-3dc1-e8730611fb6a@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="w43dpmzsnqdovct5"
Content-Disposition: inline
In-Reply-To: <3bcb32f8-00d2-905c-3dc1-e8730611fb6a@linux.intel.com>


--w43dpmzsnqdovct5
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 09/16] platform/x86: x86-android-tablets: Add include
 defining struct dmi_system_id
MIME-Version: 1.0

Hello Ilpo,

On Mon, Jun 29, 2026 at 02:38:35PM +0300, Ilpo J=E4rvinen wrote:
> On Sun, 28 Jun 2026, Uwe Kleine-K=F6nig (The Capable Hub) wrote:
>=20
> > Currently <linux/i2c.h> includes <linux/mod_devicetable.h> transitively
> > which ensures that struct dmi_system_id is defined in
> > drivers/platform/x86/x86-android-tablets/x86-android-tablets.h. However
> > this include in <linux/i2c.h> will be replaced by one for i2c_device_id
> > only. To ensure that dmi_system_id is available add the include for that
> > explicitly.
> >=20
> > Acked-by: Danilo Krummrich <dakr@kernel.org>
> > Signed-off-by: Uwe Kleine-K=F6nig (The Capable Hub) <u.kleine-koenig@ba=
ylibre.com>
> > ---
> >  drivers/platform/x86/x86-android-tablets/x86-android-tablets.h | 1 +
> >  1 file changed, 1 insertion(+)
> >=20
> > diff --git a/drivers/platform/x86/x86-android-tablets/x86-android-table=
ts.h b/drivers/platform/x86/x86-android-tablets/x86-android-tablets.h
> > index 2498390958ad..c756961ae5fd 100644
> > --- a/drivers/platform/x86/x86-android-tablets/x86-android-tablets.h
> > +++ b/drivers/platform/x86/x86-android-tablets/x86-android-tablets.h
> > @@ -13,6 +13,7 @@
> >  #include <linux/gpio/consumer.h>
> >  #include <linux/i2c.h>
> >  #include <linux/irqdomain_defs.h>
> > +#include <linux/device-id/dmi.h>
> >  #include <linux/spi/spi.h>
> > =20
> >  struct gpio_desc;
>=20
> Indirect include patchs are never a good idea as it always makes header=
=20
> reorganizations minefield. So for this change,
>=20
> Acked-by: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>
>=20
>=20
> When it comes to the series, I certainly like the direction it goes very=
=20
> much (never have been fan of mod_devicetable.h) but I'd have preferred=20
> stepwise approach over trying to introduce it to some mid-rc.

The hurdle here is that at least the header part isn't easily
automateable. (Well it is, but the script that I have now to check all
=2Ec files already takes longer than an hour to run. I guess it's not as
optimal as it could, but still.) And so getting this ready for inclusion
in next and keeping it up to date until the merge window opens is a
tough job.

The further downside is that each modification to one of the highly used
headers is expensive (in rebuild time) when these are merged one after
another (or when bisecting). So getting these changes in in one batch is
beneficial.

So while I agree with your preference, I don't think it's feasible.

Best regards
Uwe

--w43dpmzsnqdovct5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmpCdN0ACgkQj4D7WH0S
/k4xLQgAh4immjoeTECwhwTEDPyJPR7aRvpV7cngXiXtBF20rkHaZv/awpHbKGdS
tBBCAN1sS049uGGqw9hmgUPniQl16qFey1jKcQuFqQTHo+1NNqgaVuJ3qulIychO
NcrZIgXeUEZKTUo62FzNHxCbZhTJJqru6r4paDNhH97POZ+QksvTyBJ2Eg1qr0/R
QbUUxPcLwtNyoGAVt2IhaV8pcb+jh1D6FqUZn7UvZ6u1bbI4FDKAZ84lVZtCn6SH
qZbgCVutmKZdCDUm+C8COu7PueDxKsIp8ZzP2fqoq8ymz/yGyVhSSgZ0n/eKDxIe
GIAlnNs3JI+BRFuOHKwmPPAnkF+M6A==
=IYV2
-----END PGP SIGNATURE-----

--w43dpmzsnqdovct5--
