Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D888E2C2377
	for <platform-driver-x86@vger.kernel.org>; Mon, 15 Sep 2025 17:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757956404; cv=none; b=Oa9Tr3woMsLDEDHZJmiSqoIT+S1YhbSfMWzlP1CHNcTexZxcuiCI/ha77N0nEZYjrkFKO8KJXHOIX3S1KxIgCwj0NZXykmQZe+mkZoncGlCSXG3zFDaad0bGJ6YLC5h90f0194oW8MQJLMccJv4xrMLMvC1jbQGMU9kosm0F3H0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757956404; c=relaxed/simple;
	bh=1oSp1s0dFry3KNYp3t9vHFsIxz86SXd/EE0jv4U2ShE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TjLhv5qoUffNGub1V//evnD+cXUpOZnhko1Xio0sgJQk63rrCG8skoLPEjCDfqzfsW6pi11twXjBQehJkRlv4WXVziTyi6/xZkWvhp3PVE4fFPh6xjNOE4P74ucEZQBtMpxREmz1OfzkHBTMHrFvnI4esfENIFteZDGOuqMSVHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=xoJByf5d; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="xoJByf5d"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-62f330eeb86so2406223a12.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 15 Sep 2025 10:13:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1757956399; x=1758561199; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eVk/IwWAagDw/u1je9emE3yqPayy79NxUJ1XU+JfvRM=;
        b=xoJByf5d4GagcSUYVtcl7PhxMZ6j2dVqBXHnQ0zSJHMG2fO761p7IPpyJ794c7F7Ff
         /4vn2/Idmq0QMqv+g5zHC+X1L51ns47VP+qhGiX6X7nozvoeXvkKS3hAtwPz2RRyjv1e
         eIfZ3QHDu8wBxuAtDD96JBVfww6FTtYy99x4NEquo+qnaS/3Xti89TOJVGP8lgYl8rTu
         cA68XVwGJmSqyD8ggnLRQcGSHsUwjg/oCbd+4X7/UmCL5fJefipDnBy+kChALQrWpwJJ
         lkVI267JgIPx7hUattrxdtQljUve1GXe8tQS90OelY9FVplM3wzVheJn2e7xy7F8Pwvg
         IYHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757956399; x=1758561199;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eVk/IwWAagDw/u1je9emE3yqPayy79NxUJ1XU+JfvRM=;
        b=vWfirODWFBxFz6iTvD8bCwn+7JB7JK8NF6R+jkIuazD8ci8gtzt4rV+dZYY4hfGpJG
         OToFjGQxu6R8POTiguqakmAwD44hBoMj4wefNf40lJsD6OUmfOj099YWnBMfoZ0x4w44
         BBlLFqB9QlwiMbKZUpzjXR+8fhrSXTpv6fJAHl/SO0Ug1/kBW9sgMB6Ofv4tOSiEzJgl
         Fa9YHG8bjPZbqXADBeBRlhlAo4kqTo/KwP4OxyH9AGyVtA/Ro+T5c5hvtM5bILdGJxXN
         0sJRggBdLK+OIGo8ACkcsLSH3xa+zZ1Nt9MppiNI5K/0Lg1UOwm7VkC+j9SWBoVFfFb4
         ZogQ==
X-Forwarded-Encrypted: i=1; AJvYcCVKiD37WMntg9JlU6yK4/d04q27gT+zmTouO2PbQmXLRdBL3TtX+Aey1yuOYsnt8wkvNOqtwAkFQDWttlz6Av9FwFDI@vger.kernel.org
X-Gm-Message-State: AOJu0YyjeqnSgFx4vG8fu9IB/b3nmViormW27zqFYlMgtcrv6ghPHQjl
	wS+EM4ZZzyBPwzbLf1ykd1fX0QgWfDOKKhaoJyolX9rOhCgUFuYnLokOU6zF1qmWbLvohx4eiTU
	K4h4AyrQPHg+QxcEuH+EPk6uJ5qwwq8gASAZfL+iu
