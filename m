Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792747312;
	b=U4kpSymWFi+4/XJd5ri+sJ15o31SaB/lSy5n2ssgcPtMcUn4I84ZxCF8DPPDaa0j49MW
	 h6ifXgqWaCPicD8SPoL3+KqulRfCQqiPlA1CRoIYI8CghPUsVnpNww2BUIW7A+FzhMcla
	 OVtDcOX2dzfz0ryEgV6Jk5QAI2bY6ughFK2FqoyIvFiccpl18T7yPjg5CPLHzNxiK1eMd
	 wzyg3st8Xbe2F3/CihioDGL4p2a5XAyHabVPz1oDk3HDkR8TJO/bXhtYqjqfEe+6rCdNA
	 h2CjvtRcnPmvHF0QqHorPlnQ6MSG7rzg1vlEQnMWSNaYkZLuo4D7+JIYsFcfmdj/48w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792747312;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=HmjHL70SjYeeHWsidnbTxThGBvDUXps9xX6PjKAHEKQ=;
	b=TKltgsyhvngVmay+zh/bW7wyQUsbfypzeRaqaZeq5yoibLxANy0jOX9P460ICGZiRnEj
	 kfDR6r428G050IYyhQkyEtuLfPN7A0Q9mxsc6WfvtLlzVWaadOmhs7OJWklf8MdpHoIs4
	 tB8hKk7yxQkrsPgxwGZuAabGO9B7BXdxZnIhhRQMBmNY/6n3/8M/JD5y9YwgJ2c9DXhqh
	 zNcTaP3/ZfiVTz/Tw3BoYNNojnnIPAe0BYMAlOOYxjWLSC0Wc5q1YhhvX/8NBuRlPJIX/
	 Hmh13haYBen3VCBfDPe60yG6aL/V2zXs0x6gH48Olhk8ZSQN9Pm5r6ujPIWWUreX+YQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=AoVoI6+p;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5690A606A320
	for <platform-driver-x86@vger.kernel.org>; Fri, 23 Oct 2026 09:21:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5690A606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=AoVoI6+p
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso6327925e9.3
        for <platform-driver-x86@vger.kernel.org>; Fri, 23 Oct 2026 02:21:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1792747311; x=1793352111; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HmjHL70SjYeeHWsidnbTxThGBvDUXps9xX6PjKAHEKQ=;
        b=AoVoI6+pp+gL/JBGzfNKGQOz2A3uS42562gdzOMf+SfOy7QLNULEY/J/Nsdh+nwqEZ
         BCd/53IKR9sBj+t7VLklJJjNGYq707j8vzT8tFN4X5AGHrv5OkDRH+bsXJdDA3rLgyUC
         HnUoXa8UoysH7xisFxaL0vwA4bn6LUmDtP2nmkXDmzaQhTJ1/5T2d1lmv/emORm+vLMw
         4xD6OgsTmvuJq0QpqldjZKk+NZG1FU9TUGFdIfIB2b8bTJLOKs8z7+rFGnMVR+Arh/WW
         Ni3VnHEJ9zuEr7c5QFyJb8AsxV9SWhHOLzf+MSrMXc7cUw7wH1L+5bOm79oe4LrtA6Gi
         xNdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792747311; x=1793352111;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HmjHL70SjYeeHWsidnbTxThGBvDUXps9xX6PjKAHEKQ=;
        b=rwnn8OdyqErllgvV9zhlKGg4D36HMYfkItXe4o5ggw3T7UfV93wT9EuJD8nfSD/L8f
         GlR8yfZX4FySTFuNoHtDh0bIdvLMpzAgeeqY6fQ/RX5Q2pzcc3CXqmFvmiTHxYgFPZmV
         ys0G5VZnxX3HHWpEVLt+cUHU3JKrwXeSw/BQQauXEyt3V8wvPlgb6XPWM93uqmAyt6tT
         xQ62TK+2lliByKrr3/K71wmg2Xw3NUpU1UOABK7Rb/SL0ZEcRF78/pWyFyxDbfnmpyaC
         4QSppAPngL73Qiba1hD2H3dsel9c6nIfKjcBRJrCw9WPkBjQAl+5oMjvIRvRdT9qSxzT
         AI1w==
X-Forwarded-Encrypted: i=1; AKwUvByUoUFOKbTXhPYs4SrRayz+Jjzhl16RVBWp85XN+Piw+Z74m6LZ2W8DiYXl3fy9nUYsicri37zxksKdZNhFnOg+Fsek@vger.kernel.org
X-Gm-Message-State: AFq9FYJnVJ8srA5MMoSjgHZI1fS06580gsYjVyB3nvTQ/vTjoPoVJTQn
	+ovooHbfpiRu+HKO4w6ZJjZoqwvN00U/ppGR0TESAeyQV0GwoeuZSxk/pnMgaFO1hcc=
