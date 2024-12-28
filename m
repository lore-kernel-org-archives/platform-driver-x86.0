Received: from linux1587.grserver.gr (linux1587.grserver.gr [185.138.42.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8224C12BF02;
	Sat, 28 Dec 2024 11:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.138.42.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735386654; cv=none; b=hNGuJ0o0yyRo43e/yYuIxosih/bdqTQRLEWWt9xW33icuQmjphzmiIupmNoCdV6udHkDDEkmWa/dURWYSFdxdAhuqf4KU/ZsSoNp9YswlmpAkUTykWG8vEy4YAsK0+zgNUui4IQSO7enkBI+5HljqaWZ8kEuF1kB0g5SxdhYyJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735386654; c=relaxed/simple;
	bh=8R47ISBJq3AprPLMwWUv+gqTNO1h/pDFq8ADeWg/xp4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jx7hQbXVOlrIB2vfcTkKb85QxNtzIVvXMtpPgJOEDRS3WlgliSg0xhoFTMNIJFBUYk1JDB8MuzfuwTyMGbqX3ywtGZrHqtYPRibT+tnKMP75h72CAp2TIQNwvqHPe0n3QruJALS3SiCb21WIzIjQ4rylJ6KM0GZAYPSVCS+u0YE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=Jb1eQ0j0; arc=none smtp.client-ip=185.138.42.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="Jb1eQ0j0"
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	by linux1587.grserver.gr (Postfix) with ESMTPSA id 2EA302E09282;
	Sat, 28 Dec 2024 13:50:47 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1735386647;
	bh=aehk3EMVu7deNxBlfRWVbyOfhjn+K9TpzrtDYDzqcEs=;
	h=Received:From:Subject:To;
	b=Jb1eQ0j0o4b7pIGvHSxwrCKf7KvpJmzY64DRlEtQWSqdItjXPo8XQVzuQuRgzeeoZ
	 Ey3rSTjExy4yKoCYzWOX30zbgNZXpSXybNMi9+GfEXSHb/Je8J94k++M94sVG57zVm
	 PBILJEG68r9I6QxwyrEma7954ItGTuXHCIWzhILc=
Authentication-Results: linux1587.grserver.gr;
        spf=pass (sender IP is 209.85.208.178) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-lj1-f178.google.com
Received-SPF: pass (linux1587.grserver.gr: connection is authenticated)
Received: by mail-lj1-f178.google.com with SMTP id
 38308e7fff4ca-30036310158so73721451fa.0;
        Sat, 28 Dec 2024 03:50:47 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCV9dkwzJ3Ya+HnD7zHViW3opuliMTo/usz5Urq1aTxSjNGf5TYDOa1reARdd/EMeipGjhjVBREj4R8=@vger.kernel.org,
 AJvYcCWDGqpkqXBT5yWSmIVYjBJ9QkPs3N/donEsSARYnlqUASXXVeI3aeHEZuI7FEDzvw4fhTNanrfu/wDO3TRRg+je5H2o5Q==@vger.kernel.org,
 AJvYcCXLqVvHgYPeB6VRGtmMj2Nz8d4UtVWX1MC0pSkXaDk+jUw07H5qOhgRBM5PzcXs3lDw/wPamumYLewvPdR7@vger.kernel.org
X-Gm-Message-State: AOJu0YyyBRqn6ucVrgM0+HfwZrkIVVB+/atgoiAJVpl17DqaiFsSFn95
	yyLu8xs5JnhHQCs5GlS6EK0DzYqCsCPW0hZLusO9w8tdxcZng92T/Q1MkiCEhuyJijUgiCttpBp
	p8LVxTy18tBQbqJcUYYpRrQc3UvE=
X-Google-Smtp-Source: 
 AGHT+IE5bj5wM/elToybUAozaWoDBFAm4DC2wMrYgqTKYdRIjP+DwIXzJZMvO9iCDK+pq1sPneW3by8UsWiYl8GiW0o=
X-Received: by 2002:a05:651c:2215:b0:302:2cdf:7fbb with SMTP id
 38308e7fff4ca-3046851e45fmr109656021fa.6.1735386646279; Sat, 28 Dec 2024
 03:50:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241217230645.15027-2-derekjohn.clark@gmail.com>
 <20241227184825.415286-1-lkml@antheas.dev>
 <CAFqHKT=Y66KNo-e+o+n76tmPEcqL4EBSUQNDXJcoP8B9NXguew@mail.gmail.com>
 <CAGwozwGpEWVQwEAFfWWkTx4G90uhqdfbF85E4F_2w6c6G6P2Sg@mail.gmail.com>
 <CAFqHKTnOA5N-uADQLbdA-b+k-TOMdjZtCPsFsCo9jarMiNioLg@mail.gmail.com>
In-Reply-To: 
 <CAFqHKTnOA5N-uADQLbdA-b+k-TOMdjZtCPsFsCo9jarMiNioLg@mail.gmail.com>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Sat, 28 Dec 2024 12:50:34 +0100
X-Gmail-Original-Message-ID: 
 <CAGwozwF79xYrWkCSKpBaLSiXNEZz-5tmayWMbkw-of4zB=LPUQ@mail.gmail.com>
Message-ID: 
 <CAGwozwF79xYrWkCSKpBaLSiXNEZz-5tmayWMbkw-of4zB=LPUQ@mail.gmail.com>
Subject: Re: [PATCH 0/1] platform/x86: Add Lenovo Legion WMI Drivers
To: Derek John Clark <derekjohn.clark@gmail.com>
Cc: corbet@lwn.net, hdegoede@redhat.com, ilpo.jarvinen@linux.intel.com,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, luke@ljones.dev,
	mpearson-lenovo@squebb.ca, nijs1@lenovo.com, pgriffais@valvesoftware.com,
	platform-driver-x86@vger.kernel.org, shaohz1@lenovo.com, superm1@kernel.org,
	zhangzx36@lenovo.com, johnfanv2@gmail.com, codyit@gmail.com, W_Armin@gmx.de
Content-Type: text/plain; charset="UTF-8"
X-PPP-Message-ID: 
 <173538664757.17236.16977072296559972225@linux1587.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 0.103.11 at linux1587.grserver.gr
X-Virus-Status: Clean

> I'll let them weigh in on this again if they want to, but I think it
> was clear from those threads that this is a new way to use the class.
> Armin's comment was related to the fan curve setting John was
> discussing, which is specifically covered by the hwmon subsystem.
> Hwmon does not cover platform profiles or PPT.

I quote the following from Armin:

> The firmware-attribute class interface is only intended for attributes which are persistent
> and cannot be exposed over other subsystem interfaces.

The former part is not met here.

> > To rephrase, your ABI style is not intuitive, because it contains
> > implementation details such as "gamezone", "capdata01", and "Other
> > Method", in addition to the ABI being hardcoded to the WMI structure
> > lenovo uses. The documentation uses those keywords as well.
>
> Yeah, it's a driver for those interfaces... If you want an agnostic
> BMOF driver then make one. This isn't that.

It's a driver for Legion Go and Legion laptops. _Not_ those
interfaces. Which only exist in gen 7+ if I recall from John's driver.
That was my comment.

Establishing an ABI that works with older laptops and laptops that
supersede those interfaces would be beneficial I'd say.

> > If I understand correctly your last sentence, Armin suggested much of
> > the same (ie combine and merge).
>
> You don't seem to, no. The suggestion was to use the component  driver
> API to aggregate the Other Method driver with the capability data
> driver so that the firmware-attributes class is only loaded when both
> are present. That is decidedly different from breaking the kernel's
> WMI driver requirements and merging two GUID's into one driver.
>
> > GUID tables loading != drivers loading also, I would not pin that on
> > the kernel.
>
> What exactly do you think the following does?
>
>  +MODULE_DEVICE_TABLE(wmi, gamezone_wmi_id_table);

Call the probe function that can -ENODEV

> > I do not understand what "I hard code the page to custom" means.
> > If you mean the capability data does not change you are right, they
> > are hardcoded in the decompiled ACPI I am pretty sure (it has been
> > close to a year now so I might be forgetting).
>
> The capability data interface has a data block instance for every
> attribute in every fan mode. SPL has one for quiet, balanced,
> performance, and custom. The method for getting that data block (page)
> is the same as calling get/set in Other Method (0x01030100 -
> 0x0103FF00). Every page produces different values for each attribute,
> but I am only ever retrieving the instance for custom (0x0103FF00) as
> that's the only one where setting that method ID in Other Method
> changes the values on the Legion Go. It is the only relevant data for
> userspace. Other Gaming Series laptops might treat this differently,
> where every fan mode has an applicable range. I'll need to do more
> testing on other hardware to confirm that. In any case, this isn't
> relevant as I'm dropping the gamezone check (as I've stated multiple
> times in this discussion) and always setting/getting the custom method
> ID for a given attribute.

Hm, for some reason I missed the capability block when doing my RE
[1]. Feel free to reference when making the driver.

You should also provision for the fact some legion laptops have an
extreme mode which is stubbed on the Legion Go

Ok,
let's wrap up this discussion and put a bow on it.

I currently have two issues that block me from committing to your
driver: novel use of kernel APIs/design and performance
degradation/instability from unnecessary calls and checks, as those
are (i) slower (ii) could error out (iii) could have incorrect data.

The former can leave me with tech debt if your proposed ABI is vetoed
and the latter would result in a degraded experience for my users; I
would be putting in work to go backwards. I do not mention missing
features, as that is something I could have also worked on if I
committed to your driver.

Therefore, I'm left in a situation where I have to wait for buy-in
from kernel maintainers and for your V2, hoping it fixes the latter
issue which you said it will only do partly.

Best,
Antheas

[1] https://github.com/hhd-dev/hwinfo/tree/master/devices/legion_go#get-feature-command
