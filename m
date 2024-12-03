Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85CEA1F8923
	for <platform-driver-x86@vger.kernel.org>; Tue,  3 Dec 2024 21:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733261546; cv=none; b=tubANZr0TTUA7UCn1SwVqnSN+wzVBbW3cZxXNQmlnExgCfW7+iI2OmCo+Kx56eSx2IaIsObgamT1gc3VEvWLf5sUMY2bzs0aJgNWywLo6QB0jDiCV8p7YcG+ym1J+vPDUwWPLko8yLguY+ZJqfKmJ/AQFu9R9bFrKBGPfDQMpFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733261546; c=relaxed/simple;
	bh=ab8eG1Lh4pYaxoQrl5di3eiMFC63YnOqVOfhpWAw4qk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HIXQjXp/E990cdxzSXYLdGpN9XnyTZUGcg7YiWQe/9h3q7YvslTvKJ+DP3IGdHo3CTqSTkM/dSRrpBXVwsg3RQ1dLjyjcaLJO4RnF/OGE1iskNaHGruMqk6Cv2ZK1niFaPO0tJdJ+YXJt6yEr+ACf5bZPmJKbprJMvRKk/3Gn7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=Ij7DSbY3; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="Ij7DSbY3"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-385eed29d17so2007905f8f.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 03 Dec 2024 13:32:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1733261542; x=1733866342; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ab8eG1Lh4pYaxoQrl5di3eiMFC63YnOqVOfhpWAw4qk=;
        b=Ij7DSbY3aKWfUrMqjRKTYcYmJs3xDE0AHlPoq9JgrQZE0LHIw/ID6TGX5Popmo0aYC
         7Sn+oRyF1zyk+5ZEhABeT+UpkHDRihoVQO+lDcZuME53w0PQOQg9yYP6gYT3sjjiqetz
         KOjJeqSQ1vPr4CwWkOeEYDiM5hlPRoI7m10Gsx5J1YGIpVSTiO+jqOmcDmyRwhhbN69b
         +aKKsCseBlYbBdPSDEXgwZcwCP1u2pmgPt64iK0HD+k1Xjyj4g2JlEdbceya5L5nsubO
         lHdo2tohaEg+GTqSun0n6M9RCf+OCkVLQkgUr2aGFPA9MRSw+aFYYLJGyqCC8OOZ8dzC
         jmEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733261542; x=1733866342;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ab8eG1Lh4pYaxoQrl5di3eiMFC63YnOqVOfhpWAw4qk=;
        b=mQnSM79KRwEOVGODb53HYtB+gShmKrkCSQCG2gGWYHVgof9uuZ4IM5Porq3HIYmJMM
         am5+x3VqC5TAdTXh2aF5da4Quf+gS3EsOVBpUBSNVkk5L0e77DYxWAvfQZUjAaNqMFZ7
         dHIZmXZQd43IIACYLp1SfwsTqWpHKL1fMKtqs4l5rUeTz7ZLBk3cxn4ACmi1bn4Fzsrh
         bMQwawvrxsNGC7bXnAYVwy8YPH9r1nj8tMng60JjhuPqoXHL3vEg+IiVGRZfPoxxYmYk
         WCIO/QPWbs7BVdqJto61Mt3NMi0A1U2V7a7K3BxjC2/UK6BKl8d404r1j/nas0O7XTkK
         zbGA==
X-Forwarded-Encrypted: i=1; AJvYcCWp+G/9ZgBVUOVNk0fGOP7nrP2Mz6a3p0cwa27VQFPrsCmtlHSN9ZxZfuT5ovex195khfKpwr3naDQUH8XfDjopHb3F@vger.kernel.org
X-Gm-Message-State: AOJu0YxUqwDw/JoDhHXp9/QjxXDjcM83klUHaJE0PMmbuYfNWU6dq2sP
	WUnA4wugIj7e421JxXbALYZB9n7FftgaHvkRxEcm9DC8Uio6nYU/eAnE7No8LVj3vEPApawJIFQ
	6r82oGg==
