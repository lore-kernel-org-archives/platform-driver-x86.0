Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5242E2C032E
	for <platform-driver-x86@vger.kernel.org>; Tue, 12 May 2026 03:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778556084; cv=pass; b=McQl+d84zKEiqMkxHIfFKHmYRRoMSfr5uu7UPrHDptrQ+btCIlIbo+f+S4lldhis6t5tHw4fxzqbkxxHDohrGm9aH9U/UeL9kdWJxqlgKRelVP84EZ52B60CXbajPEKrocHo1SHLCnftuGFKVCjCBLOAZDP6mOybd511VvNOsac=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778556084; c=relaxed/simple;
	bh=DQ6N9oauDzHXFObRY052Krwwsu+VJK2/LFDTGHUly6I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RTu72vNhcEjz7Tkq4DrPWTJd2GVLVr447mYQJqG6ylkfus7+kV1mSQI6yuU1hKSU315dUQai26vN+7C73wjQdpog/xcBsIzKsGjZuQ/2oxLwXWasp3M0WhaB+0F288pBHqxSwRSVMHJ4Ug1uuW7Q4h12YXezvo3L/B16Qd5krtE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hgf4XXcr; arc=pass smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hgf4XXcr"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-bcceb394417so295709066b.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 11 May 2026 20:21:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778556080; cv=none;
        d=google.com; s=arc-20240605;
        b=exQ74vDl7YG+6Nxs4YMqLo/LBf0XybP9QWtz2bR2aE8FJFaZqcqfvsLM+48UEg3meE
         9+15T1YytMsFvjBnP9m9ebg7+MmoS4OSg2W/PmNAv9259Y+2XQW3ng7Y/z0Dk4ZgPKfu
         MT9cMwBcFz04IVfonRZVCUXUnYD/+hv3ijeGmsboEIkDUdWS9RGh1BSowKighsHz25kh
         hcguM0Z1+IESUTJUMYgtH5SybrIxZpYQYNv3yEVPJuvBIMD7E+MihNloa9i7sNfdePpq
         Z8Vb3IYLKk51Xme0q5joQv/GAFE38L7Z/7R/AHqbxmVEb8rh2N3z8IC/DBiBTM5J2Gwq
         eAxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HYMrozMNVZ904cuoOkrVpAxkzPl3CJ2UJtFltjYOwQU=;
        fh=phac0dKltqMY8hqAGGmi6n4zbkYtbO5LK24pghI52GA=;
        b=BRBnK2O776hJaDPeJmMyR8kKl48/7SXSegqTKetJBxObn3CeWqfsoDHlBgu6VufHO/
         9+NAgD8RLCl1U16jl9auVE9GOuhjMzVxkRtkp1NA0DD3euhIT27F9tmWnmYYUCnLeJ2G
         DsAT6EsEB9BxH/UCHcPJwh3aOElzQpvIZja/8A85C09U7ScJS8M/rm4BKs3EfBHpnyfo
         bAQ2FSsxQ4hRIepDiMj7vbLPUG3U89cHgkv4NqhulLYQ4skWo0PDmHFH11PtSJbFWGYj
         IsHSJ8s1dDOHQcuAipA35aUOS1K0h3w0i3dlGwZiVNmPP0v9oHPfOghH5/2N9ddHVm/r
         JtWQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778556080; x=1779160880; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HYMrozMNVZ904cuoOkrVpAxkzPl3CJ2UJtFltjYOwQU=;
        b=hgf4XXcrpZKhUcXa64RtGRaGTYt/keJqkQr5boTlmfhkBzpCQqFP21hk7tiuPF9uIB
         e0n369ctGt1nZ5Dk7uTNcsgtA2yvZaH/FE/tOB4R/+u60i78pmVVxzygySaHccjWpNvm
         J9C64EVQqFrIHdmAYB7bHDaUjSeC7mNWW3x6ljzODRESFN52EXmNNUFTVsHIMsCSNlPa
         tkgFczbZdDbalV7FfHrf/9Clv3Q4hVcBbsytMMK9y/TuUowEnBfOw4hwdbSG8zBth7nm
         vVSBObsJ6S/suYMDND7sOGSqyts7PA+Vmn0p8URT1eHi7CQoEl9py1niAwM0TSZEIrtJ
         otLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778556080; x=1779160880;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HYMrozMNVZ904cuoOkrVpAxkzPl3CJ2UJtFltjYOwQU=;
        b=GQceiEEYK2srpDHYFF1msSP6UyNNBXbCkkbBq9uAnrwWnxFJGOZuLtLxukxQFbICHp
         pcuHnORQxJBIYhE4SlfUBQKiB3dzybLVvCvfv6lq9qw1+mmss3+bctKWNfGxN1MsuZP+
         bR8aCw6b48Cgg/DkYlNpVBiNSCIrkNXyXQ8pB51kV7cekDyWUASQWatxxY7LAHDgiAm/
         fTvEHP1Jn9spTkqEygb60dTVXRGIHzldsmyZnoORjaxXGvP0qrV7nNKvAriSdgaQViY2
         0EcOUv07wIkVYlkmkJ/yv1SHyrT2QDYJoJiUdKMAApGJVPRlUFtI0JFuwumQnFKTUaQJ
         gaTQ==
