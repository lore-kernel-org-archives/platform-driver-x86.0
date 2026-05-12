Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4468B309F09
	for <platform-driver-x86@vger.kernel.org>; Tue, 12 May 2026 09:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778579432; cv=none; b=Uj9K/0zEyh5iTd7XoTwDzbZ/tfj5pdYM/x7UKOkPrQ0MF9+XxAkLVe5J7p1Ou6gizdKDcn10kEMNxTvV9QgwoESEDxANjfm9ql1gtMEcfulg4eUTyJ2QrL5gWX1fcZ5I4aL54y3puJTEb71PF8n96bcbB4dB8Ymru92PSk97bRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778579432; c=relaxed/simple;
	bh=gqMDtKzbgBo99Fz0MN1KXsAKED7H0vZAFnNoWuNL9fs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=svI4SIZcyG744YZ/bjz3vLk9T5v0eqY1ssRMyRwW1h9Ki/OkioYEY8nnVwsC9qTbrbBqP/zAwVrqV8nlml9kvgunvlwPoiv524NfCoFXiMqFsrVBtOe0ZxiZRus6WteMZGtNMy2dpGeIcsoOKQAPuoOHzYgw2FHwk0JhIndTSkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IIwEK55K; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IIwEK55K"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5886C2BD00
	for <platform-driver-x86@vger.kernel.org>; Tue, 12 May 2026 09:50:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778579431;
	bh=gqMDtKzbgBo99Fz0MN1KXsAKED7H0vZAFnNoWuNL9fs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=IIwEK55KtajK1SPptfatXZ0OGIhS1COSdOrksrAwolrJH2OZSeOq16nfnAY9A4sFo
	 j1O/CZ8ueqhVtN6jkEAQbOAhJ0bzIJh/nIN/bNBCvNxTUsTRo5OPvHUJtQKDg4e2a4
	 41g8pB581tKjkcxSbb1pU9muXZKdY1ZugCq3KqE5ZNxVWsyG0drmihjfbGSD8iEfJw
	 pJIe8rXNz0ZjKoYVaWYxhFaVMe/BWKVdadduXQfZYNQf3Is/pNqKSbxzCCPR48ccEZ
	 iiTnCcqI6j/XkG1PdSqpWAlsMBFYjDYqSbfvkqOCy6hNP+IfgCqTbAZYN0PPjsNEH4
	 HcG5N1vUKrXjA==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5a8891febd2so6283654e87.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 12 May 2026 02:50:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8QtwMmTyWoR6A6STg1CDY4VSuN0HCNv96X4gUBHz5ZMudHfCfhyHL9i+7kgPvlkt4GFv5njU/5XOIf/vz8CftE4545@vger.kernel.org
X-Gm-Message-State: AOJu0YwGfNRDBMgCZGoetXAG4JP5WtuEX/ez/laiaDFIQrjll7cDNpvj
	kdO7uRRjqwbZPERAb1wYP5dcFL2k6gMD4umjsK4O/mu8554xL+lNq2+E3ZZJE/ttEQ+Xr1OR9WP
	kil3oh8XUtm2jYfo/CLdtuiXOwz+yPGg=
X-Received: by 2002:a05:6512:1050:b0:5a8:87eb:b118 with SMTP id
 2adb3069b0e04-5a8e31e7903mr898926e87.22.1778579430246; Tue, 12 May 2026
 02:50:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <5990022.DvuYhMxLoT@rafael.j.wysocki> <agLV5STILBnNNfWH@ashevche-desk.local>
In-Reply-To: <agLV5STILBnNNfWH@ashevche-desk.local>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Tue, 12 May 2026 11:50:16 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0iGU=zcLsWKSjq1eki5Nf7rPu+NdjbfWJ9=jGCuP4tz8g@mail.gmail.com>
X-Gm-Features: AVHnY4IfVxdWZMC8mmirqms-UkvDJvrJgqxmxwKG40eA7E__H6pkWVvvWLf38Wk
Message-ID: <CAJZ5v0iGU=zcLsWKSjq1eki5Nf7rPu+NdjbfWJ9=jGCuP4tz8g@mail.gmail.com>
Subject: Re: [PATCH v1] platform/x86: Check ACPI_COMPANION() against NULL
 during probe
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Hans de Goede <hansg@kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	Linux ACPI <linux-acpi@vger.kernel.org>, Corentin Chary <corentin.chary@gmail.com>, 
	"Luke D. Jones" <luke@ljones.dev>, Denis Benato <denis.benato@linux.dev>, 
	=?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>, 
	Jonathan Woithe <jwoithe@just42.net>, Robert Gerlach <khnz@gmx.de>, Matan Ziv-Av <matan@svgalib.org>, 
	Kenneth Chan <kenneth.t.chan@gmail.com>, Mattia Dongili <malattia@linux.it>, 
	Jeremy Soller <jeremy@system76.com>, Azael Avalos <coproscefalo@gmail.com>, 
	platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 12, 2026 at 9:25=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Mon, May 11, 2026 at 09:48:26PM +0200, Rafael J. Wysocki wrote:
