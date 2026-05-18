Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C168A3E008F
	for <platform-driver-x86@vger.kernel.org>; Mon, 18 May 2026 07:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779090970; cv=none; b=kiYZwAHUEAr0RzfNIvNhH2SjvZ5NXt7pVNhN5ENG7YAAKCqAhAugFRbJrOuZfOJJF35U9k08RmskcAPnmuQ7fdklCW8XTHL+BZVnyjV0+QJWnSUg6RcUICVIIJGp6I2NhSP3mhrsnDdNSmpopSadTHNW7CJaxfBDvOqpVS6XBQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779090970; c=relaxed/simple;
	bh=VJ36PRww7AW5yhifd0V7DU3h0ShfL3M0Vsq0+hXDKPs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ATWlbbeY8Ku9g8K2LREh7v6c9EUIXrf9tT23hlUt3vEoZwkl/LwEP3FRHu8H6tgJuDGorPPoV92OQcClU9dfv+avXUx6ggf0x+AxMxc8VsYQykeBwJE1A1PSARv3uHTpysC4ibJKkLcUBvqOAGmosNJsP7bKhWSaoe05Kbv2D7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b=m8CKSwu7; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b="m8CKSwu7"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-44c350a5b87so1003789f8f.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 18 May 2026 00:56:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1779090964; x=1779695764; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ML+fhGCtqrS6nYIK3KHsCQErHIIB6z1uyNGHrfcGFy4=;
        b=m8CKSwu7yme0IjaFscoxmnBQal7PPNhJ3wKBdxopQbmUWf7NJ2/Bmw+Z+X1cOeHTEZ
         f0sEgPGMeCKndH/mL7UfIfd8r/rpILqYUtAusXCj5nBKhx0YChXzJ0izveNwVWovJ8uG
         G3HHl92hQME7qA6JKhQ55637PGqPsbiiNO0qQq7HY086tGWq3AHUgxMHu3iUfXcSXlDY
         tXV4CawNmtAyODsQQenAc8XaGyyUvZM/e9z0Qx0s/LaZ466jM0lBd5/f8wr70aZc3hO9
         65+apnp7Sj226y6Ns5jN0wlUi90cA50Ar91W51gCcJJkIuhAWfI6tmr1krDiA5pJJF/+
         JdVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779090964; x=1779695764;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ML+fhGCtqrS6nYIK3KHsCQErHIIB6z1uyNGHrfcGFy4=;
        b=PNGOS3xGyVpyZmQ4wGO+0wh1A5O+L1uNVTR5Hh15Z38REvNl3Afmljk5XyZLIiMs6Z
         xfBnErXT4Kdnp0wEBG83EJN0qejqeXMX6WnkMq8GfzP/6fqWsbnnCz+23ruqnCXvDbJ6
         kUfzyHaUUwEJRfFWAVU2NgipuMKKhy1d4TFuMzJrp9fPQ5RUHbbu28NWErfRmZwLEYvq
         baS9Kq93YYQSyyP1B485UCZy9lO9A38VlnvWEPfoeXBBQYxbLEfW/UuHfx58p5zQI7r7
         Z0pEzPB4OexjnwL46RPjgA9PwJWXqwRzqph9iLjsQ1b6N8Tx4xJUaY1Nqe5gh4dcZRb8
         qkkg==
X-Forwarded-Encrypted: i=1; AFNElJ9XuVkpK1vEkwpp78CU/CesvTeHI+oG6Sg5a63jobf9dXcP7zZgCmurRCBpVEuru3r2RSPcleYEXAdxZFDAgWTOuOeh@vger.kernel.org
X-Gm-Message-State: AOJu0Yz52aybrI4O2vCwsMCwnTNbkASGw6+vZXekVaORCHD2gti/K+bX
	nbCdWm5ZbV//fwr9//TB9LJhQKTEmFMpiIXC5z40lBLO75ARs9YlavtXelBHXw91gUs=
X-Gm-Gg: Acq92OERyonQqIuWCENy5rFVBUHUM/I3YArpxDodX0d5BNP6kVjg+mUh73r65x0XJTI
	DoYnc+SqAA6bHFLRuQCt+VZV9/xFeIjrKw9+Q03cXY2Od3yiLsslgEZ0kfKxvWWTA4VdXN5W/x5
	i5UvSY0rBcEIH/UPot5ArGpt9oCy7VGLfP0yjktboMlBak0uxxRgOYtr/3/9OmxlSMubsRIlkH4
	YIq8fe9ljI7Bu+YwRuAeeLVvyZVksWK3oOre1RotuBvuPWI6gAflu4gDC5zKRGdXFwoRXdb6FtD
	f4SmIdREfXLoPa66Nvr/+jhxdMexMrO1RHg7yQ4tiTkl1xKI6JwFw1dNr74CSSMAt3d826s3uQo
	+ZIxlifmN5+AtWFpPG1+5i+5ZHeSVpn2QGK6xjKRj5tO33LRIB71/7u/QXuZaXWJNag+2fuc1lu
	vmJKV8+puUySdgq4rO7HjvQQcClVdfhz3lvdEFaHqX6MQf7rIDbIYUW8EOOZ2upNabHQC4VV2d6
	8+E9NBmKpF8i1+vV80zEliBV0+EoUzwjovq
