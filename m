Received: from relay15.grserver.gr (relay15.grserver.gr [46.62.234.254])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B554254B18
	for <platform-driver-x86@vger.kernel.org>; Sat,  9 May 2026 17:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.62.234.254
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778348147; cv=none; b=BXVikAENjtISJp7hUIIC1zkYx6WA6Zpdw+Dwvxg39xVa7CdQXL4G5Jkl8uB66aTHd6aCgXj0AumnTMo9FzjTuYBW4hRsfAzbxcJRRbJefML694D526eyncDDUis39+5Ckt7/2GyVlwR296M0dRFqIvBxrK+3tq9HAbfWfWM+xG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778348147; c=relaxed/simple;
	bh=l462U55PT64SV7/6J/PrglUYrWnvSBMER0UTA9BRUMI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HRAPRxVQtIKuHUQc6Dskrm6HrxwfQSgw4luzN6xfkS+oTbsXa2jbEemVQHvlTF6UyIrmep+QgSzDwF+BtM7qm0FdjaezIfVclSi2tmAbiehGizrOGZeiDCLEPHZtE8j0GfbvVqIenYyK/ZjERE8dyPAysB0uVVh2HjpLGGtUy+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=CWGfsEj/; arc=none smtp.client-ip=46.62.234.254
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="CWGfsEj/"
Received: from relay15 (localhost [127.0.0.1])
	by relay15.grserver.gr (Proxmox) with ESMTP id A3BA3407BD
	for <platform-driver-x86@vger.kernel.org>; Sat,  9 May 2026 17:26:10 +0000 (UTC)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay15.grserver.gr (Proxmox) with ESMTPS id EFA9D407DF
	for <platform-driver-x86@vger.kernel.org>; Sat,  9 May 2026 17:26:09 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id 3284B200788
	for <platform-driver-x86@vger.kernel.org>; Sat,  9 May 2026 20:26:09 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1778347569;
	bh=aaVLGWdALPBEsCmykSE9FJJUaBWJ7tM3Snl5Lo8yqac=;
	h=Received:From:Subject:To;
	b=CWGfsEj/D/zzuBvM5kZL+yArITWJBGNsn283ZgPsa9qWao7ohiOOFtgBCcMCuqxTc
	 yh6EryFWzHgFo8MqPZeLdoO1CcR18mwl97uCDPp7UCkEQYB+jMHyuGqOKuwV5RRZlD
	 c0UR4V9yIdKdxoIP/GS1hflyImWaZrOPIZir8DIYDmj9Tx8fh53gYJYMaaqHQ8JiBy
	 wv0ZFSE2RmBRI4thmZvuz/TsTEtfAfLh9dEgcba06EswPESBn+VXC6GLzLCza6YHOg
	 JGLvnM/hoOKTv34pG2eOspskyEaH7KU3gR0kVNTTcmj1pA4yr9x1LIS+s5iLj5mjEE
	 pMu9cuyFWPScQ==
Authentication-Results: linux3247.grserver.gr;
        spf=pass (sender IP is 209.85.214.177) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-pl1-f177.google.com
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
Received: by mail-pl1-f177.google.com with SMTP id
 d9443c01a7336-2bab82d75fdso16520895ad.2
        for <platform-driver-x86@vger.kernel.org>;
 Sat, 09 May 2026 10:26:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AFNElJ/+yI9Ib7jItsHVIUJz0K6EaTjGzX+twuzCxNfJthLa4diLCKASjug6Bw6RztpCaqsnN831iWtOkzAP5dCYLnNquAIH@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0Az+XMuwLOsxjgHsYypzozkxQEvZGELS43n/4+A825YMiIROx
	OSA/dZdgXvPYwGf2yTUVykjdMNEsSdqWlnaDqS3zXENfzmtMc9zkhG5kWzEerpmEaE/wlsNWE8s
	K/3wWVe2BfuXExC/b7VKoghXEjHjMZuA=
X-Received: by 2002:a17:903:1a28:b0:2b9:f8e9:70e2 with SMTP id
 d9443c01a7336-2bc7a990b6emr31487655ad.8.1778347567646; Sat, 09 May 2026
 10:26:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250511204427.327558-1-lkml@antheas.dev>
 <20260508184104.623016-1-derekjohn.clark@gmail.com>
