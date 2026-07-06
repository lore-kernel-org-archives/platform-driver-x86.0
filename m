Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B81A3A4535
	for <platform-driver-x86@vger.kernel.org>; Mon,  6 Jul 2026 10:37:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783334262; cv=none; b=qaIm3B9VJ2ZRgbA4hmBVvB0EmzPdzgA771cG2OXTqTRS+DPxEKp0GQpMSYQO+Hmm6Im7LCa7z0Onw5hukfOQ71XETPrlrXlkr1xUH5CzFokcVJEgTqWH2aU/eKqILVOmHfC21aEwAI2k8Y9jnt+ejlG3SutR1o8k0Ub0e+2zUvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783334262; c=relaxed/simple;
	bh=7NEBWzNh1uxkZkSDHwf39crAET9UaLAJ9UI8ikC2Suw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BLM7mvcVmPz+tbbSlngHr7i4rlDae3Mp5Tifq6EPISh2xhtviS2qWGc9BxwUjlQ0AAKmEp5FRTyggKyr3iiVgufy2q+MZNHT7wkj4YYJ0EJf7r7LKR/uog95gjsYC0jbEMKe0I1BFs0lx9hBWOlTpMMfHQWQF8RwMkG7p2S8kdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=R+tcTVd/; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="R+tcTVd/"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4938d5f86f3so18281005e9.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 06 Jul 2026 03:37:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783334259; x=1783939059; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7NEBWzNh1uxkZkSDHwf39crAET9UaLAJ9UI8ikC2Suw=;
        b=R+tcTVd/7mUCrZ/BrBF64vt4eXKpZkGvmVfZZHLMglDJ7i4AGDnZTYjiCDCegW+TKl
         7qA2Xz6KgyQ6zzLiRM7u7hbi+K8fuUoxybplzNNYLzSjPhs6wRB1xODXywt5qGusHF1z
         VddsgKgtEg0wRXa4fis1pAy8JtV+LaGsbkRI1MBlydLOuiiSaLMN2KWQ2+PF4MgSr6uN
         7ZJ1opd3hH/Pr6hM8x1DlJiSGRHUa3/z31VuAbgXXVAJIQkzQt4lNrJ4JO/zg/ZOxJXg
         9m80DGHWN8DYHvpDTE7o+exD6Q0ohwGkrpbpvzh0lOrQLmC/mwIrx5nqeQtWjZ87Jrgj
         4VYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783334259; x=1783939059;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7NEBWzNh1uxkZkSDHwf39crAET9UaLAJ9UI8ikC2Suw=;
        b=j+B+keED3wUqGjsL098Zp6zBSGJ13KlmuQYI5l1yFTVTw8OeE1ozZVXwXBjFtCglMr
         yoGBpOv9h86GrT0EZMxSmO/u6IyXTOt3Q7D83SkAmzPCDDOkyQQXkQlUofUVu4UZ/m2w
         TtvWgT9G5gyLg7ckUViLpEjCyeVAKVm3qEju5bDzATuBMUcCcq7HOnDhV+bGVk38oNC3
         VGCe0JKDxIRP/UF8LKmewCYI/Nl0HHIxLz6q73Eo6mEAELllaQwFFu/DPNazKS7hTyK6
         c8pTOY9SRtsTBvIeycngIkfzFAhKTcBwjQ8nAATczI9bX2Bc/1BMOj753khS4NUsKWPR
         knXQ==
X-Gm-Message-State: AOJu0YxjfEwJH5tc9fXfcPxWUJiRZm9hoAWG/OmkFIS5WAU//1XN20ie
	qYqyYFwbPK/Fl+7vVV3O2c60ruGuIR1m4PPxL7KpIHoKaxbzSTkHz1poHMnyJBNSDAc=