X-Received: by 2002:a05:600c:a406:b0:48a:599a:3716 with SMTP id 5b1f17b1804b1-48fe651487emr168781505e9.23.1779090964101;
        Mon, 18 May 2026 00:56:04 -0700 (PDT)
Received: from localhost (p200300f65f47db049367b55fc4056f2b.dip0.t-ipconnect.de. [2003:f6:5f47:db04:9367:b55f:c405:6f2b])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-45da15a562dsm35387139f8f.33.2026.05.18.00.56.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 00:56:03 -0700 (PDT)
Date: Mon, 18 May 2026 09:56:02 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Anshul Dalal <anshulusr@gmail.com>, 
	Michael Hennerich <michael.hennerich@analog.com>, Yassine Oudjana <y.oudjana@protonmail.com>, 
	Linus Walleij <linusw@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Support Opensource <support.opensource@diasemi.com>, Nick Dyer <nick@shmanahar.org>, Hans de Goede <hansg@kernel.org>, 
	Job Noorman <job@noorman.info>, Mika =?utf-8?B?UGVudHRpbMOk?= <mpenttil@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Kees Cook <kees@kernel.org>, bui duc phuc <phucduc.bui@gmail.com>, 
	Thorsten Blum <thorsten.blum@linux.dev>, Yauhen Kharuzhy <jekhor@gmail.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Marco Crivellari <marco.crivellari@suse.com>, 
	Minseong Kim <ii4gsp@gmail.com>, Ingo Molnar <mingo@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Oleh Kuzhylnyi <kuzhylol@gmail.com>, 
	Marek Vasut <marek.vasut+renesas@mailbox.org>, Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Josua Mayer <josua@solid-run.com>, 
	Michael Tretter <m.tretter@pengutronix.de>, Jeff LaBundy <jeff@labundy.com>, 
	Javier Carrasco <javier.carrasco@wolfvision.net>, David Heidelberg <david@ixit.cz>, 
	Petr Hodina <petr.hodina@protonmail.com>, Svyatoslav Ryhel <clamor95@gmail.com>, 
	Johannes Kirchmair <johannes.kirchmair@skidata.com>, Xichao Zhao <zhao.xichao@vivo.com>, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	platform-driver-x86@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v1] Input: Use named initializers for arrays of
 i2c_device_data
Message-ID: <agrFDLaPu1nnLIN4@monoceros>
References: <20260515164848.497608-2-u.kleine-koenig@baylibre.com>
 <CAMuHMdWGSBbQtKaoFej1Qm-SUgDenLMDF0psD9o07wyHKu8A+w@mail.gmail.com>
 <agrAG3cLjEAPV90B@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ledpsosxjgbf2xjn"
Content-Disposition: inline
In-Reply-To: <agrAG3cLjEAPV90B@ashevche-desk.local>


--ledpsosxjgbf2xjn
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v1] Input: Use named initializers for arrays of
 i2c_device_data
MIME-Version: 1.0

On Mon, May 18, 2026 at 10:30:35AM +0300, Andy Shevchenko wrote:
> On Mon, May 18, 2026 at 09:24:35AM +0200, Geert Uytterhoeven wrote:
> > Hi Uwe,
> >=20
> > On Fri, 15 May 2026 at 18:48, Uwe Kleine-K=F6nig (The Capable Hub)
> > <u.kleine-koenig@baylibre.com> wrote:
> > > My additional motivation for this effort is CHERI[1]. This is a hardw=
are
> >=20
> > Nice!
> >=20
> > > extension that uses 128 bit pointers but unsigned long is still 64 bi=
t.
> > > So with CHERI you cannot store pointers in unsigned long variables.
> >=20
> > Good luck fixing all implicit assumptions about this in the kernel!
> > Also, good luck convincing people to use uintptr_t instead ;-)
> >=20
> > https://lore.kernel.org/all/CAHk-=3Dwj2OHy-5e+srG1fy+ZU00TmZ1NFp6kFLbVL=
MXHe7A1d-g@mail.gmail.com
>=20
> Yeah, I believe Linus will have a strong opinion about all this CHERI stu=
ff :-)
> But let see, it might be surprising turn around.

Yeah, it's not yet the time to start that discussion, I want to have the
patch stack in a better state before that.

I think the strongest argument will be that

	"unsigned long" [...] is an integer type large enough to hold a
	pointer.

just isn't true for CHERI.

Best regards
Uwe

--ledpsosxjgbf2xjn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmoKxg8ACgkQj4D7WH0S
/k75XQf/fJBvg+bkcjF1RD9zN6ORGpW8MCPpjekC79O2A1nW+vWJClXaxkKullcM
RNcA6S+Y0Uw9HmLHEkyScdB1VYiKlnOw/gzCrSTCR9JK7CYN1rKq99EoMheR7+DD
uVa7Rai/eEhJYIh7vpBfGS/QtapI3qrJCb9hfOrfkP16by8BWbMcqFzUpGd9CBPh
pb6E63QmhOxL3fyFRcnpEzRCgyg3eTVKynQ+7tPmH2cU7leNveZhBkWfkLYDJWgM
a6K+Do5D2xWle5UGHlxxgWvA3SdTvGEXpIXWD2JM67KsBrmKuAVx2Oxzh7rYfORT
A1krybshSByxRK8iPTzSCW+n+EBR/A==
=/va5
-----END PGP SIGNATURE-----

--ledpsosxjgbf2xjn--
