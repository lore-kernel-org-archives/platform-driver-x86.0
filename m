Received: from relay10.grserver.gr (relay10.grserver.gr [37.27.248.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6CD934CFB8
	for <platform-driver-x86@vger.kernel.org>; Wed,  4 Mar 2026 16:08:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.27.248.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772640497; cv=none; b=VdZutv1VeOfT7hGrE1DueF7+Y9p1imjg8BgcX7mZLmUBHyxE68r9ZqQ6Fe3DcoeOvThG/OV03UKiSGn/egY143AvABpCXBqzev9aEdRBY2IXW3BJyxA5xvbmLLgX1csSEuC2V8vqaANreWQmkB4txnp9qKlRlhofJmGySmv/VUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772640497; c=relaxed/simple;
	bh=KGQWCr6/p1ZBd2wELiAeQ/rBdfyqa1r8jrnLhK9lMDI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KMCXv029QC1ssF9YUVQf04kZ+5iOPHfnP04MXdceWYHfgLJP8E0FuEQZ4K4+uuYz1p0mgSO7cejnBhSRaFHuxFL/gmoQ9JCp+k9wnynsHnRIpsR4DCwc+3t5XGkyEJYzFyVkKXRrM1pQSmxxPDSImyn1UPpxf7gM6fdSIOsHO5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=emzX4Z85; arc=none smtp.client-ip=37.27.248.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="emzX4Z85"
Received: from relay10 (localhost.localdomain [127.0.0.1])
	by relay10.grserver.gr (Proxmox) with ESMTP id 3A59D42698
	for <platform-driver-x86@vger.kernel.org>; Wed,  4 Mar 2026 18:08:14 +0200 (EET)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay10.grserver.gr (Proxmox) with ESMTPS id 3EAB2429A4
	for <platform-driver-x86@vger.kernel.org>; Wed,  4 Mar 2026 18:08:13 +0200 (EET)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id 24A8B1FF50E
	for <platform-driver-x86@vger.kernel.org>; Wed,  4 Mar 2026 18:08:12 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1772640492;
	bh=nq0G84BPiBXE3wweqIZUKfA+X3gCnBq1MFZSdSmJOGo=;
	h=Received:From:Subject:To;
	b=emzX4Z852GHZo3h530mYCxfrJtzERUmLiFBVe/9c+HH5NackGcOs4RVVkBLE26DaE
	 WHzAZaxh5qgzuBqxTfWxOrGjkxAJRaOrCYQYx+tKktVQ51JqTPAHzSo+vkGX7Kdslt
	 p6G9y+bEQtlS/9pq9cGyb+DaN9Eg8xoj3xjfnIpqwsnwmWwIn+pK7xh3DtASteKhjn
	 Kp86qPuv/KF46ZnsvphoN9vrkibg0fuubicgF+R9yvkmjiQFuTo0G7mSGOCHE9ynF8
	 XczKOf2OQZ8GQid44G2n4jfQoOFwD1y5GfjjskK3c4c59CL9bryApGKjv8hujoDMqD
	 vOoRAJYX5eqRQ==
Authentication-Results: linux3247.grserver.gr;
        spf=pass (sender IP is 209.85.216.43) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-pj1-f43.google.com
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
Received: by mail-pj1-f43.google.com with SMTP id
 98e67ed59e1d1-354a18c48b5so6134458a91.1
        for <platform-driver-x86@vger.kernel.org>;
 Wed, 04 Mar 2026 08:08:12 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCU2JMYBVqyUhrlel5/+GcVH9ZYKjWkdxQO8+gHnod4vKVVFw2iL9wO2+h9oo9Kl8JKcDcgTUWEu7djO+x9KtpJ1dZYm@vger.kernel.org
X-Gm-Message-State: AOJu0YwgNjhHyNdruOC9HWQiAWfj9QWrK8uiIoBnXWx1HRsAcLfueZTL
	xTOaA91dKavqWDwgg3SRkzQaIRz7T/CdQI750hTkfQ+9KRPm7gW4uzontZ3EdNxif/Cq0pC7YDt
	MJ1lqufmLbknpyYmPMFSIYiDTN/y9Ens=
X-Received: by 2002:a17:90b:5744:b0:356:1db4:8fe5 with SMTP id
 98e67ed59e1d1-359a6a7e738mr2164422a91.29.1772640490521; Wed, 04 Mar 2026
 08:08:10 -0800 (PST)
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
 <a9182a2e-feb0-4d5a-a32f-8de56ee66030@linux.dev>
In-Reply-To: <a9182a2e-feb0-4d5a-a32f-8de56ee66030@linux.dev>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Wed, 4 Mar 2026 17:07:59 +0100
X-Gmail-Original-Message-ID: 
 <CAGwozwH9uCev1bCZTVJ7fYt-iaST5hq+_PoZr6LNrEYg2=xz1Q@mail.gmail.com>
X-Gm-Features: AaiRm50fRl3h9gwuH5e_lGUBY42weHncP3nPor7nDzHYjgEQJJV7Fmlk_GqXwDw
Message-ID: 
 <CAGwozwH9uCev1bCZTVJ7fYt-iaST5hq+_PoZr6LNrEYg2=xz1Q@mail.gmail.com>
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
 <177264049255.2375702.11571218996061838245@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.3 at linux3247.grserver.gr
X-Virus-Status: Clean

On Wed, 4 Mar 2026 at 14:52, Denis Benato <denis.benato@linux.dev> wrote:
>
>
> On 3/4/26 14:39, Antheas Kapenekakis wrote:
> > On Wed, 4 Mar 2026 at 14:37, Denis Benato <denis.benato@linux.dev> wrote:
> >>
> >> On 3/4/26 14:30, Antheas Kapenekakis wrote:
> >>> On Wed, 4 Mar 2026 at 14:26, Denis Benato <denis.benato@linux.dev> wrote:
> >>>> Users are complaining for the battery limit being reset at 100% during
> >>>> the boot process while the general consensus appears to not apply
> >>>> unsolecited hardware changes, therefore stop resetting the battery
> >>> *unsolicited. But I would rephrase to using this causes the device to
> >>> reset its limits on boot, which might have been set by e.g. windows so
> >>> if userspace is not aware to restore them, this causes a functionality
> >>> degradation. This is the case with the current implementation by KDE.
> >>>
> >>>> charge limit at boot and return -ENODATA on charge_end_threshold to
> >>>> signal for an unknown limit.
> >>>>
> >>>> Suggested-by: Antheas Kapenekakis <lkml@antheas.dev>
> >>>> Suggested-by: Derek J. Clark <derekjohn.clark@gmail.com>
> >>>> Signed-off-by: Denis Benato <denis.benato@linux.dev>
> >>>> ---
> >>>>  drivers/platform/x86/asus-wmi.c | 13 ++++++++-----
> >>>>  1 file changed, 8 insertions(+), 5 deletions(-)
> >>>>
> >>>> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
> >>>> index 6ba49bd375df..dc330a8ee2f2 100644
> >>>> --- a/drivers/platform/x86/asus-wmi.c
> >>>> +++ b/drivers/platform/x86/asus-wmi.c
> >>>> @@ -1557,7 +1557,10 @@ static ssize_t charge_control_end_threshold_show(struct device *device,
> >>>>                                                  struct device_attribute *attr,
> >>>>                                                  char *buf)
> >>>>  {
> >>>> -       return sysfs_emit(buf, "%d\n", charge_end_threshold);
> >>>> +       if ((charge_end_threshold >= 0) && (charge_end_threshold <= 100))
> >>>> +               return sysfs_emit(buf, "%d\n", charge_end_threshold);
> >>>> +
> >>>> +       return -ENODATA;
> >>> Please verify this does not cause KDE to display a warning and block
> >>> modifying the energy consumption. If it does as has been my
> >>> experience, communicate with KDE devs or Gnome (if it has a similar
> >>> issue) and block this from merging until there is a solution from
> >>> their side.
> >> KDE doesn't yet allow to modify that value as upower is not picking up batteries
> >> with only end_threshold by default. Discussion is ongoing:
> >>
> >> https://gitlab.freedesktop.org/upower/upower/-/merge_requests/308
> > I have tested this exact patch you posted on my Z13 last November. KDE
> > does pick it up and display a warning.
> Displaying a warning about the current limit not being recognised is what
> is expected and correct behavior, not an ABI change: software isn't breaking.
>
> You talked about setting (as in writing) the limit and that, as of now
> (at least in KDE) is not possible.

This is not true. Powerdevil supports the Asus driver and has done so
for at least a year.

The setting is under "Power Management -> Advanced Power Settings". On
mainline it works properly but resets after every reboot due to this
bug.

With your patch applied, at least with -ENODATA there is no error. KDE
defaults to 50%. So perhaps this could be doable to merge, -EIO made
it fail. If you verify Gnome works properly or just does not support
battery limits, but actually verify it mind you, this should be good
to merge.

Antheas


Antheas

> There already exists widely in use software that changes the battery
> level when started setting it to the previous value, so that warning
> is not to be seen; moreover said class of software is going to earn
> a new entry so I don't see any problem here.
>
> Perhaps Ilpo has some more insights on the matter.
>
> In addition to that, after the removal from the kernel of acpi_platform
> asus-wmi ABI are going to change anyway, regardless of what I do.
> > Which is why I settled with sending a fake 100 value instead and never
> > upstreamed it.
> >
> > Antheas
> >
> >> since it has never worked there is nothing to break.
> >>> Returning an error from this function when there is proper function is
> >>> a slight ABI change compared to current drivers that implement this
> >>> method.
> >>>
> >>> Thanks,
> >>> Antheas
> >>>
> >>>>  }
> >>>>
> >>>>  static DEVICE_ATTR_RW(charge_control_end_threshold);
> >>>> @@ -1580,11 +1583,11 @@ static int asus_wmi_battery_add(struct power_supply *battery, struct acpi_batter
> >>>>                 return -ENODEV;
> >>>>
> >>>>         /* The charge threshold is only reset when the system is power cycled,
> >>>> -        * and we can't get the current threshold so let set it to 100% when
> >>>> -        * a battery is added.
> >>>> +        * and we can't read the current threshold, however the majority of
> >>>> +        * platforms retains it, therefore signal the threshold as unknown
> >>>> +        * until user explicitly sets it to a new value.
> >>>>          */
> >>>> -       asus_wmi_set_devstate(ASUS_WMI_DEVID_RSOC, 100, NULL);
> >>>> -       charge_end_threshold = 100;
> >>>> +       charge_end_threshold = -1;
> >>>>
> >>>>         return 0;
> >>>>  }
> >>>> --
> >>>> 2.53.0
> >>>>
> >>>>
>