X-Gm-Gg: ASbGncs4BerB/GL9Vh81Jd0qpFWppGprOIe9iC9jTXOXmuIo9ha+d6g0Z47O8KUbZtg
	UpjGXUVAN8LqL/cMiYsKY//SZW+G48+nr2fHR7BZaP6pTD3duZ7ZYYgRTwVxYgMk7JqF0bEAdYZ
	jPrX2aMuhfbIfqf9+Nigp5ZYRcwR3KlHAAQQqKB3PjuMF0pGQEvkJI3zsh+44/X/1DkZSacXS0y
	0dBevbQDcpKBLEOCrqRs+dPdJ96vtc+BpMoRl1khu2OMWPjzOfuj4d1dChOdkXvTQ==
X-Google-Smtp-Source: AGHT+IE9e1EULEJI4AgWzyYm2QJwTZpaG4jJtqmkHHf2fi6cZM9VIHvmyy6TtgCQIkqVmW1MbSDhcupuqSDyBvZva/A=
X-Received: by 2002:a05:6402:3587:b0:62f:2ac2:af41 with SMTP id
 4fb4d7f45d1cf-62f2ac2b11amr5417351a12.38.1757956398793; Mon, 15 Sep 2025
 10:13:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250830053404.763995-1-srosek@google.com> <CAJZ5v0hShKgPB42p4dOgKoRuMCkGhe+ZHMeAuFQO0Soa1ty_LQ@mail.gmail.com>
In-Reply-To: <CAJZ5v0hShKgPB42p4dOgKoRuMCkGhe+ZHMeAuFQO0Soa1ty_LQ@mail.gmail.com>
From: =?UTF-8?Q?S=C5=82awomir_Rosek?= <srosek@google.com>
Date: Mon, 15 Sep 2025 19:13:07 +0200
X-Gm-Features: AS18NWCkhZDDdsM_oejLGVUXgZHAFu-N6GJOxDZIp7NmOXFFGPj3C2juSnvyHaI
Message-ID: <CAF3aWvHTXiODVE72Q33KDS51j4QA7gXVSsvdRnvsHdBv4NzCfw@mail.gmail.com>
Subject: Re: [PATCH v1 00/12] ACPI: DPTF: Move INT340X enumeration from DPTF
 core to thermal drivers
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

Hi Rafael,

First of all I would like to apologize for the late reply and thank
you for your comments.

On Mon, Sep 1, 2025 at 10:49=E2=80=AFAM Rafael J. Wysocki <rafael@kernel.or=
g> wrote:
>
> On Sat, Aug 30, 2025 at 7:34=E2=80=AFAM Slawomir Rosek <srosek@google.com=
> wrote:
> >
> > The Intel Dynamic Platform and Thermal Framework (DPTF) relies on
> > the INT340X ACPI device objects. The temperature information and
> > cooling ability are exposed to the userspace via those objects.
> >
> > Since kernel v3.17 the ACPI bus scan handler is introduced to prevent
> > enumeration of INT340X ACPI device objects on the platform bus unless
> > related thermal drivers are enabled. However, using the IS_ENABLED()
> > macro in the ACPI scan handler forces the kernel to be recompiled
> > when thermal drivers are enabled or disabled, which is a significant
> > limitation of its modularity. The IS_ENABLED() macro is particularly
> > problematic for the Android Generic Kernel Image (GKI) project which
> > uses unified core kernel while SoC/board support is moved to loadable
> > vendor modules.
> >
> > This patch set moves enumeration of INT340X ACPI device objects on
> > the platform bus from DPTF core to thermal drivers. It starts with
> > some code cleanup and reorganization to eventually remove IS_ENABLED()
> > macro from the ACPI bus scan handler. Brief list of changes is listed
> > below:
> >
> > 1) Remove SOC DTS thermal driver case from the ACPI scan handler
> >    since its dependency on INT340X driver is unrelated to DPTF
> > 2) Move all INT340X ACPI device ids to the common header and update
> >    the DPTF core and thermal drivers accordingly
> > 3) Move dynamic enumeration of ACPI device objects on the platform bus
> >    from the intel-hid and intel-vbtn drivers to the ACPI platform core
> > 4) Move enumeration of INT340X ACPI device objects on the platform bus
> >    from DPTF core to thermal drivers using ACPI platform core methods
> >
> >
> > Slawomir Rosek (12):
> >   ACPI: DPTF: Ignore SoC DTS thermal while scanning
> >   ACPI: DPTF: Move INT3400 device IDs to header
> >   ACPI: DPTF: Move INT3401 device IDs to header
> >   ACPI: DPTF: Move INT3402 device IDs to header
> >   ACPI: DPTF: Move INT3403 device IDs to header
> >   ACPI: DPTF: Move INT3404 device IDs to header
> >   ACPI: DPTF: Move INT3406 device IDs to header
> >   ACPI: DPTF: Move INT3407 device IDs to header
>
> Please avoid sending multiple patches with the same subject,
> especially in one patch series.
>
> Thanks!
>

