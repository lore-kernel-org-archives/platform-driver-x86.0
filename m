Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 426CB36D4F0
	for <platform-driver-x86@vger.kernel.org>; Fri, 21 Nov 2025 13:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763733033; cv=none; b=G6X71zn8wFkDc4wXz8F97DZhXuytufDvForq3z0xBgtvdAfLxlR86LtKKHPLLK9MdF+wlmb+L+2AZcwljdPGUNb0UFmp4apYCsOYWMBycASQtq1qnnEstdk3YdHW6dPra0nh8TW7ebJCGN62h2KgjHj1VbwR6rxvMT3jQMLpmFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763733033; c=relaxed/simple;
	bh=OzIbahhaveQRBUfAVZNN8f+jaVVSCVqlebf2iMLWMdA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EYlJCZ+CNdetUfA3vuqW2fQZTt/zEe3PagQXSiH5LEn587OU+Ymy52jny8ifoAsqIjWv9dTQ8HievVtvGx8D1eDvNfNWTzRTN2bbya5+trnU44iH+ga+T9WO4Xq7nsU9IlWlAY18E9ulXztK121sDOV2wRhvNx1KW6KPL8AgXLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=FJDXgnFE; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="FJDXgnFE"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-37b9728a353so20953751fa.0
        for <platform-driver-x86@vger.kernel.org>; Fri, 21 Nov 2025 05:50:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1763733029; x=1764337829; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OzIbahhaveQRBUfAVZNN8f+jaVVSCVqlebf2iMLWMdA=;
        b=FJDXgnFEsVB+kcKXcst5SE2ESXqa2JTMR6iXSoxctK9Xcg4bZfjN4N4GNgt3h/Ej7I
         WpG2LFBWvw1M33yGhHI6vmPIlZo32N3meZ5d/IzvJAWn83KHmGKq2QvjOC6vsmHhKhA3
         MgDIrmY+i6FKmuYmPo/Jd8YSHWQRrx22UjQmkDp19SaGFJkhkhQaYxQhpkzUcOm3UEv9
         mNOhWHxb2JilUi1bLLze5gdBBzfTCTd7U1rZqMozTzEidaZT0ulYmB5nX4CtKtNd955n
         naWNxoaJNZRxf9uopPCwN4414yfjgHTNbA3PU3vlJ3fjkJbIEFiRqpUzrLglUer9zN6l
         l15A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763733029; x=1764337829;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OzIbahhaveQRBUfAVZNN8f+jaVVSCVqlebf2iMLWMdA=;
        b=tmzSutIarJiRnb6iKxsbDSaliLTg/WHjuCi6+EwvNzyNYWo6kvq3YotV3XOsqCxoOl
         vLXQdRJEZGjgdW4NmgQCqjoKui68//oRBtRxFz1qEhfCW1y+fPEt/YRygt5Itd1TLVh3
         sa+9QNPUCr8R5FrGra+OQXfdFsTHmLF+vFUPRufNIbCK4YWD/DumgMPANC4g7tN8qigZ
         v0cpSNT4izr3H9sOybErwPFPbh+ae2vxttD9yzEzlITou1c1PDKjy3Pn0Q4NqrnbOCsm
         slV0oQtkmkS0wWL/hvki/+7zgB0G1UtYOw8jNqmgtBl5J3CgM1RhEVLULVf5NuZyidi6
         9jTg==
X-Forwarded-Encrypted: i=1; AJvYcCV+RMTb9WJQKkukrBnBc6PIug+WAOpNPr/sHFO5evGPhjH2zcPaLOMv3QbHrYo+ZLTIpGVIvMu18RdWnuTc2ckCp2Qq@vger.kernel.org
X-Gm-Message-State: AOJu0YydEbnM7jdMKzfSQ4Bsppb64fdIzWAf5bPHJ2BXpCqOgzaumwuP
	OIwBiUK0xl2ZGZFyv8nrJzDHlFj07L7z0dekmkVuaAe/5FcGYpZhtm7PHAI3YzaistZspPa+3CJ
	fBRZhEX0Gw5JAxZQJYM3Q2aIhPQkhs8nwem7KX8MmUg==
