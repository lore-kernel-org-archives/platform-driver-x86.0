Received: from relay12.grserver.gr (relay12.grserver.gr [88.99.38.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DECE62DF136
	for <platform-driver-x86@vger.kernel.org>; Tue, 16 Sep 2025 07:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=88.99.38.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758007662; cv=none; b=l+qVBbdOL3TVeMkm1ap1MpeRwClZQiVUOTPexD/r4elyy0pORZSG3mSTnfLHh55QSArgI4R3m8TqlxxjzvwOAVQ+3lIIbqRToKcpjxgxi+OYuO86l3pQHKnMYnAldaHqGDFIHjlsjAQxgzCQfn2dM/QUcv6WGzxnWFGHeXEZnhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758007662; c=relaxed/simple;
	bh=tk5LEi1i5W5Zn+bUa7C1zeFBnTatL24iXryRgO8TRZs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KNpPpdwwxPqjIBRxYMra9lRLkT+B4JNH0lsenYZYsgLVPY5EsmLl8+wyqHNLp0ErnW9gZowZtdMoA/8OxGtm43ycVxdkI/83VDxTXe8wEx5jgLwzGHzJK8OlEwQOm2zu7eA6d+7ankYMPVgm18gCK+9ewB5ilVb+8GOk5ho6YbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=temperror (0-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=BrYAONDv; arc=none smtp.client-ip=88.99.38.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror (0-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="BrYAONDv"
Received: from relay12 (localhost [127.0.0.1])
	by relay12.grserver.gr (Proxmox) with ESMTP id 2DD00BDF6A
	for <platform-driver-x86@vger.kernel.org>; Tue, 16 Sep 2025 10:18:08 +0300 (EEST)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay12.grserver.gr (Proxmox) with ESMTPS id 2C9F7BDD81
	for <platform-driver-x86@vger.kernel.org>; Tue, 16 Sep 2025 10:18:06 +0300 (EEST)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id 98E5A1FF5F0
	for <platform-driver-x86@vger.kernel.org>; Tue, 16 Sep 2025 10:18:05 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1758007085;
	bh=gvR4vEbGfpC4d+kJM6tlFzut3Gk7GU7qLC0EwKx9DfI=;
	h=Received:From:Subject:To;
	b=BrYAONDv//RFXglBVlzn8nnoZ2GF5OmVq7anbq2blnQw2ekPwCfocKNztVAODezKQ
	 oeRDLEb/hbPLHqy2bFfoS3eICmC7+9ZSrupex6XpPXRyzf863qb0Rtnsd/MPAy771z
	 vF31jAELG7jcwlBtIpfi7PyFd+Lv8grIFe7c0z60hMfcGeHYpjxFkCJD7uryYr/vE2
	 WE4m2tFaxtFqbIxV1g60HB5k3xgE9DZH3gI4HK3Q4HpPP0kNXhlXkJn0lWXbz3u2wJ
	 f59qAiBNwTVEE4KPastGlE0QJbWuidc3RL8BayHA15TYpzXtnkQXuTHC+g0r30ymPy
	 3F8LEWIGpbXhQ==
Authentication-Results: linux3247.grserver.gr;
        spf=pass (sender IP is 209.85.208.176) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-lj1-f176.google.com
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
Received: by mail-lj1-f176.google.com with SMTP id
 38308e7fff4ca-352323389cdso29427101fa.1
        for <platform-driver-x86@vger.kernel.org>;
 Tue, 16 Sep 2025 00:18:05 -0700 (PDT)
X-Gm-Message-State: AOJu0Yzzykc1y5R3pR1hLYt7/cRuFwm0dUaNkSly0ae27OcTapUEsw1S
	tJQ6YCgWw0tgxBUCZJBfeCItxd7C1Eoa5dr+f5+oWWfs/e9Hw3bA2Ovrc6LWkGG+Jp2BHbAtWAq
	EIfdC7E4KAFC64nL8Y2mvbKnV6KGSpFU=
X-Google-Smtp-Source: 
 AGHT+IEUOs7kzIsr2r4XNGicEKRA1LNRk29qK/NrUA2IixmhLoBV1CYI1l8ys/vOnXg1lwZa6CyYxuDCww/+3Ojb12U=
X-Received: by 2002:a05:651c:b23:b0:351:786c:e50b with SMTP id
 38308e7fff4ca-351787c2b04mr49228471fa.25.1758007082463; Tue, 16 Sep 2025
 00:18:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <1e1-68c90780-93-13ea166@216760021>
 <CAGwozwFaB9YMKqc1tbmRvjjAZLZRZJKKEjYFDH38EbdeBRvWmA@mail.gmail.com>
 <1e1-68c90980-99-13ea166@216761407> <10020-68c90a00-7-4ac6c580@106289939>
 <CAGwozwF5zawoubpsa0qnSFUhmeUmqdKE+Qzv5dJ1Jzp8rNk0rA@mail.gmail.com>
 <10020-68c90c80-d-4ac6c580@106290038> <1df-68c90d00-19-25b5f500@10458736>
 <CAGwozwEwenJcPkGohLGmeb+dWHyitddUqz7Vm3W6vGCwo6osUg@mail.gmail.com>
 <1e1-68c90e80-a3-13ea166@216795694>
In-Reply-To: <1e1-68c90e80-a3-13ea166@216795694>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Tue, 16 Sep 2025 09:17:51 +0200
X-Gmail-Original-Message-ID: 
 <CAGwozwEzrkg1bbrfq8t+vDgag-H4CyzMonG6O3Td8iwNr6bh8A@mail.gmail.com>
X-Gm-Features: AS18NWC7ASbazu_V4nIs-beHhm-G62pPE---19bZqqpPU2rxOx1KSoWVlH5Wc8I
Message-ID: 
 <CAGwozwEzrkg1bbrfq8t+vDgag-H4CyzMonG6O3Td8iwNr6bh8A@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] platform/x86: asus-wmi: Remove extra keys from
 ignore_key_wlan quirk
To: Rahul Chandra <rahul@chandra.net>
Cc: platform-driver-x86@vger.kernel.org, ilpo.jarvinen@linux.intel.com,
	mathieu@fenniak.net, corentin.chary@gmail.com, luke@ljones.dev
Content-Type: text/plain; charset="UTF-8"
X-PPP-Message-ID: 
 <175800708584.2972100.14988490288166539370@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.3 at linux3247.grserver.gr
X-Virus-Status: Clean

On Tue, 16 Sept 2025 at 09:15, Rahul Chandra <rahul@chandra.net> wrote:
>
> On Tuesday, September 16, 2025 03:11 EDT, Antheas Kapenekakis <lkml@antheas.dev> wrote:
>
> > On Tue, 16 Sept 2025 at 09:08, Rahul Chandra <rahul@chandra.net> wrote:
> > >
> > > On Tuesday, September 16, 2025 03:06 EDT, "Rahul Chandra" <rahul@chandra.net> wrote:
> > >
> > > > On Tuesday, September 16, 2025 02:57 EDT, Antheas Kapenekakis <lkml@antheas.dev> wrote:
> > > >
> > > > > On Tue, 16 Sept 2025 at 08:56, Rahul Chandra <rahul@chandra.net> wrote:
> > > > > >
> > > > > > On Tuesday, September 16, 2025 02:54 EDT, "Rahul Chandra" <rahul@chandra.net> wrote:
> > > > > >
> > > > > > > On Tuesday, September 16, 2025 02:50 EDT, Antheas Kapenekakis <lkml@antheas.dev> wrote:
> > > > > > >
> > > > > > > > On Tue, 16 Sept 2025 at 08:46, Rahul Chandra <rahul@chandra.net> wrote:
> > > > > > > > >
> > > > > > > > > Added some cc's
> > > > > > > > >
> > > > > > > > > *Note I have a UX8406CA (the 2025 Arrowlake model, I assume it is the same on the MA)
> > > > > > > >
> > > > > > > > I must have mistakenly thought that the important code on both devices
> > > > > > > > is 0x5F. Perhaps on the duo is 0x5D instead or it emits events on
> > > > > > > > both. Can you verify which codes are used on the Duo?
> > > > > > > >
> > > > > > > weird,
> > > > > > > scankey -s reports
> > > > > > > 0xe0 0x73  0xe0 0xf3, the 0xe0 is for the extended scancode set but I'm confused on the other 2 codes. the WLAN quirk definitely worked before (I submitted the patch for it for the CA)
> > > > > >
> > > > > > It's for keyboard detach/retach, both attaching and re-attaching report the same code.
> > > > >
> > > > > Use evtest to find the MSC code that is used.
> > > >
> > > > Hmm it is sending 5E... But it is still activating and deactivating and reactivating airplane mode (WLAN)
> > > >
> > > > Event: time 1758006247.925931, type 4 (EV_MSC), code 4 (MSC_SCAN), value 5e
> > > > Event: time 1758006247.925931, type 1 (EV_KEY), code 238 (KEY_WLAN), value 1
> > > > Event: time 1758006247.925931, -------------- SYN_REPORT ------------
> > > > Event: time 1758006247.925937, type 1 (EV_KEY), code 238 (KEY_WLAN), value 0
> > > > Event: time 1758006247.925937, -------------- SYN_REPORT ------------
> > > > Event: time 1758006255.123129, type 4 (EV_MSC), code 4 (MSC_SCAN), value 5e
> > > > Event: time 1758006255.123129, type 1 (EV_KEY), code 238 (KEY_WLAN), value 1
> > > > Event: time 1758006255.123129, -------------- SYN_REPORT ------------
> > >
> > >
> > > Sorry I'm dumb yes 5E is a new code forgot we had 5F currently, guess we should add 5E then, can you write up the patch or should I?
> >
> > Cleanest patch is a revert of "Remove extra keys from ignore_key_wlan
> > quirk". Should work for both -next and stable. I can write a patch and
> > add a ReportedBy for you. I will make sure to list 0x5E as the keycode
> > used on the Duo. It is not ideal those three keycodes are grouped
> > together, but it should be fine for now.
>
>
> Great sounds good thanks! What should we do about 5D? Just keep it in? I don't know what key on the board emits 5D (if any) since it doesn't have an airplane mode key.

If you can compile your own kernel, can you check 0x5F is not used in
your device? Yeah, let's keep 0x5D for now.

>
>
> --
> Rahul
>
>

