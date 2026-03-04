Received: from relay12.grserver.gr (relay12.grserver.gr [88.99.38.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63B151A681F
	for <platform-driver-x86@vger.kernel.org>; Wed,  4 Mar 2026 13:39:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=88.99.38.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772631601; cv=none; b=dCtRYoHkdwMWNL6ypqF/avcI+mmoVQGWsf8QrVxMZfKVHRXrMo7M3xdJPDINfzN2PKQM744iJ9cM/tJ1PDYR/gcxrGJoZtyWULzi8a9FI09TFvjuxySnA25UQu+He6lDSxCHAFeTaMR5ItKxIZK3LdMw+afhkKDjd1c60PKjHno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772631601; c=relaxed/simple;
	bh=cz9NeKkpZfT8YiAIqKTtDBQchIPs+kqtNsAECODjNlA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HLZc30w5P4B810O7R4am7tnEdBtGr1ET8HgHUrJvKmuhWb9/zSb7vU5hOZi3G6XoTmXj5bGCzFc/ywjgtPMr1cwxueJphY5GFH8U6oUxlW9D72KrJpAkPIJRLOcinPpMqcyyCKYpTwsnaaji2PIE7HzLT+MnzLmBqDuLHzz/8o4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=oWT+rGmn; arc=none smtp.client-ip=88.99.38.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="oWT+rGmn"
Received: from relay12 (localhost [127.0.0.1])
	by relay12.grserver.gr (Proxmox) with ESMTP id 74083BC14F
	for <platform-driver-x86@vger.kernel.org>; Wed,  4 Mar 2026 15:39:56 +0200 (EET)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay12.grserver.gr (Proxmox) with ESMTPS id 9F06DBC165
	for <platform-driver-x86@vger.kernel.org>; Wed,  4 Mar 2026 15:39:55 +0200 (EET)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id 0FC7C1FF517
	for <platform-driver-x86@vger.kernel.org>; Wed,  4 Mar 2026 15:39:55 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1772631595;
	bh=1ijCBF5NpxztTAGYQfXEid5o7Z1mlHiaYCJdjcER5WU=;
	h=Received:From:Subject:To;
	b=oWT+rGmnJoszV2qNU1AVicnNZofXsoH1hjwLDYijXlKYYsBC7xltUH7aKhVslPyVQ
	 +GzXLtUqO3LUpe1ShjTihyH7oSRO+QQSPpv3WQLaM5t50gg6/8hQ9orPtf1xKtYbKQ
	 LJA1HZUayBR9cnL8Gt/CzdqcBrz9uwmtbzROESfkfVaUQ+jUWnO63wPQBEm6RVcR1j
	 DDKysiv6LmiwZpEtZuLBEmHQlWgbfZCXuC4qrLUift1D/hb2TFZvsyV7/8f+yDkDtj
	 OVJrg+Kfv4L9Xb4MiEZz7zhl7bCWqzyqDWqvC+yOJsGuhhK/LRYDtU/Ok07AvnL0W0
	 OEf2npWuWLWDg==
Authentication-Results: linux3247.grserver.gr;
        spf=pass (sender IP is 209.85.210.180) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-pf1-f180.google.com
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
Received: by mail-pf1-f180.google.com with SMTP id
 d2e1a72fcca58-82418b0178cso3906329b3a.1
        for <platform-driver-x86@vger.kernel.org>;
 Wed, 04 Mar 2026 05:39:54 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXVFQn59mF617L9UC9OAF8s0UStXezp6+2+mCQHlMjK3xD7lsOsoAOyGxv/oqSWE63Vz0YitWBc3aLREQm4QoyYG3ZU@vger.kernel.org
X-Gm-Message-State: AOJu0YyQAJdE4zjhw0U8+vs6uJqJBI9ogT2fpnAkMwpuTsjz0hCwIjoY
	Bhb4/7v+KD6dvrcJLI/HgFuBiQCwF65sYGJl4asDJ6Fwu/23UgDqg0ipJuilwTrTV/dLraBQilP
	GmshH11GWIs4Mxn9qZsNnqO8CV4doKPQ=
X-Received: by 2002:a17:90b:4b47:b0:341:315:f4ed with SMTP id
 98e67ed59e1d1-359a69c7705mr1929044a91.10.1772631593674; Wed, 04 Mar 2026
 05:39:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260304132608.33815-1-denis.benato@linux.dev>
 <CAGwozwGhr6hwRz5jBkDGQrmJf9oK8FDE3dCE9_sAAChP5qrTGQ@mail.gmail.com>
 <a934337f-9055-40b8-93ef-294fd5f0a0f6@linux.dev>
In-Reply-To: <a934337f-9055-40b8-93ef-294fd5f0a0f6@linux.dev>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Wed, 4 Mar 2026 14:39:41 +0100
X-Gmail-Original-Message-ID: 
 <CAGwozwHcABWyYRM8_n=3o2FsLBfswN4ajHOB65VNEHoOJ+Soyg@mail.gmail.com>
X-Gm-Features: AaiRm53uoDnrz14jCFieN7NkenHDqkn20VZKHHJKUiTGZ1Ft-9q2ardZbqcq4G8
Message-ID: 
 <CAGwozwHcABWyYRM8_n=3o2FsLBfswN4ajHOB65VNEHoOJ+Soyg@mail.gmail.com>
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
 <177263159529.1820449.13733273942650596671@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.3 at linux3247.grserver.gr
X-Virus-Status: Clean

On Wed, 4 Mar 2026 at 14:37, Denis Benato <denis.benato@linux.dev> wrote:
>
>
> On 3/4/26 14:30, Antheas Kapenekakis wrote:
> > On Wed, 4 Mar 2026 at 14:26, Denis Benato <denis.benato@linux.dev> wrote:
> >> Users are complaining for the battery limit being reset at 100% during
> >> the boot process while the general consensus appears to not apply
> >> unsolecited hardware changes, therefore stop resetting the battery
> > *unsolicited. But I would rephrase to using this causes the device to
> > reset its limits on boot, which might have been set by e.g. windows so
> > if userspace is not aware to restore them, this causes a functionality
> > degradation. This is the case with the current implementation by KDE.
> >
> >> charge limit at boot and return -ENODATA on charge_end_threshold to
> >> signal for an unknown limit.
> >>
> >> Suggested-by: Antheas Kapenekakis <lkml@antheas.dev>
> >> Suggested-by: Derek J. Clark <derekjohn.clark@gmail.com>
> >> Signed-off-by: Denis Benato <denis.benato@linux.dev>
> >> ---
> >>  drivers/platform/x86/asus-wmi.c | 13 ++++++++-----
> >>  1 file changed, 8 insertions(+), 5 deletions(-)
> >>
> >> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
> >> index 6ba49bd375df..dc330a8ee2f2 100644
> >> --- a/drivers/platform/x86/asus-wmi.c
> >> +++ b/drivers/platform/x86/asus-wmi.c
> >> @@ -1557,7 +1557,10 @@ static ssize_t charge_control_end_threshold_show(struct device *device,
> >>                                                  struct device_attribute *attr,
> >>                                                  char *buf)
> >>  {
> >> -       return sysfs_emit(buf, "%d\n", charge_end_threshold);
> >> +       if ((charge_end_threshold >= 0) && (charge_end_threshold <= 100))
> >> +               return sysfs_emit(buf, "%d\n", charge_end_threshold);
> >> +
> >> +       return -ENODATA;
> > Please verify this does not cause KDE to display a warning and block
> > modifying the energy consumption. If it does as has been my
> > experience, communicate with KDE devs or Gnome (if it has a similar
> > issue) and block this from merging until there is a solution from
> > their side.
> KDE doesn't yet allow to modify that value as upower is not picking up batteries
> with only end_threshold by default. Discussion is ongoing:
>
> https://gitlab.freedesktop.org/upower/upower/-/merge_requests/308

I have tested this exact patch you posted on my Z13 last November. KDE
does pick it up and display a warning.

Which is why I settled with sending a fake 100 value instead and never
upstreamed it.

Antheas

> since it has never worked there is nothing to break.
> > Returning an error from this function when there is proper function is
> > a slight ABI change compared to current drivers that implement this
> > method.
> >
> > Thanks,
> > Antheas
> >
> >>  }
> >>
> >>  static DEVICE_ATTR_RW(charge_control_end_threshold);
> >> @@ -1580,11 +1583,11 @@ static int asus_wmi_battery_add(struct power_supply *battery, struct acpi_batter
> >>                 return -ENODEV;
> >>
> >>         /* The charge threshold is only reset when the system is power cycled,
> >> -        * and we can't get the current threshold so let set it to 100% when
> >> -        * a battery is added.
> >> +        * and we can't read the current threshold, however the majority of
> >> +        * platforms retains it, therefore signal the threshold as unknown
> >> +        * until user explicitly sets it to a new value.
> >>          */
> >> -       asus_wmi_set_devstate(ASUS_WMI_DEVID_RSOC, 100, NULL);
> >> -       charge_end_threshold = 100;
> >> +       charge_end_threshold = -1;
> >>
> >>         return 0;
> >>  }
> >> --
> >> 2.53.0
> >>
> >>
>