X-Gm-Gg: ASbGncuUN2ONsBOSZe3SqYbEH09t5LJ3achXVQe75kxbo+r5ReWTvXPzrdVBMrdUkYm
	A/KjcF0+pxjfCPuZMLkF1ljwkAvoopgXpWJs44iOrqpo6XblGoQSN0DWMW78k5pfMcrfeNeIk1W
	sVXcmHNR0oQ7Q1D7csVq03JyzKZiPaXep+PNBlYqssfBKc7D6EMLuk3oW0HI8lbPBGAsoliOq0l
	BGm92gJZJcND8GuPEE0z+oxKuhbeUSfMTy8wlGOqnwVzKXCt+zZcW5HOIx2YzRijoCh0KWwfcad
	zNjSbFali/ElkaQgUdqSpoofbpI=
X-Google-Smtp-Source: AGHT+IHF2yftHHzbz7yXVR99uzx4SLBjVeQ6+s/WAppubzFGG/b07xrVEFhAh0jdRd5zckzPh3Qwjb3jx+2YdRTocRE=
X-Received: by 2002:a05:6512:104f:b0:594:35b7:aa7 with SMTP id
 2adb3069b0e04-596a3ee53cfmr858818e87.48.1763733029310; Fri, 21 Nov 2025
 05:50:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251121-int33fe-swnode-fix-v1-1-713e7b7c6046@linaro.org> <58fdb603-6d42-443d-8ae6-57aced9eb104@kernel.org>
In-Reply-To: <58fdb603-6d42-443d-8ae6-57aced9eb104@kernel.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 21 Nov 2025 14:50:17 +0100
X-Gm-Features: AWmQ_bndZFAcXu-T_IXn6O2MHPMWpvJNWy7s2LRr9_q6Vsfu0yZ4wob_BcSbJzs
Message-ID: <CAMRc=MdSai2EaQfAqjxdmLBdXPQVc8s4b5_sKDmuZV8gBCKp4g@mail.gmail.com>
Subject: Re: [PATCH] platform/x86: intel: chtwc_int33fe: don't dereference
 swnode args
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Charles Keepax <ckeepax@opensource.cirrus.com>, 
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, stable@vger.kernel.org, 
	Hans de Goede <hansg@kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 21, 2025 at 2:40=E2=80=AFPM Hans de Goede <hansg@kernel.org> wr=
ote:
>
> On 21-Nov-25 11:04 AM, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > Members of struct software_node_ref_args should not be dereferenced
> > directly but set using the provided macros. Commit d7cdbbc93c56
> > ("software node: allow referencing firmware nodes") changed the name of
> > the software node member and caused a build failure. Remove all direct
> > dereferences of the ref struct as a fix.
> >
> > However, this driver also seems to abuse the software node interface by
> > waiting for a node with an arbitrary name "intel-xhci-usb-sw" to appear
> > in the system before setting up the reference for the I2C device, while
> > the actual software node already exists in the intel-xhci-usb-role-swit=
ch
> > module and should be used to set up a static reference. Add a FIXME for
> > a future improvement.
> >
> > Fixes: d7cdbbc93c56 ("software node: allow referencing firmware nodes")
> > Fixes: 53c24c2932e5 ("platform/x86: intel_cht_int33fe: use inline refer=
ence properties")
> > Cc: stable@vger.kernel.org
> > Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> > Closes: https://lore.kernel.org/all/20251121111534.7cdbfe5c@canb.auug.o=
rg.au/
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > ---
> > This should go into the reset tree as a fix to the regression introduce=
d
> > by the reset-gpio driver rework.
>
> Thanks, patch looks good to me:
>
> Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
>
> Also ack for merging this through the reset tree.
>
> Ilpo please do *not* pick this one up as it will be merged
> through the reset tree.
>

Philipp: I'm afraid this too must go into an immutable branch shared
with the GPIO tree or else Linus Torvalds will yell at me if by chance
he pulls my changes first into mainline. Unless you plan to do your PR
early into the merge window in which case I can wait until it's in his
tree and submit mine. Let me know what your preference is.

Bart
