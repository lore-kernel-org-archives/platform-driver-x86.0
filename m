Received: from relay12.grserver.gr (relay12.grserver.gr [88.99.38.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D3F71F462D
	for <platform-driver-x86@vger.kernel.org>; Tue, 16 Sep 2025 07:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=88.99.38.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758007610; cv=none; b=bJ6De2mcw2SgL5tqkrpUVCUuoO3/IPJHQsSMsj3HTdybCyVhdLs9aaBrx3ZuUPt3bSseo3xZ+st2aDPlzbLLHg53EVKir6rY5umbpTLB4foDIAGic4MTTg+5WREY2J3fY75TJpVUz4EFtEJcN3d8uW2Etz9TYR1hYQbyv4diTjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758007610; c=relaxed/simple;
	bh=9sFj4ijMneDm3VzpjtuQTzs7KOKMrttziG+qfxoXmWU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IOVvbQaALEC7YQQHcU3k+Pb4v7b2ZBldsDUt6AAVSXiIVLkdczmllK9sbZTFkTLYkGD8p5MWFojzrykroGFF1rFGp5JH7bz0LujMGLMravivlLu8Cix7DBVYX0S4uT01RzpcqHGJSOg+tX22eWb/8vVPbumzFHyZZfEmYnVlWc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=temperror (0-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=iLelCaNF; arc=none smtp.client-ip=88.99.38.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror (0-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="iLelCaNF"
Received: from relay12 (localhost [127.0.0.1])
	by relay12.grserver.gr (Proxmox) with ESMTP id AAA64BDD02
	for <platform-driver-x86@vger.kernel.org>; Tue, 16 Sep 2025 10:26:45 +0300 (EEST)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay12.grserver.gr (Proxmox) with ESMTPS id DE70BBDD73
	for <platform-driver-x86@vger.kernel.org>; Tue, 16 Sep 2025 10:26:44 +0300 (EEST)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id B9D0E1FE646
	for <platform-driver-x86@vger.kernel.org>; Tue, 16 Sep 2025 10:26:43 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1758007604;
	bh=wswxKN/Hu6FIpUwgHYxipA1M1jvxNlRjUNlk1w0fAmU=;
	h=Received:From:Subject:To;
	b=iLelCaNFgKx6UnvaUTMlua2Elo7wLMZAf+zcfJV4DF0e+I8zdmC1xo088neiO8H4u
	 NsDsJuZHdjilzq3xhxznvaRLXHqciiOEH4Fqf8lcm8tRPkawVUV8If+nZF8pJ5vpNt
	 XKqy7caU2Ox/kPlkZ0aYN738FKbZlGgySc69c2KM1GwSomyW4IsMi/pLZzNEDhuWQy
	 iQZ9h6sqLoUIH+rWnDCxPXuK6LZLDIjIUWYrIZx16cvJJrL42G4LvVZ9FdsIJCxC6l
	 upZZ59YLCwGA63RDSqiUMiKk2G5PDyOl95TjNWymfPFGfzld0yDce/Fx18UEmULAt2
	 +VAWlukT44Vlg==
Authentication-Results: linux3247.grserver.gr;
        spf=pass (sender IP is 209.85.167.53) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-lf1-f53.google.com
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-55f78e3cdf9so5920411e87.1
        for <platform-driver-x86@vger.kernel.org>;
 Tue, 16 Sep 2025 00:26:43 -0700 (PDT)
X-Gm-Message-State: AOJu0YzIxypcRj26Ym+nqQb2VsxZkyHrpkIKHDmi79hrgW58m/JmtwqM
	dYCgw1R0akaLz1u4887Kz3sqJ1eH/NYfQ0goyv7mdAWgFS/0FCZseFiPPvV7vJTxMfufMxY4pFZ
	pmUxwTVRSpLs7tW2IrtauU8AYMddKrJU=
X-Google-Smtp-Source: 
 AGHT+IEG8l1whSfpatHry2jIS76GkaDgZYPO3/SvbRtspv7UTrPwIZrqX1AS8hFF4X4r9quX9Wp4yD1lqS2tupJViN4=
X-Received: by 2002:a05:6512:b25:b0:570:8bc4:953f with SMTP id
 2adb3069b0e04-5708bc4a05fmr4150881e87.20.1758007603191; Tue, 16 Sep 2025
 00:26:43 -0700 (PDT)
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
 <CAGwozwEzrkg1bbrfq8t+vDgag-H4CyzMonG6O3Td8iwNr6bh8A@mail.gmail.com>
 <1df-68c91080-1f-25b5f500@10458835>
In-Reply-To: <1df-68c91080-1f-25b5f500@10458835>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Tue, 16 Sep 2025 09:26:31 +0200
X-Gmail-Original-Message-ID: 
 <CAGwozwHusY+Ri_Wt1PujPcdGiBZ3QrpUNKUrZUhGwcuaZ2TLqQ@mail.gmail.com>
X-Gm-Features: AS18NWB1aWOR65WEHn2W1lrFnlieRZUuuJSmpX_oec5u6mKaCyYp0quQk8kD4o4
Message-ID: 
 <CAGwozwHusY+Ri_Wt1PujPcdGiBZ3QrpUNKUrZUhGwcuaZ2TLqQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] platform/x86: asus-wmi: Remove extra keys from
 ignore_key_wlan quirk
To: Rahul Chandra <rahul@chandra.net>
Cc: platform-driver-x86@vger.kernel.org, ilpo.jarvinen@linux.intel.com,
	mathieu@fenniak.net, corentin.chary@gmail.com, luke@ljones.dev
Content-Type: text/plain; charset="UTF-8"
X-PPP-Message-ID: 
 <175800760446.3089953.13661228496222748916@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.3 at linux3247.grserver.gr
X-Virus-Status: Clean

On Tue, 16 Sept 2025 at 09:24, Rahul Chandra <rahul@chandra.net> wrote:
>
> On Tuesday, September 16, 2025 03:17 EDT, Antheas Kapenekakis <lkml@antheas.dev> wrote:
>
> > On Tue, 16 Sept 2025 at 09:15, Rahul Chandra <rahul@chandra.net> wrote:
> > >
> > > On Tuesday, September 16, 2025 03:11 EDT, Antheas Kapenekakis <lkml@antheas.dev> wrote:
> > >
> > > > On Tue, 16 Sept 2025 at 09:08, Rahul Chandra <rahul@chandra.net> wrote:
> > > > >
> > > > > On Tuesday, September 16, 2025 03:06 EDT, "Rahul Chandra" <rahul@chandra.net> wrote:
> > > > >
> > > > > > On Tuesday, September 16, 2025 02:57 EDT, Antheas Kapenekakis <lkml@antheas.dev> wrote:
> > > > > >
> > > > > > > On Tue, 16 Sept 2025 at 08:56, Rahul Chandra <rahul@chandra.net> wrote:
> > > > > > > >
> > > > > > > > On Tuesday, September 16, 2025 02:54 EDT, "Rahul Chandra" <rahul@chandra.net> wrote:
> > > > > > > >
> > > > > > > > > On Tuesday, September 16, 2025 02:50 EDT, Antheas Kapenekakis <lkml@antheas.dev> wrote:
> > > > > > > > >
> > > > > > > > > > On Tue, 16 Sept 2025 at 08:46, Rahul Chandra <rahul@chandra.net> wrote:
> > > > > > > > > > >
> > > > > > > > > > > Added some cc's
> > > > > > > > > > >
> > > > > > > > > > > *Note I have a UX8406CA (the 2025 Arrowlake model, I assume it is the same on the MA)
> > > > > > > > > >
> > > > > > > > > > I must have mistakenly thought that the important code on both devices
> > > > > > > > > > is 0x5F. Perhaps on the duo is 0x5D instead or it emits events on
> > > > > > > > > > both. Can you verify which codes are used on the Duo?
> > > > > > > > > >
> > > > > > > > > weird,
> > > > > > > > > scankey -s reports
> > > > > > > > > 0xe0 0x73  0xe0 0xf3, the 0xe0 is for the extended scancode set but I'm confused on the other 2 codes. the WLAN quirk definitely worked before (I submitted the patch for it for the CA)
> > > > > > > >
> > > > > > > > It's for keyboard detach/retach, both attaching and re-attaching report the same code.
> > > > > > >
> > > > > > > Use evtest to find the MSC code that is used.
> > > > > >
> > > > > > Hmm it is sending 5E... But it is still activating and deactivating and reactivating airplane mode (WLAN)
> > > > > >
> > > > > > Event: time 1758006247.925931, type 4 (EV_MSC), code 4 (MSC_SCAN), value 5e
> > > > > > Event: time 1758006247.925931, type 1 (EV_KEY), code 238 (KEY_WLAN), value 1
> > > > > > Event: time 1758006247.925931, -------------- SYN_REPORT ------------
> > > > > > Event: time 1758006247.925937, type 1 (EV_KEY), code 238 (KEY_WLAN), value 0
> > > > > > Event: time 1758006247.925937, -------------- SYN_REPORT ------------
> > > > > > Event: time 1758006255.123129, type 4 (EV_MSC), code 4 (MSC_SCAN), value 5e
> > > > > > Event: time 1758006255.123129, type 1 (EV_KEY), code 238 (KEY_WLAN), value 1
> > > > > > Event: time 1758006255.123129, -------------- SYN_REPORT ------------
> > > > >
> > > > >
> > > > > Sorry I'm dumb yes 5E is a new code forgot we had 5F currently, guess we should add 5E then, can you write up the patch or should I?
> > > >
> > > > Cleanest patch is a revert of "Remove extra keys from ignore_key_wlan
> > > > quirk". Should work for both -next and stable. I can write a patch and
> > > > add a ReportedBy for you. I will make sure to list 0x5E as the keycode
> > > > used on the Duo. It is not ideal those three keycodes are grouped
> > > > together, but it should be fine for now.
> > >
> > >
> > > Great sounds good thanks! What should we do about 5D? Just keep it in? I don't know what key on the board emits 5D (if any) since it doesn't have an airplane mode key.
> >
> > If you can compile your own kernel, can you check 0x5F is not used in
> > your device? Yeah, let's keep 0x5D for now.
>
>
> Yeah give it like 15 minutes to finish, just to be clear I am compiling a kernel with 0x5E & 0x5D ignored but with 0x5F allowed and running evtest?

Allow all three, see which does what. I am finishing the patch.

Antheas

>
>
> --
> Rahul
>
>

