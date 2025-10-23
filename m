Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D51832D438
	for <platform-driver-x86@vger.kernel.org>; Thu, 23 Oct 2025 14:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761230198; cv=none; b=jaTxPtxFM/utUM7qogyaaSg2DZI/6rjd0CpBkcI1glUljJb8WafiouSqtVSRHDNTNeNTHtfitvhn1gNxzYHc0XvGbf8e1blCUTw+PEJyZX6X7hGDXusOTOqjiwtvgwQsF2xr4zRkm6vuvBIN3EK2lo2bi47CLILWdObYSgiro1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761230198; c=relaxed/simple;
	bh=6SbX77KMhHRrNsvoj/jcXSU2W+9DAHYXAss5hQALgcc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MYuqQty3V+4e+5+yZBTsaPXAzIVGLcpBxCmB7vgoRcrYgeIQQIqcyTEzmi16Lsya1hc8LRGSbtVa38K3rJn1IHELJ+YeDT79L0aVYVw0s1uo2UP4P2AHm2aX4FzviRvT04P02K2vDVkaFVPIvbC+GE+z7wIEOSINF088VulTj30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Gj5KQBxJ; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Gj5KQBxJ"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-63e0cec110eso1560841a12.2
        for <platform-driver-x86@vger.kernel.org>; Thu, 23 Oct 2025 07:36:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761230194; x=1761834994; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cXNTVYS30VFNX/nxAcwXSrix5DBuflIOXbRt+GIcMzU=;
        b=Gj5KQBxJWxh/M201LrhXjI8kuSqBcisMSOlzlPE+FsZSFwfmyzCsUnLbEzTzwuF+BW
         GCJx6F5lV66qW8EmScac0b3U6z3uFK+dyGLPQLsCzsLNb/s9ZRamTfMULF+k9ab2IZaP
         2GBmTuEmmArtNhscOQoe64aQOsXhsm29PgZcwu6PivlAgtWiBlbaZ0TX8NViSGtnLnV6
         XCGbbl4+JbKwbzItV211SjGvFDW8UhsGtDZwfLHGTsrjXjmJSUGJTrotqSonlrKuhxzX
         5amEiJf83VTLfqCjTJP2nEE/L5UAPp1DgvgAGkeUncniTxsS4hPnFMuyJclc1FBBP1g/
         0fjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761230194; x=1761834994;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cXNTVYS30VFNX/nxAcwXSrix5DBuflIOXbRt+GIcMzU=;
        b=Z2WBX7WrskFPf75qc/u1ca3lXmd42/jQB7oei8gfsWLAbGCKL6IB8OZPHZhWat6duO
         NjWEwaZVHlqZuuINlZtRVjH1gUeOOBRhz8j17ycdwOyGNpDxViphg47h1hB7xxlBV1nA
         1vF10iT4T0OB9UeuDDovLJilSLJy9RY20V3iAFd5Ac0QYsCFiOYwgeQZhM1vlER5i7Ya
         GAe8ukZv0/sGT0rh7MJYC9KGtRygCpaTyhITx8C3dG8OGNqGsnvV7muPEdvoAgQsHy5k
         /gcrBht40Hk0gEVr6vGx3+JkHK68pLXNc+woZlZFSMP8/hPwaHOBGblB2WqwjGo3/QoJ
         tMKg==
X-Forwarded-Encrypted: i=1; AJvYcCX2oK+0L7Mvfh5QHDqSee2vAhq+DTFVK5hiQpJnDSCI1i/O1mCy8f1RCe0qY4yc4D2WAP+L8ybjDfd4fmiWEviPK2uY@vger.kernel.org
X-Gm-Message-State: AOJu0Ywt6Os0p/UB3cErIT7zJyX4LILmC2ye40wmrOe0xLZpPZGpQR4P
	j6SixSycywrDOMg2PKw0G/5kyTVJAIyQTKAFAF1o720V9wN7TAGMVcc+acvCen7WMep1kBPiIFr
	KSKNhqDdEr9flYYqSN+NlZ6my48Jc09awo7mZtmZ5
