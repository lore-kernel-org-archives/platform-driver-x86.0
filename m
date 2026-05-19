Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE4B01F09AD
	for <platform-driver-x86@vger.kernel.org>; Tue, 19 May 2026 16:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779206755; cv=pass; b=UxOtSBIQqsw+8XmCz/6mWXz+/Qn2PAqoQwItMWdXRTItLFaK4NPEjlfDXmE/sjLXRx3nbPCgI3ILKx4gcfV8sN/jzC0NMBY+2qLVqBsblat5Hh+Bwk8YEw2cw1Ufy2Yu/3k1RUr9eV6F8G0M/jr3B92+CDv3dm1MapnqLegqpfQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779206755; c=relaxed/simple;
	bh=mJd39/ynfjB0qJnJpbLk+AVP3ZZjNFk5TIdb6ou/hbA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i2pDxkuZqkJ4nYzNkxAG5G53WVFItqA3TbcsIth8dLmeSIQJpEUWLpet3wHstNX0Z35fNX76uXhNhyXDqkDM6h3PHz/Myu2Liptst3/j1SJiLB+br6X9vE+o7kpoxBaNO4LPQnGSgkK7vw82CDiAnaUI1XU0N5X1fk2hP2fELis=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o2uQi0Bs; arc=pass smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o2uQi0Bs"
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-8b4298d271fso83292876d6.3
        for <platform-driver-x86@vger.kernel.org>; Tue, 19 May 2026 09:05:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779206753; cv=none;
        d=google.com; s=arc-20240605;
        b=OrXbXkv1tNcJH2Xlb/PUFijoCNX3V3esWNrKsCNONLnAOGt07jsPLGe8kPSp9vw+6p
         TJqvM1ny8NusJ8Pit5pUMhTnSouHXFr2TQ5X2iWiti48Xp6cqnqvKu5Q9HZDMxCGXTZZ
         VyrF3V7YZ47/rbxQOIENHesoG3QVpXXf5/HxkIq7O3VadN7NQyccQ/s0svXqj8O64F7g
         eIP1bgHrMRNI04HmQk9YFLbv9YXT5rECo4Y5VAqRwuvLuLYyHO5XREGnasLLVQpvyyAq
         1F0AbRAKCMVcWFugwx0P4g5Qsf9Gorspe5mvZlBd68GXZxmNUX4VMSAoTA+yymUbVbUT
         wisA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WWduqfKym6DujZjLYiIQGtRcq4d1bKc6lCmjuuPv7rY=;
        fh=W2QfZVaRzP9T4hTpm6MkB4dqjh00cnLDO0g5ac5TgTQ=;
        b=Kf+WR5UL79nPGM0RJNKLa8wZIcBebYA12zvgLm9oWtdSXeav2zC7ms6EI/31gVgPWO
         +t+jbDyBM37qZbKkZ+AmBl6XFAVBWTAf8QXhHFFtJm4yMpITRYyY6xYr6Z0lXOvtwkx1
         tC6ZBGTv8beWIEQwXDO9cYGZ4ccDRxLDIxw5EZ3/l389ALVCdUgtj4Yc2eBAGAM1G82D
         MPcHdOEmGo8Nme+0LTQ7GadIW4MW0b21MzXnlr2xvHmCbcD3pPqaB2CE/U5J6thTQGq4
         vaU6qR+kCNyv6ji5MAr6zEQeyI03syTdqJZ0/0ZPst54cKXXtX1JEkI0eVkfqzX4JEpG
         p+4A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779206753; x=1779811553; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WWduqfKym6DujZjLYiIQGtRcq4d1bKc6lCmjuuPv7rY=;
        b=o2uQi0Bs087t/N1Ez3svHFPzPmgAK3aZCnMpJG+JxQ1bPWz002pLGI4HF20AcCTO6r
         2CfDCMe5lbEnkrWarZHRxlpy+UP4YpeReq/mqwAt/7dIAQu6aJAVjEfYYP+jbWclYd9r
         OWrrH7CPq0cw1YVy6QN7mxFYaK+OPjisxquAMJDz54ii2oO+T9ZmzTtBsLIo2dDnRV0N
         me2kvJaDzfeponz2YmipLMBvzfJk3FpybrtCj4fJOgCsD82tWKOp4c9ZAS9U+djfWln+
         hgkcloOLPSzqP2luo0z5G9Bv9fqZ5PBsUevWJtWMDkbXBVfd9jcWkAD8HtSBIv0BIbXj
         Pn1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779206753; x=1779811553;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WWduqfKym6DujZjLYiIQGtRcq4d1bKc6lCmjuuPv7rY=;
        b=IMl7V/aI3APUPZVN86Zmtx4mow6ZhDz8ZE91Evk08R0pJ4CeyRMrU5h5kM8kK5duSL
         VQu6ZgqH3aDrVmoFxcgiav0Vbd7VrHXfFkVbEdUGSH5lMQeEytF/GBh07h5yk85hks96
         2Uk1PKsTIhgYK2V9/UaOV8+RlWy8SdEHwJ0cwTJiSl78VP2JezXuvhmmZIV88eJX2YY6
         8uvcBEFcFQtoS5a0c2Nrw4KUzgkdNE4ynvNWMqaJMwtIeTnYG8TqZIUAOo4C84I6waHd
         D1ZRoRiQBki/I4BDzK536IB8wELI9dqJT/Gq+WwHG7sPnEypdZf6fLdg1Of8XhcuDHuM
         d+6Q==
