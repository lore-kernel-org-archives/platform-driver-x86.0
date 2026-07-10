Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5A9A3BED44
	for <platform-driver-x86@vger.kernel.org>; Fri, 10 Jul 2026 07:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783669198; cv=none; b=DXiSnvVyaq9NRIzJJRwB8TfVEtMRZGeRS8hvVMtPJTImNxuDzkyQ/R0y02LAHi9WiyJrulAXuhqP+SToBugZc1z9pKoItrrTS8WmqJAd6EVy6Cs1liSSYRVFsEBhYBeO6zCWiq4R0NsPMtSYHOM2+iIOaunXr7Rt8cz6MAKOEFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783669198; c=relaxed/simple;
	bh=Aa7f+W2lMwTCUw79H7zMC353Lp/aj96Ged0rqE7mDMQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MqOvj2sKcA4t2xJFUeazrSqGnxX76ZpbH1g9ye8fDc/p29eidFpE1PmvVPOg4oOFkdABDH7+n+NyJTnlwu/PQQfpBzSFmUylECPsYuL7HP3Xifo89X7wtY+nST5nEUlCbSccoosKwcxg8KYb5zPtOwsvIXYD72NglvLaD3NeZLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=cgMRIk1m; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="cgMRIk1m"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-47c6e9a694bso322242f8f.1
        for <platform-driver-x86@vger.kernel.org>; Fri, 10 Jul 2026 00:39:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783669195; x=1784273995; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Aa7f+W2lMwTCUw79H7zMC353Lp/aj96Ged0rqE7mDMQ=;
        b=cgMRIk1mowPF284ec4EK3JS4EAL5UzxBeJQ+QA+gYEv7AXi5GLeUqqhEyr58M8hUKw
         oZpzEU9Bdu8ToSce/Q+zFXyugXuFgfMODvNb4UzWqCcNaV3Z3yEDMxV8AT6NluXbm3Sy
         +0XatSaK13TpCm1hn3fHyoB4bUoPFT39PAQs2hW9/+mvTJ5nk8q211JA1s4c8TP2nT2d
         L0M4kGwk77ethduh13DzhNioeGye9LhvzRFoY0O9sHi8RfU6M6hvPJ2V8AKXF1de1zNr
         lY4Yj+8cCc743fWMvLU/7EsDRieSwzIAx5Na2Cqdv4D/6t6bRSCXyQboGZiW1yIyfR+U
         IpHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783669195; x=1784273995;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Aa7f+W2lMwTCUw79H7zMC353Lp/aj96Ged0rqE7mDMQ=;
        b=QaROtwJxh1Nnq/pUg2RMjGZdJZse5ksmskNFtQsJGiTX9Dv6meOyP7dU5Eqyy8j74D
         uXttdIQo+KvdoMi0raA+pjajmTFoyfdfdkJFedjid5lkFt5zXGPVbtXlvNqTu22SM9Nu
         niCnS3kLSoLegkAfrNEzhnzsKKfY4qBNO0qkv2gHKCGV+jSwZM/ebqU6kd5/OzyD+Fkn
         RU2hs9ERgLsEQZA7Ev05a0Dm2KoPRj5K3JLOLFeiE2Ttx+I+UBx0YoRBawoE+KCXwnJs
         I/1KULtC8g7GswlUHciprh37IN367B8m3yoEazgY32Ca6/osSq24iYLTDnFu8dECPT42
         Lelg==
X-Gm-Message-State: AOJu0YzvGYd/OBzfMJD2v5F/cyINoDMbU07LPOs8U5Vv/c81UPBXivLS
	9d+j+UI9CV03aIKASj2rBgBDTlcl3oJ/rBpvXneP0V/dsZYkan4veRtdOKrGUqYRGVw=
