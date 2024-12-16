Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0514222619
	for <platform-driver-x86@vger.kernel.org>; Mon, 16 Dec 2024 08:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734338805; cv=none; b=cTtEZYlDO8T3tiw9NsEHT0l4K3kFCkHF3xjgact8ZNzqrDkN6isPN8b2dgRaqYltlF5iFYtJIMKvyLW2NyAe2Kr8PpGbCtkmHulDokCLRbaVafgdjFYOOCQYLmicU4/bsFWfJBbQPAWnScrLSnoMRDMvtNmnq/PCRqVQYk9kuqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734338805; c=relaxed/simple;
	bh=SjffmhmJwu3hr21nrxgO8jtg19kZy1QNHccEYspfdwU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VXDvNEHTMjW+ijDjY8HbMJaTG+/ht9FUqejB9c8xqr9r6ZtwlyJj0s7TdQz8eT0ULhaPM8z32ZwMcmcmZSgfuk83NtHIk8VH+hC9VF2K5uTVMkmxaxUtCzAEQbtEWXNl37atLC8dKFMviFzYlfFFWiZbtFdeg6b4dxjk9eiUzQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=OV8MCS1J; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="OV8MCS1J"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5d647d5df90so3649621a12.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 16 Dec 2024 00:46:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1734338800; x=1734943600; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Y6ykrK8ieDiJtOix+vCkJOCkbefUNnrlz7NFFu314dw=;
        b=OV8MCS1JJ385uhEvvfNDaD9SggAGbIfG1Sy6/eo2NDJb7iEHXQexevXSzDNdjyrgX3
         Budtw2r0FKGTpCJ1O1aGLVts3EU+bjnnrh4nB2CQ1Fw0bN14INpjMJXQZ+kvqxg7hv+v
         KWjwpmXMTA872CzTv6pGvtezDHZVibM10VNGb9s3xpMK6OXKhzl0mI24debB3EJfChqt
         bmEEg3Rbgw023jWgfMgW7XsCU6RaJbrqUMC2LPXz0on66YWIQMwe4lxIzcoISrSk4jPy
         vwqcX99Qbtpi31M0BpWAD7ArznAmF+NPRHNNtpeglRGkStq84INFQ7zx1UcbE2L/SNNp
         qBHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734338800; x=1734943600;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y6ykrK8ieDiJtOix+vCkJOCkbefUNnrlz7NFFu314dw=;
        b=F7/opU3n2u7Hxw8e2HvLO7F3OSk4dFZrb/EJjqT1N9ZDB4j/+c/oGsDylJ56U5Svrr
         Na1MMZr3IgbkguAhAmA54MpsR1Dc9vrx7YVL2PKD+XUbSsvs3fcRT+Hf5VXRFG/wCiFY
         dtwnfBHkMdU3YuxAAlanIWoRAZf4Hit3m9rWzgf30g7BPWq2/ge7yTVgcdhuf5qa/05d
         eLFh0uCNprpc8xIhb1ILCqtR57z9uSDtVkPuhswc2MPM4BvMKu5Oqj/VkQtl69byFJ5z
         GG/WlGXvD/g34JzC8l7sIdp5cnke58vICrLQF1Chdmg6wmDLoGpa4j59Ix1CsjTtuDLp
         fetg==
X-Forwarded-Encrypted: i=1; AJvYcCXeAjTgjdLfoPGyHJA78ldVycPMviwmYRI260rKNKqAO+68YBCBrIzkSQbSA0ku3pzufRouSlyn8jQct9+aRI5deIU9@vger.kernel.org
X-Gm-Message-State: AOJu0YznW7YVvFg7PRxxYFOB4H5vHMHcvKuDTbf2ptLedbtu4B6PW+bx
	fd86fHCpkV/3o7i6SSp5Yb/CFOF7+dh+wCls5D9XCDjbOX4YoRZIJ6XDGFE9i7M=
X-Gm-Gg: ASbGncuhmVS0jqFF//xJfb11VxQf6F1j9MM6bSGqSJ3qvGyA7mvLdCQino6dvfAAjjw
	475JfdCEFp0zS6l+XoO1EhlCev+E+PtrlGP5UMNbJRmNwsz3xZ0CI0htf3yuSaB6u4SIENel48t
	3BHjeHMM1C3ckwZLhx4ZIp6HCZa5fnBiIuQXB1mYczcpnCsSnRIuNP3yoYDA9yTUw+NfQMxUlTd
	HQbKsx1wjfpVk17WD9aWx9X1YtPnkbTayObsWTcIGvxvOORKdbtwmxD4/pAEzehgjKlwkKDoygg
	9u3zj1IqXg==