X-Gm-Message-State: AOJu0Yw9LAMjfYu8Q8vsL8eT3Wp06C5HtBnjoEDM6Yr2msR+1OJxQZz7
	MAEo6UJnHqCbrNPw1yACnMLEGuc+tGJ4ZE7hkhVyXUlit5IoXVTWZR1Vl4Cbb5ibVCg7H8ZoW+N
	hroCInolPRObnBsJp21eE51NAESPV6ww=
X-Gm-Gg: Acq92OEcWEjyRsccGoWA46R2zJKfMRFPdKuZd/65k4kV2BtqWCvzphUXXAFXtq/Qymb
	hw5TbrfGZQ8eRnZhbUMGisiXeAJ5gbuIbewIGN6WXII2bo0Qc+wWbycME2jDavyELnuoe2quwWZ
	8QLAILaXTA7+7rsYzQ30zrCxzgritViXLydrlomedRBZjgEKrKGm8gEKBRD7wtYxgLrR6AYO4Av
	f1EzdrkEShFztzQl1VXqWpbip+nNjo8MkREoS+VQRXj5TcRMSdULmPViwZhqw6CkzKlyNY29Gms
	svAj1DC/3+8kYiNz
X-Received: by 2002:a05:6214:27ef:b0:8ac:7d70:f0da with SMTP id
 6a1803df08f44-8ca0f5ead23mr345177666d6.14.1779206752674; Tue, 19 May 2026
 09:05:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260511061901.907540-1-yaseen@ghoul.dev> <79556116-6362-4C2B-ADBA-00A325D79CB5@gmail.com>
 <b81a047b-4dc5-4537-adfb-a38ad66bbc25@ghoul.dev>
In-Reply-To: <b81a047b-4dc5-4537-adfb-a38ad66bbc25@ghoul.dev>
From: Derek John Clark <derekjohn.clark@gmail.com>
Date: Tue, 19 May 2026 09:05:41 -0700
X-Gm-Features: AVHnY4LH24L6yCF6KfiGCFbPmHA_cSfJpRt6t_AVnOyZrmx9wDkZI6ztwV7t8Y8
Message-ID: <CAFqHKTm3tbkQNVSCGsP=HvV465mgnr82QbBgWBd5eDoR2A6ynw@mail.gmail.com>
Subject: Re: [PATCH 0/2] asus-armoury: gate PPT writes on active fan curves
To: Ahmed Yaseen <yaseen@ghoul.dev>
Cc: platform-driver-x86@vger.kernel.org, corentin.chary@gmail.com, 
	luke@ljones.dev, denis.benato@linux.dev, hansg@kernel.org, 
	ilpo.jarvinen@linux.intel.com, prasanth.ksr@dell.com, 
	mpearson-lenovo@squebb.ca, Dell.Client.Kernel@dell.com, 
	linux-kernel@vger.kernel.org, mario.limonciello@amd.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 13, 2026 at 7:55=E2=80=AFAM Ahmed Yaseen <yaseen@ghoul.dev> wro=
