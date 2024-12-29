Received: from linux1587.grserver.gr (linux1587.grserver.gr [185.138.42.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C320C18C31;
	Sun, 29 Dec 2024 22:41:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.138.42.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735512113; cv=none; b=k35WHrYaxdZ5YGLO1YVvrr+WnD9lfxpUx2WKxlJfDyx6fwKv6NUEzJR2oAS8x8tr0R0UuHALmZTW57aYnJs0kFNuAhrwOZLDl88qo6qaP3R9Yd43u4p3NEWU/SbqBccYJ/5vSPNsuhZrCSMOBnCsYyMBS1Ljd2YNcc1Pqtutk3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735512113; c=relaxed/simple;
	bh=q6wAg2B9W5k2ovQrxcoZOhYsVAOUmR9aGOmOIBy+Fs8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XC1zfT32Qv6+e5a2EHIjAkXSeNROVGSrh4uMOAGJOj/ZPTAzvAdpNXTpqJW1h9+CubWEnO7gtLMJUqtbMnf0OHqYCUKRYW6UCrRwE5SDY7kcJ4J5KpefFPo7DlSzGdyRop3lymtTqnpWcFmLGn3wwp0mpBtqEcfCENnOkOwGrHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=ZAeIaZEy; arc=none smtp.client-ip=185.138.42.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="ZAeIaZEy"
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	by linux1587.grserver.gr (Postfix) with ESMTPSA id 87BBA2E08D85;
	Mon, 30 Dec 2024 00:41:38 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1735512099;
	bh=q6wAg2B9W5k2ovQrxcoZOhYsVAOUmR9aGOmOIBy+Fs8=;
	h=Received:From:Subject:To;
	b=ZAeIaZEyFpzTtwIfyNW27XJImzwamilwquRVaHlr86CIKtFZfUH2ntaNefH4jYHYb
	 3SihYkRBipXFfKE7+YGhW1wsimPmiNBdifKKHN1xO47Gw+M4LLbXfZ7nm6BX4CAh5B
	 GRNmhuY2t8xybEqGloQjXmKkZBEwEh9SXSGsGdJQ=
Authentication-Results: linux1587.grserver.gr;
        spf=pass (sender IP is 209.85.208.180) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-lj1-f180.google.com
Received-SPF: pass (linux1587.grserver.gr: connection is authenticated)
Received: by mail-lj1-f180.google.com with SMTP id
 38308e7fff4ca-30229d5b21cso19700001fa.1;
        Sun, 29 Dec 2024 14:41:38 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCU9c98hssoZ38iThs+JiYoMw+tr3UXMM8SFRkqs3kuXVSF2CZerq3vtSYj3tG/PQnKBCGIFyXc8eKuZIFBj@vger.kernel.org,
 AJvYcCXFRO+nBfMLQVmU9diJtZlzxkbbx7J9eJ0CXFqOLjCmJ32o2A66c2RwGJaj/fKaFZ8V+VypUM45ODzDWJ4xJcHXQN+ifg==@vger.kernel.org,
 AJvYcCXtmS0Et/kh/kTqu/hQydu2lGp8bjlhxzkVfZpi9asbDO1589T0GtBviebiup2wSTzgENhjtcH7/Bk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyj1+knbaBHqv1nargusXQXllAn4Ayb6wdnBoRqtV1urKuf573b
	CxVYwk8mFiFgyEGpe7++stv8KLsF9SecmlzyV2DZC+PqFkJDHRbRnJm9GDRaX+O3huk+5mJMdWh
	DUWgwbFkdoumQiOBeP5tBZ4rhwl0=
X-Google-Smtp-Source: 
 AGHT+IHbFNt6qFFnJeYWS47c/udA3neGhmpny1SBMOcMxDpfWetpzo0dqdABueqBTYmda+zarsLZJ45OLJT280ufiWk=
X-Received: by 2002:a05:651c:61f:b0:302:1e65:f2a1 with SMTP id
 38308e7fff4ca-3046852b5a7mr71064781fa.12.1735512097809; Sun, 29 Dec 2024
 14:41:37 -0800 (PST)
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
 <CAGwozwF79xYrWkCSKpBaLSiXNEZz-5tmayWMbkw-of4zB=LPUQ@mail.gmail.com>
 <b7089d69-4d7b-42fb-90b3-bd13a27fcf1e@gmx.de>
In-Reply-To: <b7089d69-4d7b-42fb-90b3-bd13a27fcf1e@gmx.de>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Sun, 29 Dec 2024 23:41:26 +0100
X-Gmail-Original-Message-ID: 
 <CAGwozwEWNkUDCzSq7-Lei1yBAjpQjyZUtW7+8n_Cpn9xd4aR3A@mail.gmail.com>
Message-ID: 
 <CAGwozwEWNkUDCzSq7-Lei1yBAjpQjyZUtW7+8n_Cpn9xd4aR3A@mail.gmail.com>
Subject: Re: [PATCH 0/1] platform/x86: Add Lenovo Legion WMI Drivers
To: Armin Wolf <W_Armin@gmx.de>
Cc: Derek John Clark <derekjohn.clark@gmail.com>, corbet@lwn.net,
 hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, luke@ljones.dev, mpearson-lenovo@squebb.ca,
	nijs1@lenovo.com, pgriffais@valvesoftware.com,
	platform-driver-x86@vger.kernel.org, shaohz1@lenovo.com, superm1@kernel.org,
	zhangzx36@lenovo.com, johnfanv2@gmail.com, codyit@gmail.com
Content-Type: text/plain; charset="UTF-8"
X-PPP-Message-ID: 
 <173551209907.2054.9778889980899824006@linux1587.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 0.103.11 at linux1587.grserver.gr
X-Virus-Status: Clean

Hi Armin,
indeed you covered everything.

I am a bit hesitant about binding sppt, fppt, and spl into those
interfaces as they need to be set in a very specific ordering and
rules. E.g., spl < sppt < fppt after setting tdp and before the fan
curve and after sleep maybe depending on device, after reboot maybe
after keybind (Legion L + Y) as well. Which is not what's expected by
the userspace programs consuming this interface. In addition, this
would expose them to perusing users where they might be confused. I
also know that its difficult by looking at a patch series to
understand the nature of these values. However, given my previous
email, you now have the full context you need to make a decision.
If you think it is appropriate, it is fine by me.

I'd personally stick them next to platform_profile with a /name
discoverability mechanism similar to hwmon, where tuning
software can find them (something similar to Mario's RFC
that I linked above). Other settings such as the bios light that
interface is perfectly good for.

As for the hardware limits. You are absolutely right, the ACPI eforces
none, incl. for Lenovo. And the quality is as you expect. For the
Legion Go, they are quite creative. They added a battery 80%
capacity limit by re-using the key value for booting from AC [1-2].
They also used a weird ABI for the lighting interface to turn off
the suspend light for a good half of the BIOSes, then they fixed it
when they allowed to turn off the suspend light during sleep as well,
which caused that option to break in Legion Space for I want to say
two months. Nevertheless, nobody has broken a Legion Go yet
messing with those settings by e.g., overclocking. It also brings
into view that while the Legion Go uses a derived Legion bios it
has started diverging a bit as it has its own vendor software.

So I would say that it is good that the other function has a discovery
mechanism and that gamezone has some bitmasks for that purpose as
well. It means that if we tap on them during probe, at least for
Legion laptops from the last 3 years, we can get pretty good support
from the get go. Before that, it is a mix of EC + WMI (see [3]).

In regards to firmware limits, it is something I would not include in
the first patch series as it will just make this harder to merge, esp.
if there are laptops with wrong limits. Then there are issues with
overrides etc. I would advertise the limits through _min, _max so we
can figure this out later and I would not do a runtime WMI check, as
we have to run the check during probe anyway to populate sysfs, where
it is natural to cache the limits.

FInally, if indeed the gamezone function is Legion specific, and the
key-value pairs of the Other function are legion specific, from a
stylistic perspective I would tend towards making the ABI of the
driver Legion specific and abstract away its WMI details. E.g., I'd
use the name legion-wmi for a combined driver instead of
lenovo-gamezone-wmi which would then not be useful if lenovo moves
past gamezone. And I'd make sure it only loads on legion laptops. I'm
not up to date on my WMI driver conventions, so this is just a
suggestion.

Best,
Antheas

[1] https://github.com/BartoszCichecki/LenovoLegionToolkit/blob/21c0e8ca8b98181a2dedbec1e436d695932a4b0f/LenovoLegionToolkit.Lib/Enums.cs#L72
[2] https://github.com/hhd-dev/adjustor/blob/188ef6c3e4d7020f2110dd29df6d78847026d41e/src/adjustor/core/lenovo.py#L241
[3] https://github.com/johnfanv2/LenovoLegionLinux
