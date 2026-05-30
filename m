Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A5EC37DEA3
	for <platform-driver-x86@vger.kernel.org>; Sat, 30 May 2026 12:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780142547; cv=none; b=IB5OVs85mMVuBOpyPi8/EwxBabDA4NP1OBI5+KFcj949qBqKBcxgVbijqi2Miw+Y/eDeXu3ouJaloTF3srIDnQUq0qNEt/VJIFf70iFgI/Uxvg9KxdpdIHvlbWXVdEjLK6VDVr7fZd1wBzPl+K2xv0TDgv/OlhjKTq/xJoV9MrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780142547; c=relaxed/simple;
	bh=g6tqcbL7AO7mmYTpPgLqdEp3sbUIa6noaf2JnjQy1rw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oGjWIfWiKTikop99L8w3zMTDj3pfvWA79BIu9YUFyrHasHrfh0Db32+eki9xc7/rc3ETc1Pi4LivW5B4e91li6uB5MaC1Z1H6ek4I9ShCOLyLR65EZecjYxRzu5Fi46OgRwni/pWOjCAq3Gb8OK3jisOCjkmuC5npx8CA9NTwJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=dBfXCJh6; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="dBfXCJh6"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4908b92904fso34630925e9.0
        for <platform-driver-x86@vger.kernel.org>; Sat, 30 May 2026 05:02:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1780142544; x=1780747344; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BgNiBxvAE0zM3QGPzW0VTokh/HeWsq2F7ow5cn6lSMc=;
        b=dBfXCJh62S2QJYjBWEvhcphjWoV2j647UB7czp5Y64Cb4tGbc57dOwT67vKoYWedpE
         5gCi7PIA7eLEAZbHFVPOrqjOouynNFP+RThs1QMccGBpPXxAXwwG80geCn/Ipsdh5EdN
         4W3CeYLqR7p8URPxr4u+QIjKROlV6WRrSQac2l2yl1rWYjbGUfkTpZ68etfcF9BYbpgg
         3kO/tc5LBo/sQUeMKjOJSMXSA0haZOFxduuHZQzbhWbpM5iFoyyj97XRBDqAGxF7KdBd
         BfZ8Ic0kLRhnym/5GPKbpLaKzoKMD/hVApHAtFV6ywOHNgrKy0/eC1kX8dAUOJHPMzLQ
         pTkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780142544; x=1780747344;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BgNiBxvAE0zM3QGPzW0VTokh/HeWsq2F7ow5cn6lSMc=;
        b=sOzvdLUlrhJQsVGVtnJeNM/JTX/dpcY5K2RZuP4UaTOywhe+EcaXfgBDov5ZoIPDgd
         fL7e9IaQiSQUy+KUDdduZsXRQow7iCliWRZdK6p+35dPePW605UyJcJfOvxLelQvG77f
         Jj76ll7zkmGPiLK6Sk5CG1m2OZAFtDGFqESpF/rELReDutUc5l8AAaF6RK0StBNjZd/S
         vt3/Z8MG96WWF7iQCNr8FiCzYt/kUae0ADjnWD/T/oXdKqophPUUmgil0uDoReDzmipV
         vs9BUtOz0ceIitLp75TrmMLXKf9Pocasc45ka6pFajKrAYlDVGwg4OkxT07nz9xsqsSN
         UxLw==
X-Forwarded-Encrypted: i=1; AFNElJ9oFP3uRrGBjEbC2ujylx5litO1kK9ApVbMDRtY1TBrwfxWQMncLzTVoGNAHorDvEzWvxA7ic52VtqEyMZ/qRf/uke/@vger.kernel.org
X-Gm-Message-State: AOJu0YzzCAPgg0i0DsCyRlEqWFa826PUfZv3W7JRaqwj9LCRXI9pPft2
	btqNucvvxkUSlfiWsjJGnNlIuxKWJoyEt5uKWmGLmawGQtdurgfax1AN+eL+EEMMQlM=