The subjects are quite similar but they are not exactly the same.

Originally the ACPI bus scan handler was added in 3230bbfce8a9
("ACPI: introduce ACPI int340x thermal scan handler") to prevent
enumeration of ACPI device objects in range INT3401~INT340B
and only the INT3400 master device had their platform driver added
in 816cab931f28 ("Thermal: introduce int3400 thermal driver").

These days, however, each of INT3400~INT3407 device ID, representing
a different kind of thermal device, has its own platform driver.
Most of them, depending on X Lake generation, can also be enumerated
on the ACPI bus using INTC1XXXX device ID. In addition INT3408~INT340B
and some of The Wildcat Lake device IDs are not supported by any
platform driver.

To make the review process easier and minimize the risk of mistakes
I decided to create separe patch for each ID in range INT3400~INT3407.
The INT3400, INT3404 and INT3407 device ID can probably be renamed to
Thermal Core, Fan and Power device ID, respectively, but I am not sure
about the others.

Alternatively they can be squashed into a single patch which moves
all INT340X device IDs to the common header.

Please let me know which way is better.

Thanks, regards
Slawek

> >   ACPI: DPTF: Move PCH FIVR device IDs to header
> >   ACPI: DPTF: Remove not supported INT340X IDs
> >   ACPI: platform: Add macro for acpi platform driver
> >   ACPI: DPTF: Move INT340X enumeration to modules
> >
> >  drivers/acpi/acpi_platform.c                  | 27 +++++++
> >  drivers/acpi/dptf/dptf_pch_fivr.c             | 10 +--
> >  drivers/acpi/dptf/dptf_power.c                | 20 +----
> >  drivers/acpi/dptf/int340x_thermal.c           | 76 ++++---------------
> >  drivers/acpi/fan.h                            | 10 +--
> >  drivers/acpi/fan_core.c                       |  2 +-
> >  drivers/acpi/int340x_thermal.h                | 76 +++++++++++++++++++
> >  drivers/platform/x86/intel/hid.c              | 41 +---------
> >  drivers/platform/x86/intel/vbtn.c             | 30 +-------
> >  drivers/thermal/intel/Kconfig                 |  1 +
> >  .../intel/int340x_thermal/int3400_thermal.c   | 12 +--
> >  .../intel/int340x_thermal/int3401_thermal.c   |  5 +-
> >  .../intel/int340x_thermal/int3402_thermal.c   |  5 +-
> >  .../intel/int340x_thermal/int3403_thermal.c   | 12 +--
> >  .../intel/int340x_thermal/int3406_thermal.c   |  5 +-
> >  include/linux/platform_device.h               | 17 +++++
> >  16 files changed, 161 insertions(+), 188 deletions(-)
> >  create mode 100644 drivers/acpi/int340x_thermal.h
> >
> > --