X-Gm-Gg: AYBFou0jyofSZmaMcMR16VzXwWtNL0W355WDidNO5cvXBr/7nJO5DEJNWYQvKNcQa5h
	YYUWaV2+NodmU1rW0hCo2/MzLnDba35ziAu9fxlsTBPUAGyclv+L0iIZLsN3+abkpjFd16Frj9k
	TZ7pnGXePRc/75Kg9rPAGpNWni2yET7gAywiJ4Wu7/Sg6VbOZirAbHhFGPPOtaIdlCX9NyXkbhg
	H8CaPgwpLWTyWv/Idyi3PXXWHVlr5N5/MPH6euMx59NGAzlfglIvJrtz5OCXGvCx+QKc33QBskw
	7hbyEqVlibGWjgcdUuQkOuL6cTjiZQ2zChjFZZxBvOYozlGpF3Mxp2nCN9kXtzFc8gru9hgEggm
	fugA6SFLe0O9unhn44sK/HfaYbAHbmGXpXhEqOYcc/znquaKMuTgI6mTZ4xLl7sTQ8RWFDNSSXF
	rxJn2V0yvEtH79s2T/3o1wXW2C3cTzqGy1ob5rrZBLpKTLsP5rQPdvZ0vhKhA1Y4bz5lWVqV2QZ
	rnNHhnSSU3uYZrRyfxyoEMHgSXpROwfGfWN9VU0AqscHVb1PvDTPSyd4bZ6auuSseL7s++FqI+H
	TkQRyjePnjkWzsmpTDuMoz8eAQF2te5OID+5neyc8uA=
X-Received: by 2002:a05:600c:314f:b0:4a2:b89:b02 with SMTP id 5b1f17b1804b1-4a211c9c5c1mr26749325e9.10.1792747310749;
        Fri, 23 Oct 2026 02:21:50 -0700 (PDT)
Received: from localhost (p200300f65f19a9045816c66224fa2d94.dip0.t-ipconnect.de. [2003:f6:5f19:a904:5816:c662:24fa:2d94])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-48e38025d76sm3827688f8f.13.2026.10.23.02.21.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 02:21:49 -0700 (PDT)
Date: Fri, 23 Oct 2026 11:21:48 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>, 
	"Derek J. Clark" <derekjohn.clark@gmail.com>, Ike Panhc <ikepanhc@gmail.com>, Hans de Goede <hansg@kernel.org>, 
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, Maxim Mikityanskiy <maxtram95@gmail.com>, 
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] platform/x86: ideapad-laptop: do not poke keyboard
 controller
Message-ID: <atsmraNrFH4HW3Qb@monoceros>
References: <4b2f60a7ceac543bd8b889b9c0772b2c@gmail.com>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="igkmiqlhogoklxiv"
Content-Disposition: inline
In-Reply-To: <4b2f60a7ceac543bd8b889b9c0772b2c@gmail.com>


--igkmiqlhogoklxiv
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3] platform/x86: ideapad-laptop: do not poke keyboard
 controller
MIME-Version: 1.0

On Wed, Oct 21, 2026 at 09:50:56PM -0700, Dmitry Torokhov wrote:
> On Ideapad Z570 the driver tries to disable and re-enable data coming
> from the touchpad by poking directly into 8042 keyboard controller.
> This may coincide with the controller resuming and leads to spews in
> dmesg and potentially other instabilities.
>=20
> Instead of using i8042_command() to control the touchpad state create
> an input handler that serves as a filter and drop events coming from
> the touchpad when it is supposed to be off.
>=20
> Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---
>=20
> v3:
> - add missing header includes (compiler.h, container_of.h, errno.h,
>   mod_devicetable.h, slab.h, spinlock.h)

noooooooo, mod_devicetable.h is wrong, I want to get rid of that header
and input_device_id is already provided by <inux/input.h>.

If you want full iwyu, please use <linux/device-id/input.h> instead.

Best regards
Uwe

--igkmiqlhogoklxiv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmrbJykACgkQj4D7WH0S
/k7UUQf/fhPoADJkA8uE7YZ9tqBim2i0UzkFm07T8xnmU4CnTZhCoQ9Ozmsd6tr5
1FGS21kPcdsoYa+h7unjfuMHYJNcG/WOx2VAp3BgYSwNgKYT4rnD4biWgJHQRNrM
lhWcoLpkwuaUHXHcexOVQTbc2kjVhLQ9kUQFV7aR1za6pX+THOsGsys//h3v+/eI
ReOfDJDne0l72AgYWxcPkyttdqZBYFnGg6pjvF/FsBReCyvxnszGvO7ZJg5s63bP
ikNxNMtfJU18X2ZxhpE9/s4zkYcgEFm8ggEZbEVIIKKjEZzX64P5U5Mp5rc+OOJu
JMUHB+DaL4Dp1tgHVXnTechZ2zULUw==
=vw9K
-----END PGP SIGNATURE-----

--igkmiqlhogoklxiv--