In-Reply-To: <20260508184104.623016-1-derekjohn.clark@gmail.com>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Sat, 9 May 2026 19:25:54 +0200
X-Gmail-Original-Message-ID: 
 <CAGwozwFXDP+nQO8bkW01t_iSOYQ6OUQkfv35ULfHrnLjVoFZvg@mail.gmail.com>
X-Gm-Features: AVHnY4JBi-EFhXFTQHQXwlf5sV1Obpy2Ad4iTU3cNjmImPpDtrJiKAc9dKkWupo
Message-ID: 
 <CAGwozwFXDP+nQO8bkW01t_iSOYQ6OUQkfv35ULfHrnLjVoFZvg@mail.gmail.com>
Subject: Re: [PATCH v1 00/10] platform/x86: msi-wmi-platform: Add fan
 curves/platform profile/tdp/battery limiting
To: "Derek J. Clark" <derekjohn.clark@gmail.com>
Cc: W_Armin@gmx.de, corbet@lwn.net, hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com, jdelvare@suse.com, kuurtb@gmail.com,
	linux-doc@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux@roeck-us.net,
	platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-PPP-Message-ID: 
 <177834756942.2678409.4588365212368582963@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.3 at linux3247.grserver.gr
X-Virus-Status: Clean

On Fri, 8 May 2026 at 20:41, Derek J. Clark <derekjohn.clark@gmail.com> wrote:
>
> >This draft patch series brings into parity the msi-wmi-platform driver with
> >the MSI Center M Windows application for the MSI Claw (all models).
> >Unfortunately, MSI Center M and this interface do not have a discovery API,
> >necessitating the introduction of a quirk system.
> >
> >While this patch series is fully functional and tested, there are still
> >some issues that need to be addressed:
> >  - Armin notes we need to disable fan curve support by default and quirk
> >    it as well, as it is not supported on all models. However, the way
> >    PWM enable ops work, this makes it a bit difficult, so I would like
> >    some suggestions on how to rework this.
> >  - It turns out that to fully disable the fan curve, we have to restore
> >    the default fan values. This is also what is done on the OEM software.
> >    For this, the last patch in the series is used, which is a bit dirty.
> >
> >Sleep was tested with all values being preserved during S0iX (platform
> >profile, fan curve, PL1/PL2), so we do not need suspend/resume hooks, at
> >least for the Claw devices.
> >
> >For PL1/PL2, we use firmware-attributes. So for that I +cc Kurt since if
> >his new high level interface is merged beforehand, we can use that instead.
> >
>
> Hi Antheas,
>
> It seems this series is stalled for 3 days shy of a year now. I have an
> interest in getting this across the finish line. Will you be continuing
> development? If not, I will take what you've started here and finish out
> the remaining nits, keeping your original attribution of course.

Hi,
I plan to get back to this after the standby rfc is in a good place.
There are some issues with this series that need resolving, MSI
firmware is a lot more varied and unstable than other OEMs which make
it hard to pin down to a defined ABI.

For V2, we'd need to look into testing into at least some laptops to
verify shift mode behavior

Antheas

> Cheers,
> Derek
>
> >Antheas Kapenekakis (8):
> >  platform/x86: msi-wmi-platform: Add unlocked msi_wmi_platform_query
> >  platform/x86: msi-wmi-platform: Add quirk system
> >  platform/x86: msi-wmi-platform: Add platform profile through shift
> >    mode
> >  platform/x86: msi-wmi-platform: Add PL1/PL2 support via firmware
> >    attributes
> >  platform/x86: msi-wmi-platform: Add charge_threshold support
> >  platform/x86: msi-wmi-platform: Drop excess fans in dual fan devices
> >  platform/x86: msi-wmi-platform: Update header text
> >  platform/x86: msi-wmi-platform: Restore fan curves on PWM disable and
> >    unload
> >
> >Armin Wolf (2):
> >  platform/x86: msi-wmi-platform: Use input buffer for returning result
> >  platform/x86: msi-wmi-platform: Add support for fan control
> >
> > .../wmi/devices/msi-wmi-platform.rst          |   26 +
> > drivers/platform/x86/Kconfig                  |    3 +
> > drivers/platform/x86/msi-wmi-platform.c       | 1181 ++++++++++++++++-
> > 3 files changed, 1156 insertions(+), 54 deletions(-)
> >
> >
> >base-commit: 62b1dcf2e7af3dc2879d1a39bf6823c99486a8c2
>

