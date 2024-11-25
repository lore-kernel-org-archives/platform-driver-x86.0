Received: from mail-il1-f171.google.com (mail-il1-f171.google.com [209.85.166.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5FDE184520
	for <platform-driver-x86@vger.kernel.org>; Mon, 25 Nov 2024 14:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732544182; cv=none; b=YHEKA1grywlYLfpj4Re6vKirgoNfTZ9YqZi/9ZEjPO2KTbFqSlKOVFCcLGHaUT46n+gf908XmNeSoJqN38+/ke//XfS5MYte5Q7S53N/ay/0eJgn9/+W1hR2nyKUBg7aGK07HkMAWa1m8ux4sA89eaBagmNYPnj8uaBqpZA7k+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732544182; c=relaxed/simple;
	bh=bqyYRA1mI8oygVZ1nzkvXGdxo9vRRk7tPrJdQw2zL3o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nQ269jYvUeJnJgN/XqXjwQb40VnDntsKv5mfp0rTzMgnqqo3ctrMJ0k9luY0NrNkVb0ppEZNSc/RLwxBRr1y5227/VLcj1y0oLBb9MV7q+UKI613f2ZmRr0nzlvIMsbCN6e5KvD6X9+nKMTmrtnOb0t0PGxhIHxIdDcFItQctaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=joshuagrisham.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.166.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=joshuagrisham.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f171.google.com with SMTP id e9e14a558f8ab-3a75eaaab59so17812405ab.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 25 Nov 2024 06:16:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732544180; x=1733148980;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bqyYRA1mI8oygVZ1nzkvXGdxo9vRRk7tPrJdQw2zL3o=;
        b=bT6lNwTgYi/8CLL9/oE8Kk+Yx005PnFulZIWP1UhW/baiFJ18hnIUfJu9KTjwHA50F
         fEzAmDBJVFzN09rAIf0EuYRa8D6Rs0AvF/aHvr0en3W6rt7GX7vbF83czCsm2D8PROe1
         45NrUXSk7BEU5Rgk2M0bwavgFHEKHhb7Rfo5XhONG019ENeN5QJTsexeymnSrVaAdmWB
         G5+dAcDMoDGBjnX8bTwflvrU5rUIn+DRkoYte0zU+DNxTfsvQQ4pxH0MJkYQ6MdQ06Dw
         Pt7gyoWYct3de/D55zC590lMWsmJT8qcg1TkOVslI7YMDC951uAoEQmEmgqlN7RFmR5+
         /qvg==
X-Forwarded-Encrypted: i=1; AJvYcCUqgxJd1mNH+4aPRjks0+U7nQ67Q029+a4aaRBVMqB3uelC6OjU4fXuiyKiC91I20FagSTsz7rwCuk0jZBsBCPXqTRt@vger.kernel.org
X-Gm-Message-State: AOJu0YyOZmkfwGnWrx35Y6SjziR3+Hznl6eQYCvuhbZgKLSMjVGzKpNz
	g3BfDXPUlco11fo7esFQWyX7+h3la8ZFi/8WvIX8Ai4lXeMvtDJ59zumQw==
X-Gm-Gg: ASbGnctpmKiB9KxUX9P3A1Jo/HtVwXNGK9KQ81kGdjb0nCYTeQ1Fuq1Ec5AJ8KXdPHg
	IFHf/XRZ3gNJJ/AHXRRk2esIPCDw3bE5e3ErzO98QxQTXEtSeO0BCfVd8+Nre4V8lmAvU49+kqh
	DriTA/4l0QI8G3PrRsS0ZiODO8GdHHmTDFG0X3HxXpkfJkIam+o8fqMtylrVA3LyR5Qfk5FTfoS
	4rrE1hVjRCBSFEM27ihFXCB3EMaHFTT+6/1r22AIbXbN3QgTVP17b+XoBpxl2N22tfg0X2aeAQX
	p6YR+Oi9pJJFrms=
X-Google-Smtp-Source: AGHT+IFxxJVhMXLZK2InUycJNhC+jU9f5saMz45RGjNKlr2/CqV20ofQhK9MRkoJKuK92+s7eL8X5w==
X-Received: by 2002:a05:6e02:68b:b0:3a7:9b16:7b6c with SMTP id e9e14a558f8ab-3a79b167dfcmr98287675ab.9.1732544179725;
        Mon, 25 Nov 2024 06:16:19 -0800 (PST)
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com. [209.85.166.45])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4e1cff11b0dsm2093953173.117.2024.11.25.06.16.19
        for <platform-driver-x86@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Nov 2024 06:16:19 -0800 (PST)
Received: by mail-io1-f45.google.com with SMTP id ca18e2360f4ac-84198252db1so27308639f.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 25 Nov 2024 06:16:19 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVyzbZ5w4HyhOqjVFpBCUo+Z9Eoe73XHIJhbxzfPc24AgEdSl0DnjAj9wfBaVvNmmMl/gfALSzYcr6vQsY5NI5xFDv6@vger.kernel.org
X-Received: by 2002:a05:6602:6c19:b0:7f6:8489:2679 with SMTP id
 ca18e2360f4ac-83ecd28d714mr1060586239f.8.1732544179006; Mon, 25 Nov 2024
 06:16:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAMF+KeYus9dW00WNJMLVxLLHdG9JgCfrGJ491fu7NM8GAEqqCg@mail.gmail.com>
 <fd4a30e0-b5bb-47d7-8173-312417dce215@gmx.de> <CAMF+KeZkqwnBNT4vVNLEC03zZqSTSAE-Z=8j9ZLACf3yBeun8A@mail.gmail.com>
 <qsdbzbvpwlrnx2sqhrjfg3rukbm3z5gjkyjwlwoc3jnd3vre36@72py3mfwwsse>
 <CAMF+KeYGCZuc5DSCf4S+oZZgp5E4hwowJ+HqOy=ijjPZwv+zpQ@mail.gmail.com> <e46b4d6d-16f0-47d9-a680-c1ac90c52a97@gmx.de>
In-Reply-To: <e46b4d6d-16f0-47d9-a680-c1ac90c52a97@gmx.de>
From: Joshua Grisham <josh@joshuagrisham.com>
Date: Mon, 25 Nov 2024 15:16:07 +0100
X-Gmail-Original-Message-ID: <CAMF+KeaSarRT3weYhiCFO=Th5ZWMf=nvi53A+ggKYq2wBYAJpw@mail.gmail.com>
Message-ID: <CAMF+KeaSarRT3weYhiCFO=Th5ZWMf=nvi53A+ggKYq2wBYAJpw@mail.gmail.com>
Subject: Re: Adding a new platform driver samsung-galaxybook
To: Armin Wolf <W_Armin@gmx.de>
Cc: Kurt Borja <kuurtb@gmail.com>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Den l=C3=B6r 23 nov. 2024 kl 23:19 skrev Armin Wolf <W_Armin@gmx.de>:
> > 1) Yes or no to create new platform_device even though one already
> > exists with the ACPI device ID as it's name?
>
> I advise against this, because if the driver somehow binds to multiple de=
vices in the future
> then creating a second platform device will fail (same name). So No.
> [...]
> > 2) If using existing platform_device, should these kind of sysfs
> > attributes be under the dynamic device ID-based platform_device or is
> > it ok / make sense to move them to driver attributes?
>
> Driver attributes get created then the driver is registered, so this coul=
d lead to
> various lifetime problems, so please use device attributes.
>
> I suggest that you update the documentation of the driver to tell people =
that:
>
> 1. They should use udev for device discovery
>
> and/or
>
> 2. They can find the attributes under /sys/bus/platform/drivers/<driver n=
ame>/<device name>/<attribute>