X-Gm-Gg: ASbGncv9KnNDwSDp84N3rBE7vm3b0wii73xQoPmH4ZC6TJakOCl/4vNeeenmtOhqt/Z
	AJfX5hoMBbxGnxU6Eoqs9xQkO1QuhPPPPv4gznfULu/w/zQDgFPHZXwdUDwkzSJ6ZQcyJCr04q6
	y4xpOJZyUQgGix66znU7nDrK6Ck+40XQczGmCvw3tLAKLJm9cxG12hlLlEByHaYh7lnRPKPZlCF
	11CvSRtTeOqqRg0TKUXGsRet75KFQvn9lKt9qESUq3jq9pF0TDRBOM2juaHGA==
X-Google-Smtp-Source: AGHT+IEwsNRvXeDDD+XmrSc/iLBDBTiJrYhaLXqZS6FAuaZGxcrkK6uq1Vmem+KIO35upB/9HHIrwdu9vYMM5bG1F6o=
X-Received: by 2002:a05:6402:2803:b0:63c:4d42:992b with SMTP id
 4fb4d7f45d1cf-63c4d429b05mr20027500a12.13.1761230191952; Thu, 23 Oct 2025
 07:36:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251002113404.3117429-1-srosek@google.com> <20251002113404.3117429-2-srosek@google.com>
 <CAJZ5v0ho8MhU8jj=YMyDKdTQWZt24LjoCaoEgJRsdi3YykkBBQ@mail.gmail.com>
In-Reply-To: <CAJZ5v0ho8MhU8jj=YMyDKdTQWZt24LjoCaoEgJRsdi3YykkBBQ@mail.gmail.com>
From: =?UTF-8?Q?S=C5=82awomir_Rosek?= <srosek@google.com>
Date: Thu, 23 Oct 2025 16:36:19 +0200
X-Gm-Features: AS18NWCCKcnrVe2CW2nVbYqluebjUROI6nTw0-aVicYPavviUkzAPbVgCIg7Gns
Message-ID: <CAF3aWvGdvHxA_fJm1EE2byL0LQUC3K2LGeDLxr3EpRzSQ=3Waw@mail.gmail.com>
Subject: Re: [PATCH v3 1/6] ACPI: DPTF: Ignore SoC DTS thermal while scanning
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Alex Hung <alexhung@gmail.com>, Hans de Goede <hansg@kernel.org>, 
	Ilpo Jarvinen <ilpo.jarvinen@linux.intel.com>, AceLan Kao <acelan.kao@canonical.com>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Zhang Rui <rui.zhang@intel.com>, 
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, Tomasz Nowicki <tnowicki@google.com>, 
	Stanislaw Kardach <skardach@google.com>, Michal Krawczyk <mikrawczyk@google.com>, 
	linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 22, 2025 at 8:33=E2=80=AFPM Rafael J. Wysocki <rafael@kernel.or=
g> wrote:
>
> On Thu, Oct 2, 2025 at 1:34=E2=80=AFPM Slawomir Rosek <srosek@google.com>=
 wrote:
> >
> > The Intel SoC DTS thermal driver on Baytrail platform uses IRQ 86 for
> > critical overheating notification. The IRQ 86 is described in the _CRS
> > control method of INT3401 device, thus Intel SoC DTS thermal driver
> > requires INT3401 device to be enumerated.
>
> I don't think that the specific interrupt number is relevant here.  It
> would be sufficient to say something like "The IRQ used by the Intel
> SoC DTS thermal device for critical overheating notification is listed
> in _CRS of device INT3401 which therefore needs to be enumerated for
> Intel SoC DTS thermal to work."

Above text is copied from the original change which is linked below.
I will rephrase it as you suggested.