X-Google-Smtp-Source: AGHT+IHp2Zf8mHD48Nyi7XHgse29fvGp6Pzxfj0A9arP1nL9FiTb2ToWj+bgqHYsRUtQACZwqL8Fmg==
X-Received: by 2002:a05:6402:2684:b0:5d0:e00d:93e8 with SMTP id 4fb4d7f45d1cf-5d63c2ef412mr10690001a12.6.1734338800263;
        Mon, 16 Dec 2024 00:46:40 -0800 (PST)
Received: from localhost (p50915bc6.dip0.t-ipconnect.de. [80.145.91.198])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d652ab5109sm2904001a12.16.2024.12.16.00.46.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2024 00:46:38 -0800 (PST)
Date: Mon, 16 Dec 2024 09:46:37 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-pwm@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>, 
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, Thierry Reding <thierry.reding@gmail.com>, 
	platform-driver-x86@vger.kernel.org, Mika Westerberg <mika.westerberg@linux.intel.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH 1/2] pwm: lpss: Move namespace import into a header
Message-ID: <ipkpvzuv7eogcfeamvkwxjsazg33umoykuij7zz3sfhlahtn2x@tr3gok7bbmco>
References: <cover.1733245406.git.ukleinek@kernel.org>
 <3a99048a52aeee356d01dbf7f2f06e6e0826ed78.1733245406.git.ukleinek@kernel.org>
 <Z09YJGifvpENYNPy@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4hlqulqrtnmzi3hu"
Content-Disposition: inline
In-Reply-To: <Z09YJGifvpENYNPy@smile.fi.intel.com>


--4hlqulqrtnmzi3hu
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 1/2] pwm: lpss: Move namespace import into a header
MIME-Version: 1.0

Hello Linus,

On Tue, Dec 03, 2024 at 09:12:36PM +0200, Andy Shevchenko wrote:
> On Tue, Dec 03, 2024 at 06:16:14PM +0100, Uwe Kleine-K=F6nig wrote:
> > Each user of the exported symbols related to the pwm-lpss driver needs
> > to import the matching namespace. So this can just be done in the header
> > together with the prototypes.
> >=20
> > This fixes drivers/pinctrl/intel/pinctrl-intel.c which failed to import
> > that namespace before. (However this didn't hurt because the pwm-lpss
> > module namespace isn't used; see the next commit.)
>=20
> I disagree on this change, I think it had been discussed already.
>=20
> The header must not provide any module importing features as it effective=
ly
> diminishes the point of namespace. Any (ab)user can include just a header=
 and
> be okay with that.

Andy and I disagree about this change. If you happen to not have the
patch in your inbox, see
https://lore.kernel.org/linux-pwm/3a99048a52aeee356d01dbf7f2f06e6e0826ed78.=
1733245406.git.ukleinek@kernel.org/
=2E

Would you please volunteer as the impartial judge here as you're the
upstream maintainer of drivers/pinctrl/intel/pinctrl-intel.c?

The TL;DR; is: Do you prefer a single MODULE_IMPORT_NS() in a header, or
should every consumer driver explicitly have its own MODULE_IMPORT_NS()
invokation?  I won't repeat the arguments because I think I cannot
present them without making my opinion too obvious, so please see the
discussion between Andy and me in the above linked thread.

Best regards and thanks,
Uwe

--4hlqulqrtnmzi3hu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmdf6OsACgkQj4D7WH0S
/k77PAgAjTrXfIeuClhVfRSB7fG6NxSEApb7h3j4yG22XxuWZGIkborbtfWi/F/b
2oq0YI3tcEtY0BB1rBBMgq9lMY0sfgbxvbwjBGZEuowvFwCA6C7PYMuLl44+h7/E
+LLNpqd2+ZldlbzeDuVsilJ9FAv1BM65aMp4r/jVKKHpaOzPo6ub5DXZ3MZNz1N5
r6CekwqPn3fv8OLElLUUTSXQ1a3ePatFI9uQBEDec7Dq3NUk3kLrkZdazr3hS0Ux
PifObSNaOrSJEG5Lze/OeG7v0sP7Fns+Q/BXXLvDwfZJYoznRfxJF0X53IBplC2A
XYXkmYDwNjjyuWa/Nw+z/wHzk/VfSw==
=mEQx
-----END PGP SIGNATURE-----

--4hlqulqrtnmzi3hu--