te:
>
> On 12/05/2026 20:14, Derek J. Clark wrote:
> > On May 10, 2026 11:19:14 PM PDT, Ahmed Yaseen <yaseen@ghoul.dev> wrote:
> >> My first kernel patch series, posted in agreement with Denis Benato (C=
c'd).
> >>
> >> On 28 ASUS ROG laptop models flagged with requires_fan_curve in the
> >> asus-armoury DMI power_data table, the BIOS ACPI method SPLX silently
> >> discards Package Power Tracking (PPT) writes unless the fan mode is
> >> set to Manual (FANM=3D4). FANM is set to 4 by the DEFC method when a
> >> custom fan curve is written. Until then, the WMI DEVS call returns
> >> success but the firmware ignores the value, so userspace sees no
> >> effect from writes to ppt_pl1_spl, ppt_pl2_sppt, ppt_pl3_fppt,
> >> ppt_apu_sppt or ppt_platform_sppt.
> >>
> >
> > This very nearly touches on an issue that has been present in the asus_=
armoury driver for a while, and presents a possible avenue to correct it. W=
hen originally adding PPT adjustments it was discussed that doing so should=
 be gated under the "custom" platform profile [1]. This was simple to do fo=
r the Lenovo WMI drivers because that interface includes a BIOS custom mode=
 and requires it to be set for PPT settings to take effect. This soft "requ=
irement" was missed when asus_armoury was accepted, and it currently allows=
 PPT settings to override manufacturer intent. Please correct me if I'm wro=
ng, but I believe the fan curves associated in BIOS for low-power, balanced=
, and performance will not automatically adjust if a user changes the TDP o=
utside of the window. I.e. setting low power and then maximum SPL would lea=
ve the fans in a quiet mode.
> >
> > Since some devices require this bit to be set, it seems like a good opp=
ortunity to gate the platform profile under custom, and use custom to set t=
he performance mode and this bit, then allow userspace to set the curve and=
 ppt values.
> >
> > Adding Mario to CC for his SA/comments on this proposal.
> >
> > - Derek
> >
> >
> > 1: https://lore.kernel.org/platform-driver-x86/20241206031918.1537-17-m=
ario.limonciello@amd.com/
>
> About the PPT settings overriding manufacturer intent, I believe this is
> a misunderstanding. I believe Derek is pointing at how currently PPT
> adjustments for these models appear to apply without a custom fan curve
> while manufacturer intends for the TDP to only be adjustable with a
> custom fan curve applied. To clarify, for the modules that require a
> custom fan curve, TDP value adjustments are currently being completely
> ignored by the BIOS because the requirement for the existence of a fan
> curve prevents it at a hardware level. Meanwhile on the kernel side of
> things, it would appear that TDP values are actually being set, while it
> is actually ignored. This is the reason for my gating custom TDP values
> behind requires_fan_curve for models that require it. Please correct me
> if i am understanding the previous message incorrectly though.

I wasn't specifically talking about manufacturer intent, but more
trying to get to a standard way for userspace to interface with PPT
values in the Linux kernel. If each implementation requires special
handling then we have essentially failed at our job of abstracting the
hardware to userspace. Even in the case of just ASUS where having some
devices where the user needs to know to set this bool while others
don't, and then having userspace reflect that difference, is an extra
burden on users and developers. Once you add more manufacturers, some
needing custom while others don't, some with different limits per
profile, etc. it then becomes the job of userspace to abstract the
vendors & models. IMO it is much cleaner to always gate PPT values for
all hardware behind custom to provide an identical interface and
expectation to users, then you can do vendor & model specific things
(like this bool, or Lenovo's custom profile) behind that without the
user even needing to know.

> As for the other issue mentioned (if a user were to choose low power and
> set maximum SPL), this is an issue I was not able to properly recreate.
> I have attempted to do this but on my device at least, a custom TDP
> cannot be set without a custom fan curve. Even in low power mode, I am
> able to ramp my fans up to 100% with a custom fan curve and increasing
> TDP knobs works perfectly and my fans are loud as expected. It may be
> the case that due to the bug I mentioned earlier, TDP was possible to
> visually max out without a custom fan curve while being in quiet mode.

In this case I was talking about the inverse behavior, where devices
that don't require a fan curve can adjust TDP without setting a custom
fan curve.

> However, on an older device that doesn't require a custom fan curve for
> TDP might behave as Derek mentioned, as there is no hardware level
> enforcement for the user to take over the fan curve before changing TDP.
> I am unable to test this as I do not have such a device, but I believe
> this is how the device's design is. The user can simply use custom fan
> curves if their device supports it in this case. Instead, there are
> min-max power limits for each power profile defined for these to prevent
> damage.

If I remember correctly, they will continue to use the fan curve of
whatever the last set platform profile is regardless of PPT setting.
That would mean that someone could in theory select the low-power
profile and have super silent fans, but ramp up PPT values to the
highest supported limits beyond what that fan profile supports. My
concern is whether or not the BIOS will reject the TDP setting above
the selected profile, automatically switch fan profiles, or enter the
scenario I outlined.

> As for the proposal to implement a 'custom' power profile, I believe
> this needs more discussion. Unlike Lenovo, ASUS does not have this as a
> native option in the BIOS, Instead ASUS ships 4 fan modes (Quiet,
> Balanced, Performance, Custom) which we are already using. The long term
> plan I have in mind for this is that the custom fan curve can be applied
> separately to all 3 performance profiles, saved somewhere, and switched
> between them by the user.

I understand that. The idea/issue I'm pressing is the need to avoid
implementing vendor specific quirks into an interface we want to be
standardized. I.E., how do we accomplish a "custom" profile when WMI
allows us to set custom values, whether or not its on a device with a
custom setting in BIOS. I think that is a fairly straightforward
objective.

> So while I can see a lot of things becoming cleaner if a custom fan mode
> mapped directly to a custom power profile, too many issues come together
> with it. For instance, would this new custom mode use Performance,
> Balanced, or Quiet as a baseline? what about the TDP value limits that
> differ per profile according to Asus Armoury Crate in Widnows? it also

Performance would be the safe option. The more complicated option is
to have the driver know where those limit transistions are and
automatically adjust the underlying platform profile before setting
the PPT values. IMO that would also be necessary if we explicitly
don't make a custom profile as they're currently not protected from
going outside the AC limits at all. I don't believe those are built
into the BIOS but are software limits in AC. Since ASUS controls the
drivers and userspace entirely in Windows they can enforce those
limits and have safe operation. It isn't an analogous situation.

> causes more complications for some users that only decrease TDP to
> reduce power consumption as they will then also be switched to a custom
> mode by the kernel which would now apply a custom fan curve which also
> needs us to create defaults for these. In the case of Lenovo, the BIOS

Default fan curves should be much easier than TDP limits, which are
already done in asus_armoury.h, since it would just be a fan % at a
temp. You could easily have an especially conservative/safe profile to
start with and add a DMI table later if it was found to be necessary.
Userspace will then take care of modifying it.

> likely ships with these baselines per device but this is not applicable
> in our case.
>
> If we can discuss this custom mode in more depth and the pros outweigh
> the cons, I believe we can discuss this for a follow-up patch

My concern with that approach is the lack of ABI stability. Once we
make a unique firmware-attribute for userspace to target we then break
userspace to "fix" it in the future. This decreases the likelihood
that such a change can be made in the future, and I think the fact
that some ASUS devices need some form of custom setting is exactly the
catalyst we need to fix it properly now. If we wait we fall into the
trap of needing to deprecate an ABI, maintain it until the next LTS
after acceptance, etc.

- Derek

> - Ahmed Yaseen
>
> >
> >> The requires_fan_curve flag has existed in the per-model power_data
> >> entries for some time but was never read. This series wires it up:
> >>
> >>   Patch 1: Adds the actual gate. Exports
> >>     asus_wmi_custom_fan_curve_is_enabled() from asus-wmi so
> >>     asus-armoury can query fan-curve state across module boundaries,
> >>     and returns -ENODEV with a pr_warn() from the PPT write path on
> >>     affected models when no fan curve is active.
> >>
> >>   Patch 2: Exposes the same flag to userspace as a read-only sysfs
> >>     attribute (requires_fan_curve) so tools like asusctl and rogcc
> >>     can surface the prerequisite to the user before issuing PPT
> >>     writes. Documented in
> >>     Documentation/ABI/testing/sysfs-class-firmware-attributes.
> >>
> >> Testing:
> >>   Verified on G835LW (ROG Strix SCAR 18 2025, requires_fan_curve=3Dtru=
e):
> >>   - With no fan curve active, writes to ppt_pl1_spl return -ENODEV
> >>     and the cached value is unchanged.
> >>   - With pwm1_enable=3D1 on /sys/class/hwmon/.../asus_custom_fan_curve=
,
> >>     PPT writes succeed and readback matches.
> >>   - The pr_warn fires exactly once per rejected write.
> >>
> >>   I do not have access to the other 27 affected models. Testers from
> >>   any of these would be appreciated: FX507VI, FX507VV, FX507Z,
> >>   GA402X, GA403UI, GA403UV, GA403WM, GA403WR, GA403WW, GA605W,
> >>   GU605CR, GU605CW, GU605CX, GU605M, G513I, G513QM, G513QY, G513R,
> >>   G614J, G615LR, G634J, G713PV, G733C, G733P, G814J, G834J, G835LR.
> >>
> >> Ahmed Yaseen (2):
> >>   platform/x86: asus-armoury: gate PPT writes behind active fan curve
> >>   platform/x86: asus-armoury: expose requires_fan_curve via sysfs
> >>
> >> .../testing/sysfs-class-firmware-attributes   | 25 +++++++++++++
> >> drivers/platform/x86/asus-armoury.c           | 35 +++++++++++++++++++
> >> drivers/platform/x86/asus-wmi.c               | 28 +++++++++++++++
> >> include/linux/platform_data/x86/asus-wmi.h    |  5 +++
> >> 4 files changed, 93 insertions(+)
> >>
> >
>
>