>
> > Every platform driver can be forced to match a device that doesn't matc=
h
> > its list of device IDs because of device_match_driver_override(), so
> > platform drivers that rely on the existence of a device's ACPI companio=
n
> > object need to verify its presence.
> >
> > Accordingly, add requisite ACPI_COMPANION() or ACPI_HANDLE() checks
> > against NULL to multiple platform/x86 drivers that have been converted
> > to platform drivers from ACPI drivers recently.
>
> > Fixes: 578bc2a53ae2 ("platform/wmi: Convert drivers to use wmidev_invok=
e_procedure()")
> > Fixes: f7e648027d7e ("platform/x86: asus-wireless: Convert ACPI driver =
to a platform one")
> > Fixes: ba19eb10170b ("platform/x86: asus-laptop: Convert ACPI driver to=
 a platform one")
> > Fixes: 3a96c7915d93 ("platform/x86: toshiba_haps: Convert ACPI driver t=
o a platform one")
> > Fixes: 553b2ac59fbb ("platform/x86: toshiba_bluetooth: Convert ACPI dri=
ver to a platform one")
> > Fixes: 246d6cefe525 ("platform/x86: toshiba_acpi: Convert ACPI driver t=
o a platform one")
> > Fixes: 19ebacfb442b ("platform/x86: dell/dell-rbtn: Convert ACPI driver=
 to a platform one")
> > Fixes: 80b8f68b94ab ("platform/x86: system76: Convert ACPI driver to a =
platform one")
> > Fixes: de6837243af0 ("platform/x86: panasonic-laptop: Convert ACPI driv=
er to a platform one")
> > Fixes: 6da22b031a3c ("platform/x86: fujitsu: Convert laptop driver to a=
 platform one")
> > Fixes: d5c9212ccfaa ("platform/x86: fujitsu: Convert backlight driver t=
o a platform one")
> > Fixes: bd13b265d386 ("platform/x86: fujitsu-tablet: Convert ACPI driver=
 to a platform one")
> > Fixes: 8507277ef132 ("platform/x86: wireless-hotkey: Convert ACPI drive=
r to a platform one")
> > Fixes: 3471415c8186 ("platform/x86: topstar-laptop: Convert ACPI driver=
 to a platform one")
> > Fixes: 138db7ee58c0 ("platform/x86: sony-laptop: Convert PIC driver to =
a platform one")
> > Fixes: 14004dd31caa ("platform/x86: sony-laptop: Convert NC driver to a=
 platform one")
> > Fixes: 2d9cb20610f7 ("platform/x86: lg-laptop: Convert ACPI driver to a=
 platform one")
> > Fixes: 8a44bd3ffdb2 ("platform/x86: intel/smartconnect: Convert ACPI dr=
iver to a platform one")
> > Fixes: 163a68a31f74 ("platform/x86: intel/rst: Convert ACPI driver to a=
 platform one")
> > Fixes: 079b59fd2d79 ("platform/x86: eeepc-laptop: Convert ACPI driver t=
o a platform one")
> > Fixes: b30a462720ad ("platform/x86: acer-wireless: Convert ACPI driver =
to a platform one")
>
> Looking at this I would rather see the series, but am not a maintainer he=
re and
> I'm fine with the result. As a single patch or as a series
>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>
> ...
>
> >  static int acpi_fujitsu_probe(struct platform_device *pdev)
> >  {
> > -     struct acpi_device *adev =3D ACPI_COMPANION(&pdev->dev);
> > +     struct acpi_device *adev;
> >       acpi_status status;
> >       int error;
> >
> > +     adev =3D ACPI_COMPANION(&pdev->dev);
> > +     if (!adev)
> > +             return -ENODEV;
> > +
> >       status =3D acpi_walk_resources(adev->handle, METHOD_NAME__CRS,
>
> Don't you want ACPI_HANDLE() actually? (Note it's not directly related
> to this change, but perhaps a material for further improvements.)

From the code flow perspective it doesn't really matter at all because
ACPI_COMPANION(dev) needs to be dereferenced anyway to get
ACPI_HANDLE(dev) sooner or later and when that happens isn't really
that important.  And since acpi_handle really is a (void *) in
disguise, I slightly prefer using (struct acpi_device *) for a local
var unless the handle is used more than once in the given piece of
code.