X-Gm-Gg: AfdE7cmchspui2Zm6m3itY4kAA83S5aLqYUD55QGwPo9L/maUtYUZj0TndS0KlCqIPI
	JAm/4kxGkXPk93DinkFb8UwX6akBMb61CqwuLxYPU0boE2IeV+sX3J4U/qBIdvhW5NGptS03GNS
	nHrTjrHFvj5nbOPpW5lF2+XVTy1xyMXv5+xFRAgr5CM1/xwTkfiMA3CU245W30nwi9kQcgotNcZ
	APZp+W+lrhDvaanqDLDy2gnGJXD6cvLblYXILaHVDxLV6cRHyxoBgfZ/9EDo9Fc539evJneSHcI
	tWZ3KZdZkdjRS3UQrFhkGGxRhL6b1tQlwrUDK5mzmJAGWgujypAAEgxtPAuml+41sxR4c70EsLw
	aKqtfIYV9819EPx5ukCFrJj36DLhV9srN/7ANpDUaic4PZa5BjxMQCMiEwvEY8uAmmIQstBqwie
	6xxA+ix2AsJwkuH9cRwi5/cWlTWRcNVQA4ZZ6phcRJMslwFOUateoqz1QnEiiqYQD1y3CSj9C6V
	iHC
X-Received: by 2002:adf:f387:0:b0:47e:b898:c580 with SMTP id ffacd0b85a97d-47eb898c59fmr2207230f8f.13.1783669195134;
        Fri, 10 Jul 2026 00:39:55 -0700 (PDT)
Received: from localhost (p200300f65f47db04fbea22a44ee9ba38.dip0.t-ipconnect.de. [2003:f6:5f47:db04:fbea:22a4:4ee9:ba38])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47ad69519c2sm61859095f8f.37.2026.07.10.00.39.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 00:39:54 -0700 (PDT)
Date: Fri, 10 Jul 2026 09:39:53 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Sean Rhodes <sean@starlabs.systems>
Cc: platform-driver-x86@vger.kernel.org, 
	Tzung-Bi Shih <tzungbi@kernel.org>, Brian Norris <briannorris@chromium.org>, 
	Julius Werner <jwerner@chromium.org>, Hans de Goede <hansg@kernel.org>, 
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev
Subject: Re: [PATCH v2 1/1] platform/x86: Add coreboot CFR firmware attributes
Message-ID: <alChumH9JHyvXVjU@monoceros>
References: <cover.1783601414.git.sean@starlabs.systems>
 <1e2a63afb26f989db2179e2aa82f1938068c10dd.1783601414.git.sean@starlabs.systems>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="636dc2akeeceuafq"
Content-Disposition: inline
In-Reply-To: <1e2a63afb26f989db2179e2aa82f1938068c10dd.1783601414.git.sean@starlabs.systems>


--636dc2akeeceuafq
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v2 1/1] platform/x86: Add coreboot CFR firmware attributes
MIME-Version: 1.0

On Thu, Jul 09, 2026 at 01:50:17PM +0100, Sean Rhodes wrote:
> +#include <linux/mod_devicetable.h>

Please don't add new users for this header file. Only use those
<linux/device-id/*.h> that you actually need (if any).

Thanks
Uwe

--636dc2akeeceuafq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmpQoccACgkQj4D7WH0S
/k4BgQf+PX3voxOVj1BGZM7OJKeHDJzNgc1Kmju9Y7aRrzLQt91Ps8IrR2n7UMNQ
Ix5x/kRS7hBLbEvFY/aGk/CTQsMefWNFD4ggU5APTW+zSXebT7FWtlvxQXyhdGMR
WxpXgmc1iivUGJBb9N2lhUau1f+DSthIk4U//LNmJdGWX2FDag4pBbeN0cKKF9lg
vua7ymIp+C33JwMS9/tQGLEJYVloKd4odjP/jrSXfQGcoBHMEu/syLEYeg9GswST
NDZwDyGHo8Dn8ZMvyOH4PSMgQX0tEE8fF2P7ROd2ln9R1iJ8twb3y7Nz8qLDgrHn
AINW8D231VcoHexXPZoaqKxg6V1sWw==
=EOvC
-----END PGP SIGNATURE-----

--636dc2akeeceuafq--