Thanks again Armin, this is very good advice! I have made these
adjustments now in a local copy but then stumbled onto something else:
what about the hwmon and kbd_backlight LED class device names? Right
now I have also hard-coded these with "samsung-galaxybook" but in
theory if multiple different instances of one of the ACPI device IDs
existed (as you mentioned could be a "possible" scenario in the
future?) then I guess these would break as well?

Having said that, it would be REALLY strange if any of these Samsung
notebooks had multiple instances of one or more of these ACPI devices;
it would be like saying there are two completely separate "platform"
devices on the same notebook, where both can control their own
keyboard backlight, performance mode, etc.. I can't imagine this
should ever actually be the case? Also in this case my driver will
actually only try to create the LED class device if the ACPI method to
enable and get/set its value within the device itself is returning the
right success codes, so it seems even less likely that there would be
two instances of the ACPI device IDs on the same notebook and that
both are responding positively to the ACPI method to enable/get/set
the kbd backlight brightness? The hwmon device, on the other hand,
will always be created if it finds any PNP fan devices that need
special handling (e.g. they will not be reporting their values by
default as acpi4 fans so will be set up by the driver instead).

I tried to look in the kernel for existing platform drivers (and
glanced through several non-platform drivers as well) to find any that
might be following this pattern of dynamic LED class device name or
hwmon device name and could not really find anything except the Intel
int3472 which is using the ACPI device ID as the LED class device
name; otherwise, everything else I could find under platform is using
hard-coded names, including drivers that seem to follow this pattern
we are talking about here (using existing platform devices based on
ACPI device ID name instead of creating new ones, e.g. ideapad-laptop
has hard-coded LED class device names with its
"platform::kbd_backlight" and "platform::fnlock" even though the
actual platform device is just matched from the ACPI device ID VPC2004
??).

For specifically kbd_backlight and hwmon devices, I think it is more
likely that people will be making various scripts / config / etc that
do things like show the fan speeds in various widgets and/or control
the keyboard backlight via script, so it seems to me like it is even
better if these can be fixed names that anyone who uses these devices
will be able to use (e.g. "samsung-galaxybook::kbd_backlight" feels
better than something non-fixed based on ACPI device ID like
"SAM0429_00::kbd_backlight").

This feels a bit like sub-optimizing here, especially since pretty
much all of the other drivers I can see are hard-coding these kind of
names already as well.. is it ok to just leave hwmon and LED class
device names as hard-coded with prefix "samsung-galaxybook" and
if/when it comes along that someone has a problem with multiple
instances, it will fail with an error message in the kernel log and
they can submit a bug? (where we figure out what the right course of
action is exactly for that case)

Thanks again!
Joshua

> [...]