X-Gm-Gg: ASbGncu/0LFBwlkmeishRrjruoyoFb4RdcRWEpcpQOIhUuAOfwWigEQVo+PE26BHCbM
	SoxOioy2oNV428dkLAus8aKdgtQweuMFF9lukTdqJM3IHFf/PI80+ffg5c15vWsrisXlfdXIy97
	9MPbvvz61aRvJn7ej3bzS7FGmBCacU8MwODkDa+gu8TV57drCKCv5MbVz0J2SIIEp6Io4b93Rjl
	N93k1dKJzyKng5Nm1jDCdnxctoCWH3Zu/akdD0AY8bLDpJUlJg5WFk=
X-Google-Smtp-Source: AGHT+IHZvM61IVWoO/mZGjrAoPZsWmd1H/v/lIxOWRFKBr6/PE0sHeewRSTzBcicDPAm0AOdtimpgA==
X-Received: by 2002:a5d:648f:0:b0:385:f417:ee3d with SMTP id ffacd0b85a97d-385fd422f74mr3708074f8f.35.1733261541316;
        Tue, 03 Dec 2024 13:32:21 -0800 (PST)
Received: from localhost ([2a02:8071:b783:6940:5869:5b6c:be91:aa03])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385ccd3a56fsm16407022f8f.62.2024.12.03.13.32.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 13:32:20 -0800 (PST)
Date: Tue, 3 Dec 2024 22:32:17 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-pwm@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>, 
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, Thierry Reding <thierry.reding@gmail.com>, 
	platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH 1/2] pwm: lpss: Move namespace import into a header
Message-ID: <6fjduueg7r3nctg4ivevvk7kopax4ynm32prxacrieq5gpbcgx@zhrgpx2loulp>
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
	protocol="application/pgp-signature"; boundary="ygbkny3mdkxsyf3o"
Content-Disposition: inline
In-Reply-To: <Z09YJGifvpENYNPy@smile.fi.intel.com>


--ygbkny3mdkxsyf3o
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 1/2] pwm: lpss: Move namespace import into a header
MIME-Version: 1.0

Hello Andy,

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

Who discussed this? If I was involved, I don't remember. So if you have
a link, that would be great.

> The header must not provide any module importing features as it effective=
ly
> diminishes the point of namespace. Any (ab)user can include just a header=
 and
> be okay with that.

Huh? Any abuser can also just do the IMPORT_NS statement? Module
namespaces are not a safeguard against bad code? So I don't see why
making it simple for the regular users should be the wrong choice.

Actually I think this is very elegant because this way all needs to use
these symbols (i.e. prototype and namespace) are in a single place and
users just do the #include and get all the preconditions.

> Besides that, you should have based this on recent changes in the NS area=
 of
> the module symbols, i.e. module namespaces needs to be provided as string
> literals.

I coordinated my patch set with the pwm maintainer and he is ok with it
:-) That's why I wrote "This conflicts with
ceb8bf2ceaa77fe222fe8fe32cb7789c9099ddf1 that is currently in Linus'
tree. I'll take care about that." in the cover letter.

Best regards
Uwe

--ygbkny3mdkxsyf3o
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmdPeN8ACgkQj4D7WH0S
/k4EwAf+NzjwOtFF8U+UQ/UCjRSSjDlxsF1vLxilpbKMnv78yo7yeZugGBX930i4
dozyHTVbpD0G/bMD6Xi1nJoIf3UMc/8ZepbiFgRu+uKTSWXSgJrAZ2uNpoNgaFDt
km3qC3it3LCz8MA3cHqbuoRvUwN83zr9d0WgPJa7EY8k/oTBrKTRdOiU2IAy7w/H
R2aiOv+Ge5GnYVpDkS8p2ACT1Kgx9c/X6HSDKeJAholJkYLTzpbR9w/qcEEtASrm
narSLdfoz+cWBROoMQEyu8bYAEVxMqZCQ4xkfIthzwlszBuQEvZt/8lcTUGMCySC
/HwUhhtfE/s3x51PsVTXzjDAuEuRhw==
=ShWg
-----END PGP SIGNATURE-----

--ygbkny3mdkxsyf3o--
