Received: from relay14.grserver.gr (relay14.grserver.gr [46.224.16.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D528289374
	for <platform-driver-x86@vger.kernel.org>; Fri, 31 Oct 2025 16:49:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.224.16.114
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761929392; cv=none; b=DDQBOuQLKZt2G007nkl2io0XuVpG5RLackNZryqzpwGd5oURnULexResLJN4hcmKLBlMqW3xPUdOmbRIqAyNna/UyF457cKBNsydaJ12MXh66B/QhweA4iGzHN2Xvdhg6mOv0RruRUDbyogtgYXVFJNZe9I7izN7cETtK9wmvnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761929392; c=relaxed/simple;
	bh=zw219W18LgFFE6vAAo7kJ6btjN9QIq5zM4msIcZQamg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O3X+LmM/KCZiAYPvvZnzlIat17OPHa66/59XulFcqPGGqfByctchpn5W8/+UOPTeRftLPvT4l5XYX3iFQsZ3AA7og3uOR66u4NQjE/XAQ3huvmUpn63P4srZnyevsvhF7iKreWaJsMk6JLBz+5vMrUJLP0wNPbKDqeCM21kmiiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=temperror (0-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=ELzERRqx; arc=none smtp.client-ip=46.224.16.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror (0-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="ELzERRqx"
Received: from relay14 (localhost [127.0.0.1])
	by relay14.grserver.gr (Proxmox) with ESMTP id 1158E44A1D
	for <platform-driver-x86@vger.kernel.org>; Fri, 31 Oct 2025 16:40:13 +0000 (UTC)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay14.grserver.gr (Proxmox) with ESMTPS id A12DC44A77
	for <platform-driver-x86@vger.kernel.org>; Fri, 31 Oct 2025 16:40:08 +0000 (UTC)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id B5CAA200C0A
	for <platform-driver-x86@vger.kernel.org>; Fri, 31 Oct 2025 18:40:07 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1761928808;
	bh=JoOwSrcBq5jLxIFWCjRANgtivw2gG0REIltdeGV6Kzk=;
	h=Received:From:Subject:To;
	b=ELzERRqxHJCrpbupjyXeg0LD2EuFg3DvUMMvXkWGiujT5ow5ojtfzFnoXzt1wo7cF
	 JZNXpRNn/Tau0ODzNmEO8KzvbZwtv/NlV0gbap3qEwAWD+hJla1zPnVuEL3HZzj0Tq
	 N0MYTwkJEAq2u3++XjEHsAGJunVSRHYquGdpZMV7TKJuSpOuiGyPhAKxxIgOG4dHlX
	 r4v9gAbuvwrhuRtyvJZ1f4VEt6/LbrbQWA2Cc7M9S3VLEU2AVXAbV//45NslWNJzaw
	 rz6YYEswx1cu9KBTzXsa/xmHlc7UQ5Y9qc8yW9yBoLoTVwJ6HqGrC6i1MItEy0hUyg
	 7MmjPWA4nwxCA==
Authentication-Results: linux3247.grserver.gr;
        spf=pass (sender IP is 209.85.208.173) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-lj1-f173.google.com
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
Received: by mail-lj1-f173.google.com with SMTP id
 38308e7fff4ca-3637d6e9923so23479451fa.3
        for <platform-driver-x86@vger.kernel.org>;
 Fri, 31 Oct 2025 09:40:07 -0700 (PDT)
X-Gm-Message-State: AOJu0YxAWxeW/dZURiYjzQPz34G4oG5i2GRUR/iprhUfX2fQSNMaECJU
	fvEh27ek7X2a2rUBQU+u46CysxV5cJK/hV2tamXp10Ak+mH/cKujTtnYDJb+C8soJEFbNS3B21X
	pbnHqBmKyzt2m83LwIkENI4yeRScjNt4=
X-Google-Smtp-Source: 
 AGHT+IH6AWjSuHaInIm0nEaTUw67TYwrKFC0ib1ZvzEB0C+g8y8XDd3GvP7msJdHtVTgvW72dpasvK7Jc9M8nH2JlYY=
X-Received: by 2002:a05:651c:a05:b0:378:e84c:d159 with SMTP id
 38308e7fff4ca-37a18d84c82mr13312961fa.5.1761928807299; Fri, 31 Oct 2025
 09:40:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251031163651.1465981-1-lkml@antheas.dev>
 <CAGwozwHk_wrS8zVRb9-QKpY5TrV1pkksxG5uO9-Db36N7RDo6A@mail.gmail.com>
In-Reply-To: 
 <CAGwozwHk_wrS8zVRb9-QKpY5TrV1pkksxG5uO9-Db36N7RDo6A@mail.gmail.com>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Fri, 31 Oct 2025 17:39:56 +0100
X-Gmail-Original-Message-ID: 
 <CAGwozwF_zKe-CrB5j=4zP4ADw=jPgDM5CgKRnsXg=e5g=gf-Fw@mail.gmail.com>
X-Gm-Features: AWmQ_bm8PMR-QJiyGAOvl8VodkxitKuMVI1Ww5PRamPGe3pxe2Gimcpb2vrMLOg
Message-ID: 
 <CAGwozwF_zKe-CrB5j=4zP4ADw=jPgDM5CgKRnsXg=e5g=gf-Fw@mail.gmail.com>
Subject: Re: [PATCH v3 0/6] platform/x86: ayaneo-ec: Add Ayaneo Embedded
 Controller platform driver
To: platform-driver-x86@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
	Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Derek John Clark <derekjohn.clark@gmail.com>,
	=?UTF-8?Q?Joaqu=C3=ADn_Ignacio_Aramend=C3=ADa?= <samsagax@gmail.com>,
	Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
X-PPP-Message-ID: 
 <176192880815.3962639.14408863855153075277@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.3 at linux3247.grserver.gr
X-Virus-Status: Clean

On Fri, 31 Oct 2025 at 17:38, Antheas Kapenekakis <lkml@antheas.dev> wrote:
>
> On Fri, 31 Oct 2025 at 17:36, Antheas Kapenekakis <lkml@antheas.dev> wrote:
> >
> > This series introduces a platform driver for Ayaneo devices, ayaneo-ec.
> > This driver provides hwmon support, power management, and module management
> > (for the new Ayaneo 3 device). Module management is done through the new
> > firmware attributes sysfs interface.
>
> I resent this as V3 didnt I. Mmmm

No, it's correct. I redid the fixes and got confused by the changelog.

>
> >
> > Luckily, all Ayaneo devices with an ACPI mapped EC use the same registers.
> > Older devices also use a memory mapped region for RGB[1], but that is
> > replaced by HID in the new Ayaneo 3. Therefore, this allows for a simple
> > driver design that provides robust future support. The memory mapped region
> > can be upstreamed as a different RGB driver in the future or remain
> > out-of-tree[1].
> >
> > This change also allows cleaning up the oxpec driver, by removing Ayaneo
> > devices from it. In parallel, charge limiting is added for these devices.
> >
> > [1] https://github.com/ShadowBlip/ayaneo-platform
> >
> > ---
> >
> > V3: https://lore.kernel.org/all/20251015084414.1391595-1-lkml@antheas.dev/
Ignore V3 here

> > V2: https://lore.kernel.org/all/20251015084414.1391595-1-lkml@antheas.dev/
> > V1: https://lore.kernel.org/all/20250820160628.99678-1-lkml@antheas.dev/
> >
> > Changes since V3:
> >   - Fix various non-functional nits
> >   - On hibernation restore, use restore instead of thaw, switch to bools,
> >     and restore fan pwm mode, but only after the first pwm write after
> >     hibernation. Also, release pwm when entering hibernation.
> >
> > Changes since V2:
> >   - Remove i counter from suspend hook by hardcoding the index
> >     (we already allocate the maximum size for the cache anyway)
> >   - Rename quirks to end in quirks
> >   - Add missing includes to controller sysfs patch, use switch statement
Ignore the V2 changelog, treat v3 as v2

> >
> > Changes since V1:
> >   - Use plain sysfs attrs for magic module attributes
> >   - Combine quirk for power and modules, so attribute tree is simpler
> >   - Use switch statement in hwmon
> >   - Add hibernation hook for charge bypass in last patch
> >     - Restoring fan speed is a liability so it is omitted, see patch notes
> >       Note that for EC managed fan curves, it would be acceptable
> >     - Regmap comment: Using regmap is unprecedented for ACPI mapped ECs
> >       and overkill for one value (> 100 LOC)
> >   - fixp_linear_interpolate() comment: it requires importing an extra header,
> >     is not used for static parameters in other modules, and expands to the
> >     same equation for parameters used, so it is omitted
> >
> > Antheas Kapenekakis (6):
> >   platform/x86: ayaneo-ec: Add Ayaneo Embedded Controller platform
> >     driver
> >   platform/x86: ayaneo-ec: Add hwmon support
> >   platform/x86: ayaneo-ec: Add charge control support
> >   platform/x86: ayaneo-ec: Add controller power and modules attributes
> >   platform/x86: ayaneo-ec: Move Ayaneo devices from oxpec to ayaneo-ec
> >   platform/x86: ayaneo-ec: Add suspend hook
> >
> >  .../ABI/testing/sysfs-platform-ayaneo-ec      |  19 +
> >  MAINTAINERS                                   |   7 +
> >  drivers/platform/x86/Kconfig                  |  16 +-
> >  drivers/platform/x86/Makefile                 |   3 +
> >  drivers/platform/x86/ayaneo-ec.c              | 582 ++++++++++++++++++
> >  drivers/platform/x86/oxpec.c                  | 115 +---
> >  6 files changed, 625 insertions(+), 117 deletions(-)
> >  create mode 100644 Documentation/ABI/testing/sysfs-platform-ayaneo-ec
> >  create mode 100644 drivers/platform/x86/ayaneo-ec.c
> >
> >
> > base-commit: 211ddde0823f1442e4ad052a2f30f050145ccada
> > --
> > 2.51.1
> >
> >