>
> > Since dependency on INT3401 device is unrelated to DPTF the IS_ENABLE()
> > macro is removed from ACPI DPTF INT340X scan handler, instead Kconfig
> > is updated to ensure proper enumeration of INT3401 device.
>
> It is not entirely clear what happens in this patch after reading the
> above paragraph.
>
> I would rather continue the previous thought by saying that the
> enumeration happens by binding the int3401_thermal driver to the
> INT3401 platform device.  Thus CONFIG_INT340X_THERMAL is in fact
> necessary for enumerating it, so checking CONFIG_INTEL_SOC_DTS_THERMAL
> in int340x_thermal_handler_attach() is pointless and INT340X_THERMAL
> may as well be selected by INTEL_SOC_DTS_THERMAL.

Sure, I will rephrase it to clearly describe what happens here.

>
> > Fixes: 014d9d5d0cc1 ("ACPI/int340x_thermal: enumerate INT3401 for Intel=
 SoC DTS thermal driver")
>
> Why do you want this tag to be added?

Just for context. The IS_ENABLE is added to the scan handler in 014d9d5d0cc=
1
and this change is about to fix that. I can remove the tag if it's not need=
ed.

>
> > Signed-off-by: Slawomir Rosek <srosek@google.com>
> > ---
> >  drivers/acpi/dptf/int340x_thermal.c | 7 +------
> >  drivers/thermal/intel/Kconfig       | 3 ++-
> >  2 files changed, 3 insertions(+), 7 deletions(-)
> >
> > diff --git a/drivers/acpi/dptf/int340x_thermal.c b/drivers/acpi/dptf/in=
t340x_thermal.c
> > index a222df059a16..947fe50c2ef6 100644
> > --- a/drivers/acpi/dptf/int340x_thermal.c
> > +++ b/drivers/acpi/dptf/int340x_thermal.c
> > @@ -11,10 +11,9 @@
> >
> >  #include "../internal.h"
> >
> > -#define INT3401_DEVICE 0X01
> >  static const struct acpi_device_id int340x_thermal_device_ids[] =3D {
> >         {"INT3400"},
> > -       {"INT3401", INT3401_DEVICE},
> > +       {"INT3401"},
> >         {"INT3402"},
> >         {"INT3403"},
> >         {"INT3404"},
> > @@ -76,10 +75,6 @@ static int int340x_thermal_handler_attach(struct acp=
i_device *adev,
> >  {
> >         if (IS_ENABLED(CONFIG_INT340X_THERMAL))
> >                 acpi_create_platform_device(adev, NULL);
> > -       /* Intel SoC DTS thermal driver needs INT3401 to set IRQ descri=
ptor */
> > -       else if (IS_ENABLED(CONFIG_INTEL_SOC_DTS_THERMAL) &&
> > -                id->driver_data =3D=3D INT3401_DEVICE)
> > -               acpi_create_platform_device(adev, NULL);
> >         return 1;
> >  }
> >
> > diff --git a/drivers/thermal/intel/Kconfig b/drivers/thermal/intel/Kcon=
fig
> > index e0268fac7093..f9e275538e29 100644
> > --- a/drivers/thermal/intel/Kconfig
> > +++ b/drivers/thermal/intel/Kconfig
> > @@ -44,7 +44,8 @@ config INTEL_SOC_DTS_IOSF_CORE
> >
> >  config INTEL_SOC_DTS_THERMAL
> >         tristate "Intel SoCs DTS thermal driver"
> > -       depends on X86 && PCI && ACPI
> > +       depends on X86_64 && PCI && ACPI
>
> AFAICS NET needs to be added to the dependency list above or selecting
> INT340X_THERMAL below may not actually cause it to be built.

Right. Previously I tried to "select NET" (INTEL_SOC_DTS_THERMAL does not
depend on NET directly so it seemed to be more appropriate to me) but got
circular dependency error so I assumed it is ensured somehow. Now I checked
again and you are right, I was able to disable NET and get unmet dependenci=
es.
I will add dependency on NET. Thanks

>
> > +       select INT340X_THERMAL
> >         select INTEL_SOC_DTS_IOSF_CORE
> >         help
> >           Enable this to register Intel SoCs (e.g. Bay Trail) platform =
digital
> > --
