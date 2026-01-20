Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com [209.85.210.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DCFAF507
	for <platform-driver-x86@vger.kernel.org>; Tue, 20 Jan 2026 00:04:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768867470; cv=none; b=ZgVkcXbP6yE6Aymt7uSL7eQlaIaLPzCN/du/NODnAsACJCuA8iA8hV6UfgPqZDQZIjjTWTtwgZZqm3976YsLsn09gjH+xM+V9hemnnCIrvjjfSBG6b/nLQWPmUxkcqZTWr5k2wXGgSEg28P75gSffJ0jStUSooHbozwEf5mGbKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768867470; c=relaxed/simple;
	bh=cuKZQcuapQnBZVta8YkwFU3o1xEnR1bsXItHBrnjVWw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cev6iQ4kWZG71YC/w5aIKuwpXjBPk6hCz8RTq18/eg56Ui4PafUfqRbmOFBLicPIlwBD0Vc+sRxdwU/keorfJfarvzgm2FFn/EzotTiZ46vQ/uAehr0WrYozWUKQ0OnCRnudLbh8+wuFT4cu1QPHFi8+GYXjDjmVdRvpnc2eB2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SEg4VYDr; arc=none smtp.client-ip=209.85.210.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SEg4VYDr"
Received: by mail-pf1-f194.google.com with SMTP id d2e1a72fcca58-81df6a302b1so3901315b3a.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 19 Jan 2026 16:04:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768867468; x=1769472268; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+Wubt2tqx7SxUgLn+ubS/XLWpKCP8r4Dm/ia5St2vgU=;
        b=SEg4VYDrKSJMyCmnOgFvsvmX7r5FsaMfTkaTXsQhLVFPGANJFzPlb3zvAENOtSJ/JM
         zHqgi6sw+bHTRgjCynmW+ZffykQT8r+kBNvYY4wEaCZaD5w5aWYklnaVv/0XzZ09KWwF
         N1V9+AP9hU9QoXh/64pykGR2wP2+P+vgsIOKicfx7nNeLQ/yJXdsPNTaj9eMnBwtIAWL
         lPhX+wlpFgBnk9eJPRIpQEuGF1s37YoNk3UJGu2RidIBVJe1lCDDgoYBcot1Ty9dUmEr
         eWeFDBcgfxPaqCu6QtAWuDRALiUgaTx5PfoJRrPUW2wEfrD6POqDszQGi9QA7SHSBgao
         v5qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768867468; x=1769472268;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+Wubt2tqx7SxUgLn+ubS/XLWpKCP8r4Dm/ia5St2vgU=;
        b=btGM6s1chhqRe5t2+Hg7JGbJX0PE4a6DIr/1XfxFKg6/LrCAnT+p1UDi1mX1IMsLBD
         VNRMPUk7L+7aamN2bih7PYU4fizxeRkzNSG7763pGFNjUnWx7zTnEuH0net8P16vI3VA
         0FRq7ks+Ib7vc+GqeaQf1tuHZ0zzXpBLoDeyXcmQOUfHgsIemP2jIDi3t0WYFBz5FtUG
         yFIjolC4qRosesxVXhtNlraS2Jg2jIDIOYEuAvZVOu7oU/A/7wpZxo69bQpUQosCS5Nb
         BXqXKL1YULFWCBDhhhC8zms4giDR7Jt4pT1f0IeQoOWGJ02oFQVH3uqJ1GvN0f6r4caI
         vqkw==
X-Forwarded-Encrypted: i=1; AJvYcCUIy9EC+9rovcMWkiTEEJOEu5+0g2EroGf0oJmuOClLmyyJym/l2xZ3uJpbL5jH0YIhOD3jokDngf+NqmP+1pqlrvjG@vger.kernel.org
X-Gm-Message-State: AOJu0YwuvAXXXJ9MgKT5jbfOu2SH1F0xtROCIGanzkF6mcjT1GU0uJCq
	BvvfQ2/jrBd5yL+Dn7AxQpg2k37u1MC/TejpNTbmhUYGZRippvWMHvxr
X-Gm-Gg: AY/fxX7AFakUwJX4/yNQMT/djVsBSPyRSYNsoGe37hXOYZ99ny/r6fN5r89SAOZUAFV
	WKPoOW4DfPCbOInJDEWd019nJRhSIzMb+EmMfFE9YCQoNTVo7k2/xRdwsq4FIRzXMQUXO7ql72k
	IAVfwppsoSjDb07CYu6S9VZW5Zzo7vwMCLyVSXqaOUJbAVPMhsYWZczx/c5I7nMNNwfcpkLRB1a
	TJxyMmYSNJPrakUm6yn/invkKSbioZfhdW93ywhXJ33ZjnrF0QPEfahMYWmb6kyJ2xQ9e+rXKvD
	CzB6l0SqkCJ4EaNutGjo4u1XdPzM3yicYPYPj8dLv6axosPVqjtwkL5jGXOBpQ/sNcdXSU4Yxbj
	CbgpSKxXoBX0ASOJGjM7MQ/ptweuRBtN/l/SGkBhNLSrU2bJrc8hjIfLdjhrR3ND7v+0UpUiyvV
	DtNG99meg=
X-Received: by 2002:a05:6a21:6b05:b0:384:f573:42bf with SMTP id adf61e73a8af0-38e00d9682fmr11086386637.53.1768867468314;
        Mon, 19 Jan 2026 16:04:28 -0800 (PST)
Received: from archie.me ([210.87.74.117])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3527313c2a9sm10227886a91.17.2026.01.19.16.04.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 16:04:26 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id E9AC3422053E; Tue, 20 Jan 2026 07:04:23 +0700 (WIB)
Date: Tue, 20 Jan 2026 07:04:23 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Vishnu Sankar <vishnuocv@gmail.com>, dmitry.torokhov@gmail.com,
	hmh@hmh.eng.br, hansg@kernel.org, ilpo.jarvinen@linux.intel.com,
	corbet@lwn.net, derekjohn.clark@gmail.com
Cc: mpearson-lenovo@squebb.ca, linux-doc@vger.kernel.org,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
	ibm-acpi-devel@lists.sourceforge.net,
	platform-driver-x86@vger.kernel.org, vsankar@lenovo.com
Subject: Re: [PATCH v5 3/3] Documentation: thinkpad-acpi - Document
 doubletap_enable attribute
Message-ID: <aW7Gh6WsTjVo5IO_@archie.me>
References: <20251226235101.106451-1-vishnuocv@gmail.com>
 <20251226235101.106451-4-vishnuocv@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cXr86z952AoRnBdA"
Content-Disposition: inline
In-Reply-To: <20251226235101.106451-4-vishnuocv@gmail.com>


--cXr86z952AoRnBdA
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 27, 2025 at 08:51:01AM +0900, Vishnu Sankar wrote:
> +Values:
> +	* 1 - doubletap events are processed (default)
> +	* 0 - doubletap events are filtered out (ignored)

Please separate the bullet list from "Values:" paragraph.

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--cXr86z952AoRnBdA
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaW7GgwAKCRD2uYlJVVFO
o5IaAP94b7MmrmseMySClfVwqN2J5VwmAmCppeUJ/3BURZkyIAD9FBUs2/yUHoyX
mdvAzlxMyN4BFBzd/S6jJXcMr4fBwww=
=2Yar
-----END PGP SIGNATURE-----

--cXr86z952AoRnBdA--
