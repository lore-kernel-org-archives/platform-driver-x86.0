Received: from linux1587.grserver.gr (linux1587.grserver.gr [185.138.42.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2354E7FBA2;
	Mon, 30 Dec 2024 13:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.138.42.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735566083; cv=none; b=rURB02t5Tqj6mb+HXfDM5hVrfvPyQZT3FSWWmMu6+hgPmSGFBHO3hNOCfkcbEyxL4fjgmpuWAIfA0Cb+oep5D6KUn3Hn/XnIKxwXcEwxnMZehZP2jlgtNqG8gwi19ed7+BKRHzpLMY79Mc/AL6/M7CQHvJw+TMa39D3ZdMSVPQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735566083; c=relaxed/simple;
	bh=O9nWGQyQJsDyzmJA3itIeEChbWgOu9XTffMoFh8MzCU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jk1AvELlV61L/J+V15i6GUIAdMjHlmvazAwjD5squL2bNNFQ70AcSM4yz5pd0j2HlYRih48P/Hr2dHm/kSr/F9iQJSG8PU3onnTJkLCl2rcx97ozdnxyFBePlFxZ4CPTDlVXRv0hTho+Io6Z9HOH8DPzsMofGF9lJK8/uUuARWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=QGQ+d/MZ; arc=none smtp.client-ip=185.138.42.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="QGQ+d/MZ"
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	by linux1587.grserver.gr (Postfix) with ESMTPSA id 0FA8A2E02902;
	Mon, 30 Dec 2024 15:41:14 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1735566075;
	bh=O9nWGQyQJsDyzmJA3itIeEChbWgOu9XTffMoFh8MzCU=;
	h=Received:From:Subject:To;
	b=QGQ+d/MZ2Oqy9p6ArWIgx+oCr8lm7sDVxZLEB5qDY3y+1Ndu0aT9lrJB359xBlOGe
	 ct7c+YAps06+Y+ekZxms2HlG3NdN0AQlkSrai2hfRYYUQNW1+m74vvsgkZkGaDKW2q
	 6IECI7PNuUGbhoOU873arI5HlPXPs5Rm/+kUh8Rw=
Authentication-Results: linux1587.grserver.gr;
        spf=pass (sender IP is 209.85.208.178) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-lj1-f178.google.com
Received-SPF: pass (linux1587.grserver.gr: connection is authenticated)
Received: by mail-lj1-f178.google.com with SMTP id
 38308e7fff4ca-3035046d4bfso85919341fa.0;
        Mon, 30 Dec 2024 05:41:14 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCU8j0pUuJxWK7/0twfKEY1I6lOg4nbwnkQZPFyk/E/TurqYyKZZWM7tEQIjAOSeQ1j/JmER683H8Y7XdQ+g3UQHOF7PVA==@vger.kernel.org,
 AJvYcCWgrAeOPRXwvtpPpQO/Ld1TR+B5vh9qvA1vbIlMRHsU3e/jdBCVee+BHvrTmZ1EC5TQ8cubIDt0cUY=@vger.kernel.org,
 AJvYcCX5Csj/r1/Cuaqc+6/ICiHRH3Rf6s5jFgkGjQFLXCTh44OcN46/eKkuXlurbZNXGEugHLykcQxIecrO/WSF@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4mbvQHzsz64y4yxWlYVpFETJL18wGOZ+s0qhLlE+POV6ksVpM
	eFcZITUFtFPPstvd4jWLC4JktI5ql8H2DLmbjivDmmIwC9OK/CX+gP+rVl+ZKzZL8/0kVTpjgik
	wym7TJjLUrcurnpvDpsdOSfg7csU=
X-Google-Smtp-Source: 
 AGHT+IG3CE5NbizKjDlNO7LAHE3YbVWKYuAZCq2jpkBmc6tF9s89Ou+nJ6fJSIBh08Z4Wh3ESLZS0PxdGYWO79UuENE=
X-Received: by 2002:a2e:a546:0:b0:304:588a:99e1 with SMTP id
 38308e7fff4ca-304685c21c6mr140783031fa.26.1735566074152; Mon, 30 Dec 2024
 05:41:14 -0800 (PST)
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
 <CAGwozwEWNkUDCzSq7-Lei1yBAjpQjyZUtW7+8n_Cpn9xd4aR3A@mail.gmail.com>
In-Reply-To: 
 <CAGwozwEWNkUDCzSq7-Lei1yBAjpQjyZUtW7+8n_Cpn9xd4aR3A@mail.gmail.com>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Mon, 30 Dec 2024 14:41:02 +0100
X-Gmail-Original-Message-ID: 
 <CAGwozwF2EZpChf+eCn5pWy5_ctJ_qUgTrARgiBaW2hWk1CgX4A@mail.gmail.com>
Message-ID: 
 <CAGwozwF2EZpChf+eCn5pWy5_ctJ_qUgTrARgiBaW2hWk1CgX4A@mail.gmail.com>
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
 <173556607557.15476.3139278796124499836@linux1587.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 0.103.11 at linux1587.grserver.gr
X-Virus-Status: Clean

I guess I am late on the party on [1], just reviewed the series. Quite
a nice series

Given there is a class device for this now, it would make sense to me
that "tunings" for each platform driver would go there

Antheas

[1] https://lore.kernel.org/all/20241206031918.1537-11-mario.limonciello@amd.com/

On Sun, 29 Dec 2024 at 23:41, Antheas Kapenekakis <lkml@antheas.dev> wrote:
>
> Hi Armin,
> indeed you covered everything.
>
> I am a bit hesitant about binding sppt, fppt, and spl into those
> interfaces as they need to be set in a very specific ordering and
> rules. E.g., spl < sppt < fppt after setting tdp and before the fan
> curve and after sleep maybe depending on device, after reboot maybe
> after keybind (Legion L + Y) as well. Which is not what's expected by
> the userspace programs consuming this interface. In addition, this
> would expose them to perusing users where they might be confused. I
> also know that its difficult by looking at a patch series to
> understand the nature of these values. However, given my previous
> email, you now have the full context you need to make a decision.
> If you think it is appropriate, it is fine by me.
>
> I'd personally stick them next to platform_profile with a /name
> discoverability mechanism similar to hwmon, where tuning
> software can find them (something similar to Mario's RFC
> that I linked above). Other settings such as the bios light that
> interface is perfectly good for.
>
> As for the hardware limits. You are absolutely right, the ACPI eforces
> none, incl. for Lenovo. And the quality is as you expect. For the
> Legion Go, they are quite creative. They added a battery 80%
> capacity limit by re-using the key value for booting from AC [1-2].
> They also used a weird ABI for the lighting interface to turn off
> the suspend light for a good half of the BIOSes, then they fixed it
> when they allowed to turn off the suspend light during sleep as well,
> which caused that option to break in Legion Space for I want to say
> two months. Nevertheless, nobody has broken a Legion Go yet
> messing with those settings by e.g., overclocking. It also brings
> into view that while the Legion Go uses a derived Legion bios it
> has started diverging a bit as it has its own vendor software.
>
> So I would say that it is good that the other function has a discovery
> mechanism and that gamezone has some bitmasks for that purpose as
> well. It means that if we tap on them during probe, at least for
> Legion laptops from the last 3 years, we can get pretty good support
> from the get go. Before that, it is a mix of EC + WMI (see [3]).
>
> In regards to firmware limits, it is something I would not include in
> the first patch series as it will just make this harder to merge, esp.
> if there are laptops with wrong limits. Then there are issues with
> overrides etc. I would advertise the limits through _min, _max so we
> can figure this out later and I would not do a runtime WMI check, as
> we have to run the check during probe anyway to populate sysfs, where
> it is natural to cache the limits.
>
> FInally, if indeed the gamezone function is Legion specific, and the
> key-value pairs of the Other function are legion specific, from a
> stylistic perspective I would tend towards making the ABI of the
> driver Legion specific and abstract away its WMI details. E.g., I'd
> use the name legion-wmi for a combined driver instead of
> lenovo-gamezone-wmi which would then not be useful if lenovo moves
> past gamezone. And I'd make sure it only loads on legion laptops. I'm
> not up to date on my WMI driver conventions, so this is just a
> suggestion.
>
> Best,
> Antheas
>
> [1] https://github.com/BartoszCichecki/LenovoLegionToolkit/blob/21c0e8ca8b98181a2dedbec1e436d695932a4b0f/LenovoLegionToolkit.Lib/Enums.cs#L72
> [2] https://github.com/hhd-dev/adjustor/blob/188ef6c3e4d7020f2110dd29df6d78847026d41e/src/adjustor/core/lenovo.py#L241
> [3] https://github.com/johnfanv2/LenovoLegionLinux