X-Gm-Gg: AfdE7clv6kYXcg1Vv/x0Obpn807FLO9HhE9Lyimc1VBWDElnBDvW5EyZiVi5kWPrpVt
	RBwznFepuADrQxf8Bi0L8cAeRgwCKKE6StQ0WzhGdx3p5CGFz7mpq+0z6dTBLx6nQwNAKJGmTEa
	GMdPj4Nkjo34grN/A707hmEqD9shN4J3OPw2m22mPYpYxdmpk0R7+47GwsuJmEuhGi7hmCLfNkH
	+8YAkUm8gtvrlZyhfaC3y7yyP9/VaWceuLfVlB4Ij+7iljOENJjisCgEcF8aUispjKKD6k6aQVo
	UhC8/RR2hzFgBW1zBQ4tZ13jOtIJhH1dIZg00LajOaCVtUw9ONDrSO6JDDifF2NKmZf8hQkGaZ9
	sxdZQELfP3MmNFj2KqpjAjNATclNyBfmkH7CAH5fnDvFM8gJU+J1bNX/LDZC65nf5MHZFtLm8Cq
	ynmGyfNsmXsDhgZeuUaNWziMdG4LgoOU40QvkOEA5fkq749UMs6hkvSTzj5d9ZgCob7f0Zul0QD
	xie
X-Received: by 2002:a05:600c:5893:b0:48e:8eb0:4957 with SMTP id 5b1f17b1804b1-493c9b3dd62mr112037115e9.2.1783334258276;
        Mon, 06 Jul 2026 03:37:38 -0700 (PDT)
Received: from localhost (p200300f65f47db0426af56a07ec3b32d.dip0.t-ipconnect.de. [2003:f6:5f47:db04:26af:56a0:7ec3:b32d])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47a9de1d910sm23039242f8f.6.2026.07.06.03.37.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 03:37:37 -0700 (PDT)
Date: Mon, 6 Jul 2026 12:37:36 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>
Cc: PDx86 ML <platform-driver-x86@vger.kernel.org>, 
	Hans de Goede <hansg@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: Imminent rebase of pdx86 trees to v7.2-rc2
Message-ID: <akuE9tvj29Y6crEk@monoceros>
References: <8084b592-cb10-2ae4-603a-615f053ca01d@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zwmv6j5dalbnrmce"
Content-Disposition: inline
In-Reply-To: <8084b592-cb10-2ae4-603a-615f053ca01d@linux.intel.com>


--zwmv6j5dalbnrmce
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: Imminent rebase of pdx86 trees to v7.2-rc2
MIME-Version: 1.0

Hello Ilpo,

On Mon, Jul 06, 2026 at 11:48:18AM +0300, Ilpo J=E4rvinen wrote:
> Because of the recent mid-rc-cycle merge of the rework for=20
> mod_devicetable.h in d2c9a99135da ("Merge tag 'device-id-rework' of=20
> git://git.kernel.org/pub/scm/linux/kernel/git/ukleinek/linux"), I'll be=
=20
> (re)basing our pdx86 tree on top of v7.2-rc2.

Probably to late now, but I guess merging v7.2-rc2 into your tree to
handle (potential?) merge conflicts would have been the solution that
doesn't involve a rebase.

Best regards
Uwe

--zwmv6j5dalbnrmce
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmpLhW4ACgkQj4D7WH0S
/k42xAf/Q1wZfEa/L0Fok1tVfHvD26XsSx/hI4Eb6zWf2eULZlTniSWYMQaj1X5A
HeDI+aaEKduJjkdVzCtqMtRI9ehSl+BmFMeWvs46R4dg71tRab5f+pNJIybEPP3X
frh01jgCM4s3nNaxaO8Drow7DXxMC9zJPVylOA2btzi2NdKxcyfLvT24OBwXixYG
R22ZlCB8a4ACG04N2O71Yxd0GrG6TyXtr3MLeNHEh+PK7m8Yxp5+Go02/Tsnn3bb
x1WfYEp76bCxVYGIWPFf/tBZIcuDdQEjIm3FiLJyXS1lwUCIt2+KHVAgqjOTZjS+
fkKXqKpSuKXQ4HQnM7oZQGwn+49edg==
=zXNb
-----END PGP SIGNATURE-----

--zwmv6j5dalbnrmce--