X-Gm-Message-State: AOJu0YzIqh3jHiQ01XS34pGdFq4IXWh8/nBMeywLgRmTHwVkAUh6j7mo
	FQg+RicjzUzMtP+pTo6sUaomilSkxjBJCYQYFg7szI63iOOTU/4h5klGgo12DM2tAde7JNtqS0v
	05ZLCBVaCeMJ3o5QgHrngL1Ug3BApako=
X-Gm-Gg: Acq92OHcjp36sEHCz6xqjs5Z+MR8ICZtBxQMkdF+MuJ7oAeDCPBuXKZtgYDPTkj/KYl
	XleP18YZA4m/QRQ/i81+tAYX6qMdCA9cwAHBRni+nk5I/nMHZeIiuJhNU4HMTEeRAMlO+Fq6PEk
	7GDIhy1w+oUaubpicTLRsenSlyncVqpfsHoHaRgzIHMQRKjjwWk4S+DADKquIE8pg78Jf2k/SP3
	9W7FPzdnGcuU00ws5ofSgCwwhy59y1VhQfKFuiUvCD6SrpRzKoPZckD4ddYm6lIeRyP8jK+xMM+
	1phOy3fMuHoeialY6UOsuEJ9q90J2qFrpG5APBQiHLpg5l+Oxk/xxhTT7S/nuA9XjhfQCg9g7OO
	zaEL6h1Q6sf1XGQCuNJCHmJEa51D4XlETq1SiYBjAOqEStxWuT6tQ6sdJOw==
X-Received: by 2002:a17:907:7242:b0:b9c:9594:e00 with SMTP id
 a640c23a62f3a-bd28de035e9mr47365766b.1.1778556079539; Mon, 11 May 2026
 20:21:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260430225309.117557-1-rosenp@gmail.com> <db8119fd-6d40-5df0-68ef-5579290c5bb9@linux.intel.com>
In-Reply-To: <db8119fd-6d40-5df0-68ef-5579290c5bb9@linux.intel.com>
From: Rosen Penev <rosenp@gmail.com>
Date: Mon, 11 May 2026 20:21:06 -0700
X-Gm-Features: AVHnY4JZN-SXXU654PMY1RzzMrowggVLGe4oxCAc5hjbYcCbMH4izfBe-B-8Mkw
Message-ID: <CAKxU2N-L9HMnNpuUhUaWo-doW0cJg1YvuaO9urLreJ3uOzqcBA@mail.gmail.com>
Subject: Re: [PATCH] platform/x86/intel/tpmi/plr: allocate die_info with plr
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, Hans de Goede <hansg@kernel.org>, 
	Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
	open list <linux-kernel@vger.kernel.org>, 
	"open list:KERNEL HARDENING" <linux-hardening@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 11, 2026 at 9:31=E2=80=AFAM Ilpo J=C3=A4rvinen
<ilpo.jarvinen@linux.intel.com> wrote:
>
> On Thu, 30 Apr 2026, Rosen Penev wrote:
>
> > Simplifies allocations slightly.
> >
> > Add __counted_by for extra runtime analysis.
> >
> > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > ---
> >  drivers/platform/x86/intel/plr_tpmi.c | 9 ++-------
> >  1 file changed, 2 insertions(+), 7 deletions(-)
> >
> > diff --git a/drivers/platform/x86/intel/plr_tpmi.c b/drivers/platform/x=
86/intel/plr_tpmi.c
> > index 05727169f49c..2fd27e80bc1f 100644
> > --- a/drivers/platform/x86/intel/plr_tpmi.c
> > +++ b/drivers/platform/x86/intel/plr_tpmi.c
> > @@ -57,9 +57,9 @@ struct tpmi_plr_die {
> >
> >  struct tpmi_plr {
> >       struct dentry *dbgfs_dir;
> > -     struct tpmi_plr_die *die_info;
> >       int num_dies;
> >       struct auxiliary_device *auxdev;
> > +     struct tpmi_plr_die die_info[] __counted_by(num_dies);
> >  };
> >
> >  static const char * const plr_coarse_reasons[] =3D {
> > @@ -278,15 +278,10 @@ static int intel_plr_probe(struct auxiliary_devic=
e *auxdev, const struct auxilia
> >       if (!num_resources)
> >               return -EINVAL;
> >
> > -     plr =3D devm_kzalloc(&auxdev->dev, sizeof(*plr), GFP_KERNEL);
> > +     plr =3D devm_kzalloc(&auxdev->dev, struct_size(plr, die_info, num=
_resources), GFP_KERNEL);
>
> Is there some particular reason why we don't have devm_kzalloc_flex()
> other than that nobody has yet bothered to added one.
I'm not up to date with the hardening people. Anyway when it does,
this will get transformed by a treewide patch.
>
> One of the most annoying thing with the various alloc APIs is that devm_*
> variants seem to never keep up with them. It would be nice if there would
> be some generic solution that when somebody decides a new alloc api func,
> the corresponding devm counterpart would be auto-generated for it.
>
> --
>  i.
>