X-Gm-Gg: Acq92OF4p1BkFd+vrEqH/3Q+xs9MY3+o19rV4+qofxPo5YgEz8jm5/AFy653ltIURRG
	tbVVMJUtnwy/8y4BqSJmHp8a5JlgzqQ4ZcMUWDC86qmTzp2C+Y1mjCwCaEaJbOKi+ecFGxB1BXN
	coJlS+INCIspbzq7FjcldHtjufXXfk5OzI0u4KS7nlTyamAcSVv0vl7Emcgr9dRAUcbOHct7mgg
	vOLE0SyJ2ZBrwijO5wRMuBJBe+Z7ppFDclZaWKoLVJ1XdPoChyBlui5Ja7jnMe8KcQYsmiMx1h9
	tTfQSMi/6tzBIS7SpRjO+Jn/iG7D1wQsfnr4JsFfEWD4/UeDWXOz2llT8XA7MLU3BnG53CmXAaW
	LkMmE56jk7thdcC/LbhREUwRsm8jX35ulP4wAp6r/vQFICexZiQ1RmzAA45oRivLW0bvFJ2RZwN
	hKfN0aUGSyQ4gB1iN2uP9Ri66NOZw6N97FwCGLIACHmxTDqiJvRQ==
X-Received: by 2002:a05:600c:6558:b0:48f:d5a0:284e with SMTP id 5b1f17b1804b1-490a294b864mr44962555e9.28.1780142543403;
        Sat, 30 May 2026 05:02:23 -0700 (PDT)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4909caa7faasm103845575e9.11.2026.05.30.05.02.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 05:02:22 -0700 (PDT)
Date: Sat, 30 May 2026 14:02:20 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Anshul Dalal <anshulusr@gmail.com>, 
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
	Johannes Kirchmair <johannes.kirchmair@skidata.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Xichao Zhao <zhao.xichao@vivo.com>, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, platform-driver-x86@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v1] Input: Use named initializers for arrays of
 i2c_device_data
Message-ID: <ahrP4STTFdUsBp0O@monoceros>
References: <20260515164848.497608-2-u.kleine-koenig@baylibre.com>
 <ahp7WuHiPYa7Q_pX@google.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5hgmmhirtt5ohzik"
Content-Disposition: inline
In-Reply-To: <ahp7WuHiPYa7Q_pX@google.com>


--5hgmmhirtt5ohzik
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v1] Input: Use named initializers for arrays of
 i2c_device_data
MIME-Version: 1.0

Hello Dmitry,

On Fri, May 29, 2026 at 10:56:48PM -0700, Dmitry Torokhov wrote:
> I like the ability to properly set up pointers for driver data, however
> I do not think we should use named initializers for name field. As long
> as we are not planning on moving its position I like the brevity of just
> saying
>=20
> 	{ "ili210x", .driver_data_ptr =3D &ili210x_chip },
>=20
> Can we keep the old style for the name field?

I have no strong opinion here, my patch introduces the named initializer
for both members for consistency. Note that my patches for all the other
subsystems (and also other *_device_id) do the same and you're the first
maintainer with that expressed preference.

I even sent a few patches that adapt initializers without .driver_data
(e.g.
https://lore.kernel.org/all/177932943265.3832404.360063047381979287.git-pat=
chwork-notify@kernel.org/)
that got positive feedback so far.

So if you're ok with having input differ in style from (up to now) all
other subsystems, I can rework the patch.

Best regards
Uwe

--5hgmmhirtt5ohzik
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmoa0coACgkQj4D7WH0S
/k5r2ggAr649aJrsJJlkFeVB/fh8+B5LDe4ym+MWA77b0yhq2eW8wormOagLI3cS
ZsKy4bfc4GPxEs6Hq4U1Xtb5rZQ4FZl0S07+51ZaYlq5RbMC/B/SVTiuASJVBVPZ
B4s5kh1AWRq20efV0vpGmMVkGWdWbbWfSDJ88TI8OoCIHy0LYFyBfz9XdnD2pdag
csvvcPKwLzXbvnQDsAb1CyMxa0P5xeJSgzH5Zq3dkY7GCsHzqv+4dmXzIRjgXwmE
F0tGpraE9YOlHYxoqXNfPa2xIKxihaRChziJOKNt3hN9BQ75tAHWpwEFGWDYHn8c
xpL0QD4yV6RvVsMilRsLYNC4h2ZaoA==
=umK9
-----END PGP SIGNATURE-----

--5hgmmhirtt5ohzik--
