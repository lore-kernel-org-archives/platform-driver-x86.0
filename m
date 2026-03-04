Received: from relay10.grserver.gr (relay10.grserver.gr [37.27.248.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 576BE36CE0B
	for <platform-driver-x86@vger.kernel.org>; Wed,  4 Mar 2026 13:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.27.248.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772631648; cv=none; b=ePWDx/G1P0dPt0KDLO+kHaft+qZl4EML+A1C51qPtBeSD3G86G49ljzehLueS91SOXNMvb10f7yHvjkwc+YqQGGfCmgHkd4gVctxNVqc1gClM6o6PwLySRfNckx0VNs7ZRtvpan15dXcCDrvpnHm1smrecIBefWfwSZwC/EcGeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772631648; c=relaxed/simple;
	bh=Tl+XZg2KEt8sjUlLWGv9Jr1W45bnM4IMsmErGLjwHUY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UVqpBEZIbyKYPIAcTH47MgUx8iDW/P1Y04CZzqRtAFvY6n45UrGwZ1c0CGx9M8oligx8/wdCLMlz6vFaWscq7uog7yLo0hLdraIIpcjp4lEN5HbISMxaVkCXSzJ5vJy2F6iAH5hQKb4auzDTurNmDd6fEIndsVBirjpv8iWptrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=G0LaOjAC; arc=none smtp.client-ip=37.27.248.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="G0LaOjAC"
Received: from relay10 (localhost.localdomain [127.0.0.1])
	by relay10.grserver.gr (Proxmox) with ESMTP id 7D373424FA
	for <platform-driver-x86@vger.kernel.org>; Wed,  4 Mar 2026 15:40:45 +0200 (EET)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay10.grserver.gr (Proxmox) with ESMTPS id ADD7F424C9
	for <platform-driver-x86@vger.kernel.org>; Wed,  4 Mar 2026 15:40:44 +0200 (EET)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id 0DB141FF4E8
	for <platform-driver-x86@vger.kernel.org>; Wed,  4 Mar 2026 15:40:44 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1772631644;
	bh=p16vzcvGFQh+AWuhp3pC4w5ZF9dEp7u2DLn4e8opNPU=;
	h=Received:From:Subject:To;
	b=G0LaOjACs9bZunJDVltGPcvCFCejpIQO5Z8V6xfOFzwITRbsZrRhp8znT/gFvLIiP
	 2J75nkHPpmsbIge2dia0Dp5yP5Q4lvUHmLaWC/iZYu1K8+bxKhms1j4srsvnK1724w
	 krsZMpMu4FRJOjMpY0QaJD9ngrLjA+KGu4To5NH6yynJXHxGvRpVPL1y+r53gP5RVt
	 IH2f36YDDLfvkDyR1QuH/hvJXD5EtcQ/Ha7xmwIEk05MDOqVPqI9Uu91AEt79nwQlI
	 uL4CK7yk/TutRXtFeVF3ErJBGOAX0C0vr3RCd2LpfGiad2WoAysLR8HdWhTfN0KTlV
	 k44R7oblAi9Hg==
Authentication-Results: linux3247.grserver.gr;
        spf=pass (sender IP is 209.85.214.177) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-pl1-f177.google.com
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
Received: by mail-pl1-f177.google.com with SMTP id
 d9443c01a7336-2ae4d919f9bso20445975ad.0
        for <platform-driver-x86@vger.kernel.org>;
 Wed, 04 Mar 2026 05:40:43 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWu/3rqmBKJUL593G3fZcQQkqznyTpyAmC1TWZvl2LfG58JWlg7eMiWArijUfQRvtBJgUR4dn7rne5rm1qc3qPxjoEk@vger.kernel.org
X-Gm-Message-State: AOJu0Yz52doJUOxLtabHK1iIGFN4mMiMIF/P66syvTByF6KkidwkFp6m
	Pfm+9HvY78o5pJr2SF2mlsdo9hTTHB3JpMeP822ZYfWQ1XXmlVa3EZkoDs8rgDaIp53Vhx8ktZT
	JamwGPqlL4ojPMX6XWZ3SaUKbR02K0G4=
X-Received: by 2002:a17:902:e544:b0:2ae:3a77:a1eb with SMTP id
 d9443c01a7336-2ae6ab2ddf0mr22837545ad.39.1772631642919; Wed, 04 Mar 2026
 05:40:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260304132608.33815-1-denis.benato@linux.dev>
 <CAGwozwGhr6hwRz5jBkDGQrmJf9oK8FDE3dCE9_sAAChP5qrTGQ@mail.gmail.com>
 <a934337f-9055-40b8-93ef-294fd5f0a0f6@linux.dev>
 <CAGwozwHcABWyYRM8_n=3o2FsLBfswN4ajHOB65VNEHoOJ+Soyg@mail.gmail.com>
In-Reply-To: 
 <CAGwozwHcABWyYRM8_n=3o2FsLBfswN4ajHOB65VNEHoOJ+Soyg@mail.gmail.com>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Wed, 4 Mar 2026 14:40:31 +0100
X-Gmail-Original-Message-ID: 
 <CAGwozwE-1bk26SyUg6G1QzGXHe0ftTXfE8051cWccjvuK=+WCQ@mail.gmail.com>
X-Gm-Features: AaiRm51dT9YYjKrEbW5-vGob8YJtCE6UTBUpfEqqvuSKUM3Rab97pwtDLWNNRP0
Message-ID: 
 <CAGwozwE-1bk26SyUg6G1QzGXHe0ftTXfE8051cWccjvuK=+WCQ@mail.gmail.com>
Subject: Re: [PATCH] platform/x86: asus-wmi: do not enforce a battery charge
 threshold
To: Denis Benato <denis.benato@linux.dev>
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
	Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Luke D . Jones" <luke@ljones.dev>,
 Derek John Clark <derekjohn.clark@gmail.com>,
	Denis Benato <benato.denis96@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-PPP-Message-ID: 
 <177263164426.1824864.16767483536949191986@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.3 at linux3247.grserver.gr
X-Virus-Status: Clean

On Wed, 4 Mar 2026 at 14:39, Antheas Kapenekakis <lkml@antheas.dev> wrote:
>
> On Wed, 4 Mar 2026 at 14:37, Denis Benato <denis.benato@linux.dev> wrote:
> >
> >
> > On 3/4/26 14:30, Antheas Kapenekakis wrote:
> > > On Wed, 4 Mar 2026 at 14:26, Denis Benato <denis.benato@linux.dev> wrote:
> > >> Users are complaining for the battery limit being reset at 100% during
> > >> the boot process while the general consensus appears to not apply
> > >> unsolecited hardware changes, therefore stop resetting the battery
> > > *unsolicited. But I would rephrase to using this causes the device to
> > > reset its limits on boot, which might have been set by e.g. windows so
> > > if userspace is not aware to restore them, this causes a functionality
> > > degradation. This is the case with the current implementation by KDE.
> > >
> > >> charge limit at boot and return -ENODATA on charge_end_threshold to
> > >> signal for an unknown limit.
> > >>
> > >> Suggested-by: Antheas Kapenekakis <lkml@antheas.dev>
> > >> Suggested-by: Derek J. Clark <derekjohn.clark@gmail.com>
> > >> Signed-off-by: Denis Benato <denis.benato@linux.dev>
> > >> ---
> > >>  drivers/platform/x86/asus-wmi.c | 13 ++++++++-----
> > >>  1 file changed, 8 insertions(+), 5 deletions(-)
> > >>
> > >> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
> > >> index 6ba49bd375df..dc330a8ee2f2 100644
> > >> --- a/drivers/platform/x86/asus-wmi.c
> > >> +++ b/drivers/platform/x86/asus-wmi.c
> > >> @@ -1557,7 +1557,10 @@ static ssize_t charge_control_end_threshold_show(struct device *device,
> > >>                                                  struct device_attribute *attr,
> > >>                                                  char *buf)
> > >>  {
> > >> -       return sysfs_emit(buf, "%d\n", charge_end_threshold);
> > >> +       if ((charge_end_threshold >= 0) && (charge_end_threshold <= 100))
> > >> +               return sysfs_emit(buf, "%d\n", charge_end_threshold);
> > >> +
> > >> +       return -ENODATA;
> > > Please verify this does not cause KDE to display a warning and block
> > > modifying the energy consumption. If it does as has been my
> > > experience, communicate with KDE devs or Gnome (if it has a similar
> > > issue) and block this from merging until there is a solution from
> > > their side.
> > KDE doesn't yet allow to modify that value as upower is not picking up batteries
> > with only end_threshold by default. Discussion is ongoing:
> >
> > https://gitlab.freedesktop.org/upower/upower/-/merge_requests/308
>
> I have tested this exact patch you posted on my Z13 last November. KDE
> does pick it up and display a warning.
>
> Which is why I settled with sending a fake 100 value instead and never
> upstreamed it.

*to be clear here I did EIO, not EDATA so this might be handled differently.

> Antheas
>
> > since it has never worked there is nothing to break.
> > > Returning an error from this function when there is proper function is
> > > a slight ABI change compared to current drivers that implement this
> > > method.
> > >
> > > Thanks,
> > > Antheas
> > >
> > >>  }
> > >>
> > >>  static DEVICE_ATTR_RW(charge_control_end_threshold);
> > >> @@ -1580,11 +1583,11 @@ static int asus_wmi_battery_add(struct power_supply *battery, struct acpi_batter
> > >>                 return -ENODEV;
> > >>
> > >>         /* The charge threshold is only reset when the system is power cycled,
> > >> -        * and we can't get the current threshold so let set it to 100% when
> > >> -        * a battery is added.
> > >> +        * and we can't read the current threshold, however the majority of
> > >> +        * platforms retains it, therefore signal the threshold as unknown
> > >> +        * until user explicitly sets it to a new value.
> > >>          */
> > >> -       asus_wmi_set_devstate(ASUS_WMI_DEVID_RSOC, 100, NULL);
> > >> -       charge_end_threshold = 100;
> > >> +       charge_end_threshold = -1;
> > >>
> > >>         return 0;
> > >>  }
> > >> --
> > >> 2.53.0
> > >>
> > >>
> >

